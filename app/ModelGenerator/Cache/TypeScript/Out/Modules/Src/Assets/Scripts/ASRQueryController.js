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
exports.ASRQueryController = void 0;
var __selfType = requireType("./ASRQueryController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Event_1 = require("SpectaclesInteractionKit.lspkg/Utils/Event");
const LSTween_1 = require("LSTween.lspkg/LSTween");
let ASRQueryController = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var ASRQueryController = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.button = this.button;
            this.activityRenderMesh = this.activityRenderMesh;
            this.asrModule = require("LensStudio:AsrModule");
            this.isRecording = false;
            this.onQueryEvent = new Event_1.default();
        }
        __initialize() {
            super.__initialize();
            this.button = this.button;
            this.activityRenderMesh = this.activityRenderMesh;
            this.asrModule = require("LensStudio:AsrModule");
            this.isRecording = false;
            this.onQueryEvent = new Event_1.default();
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(this.init.bind(this));
        }
        init() {
            this.activityMaterial = this.activityRenderMesh.mainMaterial.clone();
            this.activityRenderMesh.clearMaterials();
            this.activityRenderMesh.mainMaterial = this.activityMaterial;
            this.activityMaterial.mainPass.in_out = 0;
            this.button.onButtonPinched.add(() => {
                this.getVoiceQuery().then((query) => {
                    this.onQueryEvent.invoke(query);
                });
            });
        }
        getVoiceQuery() {
            return new Promise((resolve, reject) => {
                if (this.isRecording) {
                    this.animateVoiceIndicator(false);
                    this.asrModule.stopTranscribing();
                    this.isRecording = false;
                    reject("Already recording, cancel recording");
                    return;
                }
                this.isRecording = true;
                let asrSettings = AsrModule.AsrTranscriptionOptions.create();
                asrSettings.mode = AsrModule.AsrMode.HighAccuracy;
                asrSettings.silenceUntilTerminationMs = 1500;
                asrSettings.onTranscriptionUpdateEvent.add((asrOutput) => {
                    if (asrOutput.isFinal) {
                        this.isRecording = false;
                        this.animateVoiceIndicator(false);
                        this.asrModule.stopTranscribing();
                        resolve(asrOutput.text);
                    }
                });
                asrSettings.onTranscriptionErrorEvent.add((asrOutput) => {
                    this.isRecording = false;
                    this.animateVoiceIndicator(false);
                    reject(asrOutput);
                });
                this.animateVoiceIndicator(true);
                this.asrModule.startTranscribing(asrSettings);
            });
        }
        animateVoiceIndicator(on) {
            if (on) {
                LSTween_1.LSTween.rawTween(250)
                    .onUpdate((data) => {
                    let percent = data.t;
                    this.activityMaterial.mainPass.in_out = percent;
                })
                    .start();
            }
            else {
                LSTween_1.LSTween.rawTween(250)
                    .onUpdate((data) => {
                    let percent = 1 - data.t;
                    this.activityMaterial.mainPass.in_out = percent;
                })
                    .start();
            }
        }
    };
    __setFunctionName(_classThis, "ASRQueryController");
    (() => {
        var _a;
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create((_a = _classSuper[Symbol.metadata]) !== null && _a !== void 0 ? _a : null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        ASRQueryController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return ASRQueryController = _classThis;
})();
exports.ASRQueryController = ASRQueryController;
//# sourceMappingURL=ASRQueryController.js.map