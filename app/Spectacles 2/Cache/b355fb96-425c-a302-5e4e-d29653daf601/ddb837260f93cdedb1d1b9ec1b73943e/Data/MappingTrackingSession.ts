import { Deferred } from "../Util/Deferred";
import { delay } from "../Util/Delay";
import { setTimeout, clearTimeout } from "../Util/debounce";
import { LocationTracking } from "./Tracking";
import { LoggerVisualization } from "./Logging";
import { MapScanning } from "./MapScanning";

// a MappingTrackingSession is guaranteed to have at least one MapScanning or LocationTracking
// and never more than one of each
//
// This is needed in R54 to maintain the underlying VOS tracking session

export class MappingTrackingSession {
  waitForReleaseInS: number;

  private _mapScanning: Deferred<MapScanning> = new Deferred<MapScanning>();
  public get mapScanning(): Deferred<MapScanning> {
    return this._mapScanning;
  }
  // setter is private because this class enforces the invariant that there is at least one MapScanning or LocationTracking
  private set mapScanning(value: Deferred<MapScanning>) {
    this._mapScanning.reject(new Error("replacing mapScanning"));
    this._mapScanning = value;
  }

  private _locationTracking: Deferred<LocationTracking> =
    new Deferred<LocationTracking>();
  public get locationTracking(): Deferred<LocationTracking> {
    return this._locationTracking;
  }
  // setter is private because this class enforces the invariant that there is at least one MapScanning or LocationTracking
  private set locationTracking(value: Deferred<LocationTracking>) {
    this._locationTracking.reject(new Error("replacing locationTracking"));
    this._locationTracking = value;
  }

  private _isFirstLocationTracking: boolean = true;

  constructor(mapScanning: MapScanning, waitForReleaseInS: number) {
    this.mapScanning.resolve(mapScanning);
    this.waitForReleaseInS = waitForReleaseInS;
  }

  async destroy(): Promise<void> {
    (async () => {
      const mapScanning = await this.mapScanning.promise;
      mapScanning.destroy();
    })();

    (async () => {
      const locationTracking = await this.locationTracking.promise;
      locationTracking.destroy();
    })();

    this.mapScanning = new Deferred<MapScanning>();
    this.locationTracking = new Deferred<LocationTracking>();
    await delay(this.waitForReleaseInS);
  }

  async replaceMapScanning(
    mapScanningReplacer: () => MapScanning,
  ): Promise<MapScanning> {
    // we can only replace the mapping session if we have a LocationTracking
    await this.locationTracking.promise;
    this.log("replacing mapScanning");

    (async () => {
      const mapScanning = await this.mapScanning.promise;
      mapScanning.destroy();
    })();

    this.mapScanning = new Deferred<MapScanning>();
    this.mapScanning.reject("destroying"); // anyone adding things between now and the replacement will be lost - but they shouldn't be doing that
    await delay(this.waitForReleaseInS);
    let mapScanning = mapScanningReplacer();
    this.mapScanning = new Deferred<MapScanning>();
    this.mapScanning.resolve(mapScanning);
    return mapScanning;
  }

  async replaceLocationTracking(
    locationTrackingReplacer: () => LocationTracking,
  ): Promise<LocationTracking> {
    // we can only replace the LocationTracking if we have a MappingSession
    await this.mapScanning.promise;
    this.log("replacing tracking");

    // first time we set locationTracking there wasn't one previously, so we don't need to clear the old one
    if (!this._isFirstLocationTracking) {
      (async () => {
        const locationTracking = await this.locationTracking.promise;
        locationTracking.destroy();
      })();

      this.locationTracking = new Deferred<LocationTracking>(); // anyone adding things between now and the replacement will be lost - but they shouldn't be doing that
      this.locationTracking.reject("destroying");

      await delay(this.waitForReleaseInS);
    }
    this._isFirstLocationTracking = false;
    this.locationTracking = new Deferred<LocationTracking>();
    let locationTracking = locationTrackingReplacer();
    this.locationTracking.resolve(locationTracking);
    return locationTracking;
  }

  private logger = LoggerVisualization.createLogger("mappingtracking");
  private log = (message: string) => this.logger.log(message);
}
