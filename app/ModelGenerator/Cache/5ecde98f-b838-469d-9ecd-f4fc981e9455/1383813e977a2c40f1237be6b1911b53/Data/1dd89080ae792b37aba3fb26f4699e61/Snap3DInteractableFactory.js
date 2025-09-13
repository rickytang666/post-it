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
exports.Snap3DInteractableFactory = void 0;
var __selfType = requireType("./Snap3DInteractableFactory");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Snap3D_1 = require("Remote Service Gateway.lspkg/HostedSnap/Snap3D");
const Snap3DInteractable_1 = require("./Snap3DInteractable");
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider");
const Gemini_1 = require("Remote Service Gateway.lspkg/HostedExternal/Gemini");
let Snap3DInteractableFactory = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var Snap3DInteractableFactory = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.prompt = this.prompt;
            this.refineMesh = this.refineMesh;
            this.useVertexColor = this.useVertexColor;
            this.runOnTap = this.runOnTap;
            this.snap3DInteractablePrefab = this.snap3DInteractablePrefab;
            this.avaliableToRequest = true;
            this.wcfmp = WorldCameraFinderProvider_1.default.getInstance();
        }
        __initialize() {
            super.__initialize();
            this.prompt = this.prompt;
            this.refineMesh = this.refineMesh;
            this.useVertexColor = this.useVertexColor;
            this.runOnTap = this.runOnTap;
            this.snap3DInteractablePrefab = this.snap3DInteractablePrefab;
            this.avaliableToRequest = true;
            this.wcfmp = WorldCameraFinderProvider_1.default.getInstance();
        }
        onAwake() {
            this.createEvent("TapEvent").bind(() => {
                if (!this.runOnTap)
                    return;
                this.createInteractable3DObject(this.prompt);
            });
        }
        /** Helper to clean up prompt using Gemini */
        generateSnap3DPrompt(userInput) {
            const geminiRequest = {
                model: 'gemini-2.0-flash',
                type: 'generateContent',
                body: {
                    contents: [
                        { parts: [{ text: "Rewrite this into a creative 3D prompt for Snap3D:" }], role: 'model' },
                        { parts: [{ text: userInput }], role: 'user' }
                    ]
                }
            };
            return Gemini_1.Gemini.models(geminiRequest)
                .then((response) => {
                const prompt = response.candidates[0].content.parts[0].text.trim();
                print("Gemini prompt: " + prompt);
                return prompt;
            });
        }
        createInteractable3DObject(input, overridePosition) {
            return new Promise((resolve, reject) => {
                if (!this.avaliableToRequest) {
                    print("Already processing a request. Please wait.");
                    return;
                }
                this.avaliableToRequest = false;
                this.generateSnap3DPrompt(input)
                    .then((cleanPrompt) => {
                    let outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
                    outputObj.name = "Snap3DInteractable - " + cleanPrompt;
                    let snap3DInteractable = outputObj.getComponent(Snap3DInteractable_1.Snap3DInteractable.getTypeName());
                    snap3DInteractable.setPrompt(cleanPrompt);
                    if (overridePosition) {
                        outputObj.getTransform().setWorldPosition(overridePosition);
                    }
                    else {
                        let newPos = this.wcfmp.getForwardPosition(80);
                        outputObj.getTransform().setWorldPosition(newPos);
                    }
                    Snap3D_1.Snap3D.submitAndGetStatus({
                        prompt: cleanPrompt,
                        format: "glb",
                        refine: this.refineMesh,
                        use_vertex_color: this.useVertexColor
                    }).then((submitGetStatusResults) => {
                        submitGetStatusResults.event.add(([value, assetOrError]) => {
                            if (value === "image") {
                                snap3DInteractable.setImage(assetOrError.texture);
                            }
                            else if (value === "base_mesh") {
                                snap3DInteractable.setModel(assetOrError.gltfAsset, !this.refineMesh);
                                if (!this.refineMesh) {
                                    this.avaliableToRequest = true;
                                    resolve("Created base mesh: " + cleanPrompt);
                                }
                            }
                            else if (value === "refined_mesh") {
                                snap3DInteractable.setModel(assetOrError.gltfAsset, true);
                                this.avaliableToRequest = true;
                                resolve("Created refined mesh: " + cleanPrompt);
                            }
                            else if (value === "failed") {
                                print("Snap3D failed: " + assetOrError.errorMsg);
                                this.avaliableToRequest = true;
                                reject("Failed to create mesh: " + cleanPrompt);
                            }
                        });
                    });
                })
                    .catch((err) => {
                    print("Error generating Snap3D prompt: " + err);
                    this.avaliableToRequest = true;
                    reject(err);
                });
            });
        }
    };
    __setFunctionName(_classThis, "Snap3DInteractableFactory");
    (() => {
        var _a;
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create((_a = _classSuper[Symbol.metadata]) !== null && _a !== void 0 ? _a : null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        Snap3DInteractableFactory = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return Snap3DInteractableFactory = _classThis;
})();
exports.Snap3DInteractableFactory = Snap3DInteractableFactory;
//# sourceMappingURL=Snap3DInteractableFactory.js.map