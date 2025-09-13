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
exports.SphereController = void 0;
var __selfType = requireType("./SphereController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Interactable_1 = require("SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable");
const LSTween_1 = require("LSTween.lspkg/LSTween");
const Easing_1 = require("LSTween.lspkg/TweenJS/Easing");
const InteractableManipulation_1 = require("SpectaclesInteractionKit.lspkg/Components/Interaction/InteractableManipulation/InteractableManipulation");
const HandInputData_1 = require("SpectaclesInteractionKit.lspkg/Providers/HandInputData/HandInputData");
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider");
const PinchButton_1 = require("SpectaclesInteractionKit.lspkg/Components/UI/PinchButton/PinchButton");
const Event_1 = require("SpectaclesInteractionKit.lspkg/Utils/Event");
let SphereController = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var SphereController = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.hoverMat = this.hoverMat;
            this.orbInteractableObj = this.orbInteractableObj;
            this.orbObject = this.orbObject;
            this.orbVisualParent = this.orbVisualParent;
            this.orbScreenPosition = this.orbScreenPosition;
            this.closeObj = this.closeObj;
            this.closeButtonInteractable = this.closeButtonInteractable;
            this.worldSpaceText = this.worldSpaceText;
            this.screenSpaceText = this.screenSpaceText;
            this.uiParent = this.uiParent;
            this.wasInFOV = true;
            // Get SIK data
            this.handProvider = HandInputData_1.HandInputData.getInstance();
            this.menuHand = this.handProvider.getHand("left");
            this.trackedToHand = true;
            this.wcfmp = WorldCameraFinderProvider_1.default.getInstance();
            this.minimizedSize = vec3.one().uniformScale(0.3);
            this.fullSize = vec3.one();
            this.isActivatedEvent = new Event_1.default();
        }
        __initialize() {
            super.__initialize();
            this.hoverMat = this.hoverMat;
            this.orbInteractableObj = this.orbInteractableObj;
            this.orbObject = this.orbObject;
            this.orbVisualParent = this.orbVisualParent;
            this.orbScreenPosition = this.orbScreenPosition;
            this.closeObj = this.closeObj;
            this.closeButtonInteractable = this.closeButtonInteractable;
            this.worldSpaceText = this.worldSpaceText;
            this.screenSpaceText = this.screenSpaceText;
            this.uiParent = this.uiParent;
            this.wasInFOV = true;
            // Get SIK data
            this.handProvider = HandInputData_1.HandInputData.getInstance();
            this.menuHand = this.handProvider.getHand("left");
            this.trackedToHand = true;
            this.wcfmp = WorldCameraFinderProvider_1.default.getInstance();
            this.minimizedSize = vec3.one().uniformScale(0.3);
            this.fullSize = vec3.one();
            this.isActivatedEvent = new Event_1.default();
        }
        onAwake() {
            this.interactable = this.orbInteractableObj.getComponent(Interactable_1.Interactable.getTypeName());
            this.manipulate = this.orbInteractableObj.getComponent(InteractableManipulation_1.InteractableManipulation.getTypeName());
            this.orbButton = this.orbInteractableObj.getComponent(PinchButton_1.PinchButton.getTypeName());
            this.closeButton = this.closeButtonInteractable.getComponent(PinchButton_1.PinchButton.getTypeName());
            this.setIsTrackedToHand(true);
            this.createEvent("OnStartEvent").bind(this.init.bind(this));
            this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
            this.hoverMat.mainPass.activeHover = 0;
            this.uiParent.enabled = false;
        }
        initializeUI() {
            this.uiParent.enabled = true;
        }
        setIsTrackedToHand(value) {
            this.trackedToHand = value;
            this.manipulate.enabled = !value;
            if (value) {
                this.setOrbToScreenPosition(true);
                LSTween_1.LSTween.scaleToLocal(this.orbObject.getTransform(), this.minimizedSize, 600)
                    .easing(Easing_1.default.Quadratic.InOut)
                    .start();
                LSTween_1.LSTween.scaleToLocal(this.closeObj.getTransform(), vec3.one().uniformScale(0.1), 600)
                    .easing(Easing_1.default.Quadratic.InOut)
                    .onComplete(() => {
                    this.closeButton.sceneObject.enabled = false;
                })
                    .start();
                this.screenSpaceText.enabled = false;
                this.worldSpaceText.enabled = false;
            }
            else {
                LSTween_1.LSTween.scaleToLocal(this.orbObject.getTransform(), this.fullSize, 400)
                    .easing(Easing_1.default.Quadratic.InOut)
                    .start();
                let worldPos = this.wcfmp.getForwardPosition(100);
                LSTween_1.LSTween.moveToWorld(this.orbObject.getTransform(), worldPos, 600)
                    .easing(Easing_1.default.Quadratic.InOut)
                    .start();
                this.closeButton.sceneObject.enabled = true;
                LSTween_1.LSTween.scaleToLocal(this.closeObj.getTransform(), vec3.one(), 600)
                    .easing(Easing_1.default.Quadratic.InOut)
                    .start();
                this.screenSpaceText.enabled = false;
                this.worldSpaceText.enabled = true;
            }
            this.isActivatedEvent.invoke(!value);
        }
        init() {
            this.interactable.onHoverEnter.add(() => {
                LSTween_1.LSTween.rawTween(200)
                    .onUpdate((tweenData) => {
                    let percent = tweenData.t;
                    this.hoverMat.mainPass.activeHover = percent;
                })
                    .start();
            });
            this.interactable.onHoverExit.add(() => {
                LSTween_1.LSTween.rawTween(200)
                    .onUpdate((tweenData) => {
                    let percent = 1 - tweenData.t;
                    this.hoverMat.mainPass.activeHover = percent;
                })
                    .start();
            });
            this.orbButton.onButtonPinched.add(() => {
                if (this.trackedToHand) {
                    this.setIsTrackedToHand(false);
                }
            });
            this.closeButton.onButtonPinched.add(() => {
                if (!this.trackedToHand) {
                    this.setIsTrackedToHand(true);
                }
            });
        }
        onUpdate() {
            this.positionByHand();
            this.keepActiveOrbVisible();
        }
        positionByHand() {
            let objectToTransform = this.orbObject.getTransform();
            if (!this.trackedToHand) {
                objectToTransform = this.closeObj.getTransform();
            }
            let handPosition = this.menuHand.pinkyKnuckle.position;
            let handRight = this.menuHand.indexTip.right;
            let curPosition = objectToTransform.getWorldPosition();
            let menuPosition = handPosition.add(handRight.uniformScale(4));
            if (global.deviceInfoSystem.isEditor()) {
                menuPosition = this.wcfmp.getWorldPosition().add(new vec3(0, -20, -25));
            }
            let nPosition = vec3.lerp(curPosition, menuPosition, 0.2);
            objectToTransform.setWorldPosition(nPosition);
            var billboardPos = this.wcfmp
                .getWorldPosition()
                .add(this.wcfmp.forward().uniformScale(5));
            billboardPos = billboardPos.add(this.wcfmp.right().uniformScale(-5));
            let dir = billboardPos.sub(menuPosition).normalize();
            objectToTransform.setWorldRotation(quat.lookAt(dir, vec3.up()));
            if ((!this.menuHand.isTracked() || !this.menuHand.isFacingCamera()) &&
                !global.deviceInfoSystem.isEditor()) {
                objectToTransform.getSceneObject().enabled = false;
            }
            else {
                objectToTransform.getSceneObject().enabled = true;
            }
        }
        setOrbToScreenPosition(inScrPos) {
            if (!inScrPos) {
                this.orbVisualParent.setParent(this.orbScreenPosition);
                this.orbVisualParent.getTransform().setLocalPosition(vec3.zero());
                LSTween_1.LSTween.scaleFromToLocal(this.orbVisualParent.getTransform(), vec3.one().uniformScale(0.01), vec3.one().uniformScale(0.3), 200).start();
                this.screenSpaceText.enabled = true;
                this.worldSpaceText.enabled = false;
            }
            else {
                this.orbVisualParent.setParent(this.orbObject);
                this.orbVisualParent.getTransform().setLocalPosition(vec3.zero());
                LSTween_1.LSTween.scaleToLocal(this.orbVisualParent.getTransform(), vec3.one(), 200).start();
                this.screenSpaceText.enabled = false;
                this.worldSpaceText.enabled = true;
            }
        }
        keepActiveOrbVisible() {
            if (this.trackedToHand) {
                return;
            }
            let orbPos = this.orbObject.getTransform().getWorldPosition();
            let inFov = this.wcfmp.inFoV(orbPos);
            if (inFov !== this.wasInFOV) {
                this.setOrbToScreenPosition(inFov);
            }
            this.wasInFOV = inFov;
        }
        setText(data) {
            if (data.completed) {
                this.worldSpaceText.text = data.text;
                this.screenSpaceText.text = data.text;
            }
            else {
                this.worldSpaceText.text += data.text;
                this.screenSpaceText.text += data.text;
            }
        }
    };
    __setFunctionName(_classThis, "SphereController");
    (() => {
        var _a;
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create((_a = _classSuper[Symbol.metadata]) !== null && _a !== void 0 ? _a : null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        SphereController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return SphereController = _classThis;
})();
exports.SphereController = SphereController;
//# sourceMappingURL=SphereController.js.map