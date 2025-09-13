"use strict";
/**
 * ## Anchors
 * Define and track poses in world space.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.AnchorSession = exports.AnchorSessionOptions = void 0;
const Event_1 = require("./Util/Event");
const Anchor_1 = require("./Anchor");
const WorldAnchor_1 = require("./WorldAnchor");
const debounce_1 = require("./Util/debounce");
const Logging_1 = require("./SpatialPersistence/Logging");
/**
 * Options for locating and persisting nearby anchors, past and new.
 */
class AnchorSessionOptions {
    constructor() {
        /**
         * Named scope for storing and retrieving anchors.
         * A13 - only one may be active at a time.
         */
        this.area = "default";
        /**
         * Anchor types to look for.
         * Default to at least searching for WorldAnchors.
         */
        this.scanForWorldAnchors = false;
    }
}
exports.AnchorSessionOptions = AnchorSessionOptions;
/**
 * Storage context for anchors.
 */
class AnchorSession {
    constructor(options, spatialPersistence, onClose) {
        /**
         * Notifies of anchors becoming available within area scope.
         */
        this.onAnchorNearbyEvent = new Event_1.default();
        this.onAnchorNearby = this.onAnchorNearbyEvent.publicApi();
        this.onAnchorDeletedEvent = new Event_1.default();
        this.onAnchorDeleted = this.onAnchorDeletedEvent.publicApi();
        this._notifiesOnNearbyWorldAnchors = false;
        this._loadedAnchors = new Map();
        this._anchorCount = 0;
        this._waitingForArea = [];
        this._areaSelected = new Promise((resolve) => {
            this._waitingForArea.push(resolve);
        });
        this._registrationUnsubscribes = [];
        this._isResetting = false;
        this._isClosing = false;
        this.logger = Logging_1.LoggerVisualization.createLogger("persistence");
        this.log = this.logger.log.bind(this.logger);
        this.area = options.area;
        this._isResetting = false;
        this._isClosing = false;
        this._onClose = onClose;
        this._notifiesOnNearbyWorldAnchors = options.scanForWorldAnchors;
        this._spatialPersistence = spatialPersistence;
        this._registrationUnsubscribes.push(this._spatialPersistence.onLoaded.add(this._onLoaded.bind(this)));
        this._registrationUnsubscribes.push(this._spatialPersistence.onLoadError.add(this._onLoadError.bind(this)));
        this._registrationUnsubscribes.push(this._spatialPersistence.onFound.add(this._onFound.bind(this)));
        this._registrationUnsubscribes.push(this._spatialPersistence.onLost.add(this._onLost.bind(this)));
        this._registrationUnsubscribes.push(this._spatialPersistence.onUnloaded.add(this._onUnloaded.bind(this)));
        this._registrationUnsubscribes.push(this._spatialPersistence.onDeleted.add(this._onDeleted.bind(this)));
        // finish construction and give receivers a chance to subscribe to activation events before selecting area
        AnchorSession.theDeferToNextFrame(() => {
            this._spatialPersistence.selectArea(this.area);
            while (this._waitingForArea.length > 0) {
                let next = this._waitingForArea.shift();
                next();
            }
            this._areaSelected = Promise.resolve();
        });
    }
    /**
     * Stop trying to find or track anchors in the area.
     */
    async close() {
        await this._areaSelected;
        this._isClosing = true;
        await this._onClose(this);
        this._registrationUnsubscribes.forEach((unsubscribe) => {
            unsubscribe();
        });
        this._registrationUnsubscribes = [];
    }
    /**
     * Save an anchor in storage after user modifications.
     */
    async saveAnchor(anchor) {
        this._checkIsNotClosing();
        await this._areaSelected;
        if (!(anchor instanceof WorldAnchor_1.WorldAnchor)) {
            throw new Error("Only WorldAnchors supported");
        }
        // This can throw if the anchor is deleted while waiting for save to complete
        let anchorEvent = await this._spatialPersistence.saveAnchor(anchor._sceneObject);
        this._loadedAnchors.set(anchor.id, anchor);
        return anchor;
    }
    /**
     * Delete anchor from the storage context.
     */
    async deleteAnchor(anchor) {
        this._checkIsNotClosing();
        await this._areaSelected;
        if (!(anchor instanceof WorldAnchor_1.WorldAnchor)) {
            throw new Error("Only WorldAnchors supported");
        }
        let anchorEvent = await this._spatialPersistence.deleteAnchor(anchor._sceneObject);
        return anchor;
    }
    /**
     * Delete all anchors and reset ability to track in current area.
     */
    async reset() {
        this._checkIsNotClosing();
        if (this._isResetting) {
            this.log("AnchorSession: reset already in progress");
            return;
        }
        this._isResetting = true;
        try {
            await this._areaSelected;
            await this._spatialPersistence.resetArea();
            this._loadedAnchors = new Map();
        }
        finally {
            this._isResetting = false;
        }
    }
    /**
     * Create a world anchor.
     *
     * @param toWorldFromAnchor - World pose of anchor. 'World' is the coordinate system of scene graph root, compatible with a child rendering camera positioned by DeviceTracking set to world.
     */
    async createWorldAnchor(toWorldFromAnchor, alignment) {
        this._checkIsNotClosing();
        await this._areaSelected;
        let anchorSceneObject = global.scene.createSceneObject("_anchor_" + this._anchorCount++);
        anchorSceneObject.getTransform().setWorldTransform(toWorldFromAnchor);
        try {
            let anchorEvent = this._spatialPersistence.createAnchor(anchorSceneObject);
            let anchor = new WorldAnchor_1.WorldAnchor(anchorEvent.location, anchorSceneObject, alignment);
            // having waited on this._spatialPersistence.createAnchor
            // anchor on creation is found, with nothing watching on handlers yet
            // via anchor resolved from AnchorSession.createWorldAnchor
            anchor.state = Anchor_1.State.Found;
            return anchor;
        }
        catch (error) {
            throw new Error("Failed to create anchor: " + error);
        }
    }
    // implementation details
    _checkIsNotClosing() {
        if (this._isClosing === true) {
            throw new Error("Session is closing");
        }
    }
    async _onLoaded(event) {
        await this._areaSelected;
        // todo (gbakker) - need to support alignment serialization
        let anchor = new WorldAnchor_1.WorldAnchor(event.location, event.sceneObject);
        this._loadedAnchors.set(event.location.getProxyId(), anchor);
        // todo (gbakker) - as specced atm anchor will be ready to track, we should verify this
        anchor.state = Anchor_1.State.Ready;
        if (this._notifiesOnNearbyWorldAnchors) {
            this.onAnchorNearbyEvent.invoke(anchor);
        }
    }
    async _onLoadError(event) {
        await this._areaSelected;
        // it doesn't exist yet and never will o_O
        // todo (gbakker) - need to support alignment serialization
        let anchor = new WorldAnchor_1.WorldAnchor(event.location);
        this._loadedAnchors.set(event.location.getProxyId(), anchor);
        anchor.state = Anchor_1.State.Error;
        if (this._notifiesOnNearbyWorldAnchors) {
            this.onAnchorNearbyEvent.invoke(anchor);
        }
    }
    async _onUnloaded(event) {
        await this._areaSelected;
        const anchor = this._loadedAnchors.get(event.location.getProxyId());
        if (anchor) {
            anchor.state = Anchor_1.State.CannotTrack;
        }
        else {
            this.log("AnchorSession: _onUnloaded - anchor not found in loaded anchors");
        }
    }
    async _onFound(event) {
        await this._areaSelected;
        const anchor = this._loadedAnchors.get(event.location.getProxyId());
        if (anchor) {
            anchor.state = Anchor_1.State.Found;
        }
        else {
            this.log("AnchorSession: _onFound - anchor not found in loaded anchors");
        }
    }
    async _onLost(event) {
        await this._areaSelected;
        const anchor = this._loadedAnchors.get(event.location.getProxyId());
        if (anchor) {
            anchor.state = Anchor_1.State.Lost;
        }
        else {
            this.log("AnchorSession: _onLost - anchor not found in loaded anchors");
        }
    }
    async _onDeleted(event) {
        await this._areaSelected;
        let anchor = this._loadedAnchors.get(event.location.getProxyId());
        if (anchor) {
            this.onAnchorDeletedEvent.invoke(anchor);
        }
        else {
            this.log("AnchorSession: _onDeleted - anchor not found in loaded anchors");
        }
    }
}
exports.AnchorSession = AnchorSession;
/**
 * Internal hook to defer an operation to the next frame.
 * For override in tests.
 */
AnchorSession.theDeferToNextFrame = (callback) => {
    (0, debounce_1.setTimeout)(callback, 0);
};
//# sourceMappingURL=AnchorSession.js.map