"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SpatialPersistence = exports.AreaDeactivatedEvent = exports.AreaActivatedEvent = exports.AnchorMappingStatusEvent = exports.AnchorError = exports.AnchorEvent = exports.InitializeErrorEvent = exports.InitializedLensCloudEvent = exports.InitializedEvent = void 0;
const Event_1 = require("../Util/Event");
const Deferred_1 = require("../Util/Deferred");
const Delay_1 = require("../Util/Delay");
const Tracking_1 = require("./Tracking");
const Logging_1 = require("./Logging");
const MapScanning_1 = require("./MapScanning");
const MappingTrackingSession_1 = require("./MappingTrackingSession");
const Model_1 = require("./Model");
const PersistentStorage_1 = require("./PersistentStorage");
// initialization events
class InitializedEvent {
}
exports.InitializedEvent = InitializedEvent;
class InitializedLensCloudEvent {
}
exports.InitializedLensCloudEvent = InitializedLensCloudEvent;
class InitializeErrorEvent {
}
exports.InitializeErrorEvent = InitializeErrorEvent;
class AnchorEvent {
}
exports.AnchorEvent = AnchorEvent;
class AnchorError {
}
exports.AnchorError = AnchorError;
class AnchorMappingStatusEvent {
}
exports.AnchorMappingStatusEvent = AnchorMappingStatusEvent;
class AreaActivatedEvent {
}
exports.AreaActivatedEvent = AreaActivatedEvent;
class AreaDeactivatedEvent {
}
exports.AreaDeactivatedEvent = AreaDeactivatedEvent;
class SpatialPersistence {
    constructor(mappingInterval, resetDelayInS, debug, incrementalMapping, enableLoggingPoseSettling, locationCloudStorageModule) {
        // temporary
        this._mappingInterval = 20;
        this._resetDelayInS = 0.5;
        this._checkPointDelayInS = 1.0;
        this._debug = true;
        this._incrementalMapping = false;
        this._enableLoggingPoseSettling = false;
        this.sceneObjects = {};
        this.locations = {};
        this.pendingOnFoundAnchorEvents = {};
        this.alreadyInitialized = false;
        this.initializingDelayInSec = 1.0;
        // sequences
        //
        //    initialize()
        //      (loading)
        //        => onLoaded
        //        => onLoaded
        //        => onLoaded
        //      (in parallel with)
        //        => initialize lens cloud
        //    => onInitialized
        //    ...
        //    => onFound
        //
        //
        //    async saveAnchor()
        //
        //    async deleteAnchor()
        //
        this.onLoadedEvent = new Event_1.default();
        this.onLoaded = this.onLoadedEvent.publicApi();
        this.onLoadErrorEvent = new Event_1.default();
        this.onLoadError = this.onLoadErrorEvent.publicApi();
        this.onUnloadedEvent = new Event_1.default();
        this.onUnloaded = this.onUnloadedEvent.publicApi();
        this.onFoundEvent = new Event_1.default();
        this.onFound = this.onFoundEvent.publicApi();
        this.onLostEvent = new Event_1.default();
        this.onLost = this.onLostEvent.publicApi();
        this.onDeletedEvent = new Event_1.default();
        this.onDeleted = this.onDeletedEvent.publicApi();
        this.onDeleteErrorEvent = new Event_1.default();
        this.onDeleteError = this.onDeleteErrorEvent.publicApi();
        // debugging / ui
        this.onAnchorMappingStatusEvent = new Event_1.default();
        this.onAnchorMappingStatus = this.onAnchorMappingStatusEvent.publicApi();
        // Outgoing area selection events
        this.onAreaActivatedEvent = new Event_1.default();
        this.onAreaActivated = this.onAreaActivatedEvent.publicApi();
        this.onAreaDeactivatedEvent = new Event_1.default();
        this.onAreaDeactivated = this.onAreaDeactivatedEvent.publicApi();
        // A13 behaviour - wait for any location for current area to be tracked, then we resolve
        this._mappedOrTracked = new Deferred_1.Deferred();
        this._trackingState = null;
        this.logger = Logging_1.LoggerVisualization.createLogger("component");
        this.log = this.logger.log.bind(this.logger);
        this._locationCloudStorageModule = locationCloudStorageModule;
        this._mappingInterval = mappingInterval;
        this._resetDelayInS = resetDelayInS;
        this._debug = debug;
        this._incrementalMapping = incrementalMapping;
        this._enableLoggingPoseSettling = enableLoggingPoseSettling;
    }
    createAnchor(sceneObject) {
        let anchorId = getGuid();
        this.model.createAnchor(anchorId);
        let anchor = LocationAsset.getProxy(anchorId);
        this.sceneObjects[anchorId] = sceneObject;
        this.locations[anchorId] = anchor;
        sceneObject[SpatialPersistence.anchorIdStash] = anchorId;
        let anchorEvent = new AnchorEvent();
        anchorEvent.location = anchor;
        anchorEvent.sceneObject = sceneObject;
        return anchorEvent;
    }
    async saveAnchor(sceneObject) {
        let anchorId = sceneObject[SpatialPersistence.anchorIdStash];
        this.log("Saving " + anchorId);
        let areaIdWhenRequestIssued = this.model.currentAreaId;
        await this.mappedOrTracked.promise;
        let toLensWorldFromSceneObject = sceneObject
            .getTransform()
            .getWorldTransform();
        let toTrackedLocationFromLensWorld = this._trackingState.toLensWorldFromTrackedLocation.inverse();
        let toTrackedLocationFromAnchor = toTrackedLocationFromLensWorld.mult(toLensWorldFromSceneObject);
        let serializedLocationId = await this.persistentStorage.storeLocation(this._trackingState.location);
        if (areaIdWhenRequestIssued != this.model.currentAreaId) {
            throw new Error("Save cancelled - area has changed");
        }
        let modelEvent = await this.model.saveAnchor(anchorId, serializedLocationId, toTrackedLocationFromAnchor);
        // model was updated, now we need to save
        this.triggerSceneSave();
        // forward the event
        let location = this.locations[modelEvent.anchorId];
        let savedSceneObject = this.sceneObjects[modelEvent.anchorId];
        let anchorEvent = new AnchorEvent();
        anchorEvent.location = location;
        anchorEvent.sceneObject = savedSceneObject;
        return anchorEvent;
    }
    // This doesn't need to be async
    async deleteAnchor(sceneObject) {
        let anchorId = sceneObject[SpatialPersistence.anchorIdStash];
        let modelEvent = this.model.deleteAnchor(anchorId);
        return this.createAnchorEvent(modelEvent);
    }
    async resetArea() {
        // can't reset if load hasn't completed
        await this.previousState.finally(async () => {
            this.log("resetting area " + this.model.currentAreaId);
            await this.model.reset();
            // !!! should be triggered by model
            // !!! missing is model notifying subscribers that state has changed due to lastTrackedLocation being cleared
            this.triggerSceneSave();
        });
    }
    selectArea(areaID) {
        this.model.selectArea(areaID);
    }
    awake(sceneObject, scriptComponent) {
        this.sceneObject = sceneObject;
        this.scriptComponent = scriptComponent;
        this.trackingSceneObject = global.scene.createSceneObject("tracking");
        this.trackingSceneObject.setParent(sceneObject);
        this.mappingSceneObject = global.scene.createSceneObject("mapping");
        this.mappingSceneObject.setParent(sceneObject);
        let mappingLocatedAt = this.mappingSceneObject.createComponent("LocatedAtComponent");
        mappingLocatedAt.location = LocationAsset.getAROrigin();
        this.model = new Model_1.Model();
        // !!! persistent storage needs to be per area, not per tracked location
        this.persistentStorage = new PersistentStorage_1.PersistentStorage(this._locationCloudStorageModule);
        this.model.onAnchorLoaded.add(this.notifyAnchorLoaded.bind(this));
        this.model.onAnchorUnloaded.add(this.notifyAnchorUnloaded.bind(this));
        this.model.onAnchorDeleted.add(this.notifyAnchorDeleted.bind(this));
        this.model.onAreaActivated.add(this.notifyAreaActivated.bind(this));
        this.model.onAreaDeactivated.add(this.notifyAreaDeactivated.bind(this));
    }
    async initializeMappingAndTracking() {
        if (this.alreadyInitialized) {
            await (0, Delay_1.delay)(this.initializingDelayInSec);
        }
        this.alreadyInitialized = true;
        this.log("initializing mapping and tracking for area " + this.model.currentAreaId);
        let mapScanning = this.createMapScanning();
        // mapping control
        let trigger = new MapScanning_1.GateByFlagOrTrackingAlready();
        trigger.allowCheckpoint = false;
        trigger.trackingAlready = false;
        this.gateByFlagOrTrackingAlreadyTrigger = trigger;
        // Start checkpoint operation asynchronously (fire-and-forget)
        // This ensures the method returns immediately and doesn't block the function and delay MappingTrackingSession creation
        (async () => {
            try {
                const newlyMappedLocation = await mapScanning.checkpoint(trigger);
                await this.updateModelAgainstScan(newlyMappedLocation);
                let toLensWorldFromMapping = this.mappingSceneObject
                    .getTransform()
                    .getWorldTransform();
                this._trackingState = {
                    location: newlyMappedLocation,
                    toLensWorldFromTrackedLocation: toLensWorldFromMapping,
                };
                this.mappedOrTracked.resolve();
                this.firstMapCompleted(newlyMappedLocation);
            }
            catch (error) {
                this.log("error during initial checkpointing: " + error);
            }
        })();
        return new MappingTrackingSession_1.MappingTrackingSession(mapScanning, this._resetDelayInS);
    }
    createMapScanning() {
        let mapScanning = new MapScanning_1.MapScanning(this.scriptComponent);
        mapScanning.onMappingStatus.add((status) => {
            this.onAnchorMappingStatusEvent.invoke(status);
        });
        return mapScanning;
    }
    async firstMapCompleted(newlyMappedLocation) {
        // we need to wait for previous state to load or fail to load - otherwise we don't
        // know if we should wait for it to track
        this.log("startup mapping completed");
        try {
            let previousLocation = await this.previousState;
            // [A9] - we need a successful localization of the old location to proceed
            // this.log("waiting for previous localization before applying new map");
            // this.mappedOrTracked.promise.then(([trackedLocation, toLensWorldFromTrackedLocation]) => {
            // this.log("tracking previous localization");
            // this.track(newlyMappedLocation);
            // });
        }
        catch {
            this.track(newlyMappedLocation);
        }
        finally {
            if (this._incrementalMapping) {
                this.scheduleSubsequentMap();
            }
        }
    }
    async scheduleSubsequentMap() {
        if (this._mappingInterval > 0.0) {
            this.log("scheduling subsequent map");
            let mapScanning = await this.mappingAndTracking.mapScanning.promise;
            this.log("mapping session capacity used: " +
                mapScanning.mappingSession.capacityUsed);
            // "capacityUsed" is scaled relative to the "wearableMaximumSize_" parameter
            // defined in LensCore:
            // capacityUsed = std::min(rawCapacity / wearableMaximumSize_, 1.0)
            if (mapScanning.mappingSession.capacityUsed >
                mapScanning.maxAllowedCapacityUsed) {
                this.log("capacity used above threshold - stopping map saves");
                return;
            }
            try {
                let trigger = new MapScanning_1.Timeout();
                trigger.timeoutInS = this._mappingInterval;
                let newlyMappedLocation = await mapScanning.checkpoint(trigger);
                let toLensWorldFromMapping = this.mappingSceneObject
                    .getTransform()
                    .getWorldTransform();
                this._trackingState = {
                    location: newlyMappedLocation,
                    toLensWorldFromTrackedLocation: toLensWorldFromMapping,
                };
                await this.updateModelAgainstScan(newlyMappedLocation);
                this.scheduleSubsequentMap();
            }
            catch (error) {
                this.log("Chained checkpointing failed: " + error);
            }
        }
    }
    async updateModelAgainstScan(newlyMappedLocation) {
        this.log("updating model against scan");
        if (this.model.area === undefined || this.model.area === null) {
            this.log("[updateModelAgainstScan] no area selected - cannot update model against scan");
            return;
        }
        this.model.area.lastTrackedLocation =
            await this.persistentStorage.storeLocation(newlyMappedLocation);
        // we have mapped in the the new location but will not be tracking it.
        // All anchors already in the model will need to be updated
        // this must be done via the model, not the local list of scene objects / locations
        // as they may not be in the model yet
        for (let anchorId in this.model.area.anchors) {
            // !!! area cannot be null, no checkpoint can be asked for without an activate
            // !!! ie we are safe using this.model.area - how can we make this obvious?
            let toLensWorldFromAnchor = this.sceneObjects[anchorId]
                .getTransform()
                .getWorldTransform();
            let toLensWorldFromAROrigin = this.mappingSceneObject
                .getTransform()
                .getWorldTransform();
            let toNewlyMappedLocationFromAnchor = toLensWorldFromAROrigin
                .inverse()
                .mult(toLensWorldFromAnchor);
            this.model
                .saveAnchor(anchorId, this.model.area.lastTrackedLocation, // !!! area cannot be null, no checkpoint can be asked for without an activate
            // !!! ie we are safe using this.model.area - how can we make this obvious?
            toNewlyMappedLocationFromAnchor)
                .catch((error) => {
                this.log("[updateModelAgainstScan] Couldn't update anchor: " + error);
            });
        }
        this.triggerSceneSave();
    }
    async initialize() {
        this.log("initializing");
        this.previousState = this.loadPrevious();
        try {
            await this.previousState;
        }
        catch (noPreviousStateError) {
            this.log("no previous location state - using default state" +
                noPreviousStateError);
            this.model.load(SpatialPersistence.DefaultStateAsString);
            this.model.selectArea(SpatialPersistence.DefaultAreaId);
        }
    }
    async loadPrevious() {
        try {
            let stateAsString = await this.persistentStorage.loadFromStore();
            this.model.load(stateAsString);
        }
        catch (error) {
            throw new Error("previous location failed to load");
        }
    }
    async track(location) {
        this.log("starting tracking for " +
            location.locationId +
            " " +
            location.locationType);
        let locationTracking = await this.mappingAndTracking.replaceLocationTracking(() => {
            //// nuke the old tracking
            let locationTracking = new Tracking_1.LocationTracking(this.scriptComponent, this.trackingSceneObject, location, this._enableLoggingPoseSettling);
            return locationTracking;
        });
        let [trackedLocation, toLensWorldFromTrackedLocation] = await locationTracking.onceFound;
        this._trackingState = {
            location: trackedLocation,
            toLensWorldFromTrackedLocation: toLensWorldFromTrackedLocation,
        };
        // early complete any quality-based scan in progress
        if (this.gateByFlagOrTrackingAlreadyTrigger) {
            this.gateByFlagOrTrackingAlreadyTrigger.allowCheckpoint =
                this._incrementalMapping; // only allow scan to complete if we are incrementally mapping
            this.gateByFlagOrTrackingAlreadyTrigger.trackingAlready = true;
        }
        // we expect to track either an old location or a new location with no anchors.
        // So the only anchors that will need to be handled are new or updated anchors.
        this.mappedOrTracked.resolve();
        let newLocation = await this.persistentStorage.storeLocation(trackedLocation);
        if (this.model.area &&
            this.model.area.lastTrackedLocation !== newLocation) {
            this.model.area.lastTrackedLocation = newLocation;
            this.triggerSceneSave();
        }
        return locationTracking;
    }
    get mappedOrTracked() {
        return this._mappedOrTracked;
    }
    set mappedOrTracked(mappedOrTracked) {
        this._mappedOrTracked.reject(new Error("tracking cancelled"));
        this._mappedOrTracked = mappedOrTracked;
        this._trackingState = null;
    }
    async triggerSceneSave() {
        // todo: wait 5s then save
        this.log("triggering save");
        let stateAsString = this.model.save();
        try {
            await this.persistentStorage.saveToStore(stateAsString);
            this.log("save successful");
        }
        catch (error) {
            this.log("save failed: " + error);
        }
    }
    notifyAnchorLoaded(modelEvent) {
        let anchorLocation = LocationAsset.getProxy(modelEvent.anchorId);
        let sceneObject = global.scene.createSceneObject("anchor-" + modelEvent.anchorId);
        sceneObject.setParent(this.trackingSceneObject);
        sceneObject[SpatialPersistence.anchorIdStash] = modelEvent.anchorId;
        this.locations[modelEvent.anchorId] = anchorLocation;
        this.sceneObjects[modelEvent.anchorId] = sceneObject;
        let anchorEvent = new AnchorEvent();
        anchorEvent.location = anchorLocation;
        anchorEvent.sceneObject = this.sceneObjects[modelEvent.anchorId];
        this.pendingOnFoundAnchorEvents[modelEvent.anchorId] = anchorEvent;
        try {
            this.onLoadedEvent.invoke(anchorEvent);
            sceneObject
                .getTransform()
                .setLocalTransform(modelEvent.toTrackedLocationFromAnchor);
        }
        catch (error) {
            this.onLoadErrorEvent.invoke({
                message: error,
                location: anchorLocation,
            });
        }
    }
    createAnchorEvent(modelEvent) {
        let location = this.locations[modelEvent.anchorId];
        let sceneObject = this.sceneObjects[modelEvent.anchorId];
        let anchorEvent = new AnchorEvent();
        anchorEvent.location = location;
        anchorEvent.sceneObject = sceneObject;
        return anchorEvent;
    }
    notifyAnchorUnloaded(modelEvent) {
        this.log("unloading anchor " + modelEvent.anchorId);
        try {
            // model was not updated so no need to save
            // as far as the ui is concerned, the anchor is gone
            // forward the event
            let anchorEvent = this.createAnchorEvent(modelEvent);
            // anchor was unloaded, we no longer care about it
            this.locations[modelEvent.anchorId] = undefined;
            this.sceneObjects[modelEvent.anchorId] = undefined;
            this.log("invoking onUnloaded due to unloading anchor " + modelEvent.anchorId);
            this.onUnloadedEvent.invoke(anchorEvent);
            this.onDeletedEvent.invoke(anchorEvent);
        }
        catch (error) {
            this.log("error unloading anchor: " + error + " " + error.stack);
        }
    }
    notifyAnchorDeleted(modelEvent) {
        // model was updated, now we need to save
        this.triggerSceneSave();
        // we don't notify UI at this point - anchor was unloaded, and that is forwarded as a delete
        // event to UI
    }
    async notifyAreaActivated(areaEvent) {
        // At this point all prev anchors are unloaded if there was an area switch
        try {
            this.mappingAndTracking = await this.initializeMappingAndTracking();
            if (areaEvent.isNewArea) {
                // TODO (ngollahalliananda): https://jira.sc-corp.net/browse/AVALON-50446
                // Cancel API call has issues since map snips buffer is not cleared properly
                // This is a workaround by adding a delay before checkpointing in case of new area
                await (0, Delay_1.delay)(this._checkPointDelayInS);
                if (this.gateByFlagOrTrackingAlreadyTrigger) {
                    this.gateByFlagOrTrackingAlreadyTrigger.allowCheckpoint = true;
                }
            }
            else {
                let lastTrackedLocation = await this.persistentStorage.retrieveLocation(areaEvent.area.lastTrackedLocation);
                this.log("tracking area " +
                    areaEvent.areaId +
                    " with location ID: " +
                    lastTrackedLocation.locationId);
                this.track(lastTrackedLocation);
            }
            // Waiting for either tracking or first checkpoint
            await this.mappedOrTracked.promise;
            // invoke anchor onFound events for all anchors in the area since we have tracked the area
            for (let anchorId in this.pendingOnFoundAnchorEvents) {
                if (!(anchorId in this.locations)) {
                    continue; // skip if anchor was unloaded during the await
                }
                let anchorEvent = this.pendingOnFoundAnchorEvents[anchorId];
                this.onFoundEvent.invoke(anchorEvent);
            }
            let areaActivatedEvent = {
                areaId: areaEvent.areaId,
            };
            this.onAreaActivatedEvent.invoke(areaActivatedEvent);
        }
        catch (error) {
            this.log("notifyAreaActivated: error during area activation for area " +
                areaEvent.areaId +
                ": " +
                error);
        }
        finally {
            if (this.gateByFlagOrTrackingAlreadyTrigger) {
                this.gateByFlagOrTrackingAlreadyTrigger.allowCheckpoint =
                    this._incrementalMapping; // only allow first scan to complete if we are incrementally mapping
            }
        }
    }
    async notifyAreaDeactivated(deletedAreaEvent) {
        this.mappedOrTracked = new Deferred_1.Deferred();
        this.pendingOnFoundAnchorEvents = {};
        // Destroy current mapping-tracking session
        if (this.mappingAndTracking) {
            const sessionToDestroy = this.mappingAndTracking;
            this.mappingAndTracking = undefined;
            // Start the destroy operation asynchronously
            (async () => {
                try {
                    await sessionToDestroy.destroy();
                    this.log(deletedAreaEvent.areaId +
                        " deactivated - destroyed mapping and tracking session");
                }
                catch (error) {
                    this.log("error destroying mapping and tracking session: " + error);
                    throw new Error("error destroying mapping and tracking session: " + error);
                }
            })();
        }
        let areaDeactivatedEvent = {
            areaId: deletedAreaEvent.areaId,
        };
        this.onAreaDeactivatedEvent.invoke(areaDeactivatedEvent);
    }
}
exports.SpatialPersistence = SpatialPersistence;
SpatialPersistence.anchorIdStash = "__anchorId";
SpatialPersistence.DefaultAreaId = "default";
SpatialPersistence.DefaultStateAsString = JSON.stringify({
    areas: { default: { name: "default" } },
});
const getGuid = () => {
    // return uuid of form xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx
    let uuid = "";
    let currentChar;
    for (currentChar = 0; currentChar < /* 36 minus four hyphens */ 32; currentChar += 1) {
        switch (currentChar) {
            case 8:
            case 20:
                uuid += "-";
                uuid += ((Math.random() * 16) | 0).toString(16);
                break;
            case 12:
                uuid += "-";
                uuid += "4";
                break;
            case 16:
                uuid += "-";
                uuid += ((Math.random() * 4) | 8).toString(16); // Not the difference for this position
                break;
            default:
                uuid += ((Math.random() * 16) | 0).toString(16);
        }
    }
    return uuid;
};
//# sourceMappingURL=SpatialPersistence.js.map