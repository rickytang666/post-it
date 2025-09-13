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
exports.InteractableImageGenerator = void 0;
var __selfType = requireType("./InteractableImageGenerator");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const ImageGenerator_1 = require("./ImageGenerator");
let InteractableImageGenerator = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var InteractableImageGenerator = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.modelProvider = this.modelProvider;
            this.image = this.image;
            this.textDisplay = this.textDisplay;
            this.asrQueryController = this.asrQueryController;
            this.spinner = this.spinner;
            this.imageGenerator = null;
        }
        __initialize() {
            super.__initialize();
            this.modelProvider = this.modelProvider;
            this.image = this.image;
            this.textDisplay = this.textDisplay;
            this.asrQueryController = this.asrQueryController;
            this.spinner = this.spinner;
            this.imageGenerator = null;
        }
        onAwake() {
            this.imageGenerator = new ImageGenerator_1.ImageGenerator(this.modelProvider);
            let imgMat = this.image.mainMaterial.clone();
            this.image.clearMaterials();
            this.image.mainMaterial = imgMat;
            this.createEvent("OnStartEvent").bind(() => {
                this.spinner.enabled = false;
                this.asrQueryController.onQueryEvent.add((query) => {
                    this.createImage(query);
                });
            });
        }
        createImage(prompt) {
            this.spinner.enabled = true;
            this.textDisplay.text = "Generating: " + prompt;
            this.imageGenerator
                .generateImage(prompt)
                .then((image) => {
                print("Image generated successfully: " + image);
                this.textDisplay.text = prompt;
                this.image.mainMaterial.mainPass.baseTex = image;
                this.textDisplay.text = prompt;
                this.spinner.enabled = false;
            })
                .catch((error) => {
                print("Error generating image: " + error);
                this.textDisplay.text = "Error Generating Image";
                this.spinner.enabled = false;
            });
        }
    };
    __setFunctionName(_classThis, "InteractableImageGenerator");
    (() => {
        var _a;
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create((_a = _classSuper[Symbol.metadata]) !== null && _a !== void 0 ? _a : null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        InteractableImageGenerator = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return InteractableImageGenerator = _classThis;
})();
exports.InteractableImageGenerator = InteractableImageGenerator;
//# sourceMappingURL=InteractableImageGenerator.js.map