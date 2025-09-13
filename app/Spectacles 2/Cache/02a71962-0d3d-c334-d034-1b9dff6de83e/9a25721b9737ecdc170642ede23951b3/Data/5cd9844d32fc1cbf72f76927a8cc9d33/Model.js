"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Model = exports.ModelEvent = exports.Area = exports.AreaEvent = exports.Anchor = exports.Localization = void 0;
const Event_1 = require("../Util/Event");
const Logging_1 = require("./Logging");
class Localization {
    constructor() {
        this.toLocationFromAnchor = mat4.identity();
    }
    toJS() {
        return {
            location: this.location,
            toLocationFromAnchor: Model.mat4toJS(this.toLocationFromAnchor),
        };
    }
    static makeLocalization(obj) {
        let loc = new Localization();
        loc.location = obj["location"];
        loc.toLocationFromAnchor = Model.makeMat4(obj["toLocationFromAnchor"]);
        return loc;
    }
}
exports.Localization = Localization;
class Anchor {
    toJS() {
        let localizations = [];
        for (let localization of this.localizations) {
            localizations.push(localization.toJS());
        }
        return {
            anchorId: this.anchorId,
            localizations: localizations,
        };
    }
    static makeAnchor(obj) {
        let anchor = new Anchor();
        // Handle backwards compatability - "anchorId" used to be "location"
        anchor.anchorId = ("location" in obj ? obj["location"] : obj["anchorId"]);
        let localizations = [];
        for (let localization of obj["localizations"]) {
            localizations.push(Localization.makeLocalization(localization));
        }
        anchor.localizations = localizations;
        return anchor;
    }
}
exports.Anchor = Anchor;
class AreaEvent {
}
exports.AreaEvent = AreaEvent;
class Area {
    constructor() {
        this.anchors = {};
    }
    toJS() {
        let anchors = {};
        for (let anchor in this.anchors) {
            anchors[anchor] = this.anchors[anchor].toJS();
        }
        let object = {
            name: this.name,
            anchors: anchors,
        };
        if (this.lastTrackedLocation) {
            object["lastTrackedLocation"] = this.lastTrackedLocation;
        }
        return object;
    }
    static makeArea(obj) {
        let area = new Area();
        area.name = "name" in obj ? obj["name"] : "default";
        let anchors = {};
        if ("anchors" in obj) {
            for (let anchor in obj["anchors"]) {
                anchors[anchor] = Anchor.makeAnchor(obj.anchors[anchor]);
            }
        }
        area.anchors = anchors;
        if ("lastTrackedLocation" in obj) {
            area.lastTrackedLocation = obj.lastTrackedLocation;
        }
        return area;
    }
    static makeAreas(obj) {
        let areas = {};
        for (let area in obj) {
            areas[area] = Area.makeArea(obj[area]);
        }
        return areas;
    }
}
exports.Area = Area;
class ModelEvent {
}
exports.ModelEvent = ModelEvent;
class Model {
    constructor() {
        this.areas = {};
        this.currentAreaId = null;
        this.onAnchorLoadedEvent = new Event_1.default();
        this.onAnchorLoaded = this.onAnchorLoadedEvent.publicApi();
        this.onAnchorUnloadedEvent = new Event_1.default();
        this.onAnchorUnloaded = this.onAnchorUnloadedEvent.publicApi();
        this.onAnchorDeletedEvent = new Event_1.default();
        this.onAnchorDeleted = this.onAnchorDeletedEvent.publicApi();
        this.onAreaActivatedEvent = new Event_1.default();
        this.onAreaActivated = this.onAreaActivatedEvent.publicApi();
        this.onAreaDeactivatedEvent = new Event_1.default();
        this.onAreaDeactivated = this.onAreaDeactivatedEvent.publicApi();
        this.logger = Logging_1.LoggerVisualization.createLogger("model");
        this.log = this.logger.log.bind(this.logger);
    }
    get area() {
        return this.currentAreaId ? this.areas[this.currentAreaId] : null;
    }
    toJson() {
        let areas = {};
        for (let areaKey in this.areas) {
            areas[areaKey] = this.areas[areaKey].toJS();
        }
        return JSON.stringify({
            areas: areas,
            currentAreaId: this.currentAreaId,
        });
    }
    static fromJson(json) {
        let object = JSON.parse(json);
        let model = new Model();
        let areas = {};
        model.areas = "areas" in object ? Area.makeAreas(object.areas) : areas;
        model.currentAreaId =
            "currentAreaId" in object ? object.currentAreaId : null;
        return model;
    }
    createArea(areaID) {
        if (areaID in this.areas) {
            return;
        }
        this.log("creating new area: " + areaID);
        let area = new Area();
        area.name = areaID;
        this.areas[areaID] = area;
    }
    selectArea(areaId) {
        if (areaId == this.currentAreaId) {
            return;
        }
        this.deactivateArea();
        this.currentAreaId = areaId;
        this.activateArea();
    }
    deactivateArea() {
        if (!this.currentAreaId) {
            return;
        }
        this.unloadAnchorsForCurrentArea();
        this.removeAnchorsWithoutLocalizations(this.areas[this.currentAreaId]);
        let currentAreaEvent = {
            area: this.area,
            isNewArea: false,
            areaId: this.currentAreaId,
        };
        this.onAreaDeactivatedEvent.invoke(currentAreaEvent);
    }
    activateArea() {
        this.log("Activating area " + this.currentAreaId);
        if (!this.currentAreaId) {
            return;
        }
        if (!(this.currentAreaId in this.areas)) {
            this.createArea(this.currentAreaId);
        }
        let isNewArea = this.areas[this.currentAreaId].lastTrackedLocation
            ? false
            : true;
        this.loadAnchorsForCurrentArea();
        let requestedAreaEvent = {
            area: this.area,
            areaId: this.currentAreaId,
            isNewArea: isNewArea,
        };
        this.onAreaActivatedEvent.invoke(requestedAreaEvent);
    }
    // Drop any anchors that have no localizations - they can't be used
    // TODO: we should avoid serializing anchors with no localisations
    removeAnchorsWithoutLocalizations(area) {
        let anchorIdsToDelete = [];
        for (let anchorId in area.anchors) {
            if (area.anchors[anchorId].localizations.length === 0) {
                this.log("Dropping anchor with no localizations: " + anchorId);
                anchorIdsToDelete.push(anchorId);
            }
        }
        anchorIdsToDelete.forEach((anchorId) => delete area.anchors[anchorId]);
    }
    loadAnchorsForCurrentArea(isNewArea) {
        for (let anchorId in this.area.anchors) {
            let anchor = this.area.anchors[anchorId];
            // A9: we only expect one localization per anchor
            let localization = anchor.localizations[0];
            let modelEvent = {
                anchorId: anchor.anchorId,
                trackedLocation: localization.location,
                toTrackedLocationFromAnchor: localization.toLocationFromAnchor,
            };
            this.onAnchorLoadedEvent.invoke(modelEvent);
        }
    }
    load(asString) {
        try {
            if (this.currentAreaId) {
                throw new Error("Model already loaded - current area " + this.currentAreaId);
            }
            let model = Model.fromJson(asString);
            for (let areaId in model.areas) {
                this.removeAnchorsWithoutLocalizations(model.areas[areaId]);
            }
            this.areas = model.areas;
            this.currentAreaId = null; // !!! model.currentAreaId;
            // !!! for the moment we do not support automatically storing / restoring the area to activate
            this.log("Current active area " + this.currentAreaId);
        }
        catch (e) {
            this.log("Error loading model: " + e + " + " + e.stack);
        }
        // load will finish without selecting an area
    }
    save() {
        return this.toJson();
    }
    unloadAnchorsForCurrentArea() {
        this.log("Unloading anchors for current area " + this.currentAreaId);
        for (let anchorId in this.area.anchors) {
            this.log("Unloading anchor: " + anchorId);
            let anchor = this.area.anchors[anchorId];
            // A9: we only expect one localization per anchor
            let localization = anchor.localizations[0];
            let modelEvent = {
                anchorId: anchor.anchorId,
                trackedLocation: localization === null || localization === void 0 ? void 0 : localization.location,
                toTrackedLocationFromAnchor: localization === null || localization === void 0 ? void 0 : localization.toLocationFromAnchor,
            };
            this.onAnchorUnloadedEvent.invoke(modelEvent);
        }
    }
    createAnchor(anchorId) {
        if (!this.area) {
            throw new Error("Cannot create anchor when area doesn't exist");
        }
        this.log("Creating anchor: " + anchorId);
        let anchor = new Anchor();
        anchor.anchorId = anchorId;
        anchor.localizations = [];
        this.area.anchors[anchorId] = anchor;
    }
    async saveAnchor(anchorId, trackedLocation, toTrackedFromAnchor) {
        this.log("Saving anchor: " +
            anchorId +
            " at " +
            trackedLocation +
            " with " +
            toTrackedFromAnchor.toString());
        let anchor = this.area.anchors[anchorId];
        if (anchor === undefined) {
            throw new Error("Cannot save non-existent anchor: " + anchorId);
        }
        let localization = new Localization();
        localization.location = trackedLocation;
        localization.toLocationFromAnchor = toTrackedFromAnchor;
        anchor.localizations[0] = localization;
        this.area.anchors[anchorId] = anchor;
        let modelEvent = {
            anchorId: anchorId,
            trackedLocation: trackedLocation,
            toTrackedLocationFromAnchor: toTrackedFromAnchor,
        };
        return modelEvent;
    }
    deleteAnchor(anchorId) {
        var _a, _b;
        try {
            this.log("Deleting anchor: " + anchorId);
            let anchor = this.area.anchors[anchorId];
            let modelEvent = {
                anchorId: anchorId,
                trackedLocation: (_a = anchor.localizations[0]) === null || _a === void 0 ? void 0 : _a.location,
                toTrackedLocationFromAnchor: (_b = anchor.localizations[0]) === null || _b === void 0 ? void 0 : _b.toLocationFromAnchor,
            };
            this.onAnchorUnloadedEvent.invoke(modelEvent);
            delete this.area.anchors[anchorId];
            this.onAnchorDeletedEvent.invoke(modelEvent);
            return modelEvent;
        }
        catch (e) {
            this.log("Error deleting anchor: " + e + " " + e.stack);
            throw new Error("Error deleting anchor: " + e);
        }
    }
    async reset() {
        if (!this.currentAreaId || !this.area) {
            return;
        }
        for (let anchorId in this.area.anchors) {
            this.deleteAnchor(anchorId);
        }
        this.area.anchors = {};
        this.area.lastTrackedLocation = null;
        this.deactivateArea();
        this.activateArea();
    }
    // utilities
    static vec4toJS(v) {
        let vector4 = [v.x, v.y, v.z, v.w];
        return vector4;
    }
    static mat4toJS(ltm) {
        let matrix4 = [
            this.vec4toJS(ltm.column0),
            this.vec4toJS(ltm.column1),
            this.vec4toJS(ltm.column2),
            this.vec4toJS(ltm.column3),
        ];
        return matrix4;
    }
    static makeVec4(o) {
        return new vec4(o[0], o[1], o[2], o[3]);
    }
    static makeMat4(ltmJS) {
        let ltm = new mat4();
        ltm.column0 = this.makeVec4(ltmJS[0]);
        ltm.column1 = this.makeVec4(ltmJS[1]);
        ltm.column2 = this.makeVec4(ltmJS[2]);
        ltm.column3 = this.makeVec4(ltmJS[3]);
        return ltm;
    }
}
exports.Model = Model;
//# sourceMappingURL=Model.js.map