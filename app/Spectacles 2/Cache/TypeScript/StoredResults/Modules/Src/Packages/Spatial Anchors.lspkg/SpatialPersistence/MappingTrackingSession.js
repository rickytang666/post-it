"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.MappingTrackingSession = void 0;
const Deferred_1 = require("../Util/Deferred");
const Delay_1 = require("../Util/Delay");
const Logging_1 = require("./Logging");
// a MappingTrackingSession is guaranteed to have at least one MapScanning or LocationTracking
// and never more than one of each
//
// This is needed in R54 to maintain the underlying VOS tracking session
class MappingTrackingSession {
    get mapScanning() {
        return this._mapScanning;
    }
    // setter is private because this class enforces the invariant that there is at least one MapScanning or LocationTracking
    set mapScanning(value) {
        this._mapScanning.reject(new Error("replacing mapScanning"));
        this._mapScanning = value;
    }
    get locationTracking() {
        return this._locationTracking;
    }
    // setter is private because this class enforces the invariant that there is at least one MapScanning or LocationTracking
    set locationTracking(value) {
        this._locationTracking.reject(new Error("replacing locationTracking"));
        this._locationTracking = value;
    }
    constructor(mapScanning, waitForReleaseInS) {
        this._mapScanning = new Deferred_1.Deferred();
        this._locationTracking = new Deferred_1.Deferred();
        this._isFirstLocationTracking = true;
        this.logger = Logging_1.LoggerVisualization.createLogger("mappingtracking");
        this.log = (message) => this.logger.log(message);
        this.mapScanning.resolve(mapScanning);
        this.waitForReleaseInS = waitForReleaseInS;
    }
    async destroy() {
        (async () => {
            const mapScanning = await this.mapScanning.promise;
            mapScanning.destroy();
        })();
        (async () => {
            const locationTracking = await this.locationTracking.promise;
            locationTracking.destroy();
        })();
        this.mapScanning = new Deferred_1.Deferred();
        this.locationTracking = new Deferred_1.Deferred();
        await (0, Delay_1.delay)(this.waitForReleaseInS);
    }
    async replaceMapScanning(mapScanningReplacer) {
        // we can only replace the mapping session if we have a LocationTracking
        await this.locationTracking.promise;
        this.log("replacing mapScanning");
        (async () => {
            const mapScanning = await this.mapScanning.promise;
            mapScanning.destroy();
        })();
        this.mapScanning = new Deferred_1.Deferred();
        this.mapScanning.reject("destroying"); // anyone adding things between now and the replacement will be lost - but they shouldn't be doing that
        await (0, Delay_1.delay)(this.waitForReleaseInS);
        let mapScanning = mapScanningReplacer();
        this.mapScanning = new Deferred_1.Deferred();
        this.mapScanning.resolve(mapScanning);
        return mapScanning;
    }
    async replaceLocationTracking(locationTrackingReplacer) {
        // we can only replace the LocationTracking if we have a MappingSession
        await this.mapScanning.promise;
        this.log("replacing tracking");
        // first time we set locationTracking there wasn't one previously, so we don't need to clear the old one
        if (!this._isFirstLocationTracking) {
            (async () => {
                const locationTracking = await this.locationTracking.promise;
                locationTracking.destroy();
            })();
            this.locationTracking = new Deferred_1.Deferred(); // anyone adding things between now and the replacement will be lost - but they shouldn't be doing that
            this.locationTracking.reject("destroying");
            await (0, Delay_1.delay)(this.waitForReleaseInS);
        }
        this._isFirstLocationTracking = false;
        this.locationTracking = new Deferred_1.Deferred();
        let locationTracking = locationTrackingReplacer();
        this.locationTracking.resolve(locationTracking);
        return locationTracking;
    }
}
exports.MappingTrackingSession = MappingTrackingSession;
//# sourceMappingURL=MappingTrackingSession.js.map