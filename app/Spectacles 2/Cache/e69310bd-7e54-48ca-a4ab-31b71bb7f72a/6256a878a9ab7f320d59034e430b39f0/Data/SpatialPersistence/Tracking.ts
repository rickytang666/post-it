import { findDeviceTracking } from "../Util/Util";
import {
  DelayActionByMultipleFrames,
  WorldPositionMonitor,
} from "../Util/Util";
import { LoggerVisualization } from "./Logging";

export class LocationTracking {
  constructor(
    script: BaseScriptComponent,
    sceneObject: SceneObject,
    location: LocationAsset,
    logPoseSettling: boolean,
  ) {
    this.sceneObject = sceneObject;
    let deviceTracking = findDeviceTracking();
    let poseLogger = logPoseSettling
      ? () => {
          this.log(
            "pose settling: locatedAt - " +
              locatedAt.getTransform().getWorldTransform().toString() +
              " device - " +
              deviceTracking
                .getSceneObject()
                .getTransform()
                .getWorldTransform()
                .toString(),
          );
        }
      : () => {
          return;
        };
    this.worldPositionMonitor = new WorldPositionMonitor(
      script,
      sceneObject,
      poseLogger,
    );

    // onFound appears not to get reset when location is set to null, so we always have to remove the component if present
    this.removeTrackingComponent();

    let locatedAt = sceneObject.createComponent(
      "LocatedAtComponent",
    ) as LocatedAtComponent;
    this.log("downloading location " + (location as any).locationId);
    locatedAt.location = location;
    locatedAt.onReady.add(() => {
      this.log("attempting to track " + (location as any).locationId);
    });
    this.onceFound = new Promise<
      [trackedLocation: LocationAsset, toLensWorldFromTrackedLocation: mat4]
    >((resolve, reject) => {
      locatedAt.onFound.add(async () => {
        this.log(
          "location " +
            (location as any).locationId +
            " found, waiting for stability",
        );

        // !!! hack because onFound fires before world transform is set
        await this.worldPositionMonitor.waitForStability(
          locatedAt.getTransform(),
          3,
          1,
        );

        this.log("location " + (location as any).locationId + " stable");
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

  private removeTrackingComponent() {
    let sceneObject = this.sceneObject;
    let oldLocatedAt = sceneObject.getComponent(
      "LocatedAtComponent",
    ) as LocatedAtComponent;
    if (oldLocatedAt) {
      this.log("removing old location tracking");
      oldLocatedAt.destroy();
    }
  }

  onceFound: Promise<
    [trackedLocation: LocationAsset, toLensWorldFromTrackedLocation: mat4]
  >;

  // private scene objects
  private sceneObject: SceneObject;

  private logger = LoggerVisualization.createLogger("tracking");
  private log = this.logger.log.bind(this.logger);

  private worldPositionMonitor: WorldPositionMonitor;
}
