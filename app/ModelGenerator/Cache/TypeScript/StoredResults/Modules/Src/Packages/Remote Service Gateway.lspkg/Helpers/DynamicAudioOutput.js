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
exports.DynamicAudioOutput = void 0;
var __selfType = requireType("./DynamicAudioOutput");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * Acts as a dynamic audio track output for PCM16 input
 */
let DynamicAudioOutput = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var DynamicAudioOutput = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.audioOutputTrack = this.audioOutputTrack;
        }
        __initialize() {
            super.__initialize();
            this.audioOutputTrack = this.audioOutputTrack;
        }
        onAwake() {
            this.audioOutputProvider = this.audioOutputTrack
                .control;
            this.audComponent = this.sceneObject.getComponent("AudioComponent");
        }
        /**
         * Initializes the audio output with the specified sample rate.
         * @param sampleRate - Sample rate for the audio output.
         */
        initialize(sampleRate) {
            this.audioOutputProvider.sampleRate = sampleRate;
            this.audComponent.audioTrack = this.audioOutputTrack;
            this.audComponent.play(-1);
        }
        /**
         * Adds an audio frame to the output.
         * @param uint8Array - Audio data in PCM 16-bit format as a Uint8Array.
         */
        addAudioFrame(uint8Array) {
            if (!this.audComponent.isPlaying()) {
                this.audComponent.play(-1);
            }
            let { data, shape } = this.convertPCM16ToAudFrameAndShape(uint8Array);
            this.audioOutputProvider.enqueueAudioFrame(data, shape);
        }
        /**
         * Stops the audio output if it is currently playing.
         */
        interruptAudioOutput() {
            if (this.audComponent.isPlaying()) {
                this.audComponent.stop(false);
            }
        }
        convertPCM16ToAudFrameAndShape(uint8Array) {
            // Ensure we process only complete samples (2 bytes each)
            const safeLength = uint8Array.length - (uint8Array.length % 2);
            let bufferSize = safeLength / 2;
            let data = new Float32Array(bufferSize);
            for (let i = 0, j = 0; i < safeLength; i += 2, j++) {
                const sample = ((uint8Array[i] | (uint8Array[i + 1] << 8)) << 16) >> 16;
                data[j] = sample / 32768.0;
            }
            let shape = new vec3(bufferSize, 1, 1);
            return { data: data, shape: shape };
        }
    };
    __setFunctionName(_classThis, "DynamicAudioOutput");
    (() => {
        var _a;
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create((_a = _classSuper[Symbol.metadata]) !== null && _a !== void 0 ? _a : null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        DynamicAudioOutput = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return DynamicAudioOutput = _classThis;
})();
exports.DynamicAudioOutput = DynamicAudioOutput;
//# sourceMappingURL=DynamicAudioOutput.js.map