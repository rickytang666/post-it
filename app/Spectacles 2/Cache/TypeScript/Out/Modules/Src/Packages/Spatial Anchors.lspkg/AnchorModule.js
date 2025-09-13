"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var AnchorModule_1;
Object.defineProperty(exports, "__esModule", { value: true });
exports.AnchorModule = void 0;
var __selfType = requireType("./AnchorModule");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * ## Anchors
 * Define and track poses in world space.
 */
const SpatialPersistence_1 = require("./SpatialPersistence/SpatialPersistence");
const AnchorSession_1 = require("./AnchorSession");
/**
 * Create, scan for, save and delete Anchors.
 */
let AnchorModule = AnchorModule_1 = class AnchorModule extends BaseScriptComponent {
    /**
     * Open a session for scanning for anchors in the area.
     */
    async openSession(options) {
        await this._haveInitialized;
        if (this._session) {
            throw new Error("Only one session may be active at a time.");
        }
        this._spatialPersistence.selectArea(null);
        print("Spatial Anchor version: " + this._version);
        this._session = new AnchorSession_1.AnchorSession(options, this._spatialPersistence, async (session) => {
            await this.onClosed(session);
        });
        return this._session;
    }
    // implementation details
    onAwake() {
        this._spatialPersistence =
            AnchorModule_1.theSpatialPersistenceFactory !== undefined
                ? AnchorModule_1.theSpatialPersistenceFactory()
                : new SpatialPersistence_1.SpatialPersistence(20, // mappingInterval
                0.5, // resetDelayInS
                this.debug, true, // incrementalMapping
                false, // enableLoggingPoseSettling
                this.cloudStorage);
        this._spatialPersistence.awake(this.sceneObject, this);
    }
    async onClosed(session) {
        return await new Promise((resolve, reject) => {
            let registration = this._spatialPersistence.onAreaDeactivated.add((areaDeactivatedEvent) => {
                this._spatialPersistence.onAreaDeactivated.remove(registration);
                resolve();
            });
            this._spatialPersistence.selectArea(null);
            this._session = undefined;
        });
    }
    get _haveInitialized() {
        if (!this._initialized) {
            const waitForInitialization = async () => {
                await this._spatialPersistence.initialize();
            };
            this._initialized = waitForInitialization();
        }
        return this._initialized;
    }
    __initialize() {
        super.__initialize();
        this._version = "v0.0.7";
    }
};
exports.AnchorModule = AnchorModule;
exports.AnchorModule = AnchorModule = AnchorModule_1 = __decorate([
    component
], AnchorModule);
//# sourceMappingURL=AnchorModule.js.map