import { bfs } from "./algorithms";
import { LoggerVisualization } from "../SpatialPersistence/Logging";

type DelayedUpdate = () => void;
type DelayedUpdateArray = DelayedUpdate[];

export class DelayActionByMultipleFrames {
  constructor(script: BaseScriptComponent, numberOfFrames: number) {
    this.updateEvent = script.createEvent("UpdateEvent");
    this.updateEvent.bind(this.onUpdate.bind(this));
    this.doItLater = DelayActionByMultipleFrames.emptyDoitlater(numberOfFrames);
    this.numberOfFrames = numberOfFrames;
  }

  private updateEvent: UpdateEvent;

  private doItLater: DelayedUpdateArray[];

  async waitForNextFrame(): Promise<void> {
    return new Promise<void>((resolve, reject) => {
      this.doItLater[this.numberOfFrames - 1].push(resolve);
    });
  }

  private onUpdate() {
    // execute things deferred to this frame
    let doItNow = this.doItLater.shift()!;
    while (doItNow.length) {
      doItNow.shift()!();
    }
    this.doItLater.push([]); // swap would be better
  }

  private static emptyDoitlater(length: number) {
    let doItLater = [];
    for (let i = 0; i < length; i++) {
      doItLater.push([]);
    }
    return doItLater;
  }

  private numberOfFrames: number;
}

class MonitoredPosition {
  transform: Transform;
  minStableFrames: number;
  distanceTolerance: number;
  onSuccess: DelayedUpdate;
  numFramesObserved: number = 0;
  private positions: vec3[] = [];

  constructor(
    transform: Transform,
    minStableFrames: number,
    distanceTolerance: number,
    onSuccess: DelayedUpdate,
  ) {
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

  isStable(): Boolean {
    if (this.positions.length < this.minStableFrames) {
      return false;
    }

    let meanPos = this.positions.reduce(
      function (a, b) {
        return a.add(b);
      },
      new vec3(0, 0, 0),
    );
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

export class WorldPositionMonitor {
  constructor(
    script: BaseScriptComponent,
    sceneObject: SceneObject,
    logFunction: () => void,
  ) {
    this.script = script;
    this.sceneObject = sceneObject;
    this.logFunction = logFunction;
  }

  private script: BaseScriptComponent;
  private sceneObject: SceneObject;
  private updateEvent?: UpdateEvent = null;
  private monitoredPositions: MonitoredPosition[] = [];
  private logFunction: () => void;

  // Monitors the given transform's world position, resolving once minStableFrames have been within distanceTolerance of the mean position
  async waitForStability(
    transform: Transform,
    minStableFrames: number,
    distanceTolerance: number,
  ): Promise<void> {
    return new Promise<void>((resolve, reject) => {
      this.monitoredPositions.push(
        new MonitoredPosition(
          transform,
          minStableFrames,
          distanceTolerance,
          resolve,
        ),
      );
      // Register for update events if required
      if (this.updateEvent === null) {
        this.updateEvent = this.script.createEvent("UpdateEvent");
        this.updateEvent.bind(this.onUpdate.bind(this));
      }
    });
  }

  private onUpdate() {
    this.logFunction();

    for (var i = this.monitoredPositions.length - 1; i >= 0; i--) {
      this.monitoredPositions[i].addSample();
      if (this.monitoredPositions[i].isStable()) {
        this.log(
          "World position stable after " +
            this.monitoredPositions[i].numFramesObserved +
            " frames",
        );
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

  private logger = LoggerVisualization.createLogger("position monitor");
  private log = this.logger.log.bind(this.logger);
}

export function findDeviceTracking(): DeviceTracking | null {
  // Define predicate for bfs
  const predicate = (object: SceneObject): DeviceTracking | null => {
    const component = object.getComponent("Component.DeviceTracking");

    if (object.enabled && component !== null) {
      return component;
    } else {
      return null;
    }
  };

  // Get root objects from the scene
  const rootObjects = [];
  for (let i = 0; i < global.scene.getRootObjectsCount(); i++) {
    rootObjects.push(global.scene.getRootObject(i));
  }

  return bfs<DeviceTracking | null>(rootObjects, predicate);
}
