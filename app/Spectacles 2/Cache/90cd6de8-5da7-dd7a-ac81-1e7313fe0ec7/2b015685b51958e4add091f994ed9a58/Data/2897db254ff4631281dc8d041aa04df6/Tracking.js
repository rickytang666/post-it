"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LocationTracking = void 0;
const Util_1 = require("../Util/Util");
const Util_2 = require("../Util/Util");
const Logging_1 = require("./Logging");
class LocationTracking {
    constructor(script, sceneObject, location, logPoseSettling) {
        this.logger = Logging_1.LoggerVisualization.createLogger("tracking");
        this.log = this.logger.log.bind(this.logger);
        this.sceneObject = sceneObject;
        let deviceTracking = (0, Util_1.findDeviceTracking)();
        let poseLogger = logPoseSettling
            ? () => {
                this.log("pose settling: locatedAt - " +
                    locatedAt.getTransform().getWorldTransform().toString() +
                    " device - " +
                    deviceTracking
                        .getSceneObject()
                        .getTransform()
                        .getWorldTransform()
                        .toString());
            }
            : () => {
                return;
            };
        this.worldPositionMonitor = new Util_2.WorldPositionMonitor(script, sceneObject, poseLogger);
        // onFound appears not to get reset when location is set to null, so we always have to remove the component if present
        this.removeTrackingComponent();
        let locatedAt = sceneObject.createComponent("LocatedAtComponent");
        this.log("downloading location " + location.locationId);
        locatedAt.location = location;
        locatedAt.onReady.add(() => {
            this.log("attempting to track " + location.locationId);
        });
        this.onceFound = new Promise((resolve, reject) => {
            locatedAt.onFound.add(async () => {
                this.log("location " +
                    location.locationId +
                    " found, waiting for stability");
                // !!! hack because onFound fires before world transform is set
                await this.worldPositionMonitor.waitForStability(locatedAt.getTransform(), 3, 1);
                this.log("location " + location.locationId + " stable");
                let toLensWorldFromTrackedLocation = sceneObject
                    .getTransform()
                    .getWorldTransform();
                resolve([location, toLensWorldFromTrackedLocation]);
            });
            //locatedAt.onError.add(() => {
            //    this.log("tracking location: " + (location as any).locationId + " - error");
            //});
            //locatedAt.onCannotTrack.add(() => {
            //    this.log("tracking location: " + (location as any).locationId + " - cannot track");
            //});
        });
    }
    destroy() {
        this.removeTrackingComponent();
    }
    removeTrackingComponent() {
        let sceneObject = this.sceneObject;
        let oldLocatedAt = sceneObject.getComponent("LocatedAtComponent");
        if (oldLocatedAt) {
            this.log("removing old location tracking");
            oldLocatedAt.destroy();
        }
    }
}
exports.LocationTracking = LocationTracking;
//# sourceMappingURL=Tracking.js.map