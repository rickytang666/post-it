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
exports.Snap3DInteractable = void 0;
var __selfType = requireType("./Snap3DInteractable");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const FunctionTimingUtils_1 = require("SpectaclesInteractionKit.lspkg/Utils/FunctionTimingUtils");
let Snap3DInteractable = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var Snap3DInteractable = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.modelParent = this.modelParent;
            this.img = this.img;
            this.promptDisplay = this.promptDisplay;
            this.spinner = this.spinner;
            this.mat = this.mat;
            this.displayPlate = this.displayPlate;
            this.colliderObj = this.colliderObj;
            this.tempModel = null;
            this.finalModel = null;
            this.size = 20;
            this.sizeVec = null;
        }
        __initialize() {
            super.__initialize();
            this.modelParent = this.modelParent;
            this.img = this.img;
            this.promptDisplay = this.promptDisplay;
            this.spinner = this.spinner;
            this.mat = this.mat;
            this.displayPlate = this.displayPlate;
            this.colliderObj = this.colliderObj;
            this.tempModel = null;
            this.finalModel = null;
            this.size = 20;
            this.sizeVec = null;
        }
        onAwake() {
            // Clone the image material to avoid modifying the original
            let imgMaterial = this.img.mainMaterial;
            imgMaterial.mainPass.baseTex = this.img.mainPass.baseTex;
            this.img.enabled = false;
            let offsetBelow = 0;
            this.sizeVec = vec3.one().uniformScale(this.size);
            this.displayPlate
                .getTransform()
                .setLocalPosition(new vec3(0, -this.size * 0.5 - offsetBelow, 0));
            this.colliderObj.getTransform().setLocalScale(this.sizeVec);
            this.img.getTransform().setLocalScale(this.sizeVec);
        }
        setPrompt(prompt) {
            this.promptDisplay.text = prompt;
        }
        setImage(image) {
            this.img.enabled = true;
            this.img.mainPass.baseTex = image;
        }
        setModel(model, isFinal) {
            this.img.enabled = false;
            if (isFinal) {
                if (!isNull(this.finalModel)) {
                    this.finalModel.destroy();
                }
                this.spinner.enabled = false;
                this.finalModel = model.tryInstantiate(this.modelParent, this.mat);
                this.finalModel.getTransform().setLocalScale(this.sizeVec);
            }
            else {
                this.tempModel = model.tryInstantiate(this.modelParent, this.mat);
                this.tempModel.getTransform().setLocalScale(this.sizeVec);
            }
        }
        onFailure(error) {
            this.img.enabled = false;
            this.spinner.enabled = false;
            if (this.tempModel) {
                this.tempModel.destroy();
            }
            if (this.finalModel) {
                this.finalModel.destroy();
            }
            this.promptDisplay.text = "Error: " + error;
            (0, FunctionTimingUtils_1.setTimeout)(() => {
                this.destroy();
            }, 5000); // Hide error after 5 seconds
        }
    };
    __setFunctionName(_classThis, "Snap3DInteractable");
    (() => {
        var _a;
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create((_a = _classSuper[Symbol.metadata]) !== null && _a !== void 0 ? _a : null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        Snap3DInteractable = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return Snap3DInteractable = _classThis;
})();
exports.Snap3DInteractable = Snap3DInteractable;
//# sourceMappingURL=Snap3DInteractable.js.map