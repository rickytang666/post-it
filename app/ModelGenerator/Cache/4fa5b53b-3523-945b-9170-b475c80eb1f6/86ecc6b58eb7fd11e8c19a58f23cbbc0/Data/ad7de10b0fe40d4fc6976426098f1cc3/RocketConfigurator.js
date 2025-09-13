"use strict";
var __esDecorate = (this && this.__esDecorate) || function (ctor, descriptorIn, decorators, contextIn, initializers, extraInitializers) {
    function accept(f) { if (f !== void 0 && typeof f !== "function") throw new TypeError("Function expected"); return f; }
    var kind = contextIn.kind, key = kind === "getter" ? "get" : kind === "setter" ? "set" : "value";
    var target = !descriptorIn && ctor ? contextIn["static"] ? ctor : ctor.prototype : null;
    var descriptor = descriptorIn || (target ? Object.getOwnPropertyDescriptor(target, contextIn.name) : {});
    var _, done = false;
    for (var i = decorators.length - 1; i >= 0; i--) {
        var context = {};
        for (var p in contextIn) context[p] = p === "access" ? {} : contextIn[p];
        for (var p in contextIn.access) context.access[p] = contextIn.access[p];
        context.addInitializer = function (f) { if (done) throw new TypeError("Cannot add initializers after decoration has completed"); extraInitializers.push(accept(f || null)); };
        var result = (0, decorators[i])(kind === "accessor" ? { get: descriptor.get, set: descriptor.set } : descriptor[key], context);
        if (kind === "accessor") {
            if (result === void 0) continue;
            if (result === null || typeof result !== "object") throw new TypeError("Object expected");
            if (_ = accept(result.get)) descriptor.get = _;
            if (_ = accept(result.set)) descriptor.set = _;
            if (_ = accept(result.init)) initializers.unshift(_);
        }
        else if (_ = accept(result)) {
            if (kind === "field") initializers.unshift(_);
            else descriptor[key] = _;
        }
    }
    if (target) Object.defineProperty(target, contextIn.name, descriptor);
    done = true;
};
var __runInitializers = (this && this.__runInitializers) || function (thisArg, initializers, value) {
    var useValue = arguments.length > 2;
    for (var i = 0; i < initializers.length; i++) {
        value = useValue ? initializers[i].call(thisArg, value) : initializers[i].call(thisArg);
    }
    return useValue ? value : void 0;
};
var __setFunctionName = (this && this.__setFunctionName) || function (f, name, prefix) {
    if (typeof name === "symbol") name = name.description ? "[".concat(name.description, "]") : "";
    return Object.defineProperty(f, "name", { configurable: true, value: prefix ? "".concat(prefix, " ", name) : name });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.RocketConfigurator = void 0;
var __selfType = requireType("./RocketConfigurator");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const NativeLogger_1 = require("SpectaclesInteractionKit.lspkg/Utils/NativeLogger");
const validate_1 = require("SpectaclesInteractionKit.lspkg/Utils/validate");
const ExhaustControls_1 = require("./ExhaustControls");
const TAG = "RocketConfigurator";
const log = new NativeLogger_1.default(TAG);
/**
 * This class is responsible for configuring the rocket by setting up its parts and managing the exhaust controls. It initializes the rocket sections and provides methods to set rocket part sections.
 *
 */
let RocketConfigurator = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var RocketConfigurator = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.rocket = this.rocket;
            this.allRocketParts = this.allRocketParts;
            this.topSection = null;
            this.middleSection = null;
            this.bottomSection = null;
            this.exhaustControl = null;
            this.noseConeBackingImages = new Map();
            this.bodyTubeBackingImages = new Map();
            this.finsBackingImages = new Map();
            this.activeBackingTexture = requireAsset("SpectaclesInteractionKit.lspkg/Assets/Textures/Rectangle-Active.png");
            this.inactiveBackingTexture = requireAsset("SpectaclesInteractionKit.lspkg/Assets/Textures/Rectangle-Inactive.png");
            this.setUpRocket = () => {
                for (let i = 0; i < this.allRocketParts.length; i++) {
                    if (this.allRocketParts[i].name === "Space Age Nose Cone") {
                        this.topSection = this.allRocketParts[i].instantiate(this.rocket);
                    }
                    if (this.allRocketParts[i].name === "Space Age Body Tube") {
                        this.middleSection = this.allRocketParts[i].instantiate(this.rocket);
                    }
                    if (this.allRocketParts[i].name === "Space Age Fins") {
                        this.bottomSection = this.allRocketParts[i].instantiate(this.rocket);
                    }
                }
            };
            this.setRocketPartSection = (style, item) => {
                if (isNull(this.topSection))
                    log.f("Top section is null!");
                if (isNull(this.middleSection))
                    log.f("Middle section is null!");
                if (isNull(this.bottomSection))
                    log.f("Bottom section is null!");
                const combinedName = style + " " + item;
                let rocketPart;
                if (item === "Nose Cone") {
                    if (this.topSection !== null)
                        this.topSection.destroy();
                    for (let i = 0; i < this.allRocketParts.length; i++) {
                        if (combinedName === this.allRocketParts[i].name) {
                            rocketPart = this.allRocketParts[i].instantiate(this.rocket);
                        }
                    }
                    if (rocketPart !== undefined) {
                        this.topSection = rocketPart;
                    }
                    else {
                        log.f("Rocket part is undefined!");
                    }
                }
                else if (item === "Body Tube") {
                    if (this.middleSection !== null)
                        this.middleSection.destroy();
                    for (let i = 0; i < this.allRocketParts.length; i++) {
                        if (combinedName === this.allRocketParts[i].name) {
                            rocketPart = this.allRocketParts[i].instantiate(this.rocket);
                        }
                    }
                    if (rocketPart !== undefined) {
                        this.middleSection = rocketPart;
                    }
                    else {
                        log.f("Rocket part is undefined!");
                    }
                }
                else if (item === "Fins") {
                    if (this.bottomSection !== null)
                        this.bottomSection.destroy();
                    for (let i = 0; i < this.allRocketParts.length; i++) {
                        if (combinedName === this.allRocketParts[i].name) {
                            rocketPart = this.allRocketParts[i].instantiate(this.rocket);
                        }
                    }
                    if (rocketPart !== undefined) {
                        this.bottomSection = rocketPart;
                    }
                    else {
                        log.f("Rocket part is undefined!");
                    }
                }
                this.setBackingColorsByPartType(style, item);
            };
            this.registerRocketListItemBacking = (style, item, backing) => {
                if (item === "Nose Cone") {
                    this.noseConeBackingImages.set(style, backing);
                }
                else if (item === "Body Tube") {
                    this.bodyTubeBackingImages.set(style, backing);
                }
                else if (item === "Fins") {
                    this.finsBackingImages.set(style, backing);
                }
                if (style === "Space Age") {
                    backing.mainMaterial.mainPass.baseTex = this.activeBackingTexture;
                }
            };
            this.setBackingColorsByPartType = (style, item) => {
                if (item === "Nose Cone") {
                    this.setBackingColors(this.noseConeBackingImages, style);
                }
                else if (item === "Body Tube") {
                    this.setBackingColors(this.bodyTubeBackingImages, style);
                }
                else if (item === "Fins") {
                    this.setBackingColors(this.finsBackingImages, style);
                }
            };
            this.getExhaustControl = () => {
                (0, validate_1.validate)(this.bottomSection);
                this.exhaustControl = this.bottomSection.getComponent(ExhaustControls_1.ExhaustControls.getTypeName());
            };
        }
        __initialize() {
            super.__initialize();
            this.rocket = this.rocket;
            this.allRocketParts = this.allRocketParts;
            this.topSection = null;
            this.middleSection = null;
            this.bottomSection = null;
            this.exhaustControl = null;
            this.noseConeBackingImages = new Map();
            this.bodyTubeBackingImages = new Map();
            this.finsBackingImages = new Map();
            this.activeBackingTexture = requireAsset("SpectaclesInteractionKit.lspkg/Assets/Textures/Rectangle-Active.png");
            this.inactiveBackingTexture = requireAsset("SpectaclesInteractionKit.lspkg/Assets/Textures/Rectangle-Inactive.png");
            this.setUpRocket = () => {
                for (let i = 0; i < this.allRocketParts.length; i++) {
                    if (this.allRocketParts[i].name === "Space Age Nose Cone") {
                        this.topSection = this.allRocketParts[i].instantiate(this.rocket);
                    }
                    if (this.allRocketParts[i].name === "Space Age Body Tube") {
                        this.middleSection = this.allRocketParts[i].instantiate(this.rocket);
                    }
                    if (this.allRocketParts[i].name === "Space Age Fins") {
                        this.bottomSection = this.allRocketParts[i].instantiate(this.rocket);
                    }
                }
            };
            this.setRocketPartSection = (style, item) => {
                if (isNull(this.topSection))
                    log.f("Top section is null!");
                if (isNull(this.middleSection))
                    log.f("Middle section is null!");
                if (isNull(this.bottomSection))
                    log.f("Bottom section is null!");
                const combinedName = style + " " + item;
                let rocketPart;
                if (item === "Nose Cone") {
                    if (this.topSection !== null)
                        this.topSection.destroy();
                    for (let i = 0; i < this.allRocketParts.length; i++) {
                        if (combinedName === this.allRocketParts[i].name) {
                            rocketPart = this.allRocketParts[i].instantiate(this.rocket);
                        }
                    }
                    if (rocketPart !== undefined) {
                        this.topSection = rocketPart;
                    }
                    else {
                        log.f("Rocket part is undefined!");
                    }
                }
                else if (item === "Body Tube") {
                    if (this.middleSection !== null)
                        this.middleSection.destroy();
                    for (let i = 0; i < this.allRocketParts.length; i++) {
                        if (combinedName === this.allRocketParts[i].name) {
                            rocketPart = this.allRocketParts[i].instantiate(this.rocket);
                        }
                    }
                    if (rocketPart !== undefined) {
                        this.middleSection = rocketPart;
                    }
                    else {
                        log.f("Rocket part is undefined!");
                    }
                }
                else if (item === "Fins") {
                    if (this.bottomSection !== null)
                        this.bottomSection.destroy();
                    for (let i = 0; i < this.allRocketParts.length; i++) {
                        if (combinedName === this.allRocketParts[i].name) {
                            rocketPart = this.allRocketParts[i].instantiate(this.rocket);
                        }
                    }
                    if (rocketPart !== undefined) {
                        this.bottomSection = rocketPart;
                    }
                    else {
                        log.f("Rocket part is undefined!");
                    }
                }
                this.setBackingColorsByPartType(style, item);
            };
            this.registerRocketListItemBacking = (style, item, backing) => {
                if (item === "Nose Cone") {
                    this.noseConeBackingImages.set(style, backing);
                }
                else if (item === "Body Tube") {
                    this.bodyTubeBackingImages.set(style, backing);
                }
                else if (item === "Fins") {
                    this.finsBackingImages.set(style, backing);
                }
                if (style === "Space Age") {
                    backing.mainMaterial.mainPass.baseTex = this.activeBackingTexture;
                }
            };
            this.setBackingColorsByPartType = (style, item) => {
                if (item === "Nose Cone") {
                    this.setBackingColors(this.noseConeBackingImages, style);
                }
                else if (item === "Body Tube") {
                    this.setBackingColors(this.bodyTubeBackingImages, style);
                }
                else if (item === "Fins") {
                    this.setBackingColors(this.finsBackingImages, style);
                }
            };
            this.getExhaustControl = () => {
                (0, validate_1.validate)(this.bottomSection);
                this.exhaustControl = this.bottomSection.getComponent(ExhaustControls_1.ExhaustControls.getTypeName());
            };
        }
        onAwake() {
            this.setUpRocket();
        }
        setBackingColors(map, style) {
            map.forEach((image, key) => {
                if (key === style) {
                    // active
                    image.mainMaterial.mainPass.baseTex = this.activeBackingTexture;
                }
                else {
                    // inactive
                    image.mainMaterial.mainPass.baseTex = this.inactiveBackingTexture;
                }
            });
        }
    };
    __setFunctionName(_classThis, "RocketConfigurator");
    (() => {
        var _a;
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create((_a = _classSuper[Symbol.metadata]) !== null && _a !== void 0 ? _a : null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        RocketConfigurator = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return RocketConfigurator = _classThis;
})();
exports.RocketConfigurator = RocketConfigurator;
//# sourceMappingURL=RocketConfigurator.js.map