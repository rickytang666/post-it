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
exports.GeminiAssistant = void 0;
var __selfType = requireType("./GeminiAssistant");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const AudioProcessor_1 = require("Remote Service Gateway.lspkg/Helpers/AudioProcessor");
const Gemini_1 = require("Remote Service Gateway.lspkg/HostedExternal/Gemini");
const VideoController_1 = require("Remote Service Gateway.lspkg/Helpers/VideoController");
const Event_1 = require("SpectaclesInteractionKit.lspkg/Utils/Event");
let GeminiAssistant = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var GeminiAssistant = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.websocketRequirementsObj = this.websocketRequirementsObj;
            this.dynamicAudioOutput = this.dynamicAudioOutput;
            this.microphoneRecorder = this.microphoneRecorder;
            this.instructions = this.instructions;
            this.haveVideoInput = this.haveVideoInput;
            this.haveAudioOutput = this.haveAudioOutput;
            this.voice = this.voice;
            this.audioProcessor = new AudioProcessor_1.AudioProcessor();
            this.videoController = new VideoController_1.VideoController(1500, CompressionQuality.HighQuality, EncodingType.Jpg);
            this.updateTextEvent = new Event_1.default();
            this.functionCallEvent = new Event_1.default();
        }
        __initialize() {
            super.__initialize();
            this.websocketRequirementsObj = this.websocketRequirementsObj;
            this.dynamicAudioOutput = this.dynamicAudioOutput;
            this.microphoneRecorder = this.microphoneRecorder;
            this.instructions = this.instructions;
            this.haveVideoInput = this.haveVideoInput;
            this.haveAudioOutput = this.haveAudioOutput;
            this.voice = this.voice;
            this.audioProcessor = new AudioProcessor_1.AudioProcessor();
            this.videoController = new VideoController_1.VideoController(1500, CompressionQuality.HighQuality, EncodingType.Jpg);
            this.updateTextEvent = new Event_1.default();
            this.functionCallEvent = new Event_1.default();
        }
        createGeminiLiveSession() {
            this.websocketRequirementsObj.enabled = true;
            this.dynamicAudioOutput.initialize(24000);
            this.microphoneRecorder.setSampleRate(16000);
            // Display internet connection status
            let internetStatus = global.deviceInfoSystem.isInternetAvailable()
                ? "Websocket connected"
                : "No internet";
            this.updateTextEvent.invoke({ text: internetStatus, completed: true });
            global.deviceInfoSystem.onInternetStatusChanged.add((args) => {
                internetStatus = args.isInternetAvailable
                    ? "Reconnected to internete"
                    : "No internet";
                this.updateTextEvent.invoke({ text: internetStatus, completed: true });
            });
            this.GeminiLive = Gemini_1.Gemini.liveConnect();
            this.GeminiLive.onOpen.add((event) => {
                print("Connection opened");
                this.sessionSetup();
            });
            let completedTextDisplay = true;
            this.GeminiLive.onMessage.add((message) => {
                var _a, _b, _c, _d, _e, _f, _g, _h, _j, _k, _l, _m, _o, _p, _q;
                print("Received message: " + JSON.stringify(message));
                // Setup complete, begin sending data
                if (message.setupComplete) {
                    message = message;
                    print("Setup complete");
                    this.setupInputs();
                }
                if (message === null || message === void 0 ? void 0 : message.serverContent) {
                    message = message;
                    // Playback the audio response
                    if ((_f = (_e = (_d = (_c = (_b = (_a = message === null || message === void 0 ? void 0 : message.serverContent) === null || _a === void 0 ? void 0 : _a.modelTurn) === null || _b === void 0 ? void 0 : _b.parts) === null || _c === void 0 ? void 0 : _c[0]) === null || _d === void 0 ? void 0 : _d.inlineData) === null || _e === void 0 ? void 0 : _e.mimeType) === null || _f === void 0 ? void 0 : _f.startsWith("audio/pcm")) {
                        let b64Audio = message.serverContent.modelTurn.parts[0].inlineData.data;
                        let audio = Base64.decode(b64Audio);
                        this.dynamicAudioOutput.addAudioFrame(audio);
                    }
                    if (message.serverContent.interrupted) {
                        this.dynamicAudioOutput.interruptAudioOutput();
                    }
                    // Show output transcription
                    else if ((_h = (_g = message === null || message === void 0 ? void 0 : message.serverContent) === null || _g === void 0 ? void 0 : _g.outputTranscription) === null || _h === void 0 ? void 0 : _h.text) {
                        if (completedTextDisplay) {
                            this.updateTextEvent.invoke({
                                text: (_j = message.serverContent.outputTranscription) === null || _j === void 0 ? void 0 : _j.text,
                                completed: true,
                            });
                        }
                        else {
                            this.updateTextEvent.invoke({
                                text: (_k = message.serverContent.outputTranscription) === null || _k === void 0 ? void 0 : _k.text,
                                completed: false,
                            });
                        }
                        completedTextDisplay = false;
                    }
                    // Show text response
                    else if ((_p = (_o = (_m = (_l = message === null || message === void 0 ? void 0 : message.serverContent) === null || _l === void 0 ? void 0 : _l.modelTurn) === null || _m === void 0 ? void 0 : _m.parts) === null || _o === void 0 ? void 0 : _o[0]) === null || _p === void 0 ? void 0 : _p.text) {
                        if (completedTextDisplay) {
                            this.updateTextEvent.invoke({
                                text: message.serverContent.modelTurn.parts[0].text,
                                completed: true,
                            });
                        }
                        else {
                            this.updateTextEvent.invoke({
                                text: message.serverContent.modelTurn.parts[0].text,
                                completed: false,
                            });
                        }
                        completedTextDisplay = false;
                    }
                    // Determine if the response is complete
                    else if ((_q = message === null || message === void 0 ? void 0 : message.serverContent) === null || _q === void 0 ? void 0 : _q.turnComplete) {
                        completedTextDisplay = true;
                    }
                }
                if (message.toolCall) {
                    message = message;
                    print(JSON.stringify(message));
                    // Handle tool calls
                    message.toolCall.functionCalls.forEach((functionCall) => {
                        this.functionCallEvent.invoke({
                            name: functionCall.name,
                            args: functionCall.args,
                        });
                    });
                }
            });
            this.GeminiLive.onError.add((event) => {
                print("Error: " + event);
            });
            this.GeminiLive.onClose.add((event) => {
                print("Connection closed: " + event.reason);
            });
        }
        streamData(stream) {
            if (stream) {
                if (this.haveVideoInput) {
                    this.videoController.startRecording();
                }
                this.microphoneRecorder.startRecording();
            }
            else {
                if (this.haveVideoInput) {
                    this.videoController.stopRecording();
                }
                this.microphoneRecorder.stopRecording();
            }
        }
        setupInputs() {
            this.audioProcessor.onAudioChunkReady.add((encodedAudioChunk) => {
                const message = {
                    realtime_input: {
                        media_chunks: [
                            {
                                mime_type: "audio/pcm",
                                data: encodedAudioChunk,
                            },
                        ],
                    },
                };
                this.GeminiLive.send(message);
            });
            // Configure the microphone
            this.microphoneRecorder.onAudioFrame.add((audioFrame) => {
                this.audioProcessor.processFrame(audioFrame);
            });
            if (this.haveVideoInput) {
                // Configure the video controller
                this.videoController.onEncodedFrame.add((encodedFrame) => {
                    const message = {
                        realtime_input: {
                            media_chunks: [
                                {
                                    mime_type: "image/jpeg",
                                    data: encodedFrame,
                                },
                            ],
                        },
                    };
                    this.GeminiLive.send(message);
                });
            }
        }
        sendFunctionCallUpdate(functionName, args) {
            const messageToSend = {
                tool_response: {
                    function_responses: [
                        {
                            name: functionName,
                            response: { content: args },
                        },
                    ],
                },
            };
            this.GeminiLive.send(messageToSend);
        }
        sessionSetup() {
            let generationConfig = {
                responseModalities: ["AUDIO"],
                temperature: 1,
                speechConfig: {
                    voiceConfig: {
                        prebuiltVoiceConfig: {
                            voiceName: this.voice,
                        },
                    },
                },
            };
            if (!this.haveAudioOutput) {
                generationConfig = {
                    responseModalities: ["TEXT"],
                };
            }
            // Define the Snap3D tool
            const tools = [
                {
                    function_declarations: [
                        {
                            name: "Snap3D",
                            description: "Generates a 3D model based on a text prompt",
                            parameters: {
                                type: "object",
                                properties: {
                                    prompt: {
                                        type: "string",
                                        description: "The text prompt to generate a 3D model from. Cartoonish styles work best. Use 'full body' when generating characters.",
                                    },
                                },
                                required: ["prompt"],
                            },
                        },
                    ],
                },
            ];
            // Send the session setup message
            let modelUri = `models/gemini-2.0-flash-live-preview-04-09`;
            const sessionSetupMessage = {
                setup: {
                    model: modelUri,
                    generation_config: generationConfig,
                    system_instruction: {
                        parts: [
                            {
                                text: this.instructions,
                            },
                        ],
                    },
                    tools: tools,
                    contextWindowCompression: {
                        triggerTokens: 20000,
                        slidingWindow: { targetTokens: 16000 },
                    },
                    output_audio_transcription: {},
                },
            };
            this.GeminiLive.send(sessionSetupMessage);
        }
        interruptAudioOutput() {
            if (this.dynamicAudioOutput && this.haveAudioOutput) {
                this.dynamicAudioOutput.interruptAudioOutput();
            }
            else {
                print("DynamicAudioOutput is not initialized.");
            }
        }
    };
    __setFunctionName(_classThis, "GeminiAssistant");
    (() => {
        var _a;
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create((_a = _classSuper[Symbol.metadata]) !== null && _a !== void 0 ? _a : null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        GeminiAssistant = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return GeminiAssistant = _classThis;
})();
exports.GeminiAssistant = GeminiAssistant;
//# sourceMappingURL=GeminiAssistant.js.map