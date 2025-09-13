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
exports.AIAssistantUIBridge = void 0;
var __selfType = requireType("./AIAssistantUIBridge");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("LSTween.lspkg/LSTween");
const Easing_1 = require("LSTween.lspkg/TweenJS/Easing");
var AssistantType;
(function (AssistantType) {
    AssistantType["Gemini"] = "Gemini";
    AssistantType["OpenAI"] = "OpenAI";
})(AssistantType || (AssistantType = {}));
let AIAssistantUIBridge = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var AIAssistantUIBridge = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.assistantType = AssistantType.Gemini;
            this.geminiAssistant = this.geminiAssistant;
            this.openAIAssistant = this.openAIAssistant;
            this.sphereController = this.sphereController;
            this.snap3DInteractableFactory = this.snap3DInteractableFactory;
            this.hintTitle = this.hintTitle;
            this.hintText = this.hintText;
            this.geminiButton = this.geminiButton;
            this.openAIButton = this.openAIButton;
            this.textIsVisible = true;
        }
        __initialize() {
            super.__initialize();
            this.assistantType = AssistantType.Gemini;
            this.geminiAssistant = this.geminiAssistant;
            this.openAIAssistant = this.openAIAssistant;
            this.sphereController = this.sphereController;
            this.snap3DInteractableFactory = this.snap3DInteractableFactory;
            this.hintTitle = this.hintTitle;
            this.hintText = this.hintText;
            this.geminiButton = this.geminiButton;
            this.openAIButton = this.openAIButton;
            this.textIsVisible = true;
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(this.onStart.bind(this));
        }
        onStart() {
            this.geminiButton.onButtonPinched.add(() => {
                this.assistantType = AssistantType.Gemini;
                this.hintTitle.text = "Gemini Live Example";
                this.startWebsocketAndUI();
            });
            this.openAIButton.onButtonPinched.add(() => {
                this.assistantType = AssistantType.OpenAI;
                this.hintTitle.text = "OpenAI Realtime Example";
                this.startWebsocketAndUI();
            });
        }
        hideButtons() {
            this.geminiButton.enabled = false;
            this.openAIButton.enabled = false;
            LSTween_1.LSTween.scaleToLocal(this.geminiButton.sceneObject.getTransform(), vec3.zero(), 500)
                .easing(Easing_1.default.Quadratic.Out)
                .onComplete(() => {
                this.geminiButton.sceneObject.enabled = false;
            })
                .start();
            LSTween_1.LSTween.scaleToLocal(this.openAIButton.sceneObject.getTransform(), vec3.zero(), 500)
                .easing(Easing_1.default.Quadratic.Out)
                .onComplete(() => {
                this.openAIButton.sceneObject.enabled = false;
            })
                .start();
        }
        startWebsocketAndUI() {
            this.hideButtons();
            this.hintText.text = "Pinch on the orb next to your left hand to activate";
            if (global.deviceInfoSystem.isEditor()) {
                this.hintText.text = "Look down and click on the orb to activate";
            }
            this.sphereController.initializeUI();
            // Set the current assistant based on selection
            this.currentAssistant =
                this.assistantType === AssistantType.Gemini
                    ? this.geminiAssistant
                    : this.openAIAssistant;
            if (this.assistantType === AssistantType.Gemini) {
                this.geminiAssistant.createGeminiLiveSession();
            }
            else if (this.assistantType === AssistantType.OpenAI) {
                this.openAIAssistant.createOpenAIRealtimeSession();
            }
            // Connect the selected assistant to the UI
            this.connectAssistantEvents();
            // Connect sphere controller activation to the current assistant
            this.sphereController.isActivatedEvent.add((isActivated) => {
                if (this.textIsVisible) {
                    LSTween_1.LSTween.textAlphaTo(this.hintTitle, 0, 600).start();
                    LSTween_1.LSTween.textAlphaTo(this.hintText, 0, 600).start();
                    let bgColor = this.hintTitle.backgroundSettings.fill.color;
                    LSTween_1.LSTween.rawTween(600)
                        .onUpdate((tweenData) => {
                        let percent = tweenData.t;
                        bgColor.a = 1 - percent;
                        this.hintTitle.backgroundSettings.fill.color = bgColor;
                    })
                        .start();
                }
                this.textIsVisible = false;
                this.currentAssistant.streamData(isActivated);
                if (!isActivated) {
                    this.currentAssistant.interruptAudioOutput();
                }
            });
        }
        connectAssistantEvents() {
            // Connect text update events
            this.currentAssistant.updateTextEvent.add((data) => {
                this.sphereController.setText(data);
            });
            // Connect function call events
            this.currentAssistant.functionCallEvent.add((data) => {
                if (data.name === "Snap3D") {
                    // Send a response based on which assistant is active
                    if (this.assistantType === AssistantType.Gemini) {
                        this.geminiAssistant.sendFunctionCallUpdate(data.name, "Beginning to create 3D object...");
                    }
                    else {
                        this.openAIAssistant.sendFunctionCallUpdate(data.name, data.callId, // OpenAI requires a call_id
                        "Beginning to create 3D object...");
                    }
                    // Create the 3D object and handle the response
                    this.snap3DInteractableFactory
                        .createInteractable3DObject(data.args.prompt)
                        .then((status) => {
                        if (this.assistantType === AssistantType.Gemini) {
                            this.geminiAssistant.sendFunctionCallUpdate(data.name, status);
                        }
                        else {
                            this.openAIAssistant.sendFunctionCallUpdate(data.name, data.callId, status);
                        }
                    })
                        .catch((error) => {
                        if (this.assistantType === AssistantType.Gemini) {
                            this.geminiAssistant.sendFunctionCallUpdate(data.name, error);
                        }
                        else {
                            this.openAIAssistant.sendFunctionCallUpdate(data.name, data.callId, error);
                        }
                    });
                }
            });
        }
    };
    __setFunctionName(_classThis, "AIAssistantUIBridge");
    (() => {
        var _a;
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create((_a = _classSuper[Symbol.metadata]) !== null && _a !== void 0 ? _a : null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        AIAssistantUIBridge = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return AIAssistantUIBridge = _classThis;
})();
exports.AIAssistantUIBridge = AIAssistantUIBridge;
//# sourceMappingURL=AIAssistantUIBridge.js.map