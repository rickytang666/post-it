import { setTimeout, clearTimeout } from "../Util/debounce";
import Event from "../Util/Event";
import { LoggerVisualization } from "./Logging";

// -- MAPPING SESSION EVENT CLASSES
export type MappingStatusEvent = {
  quality: number;
  capacityUsed: number;
};

// LensStudio Mock for MappingSession
class MockMappingSession {
  canCheckpoint: boolean = true;
  onMapped: any; // event1<LocationAsset, void> is not recognized outside Lens Studio
  quality: number = 1.0;
  capacityUsed: number = 0.07; // a value lower than 'maxAllowedCapacityUsed'
  wearableMinimumSize: number;
  wearableMaximumSize: number;
  handheldMinimumSize: number;
  handheldMaximumSize: number;
  checkpoint(): void {}
  cancel(): void {}
  onCapacityUsedAtLimit: Event<void>;
  onQualityAcceptable: Event<void>;
  throttling: any; // MappingSession.MappingThrottling enum type
  wearableAcceptableRawCapacity: number;
  wearableAllowEarlyCheckpoint: boolean;
  isOfType() {}
  isSame() {}
  getTypeName() {}
}

export class Timeout {
  timeoutInS: number;
}
export class GateByFlagOrTrackingAlready {
  allowCheckpoint: boolean;
  trackingAlready: boolean;
}

// -- MAPPING SESSION
export class MapScanning {
  private onMappingStatusEvent = new Event<MappingStatusEvent>();
  public readonly onMappingStatus = this.onMappingStatusEvent.publicApi();
  public readonly maxAllowedCapacityUsed: number = 0.1; // finetuned to reduce the map download lag to <1s
  // TODO (oelkhatib): Remove the hysteresis factor as soon as map saving
  // is properly async on a background thread and the map size estimate is
  // fixed.
  public readonly capacityHysteresisFactor: number = 1.3;

  mappingSession?: MappingSession | MockMappingSession;
  activelyMapping: boolean = false;
  private checkpointCount: number = 0;
  private cancelCheckpoint: any;
  private updateEvent: SceneEvent;

  constructor(script: ScriptComponent) {
    this.updateEvent = script.createEvent("UpdateEvent");
    this.updateEvent.bind(this.notifyUpdate.bind(this));

    var mappingOptions = LocatedAtComponent.createMappingOptions();
    mappingOptions.location = LocationAsset.getAROrigin();

    if (global.deviceInfoSystem.isEditor()) {
      this.mappingSession = new MockMappingSession();
    } else {
      this.mappingSession =
        LocatedAtComponent.createMappingSession(mappingOptions);
    }

    this.log("Scanning start");
    this.activelyMapping = true;
  }

  async checkpoint(
    completionCriterion: Timeout | GateByFlagOrTrackingAlready,
  ): Promise<LocationAsset> {
    this.checkpointCount += 1;
    this.log("checkpoint trigger requested: " + this.checkpointCount);

    let checkpointed = new Promise<LocationAsset>((resolve, reject) => {
      if (global.deviceInfoSystem.isEditor()) {
        resolve(LocationAsset.getAROrigin());
      } else {
        let onCheckpointedRegistration = this.mappingSession.onMapped.add(
          (location: LocationAsset) => {
            this.log("checkpoint completed: " + this.checkpointCount);
            if (!this.mappingSession) {
              reject(
                "[checkpoint]: mapping session was destroyed due to a reset or replacement between the checkpoint trigger and the completion",
              );
              return;
            }
            this.mappingSession.onMapped.remove(onCheckpointedRegistration);
            resolve(location);
          },
        );
      }
    });

    if (completionCriterion instanceof Timeout) {
      await this.triggerCheckpointWithTimeout(completionCriterion as Timeout);
    } else {
      await this.triggerCheckpointWithGateFlag(
        completionCriterion as GateByFlagOrTrackingAlready,
      );
    }

    return checkpointed;
  }

  destroy() {
    this.log("destroying");
    this.activelyMapping = false;
    this.mappingSession?.cancel();
    this.mappingSession = null;
    clearTimeout(this.cancelCheckpoint);
  }

  private notifyUpdate(): void {
    if (this.mappingSession && this.activelyMapping) {
      let capacityUsed = this.mappingSession.capacityUsed;
      let quality = this.mappingSession.quality;

      this.onMappingStatusEvent.invoke({
        capacityUsed: capacityUsed,
        quality: quality,
      } as MappingStatusEvent);
    }
  }

  private async triggerCheckpointWithTimeout(timeout: Timeout): Promise<void> {
    return new Promise((resolve, reject) => {
      var canCheckpoint = this.mappingSession.canCheckpoint;
      this.log("timeout - canCheckpoint:" + canCheckpoint.toString());

      this.cancelCheckpoint = setTimeout(() => {
        if (!this.mappingSession) {
          reject(
            "[triggerCheckpointWithTimeout] Mapping session has been destroyed",
          );
          return;
        }
        this.log("timeout - triggering checkpoint: " + this.checkpointCount);
        this.activelyMapping = false;
        this.mappingSession.checkpoint();
        resolve();
      }, timeout.timeoutInS * 1000);
    });
  }

  private async triggerCheckpointWithGateFlag(
    gateFlag: GateByFlagOrTrackingAlready,
  ): Promise<void> {
    return new Promise((resolve, reject) => {
      var canCheckpoint = this.mappingSession.canCheckpoint;
      this.log("gated - canCheckpoint:" + canCheckpoint.toString());

      let subscription = this.onMappingStatus.add(
        (status: MappingStatusEvent) => {
          if (!this.mappingSession) {
            reject(
              "[triggerCheckpointWithGateFlag] Mapping session has been destroyed",
            );
            return;
          }
          // TODO (oelkhatib): Remove the hysteresis factor as soon as map
          // saving is properly async on a background thread and the map size
          // estimate is fixed.
          // NOTE: Map sizes tend to slightly go down when saved which makes
          // this check sensitive to the map size threshold. To prevent
          // additional lag when saving maps that are almost at the size
          // threshold, we add a hysteresis factor.
          if (
            (this.activelyMapping || gateFlag.trackingAlready) &&
            gateFlag.allowCheckpoint &&
            status.capacityUsed * this.capacityHysteresisFactor <
              this.maxAllowedCapacityUsed
          ) {
            this.log(
              "gate - triggering checkpoint - trackingAlready: " +
                gateFlag.trackingAlready.toString(),
            );
            this.onMappingStatusEvent.remove(subscription);
            this.activelyMapping = false;
            this.mappingSession.checkpoint();
            resolve();
          }
        },
      );
    });
  }

  private logger = LoggerVisualization.createLogger("mapper");
  private log = (message: string) => this.logger.log(message);
}
