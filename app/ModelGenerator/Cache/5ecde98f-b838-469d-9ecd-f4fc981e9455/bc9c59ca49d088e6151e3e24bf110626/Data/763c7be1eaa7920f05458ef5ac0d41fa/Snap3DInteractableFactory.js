"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Snap3DInteractableFactory = void 0;
var __selfType = requireType("./Snap3DInteractableFactory");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Snap3D_1 = require("Remote Service Gateway.lspkg/HostedSnap/Snap3D");
const Snap3DInteractable_1 = require("./Snap3DInteractable");
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider");
const Gemini_1 = require("Remote Service Gateway.lspkg/HostedExternal/Gemini");
let Snap3DInteractableFactory = class Snap3DInteractableFactory extends BaseScriptComponent {
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
                    { parts: [{ text: "You are an assistant for an app that turns a user's sticky note text into a Snap3D input prompt. Transform the note into a concise but vivid 3D landmark prompt that clearly represents the meaning or theme of the note. It should look like a marker object that symbolizes the note. It should stay directly grounded in the note’s subject or activity. Output ONLY the raw prompt string with no commentary, quotes, or formatting. Here is the user's sticky note text: " }], role: 'model' },
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
    createInteractable3DObject(originalText, overridePosition) {
        return new Promise((resolve, reject) => {
            if (!this.avaliableToRequest) {
                print("Already processing a request. Please wait.");
                return;
            }
            this.avaliableToRequest = false;
            this.generateSnap3DPrompt(originalText)
                .then((cleanPrompt) => {
                // Instantiate the object
                let outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
                outputObj.name = "Snap3DInteractable - " + cleanPrompt;
                // Get Snap3DInteractable component
                let snap3DInteractable = outputObj.getComponent(Snap3DInteractable_1.Snap3DInteractable.getTypeName());
                // **Display the original text** on the object
                snap3DInteractable.setPrompt(originalText);
                // Position
                if (overridePosition) {
                    outputObj.getTransform().setWorldPosition(overridePosition);
                }
                else {
                    let newPos = this.wcfmp.getForwardPosition(80);
                    outputObj.getTransform().setWorldPosition(newPos);
                }
                // Feed **cleaned-up prompt** to Snap3D for model generation
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
    __initialize() {
        super.__initialize();
        this.avaliableToRequest = true;
        this.wcfmp = WorldCameraFinderProvider_1.default.getInstance();
    }
};
exports.Snap3DInteractableFactory = Snap3DInteractableFactory;
exports.Snap3DInteractableFactory = Snap3DInteractableFactory = __decorate([
    component
], Snap3DInteractableFactory);
//# sourceMappingURL=Snap3DInteractableFactory.js.map