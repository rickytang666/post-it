"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.findDeviceTracking = exports.WorldPositionMonitor = exports.DelayActionByMultipleFrames = void 0;
const algorithms_1 = require("./algorithms");
const Logging_1 = require("../SpatialPersistence/Logging");
class DelayActionByMultipleFrames {
    constructor(script, numberOfFrames) {
        this.updateEvent = script.createEvent("UpdateEvent");
        this.updateEvent.bind(this.onUpdate.bind(this));
        this.doItLater = DelayActionByMultipleFrames.emptyDoitlater(numberOfFrames);
        this.numberOfFrames = numberOfFrames;
    }
    async waitForNextFrame() {
        return new Promise((resolve, reject) => {
            this.doItLater[this.numberOfFrames - 1].push(resolve);
        });
    }
    onUpdate() {
        // execute things deferred to this frame
        let doItNow = this.doItLater.shift();
        while (doItNow.length) {
            doItNow.shift()();
        }
        this.doItLater.push([]); // swap would be better
    }
    static emptyDoitlater(length) {
        let doItLater = [];
        for (let i = 0; i < length; i++) {
            doItLater.push([]);
        }
        return doItLater;
    }
}
exports.DelayActionByMultipleFrames = DelayActionByMultipleFrames;
class MonitoredPosition {
    constructor(transform, minStableFrames, distanceTolerance, onSuccess) {
        this.numFramesObserved = 0;
        this.positions = [];
        this.transform = transform;
        this.minStableFrames = minStableFrames;
        this.distanceTolerance = distanceTolerance;
        this.onSuccess = onSuccess;
    }
    // Add new sample
    addSample() {
        this.numFramesObserved++;
        this.positions.push(this.transform.getWorldPosition());
        while (this.positions.length > this.minStableFrames) {
            this.positions.shift();
        }
    }
    isStable() {
        if (this.positions.length < this.minStableFrames) {
            return false;
        }
        let meanPos = this.positions.reduce(function (a, b) {
            return a.add(b);
        }, new vec3(0, 0, 0));
        meanPos = meanPos.uniformScale(1 / this.positions.length);
        for (var pos of this.positions) {
            if (pos.distance(meanPos) > this.distanceTolerance) {
                return false;
            }
        }
        this.onSuccess();
        return true;
    }
}
class WorldPositionMonitor {
    constructor(script, sceneObject, logFunction) {
        this.updateEvent = null;
        this.monitoredPositions = [];
        this.logger = Logging_1.LoggerVisualization.createLogger("position monitor");
        this.log = this.logger.log.bind(this.logger);
        this.script = script;
        this.sceneObject = sceneObject;
        this.logFunction = logFunction;
    }
    // Monitors the given transform's world position, resolving once minStableFrames have been within distanceTolerance of the mean position
    async waitForStability(transform, minStableFrames, distanceTolerance) {
        return new Promise((resolve, reject) => {
            this.monitoredPositions.push(new MonitoredPosition(transform, minStableFrames, distanceTolerance, resolve));
            // Register for update events if required
            if (this.updateEvent === null) {
                this.updateEvent = this.script.createEvent("UpdateEvent");
                this.updateEvent.bind(this.onUpdate.bind(this));
            }
        });
    }
    onUpdate() {
        this.logFunction();
        for (var i = this.monitoredPositions.length - 1; i >= 0; i--) {
            this.monitoredPositions[i].addSample();
            if (this.monitoredPositions[i].isStable()) {
                this.log("World position stable after " +
                    this.monitoredPositions[i].numFramesObserved +
                    " frames");
                // Remove the complete monitor request
                this.monitoredPositions.splice(i, 1);
            }
        }
        // Remove onUpdate if we are no longer monitoring anything
        if (this.monitoredPositions.length === 0) {
            this.script.removeEvent(this.updateEvent);
            this.updateEvent = null;
        }
    }
}
exports.WorldPositionMonitor = WorldPositionMonitor;
function findDeviceTracking() {
    // Define predicate for bfs
    const predicate = (object) => {
        const component = object.getComponent("Component.DeviceTracking");
        if (object.enabled && component !== null) {
            return component;
        }
        else {
            return null;
        }
    };
    // Get root objects from the scene
    const rootObjects = [];
    for (let i = 0; i < global.scene.getRootObjectsCount(); i++) {
        rootObjects.push(global.scene.getRootObject(i));
    }
    return (0, algorithms_1.bfs)(rootObjects, predicate);
}
exports.findDeviceTracking = findDeviceTracking;
//# sourceMappingURL=Util.js.map