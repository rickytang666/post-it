"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.HandInteractor = exports.MINIMUM_PINCH_STRENGTH = exports.FieldTargetingMode = void 0;
var __selfType = requireType("./HandInteractor");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Interactable_1 = require("../../Components/Interaction/Interactable/Interactable");
const WorldCameraFinderProvider_1 = require("../../Providers/CameraProvider/WorldCameraFinderProvider");
const HandInputData_1 = require("../../Providers/HandInputData/HandInputData");
const Event_1 = require("../../Utils/Event");
const validate_1 = require("../../Utils/validate");
const BaseInteractor_1 = require("../Interactor/BaseInteractor");
const DirectTargetProvider_1 = require("../Interactor/DirectTargetProvider");
const DragProvider_1 = require("../Interactor/DragProvider");
const HandRayProvider_1 = require("../Interactor/HandRayProvider");
const IndirectTargetProvider_1 = require("../Interactor/IndirectTargetProvider");
const Interactor_1 = require("../Interactor/Interactor");
const PokeTargetProvider_1 = require("../Interactor/PokeTargetProvider");
var FieldTargetingMode;
(function (FieldTargetingMode) {
    FieldTargetingMode[FieldTargetingMode["FarField"] = 0] = "FarField";
    FieldTargetingMode[FieldTargetingMode["NearField"] = 1] = "NearField";
    FieldTargetingMode[FieldTargetingMode["Direct"] = 2] = "Direct";
    FieldTargetingMode[FieldTargetingMode["BehindNearField"] = 3] = "BehindNearField";
})(FieldTargetingMode || (exports.FieldTargetingMode = FieldTargetingMode = {}));
const HANDUI_INTERACTION_DISTANCE_THRESHOLD_CM = 15;
// The threshold to reject a near field interaction (the default hand ray must be within a 45 degree angle to the plane's normal).
const NEAR_FIELD_ANGLE_THRESHOLD_RADIAN = Math.PI / 4;
// The minimum pinch strength required to trigger a pinch instead of a poke during direct targeting.
exports.MINIMUM_PINCH_STRENGTH = 0.2;
/**
 * This class handles hand interactions within the Spectacles Interaction Kit. It provides various configurations for hand types and raycast types.
 *
 */
let HandInteractor = class HandInteractor extends BaseInteractor_1.default {
    onAwake() {
        this.inputType = this.handType === "left" ? Interactor_1.InteractorInputType.LeftHand : Interactor_1.InteractorInputType.RightHand;
        this._hand = this.handProvider.getHand(this.handType);
        this.handRayProvider = new HandRayProvider_1.HandRayProvider({
            handType: this.handType,
            handInteractor: this
        });
        this.indirectTargetProvider = new IndirectTargetProvider_1.default(this, {
            maxRayDistance: this.maxRaycastDistance,
            rayProvider: this.handRayProvider,
            targetingVolumeMultiplier: this.indirectTargetingVolumeMultiplier,
            shouldPreventTargetUpdate: () => {
                return this.preventTargetUpdate();
            },
            spherecastRadii: this.spherecastRadii,
            spherecastDistanceThresholds: this.spherecastDistanceThresholds
        });
        this.indirectDragProvider = new DragProvider_1.DragProvider(this.indirectDragThreshold);
        if (this.directColliderEnterRadius >= this.directColliderExitRadius) {
            throw Error(`The direct collider enter radius should be less than the exit radius for bistable threshold behavior.`);
        }
        this.directTargetProvider = new DirectTargetProvider_1.DirectTargetProvider(this, {
            handType: this.handType,
            shouldPreventTargetUpdate: () => {
                return this.preventTargetUpdate();
            },
            sceneObjectName: `${this.handType === `left` ? `Left` : `Right`}HandColliderTargetProvider`,
            debugEnabled: this.drawDebug,
            colliderEnterRadius: this.directColliderEnterRadius,
            colliderExitRadius: this.directColliderExitRadius
        });
        this.directDragProvider = new DragProvider_1.DragProvider(this.directDragThreshold);
        this.pokeTargetProvider = new PokeTargetProvider_1.PokeTargetProvider({
            handType: this.handType,
            drawDebug: this.drawDebug
        });
        this.activeTargetProvider = this.indirectTargetProvider;
        this.dragProvider = this.indirectDragProvider;
        this.defineSceneEvents();
    }
    /**
     * @returns the TrackedHand that this HandInteractor is using for tracking information.
     */
    get hand() {
        return this._hand;
    }
    get startPoint() {
        var _a, _b;
        return (_b = (_a = this.activeTargetProvider) === null || _a === void 0 ? void 0 : _a.startPoint) !== null && _b !== void 0 ? _b : null;
    }
    get endPoint() {
        var _a, _b;
        return (_b = (_a = this.activeTargetProvider) === null || _a === void 0 ? void 0 : _a.endPoint) !== null && _b !== void 0 ? _b : null;
    }
    get direction() {
        var _a, _b;
        const proposedDirection = this.activeTargetingMode === Interactor_1.TargetingMode.Poke
            ? (_a = this.pokeTargetProvider) === null || _a === void 0 ? void 0 : _a.direction
            : (_b = this.indirectTargetProvider) === null || _b === void 0 ? void 0 : _b.direction;
        return proposedDirection !== null && proposedDirection !== void 0 ? proposedDirection : null;
    }
    get orientation() {
        var _a, _b;
        return (_b = (_a = this.hand) === null || _a === void 0 ? void 0 : _a.getPinchDirection()) !== null && _b !== void 0 ? _b : null;
    }
    get distanceToTarget() {
        var _a, _b, _c;
        return (_c = (_b = (_a = this.activeTargetProvider) === null || _a === void 0 ? void 0 : _a.currentInteractableHitInfo) === null || _b === void 0 ? void 0 : _b.hit.distance) !== null && _c !== void 0 ? _c : null;
    }
    get targetHitPosition() {
        var _a, _b, _c;
        return (_c = (_b = (_a = this.activeTargetProvider) === null || _a === void 0 ? void 0 : _a.currentInteractableHitInfo) === null || _b === void 0 ? void 0 : _b.hit.position) !== null && _c !== void 0 ? _c : null;
    }
    get targetHitInfo() {
        var _a, _b;
        return (_b = (_a = this.activeTargetProvider) === null || _a === void 0 ? void 0 : _a.currentInteractableHitInfo) !== null && _b !== void 0 ? _b : null;
    }
    get activeTargetingMode() {
        var _a, _b;
        return (_b = (_a = this.activeTargetProvider) === null || _a === void 0 ? void 0 : _a.targetingMode) !== null && _b !== void 0 ? _b : Interactor_1.TargetingMode.None;
    }
    get maxRaycastDistance() {
        return this._maxRaycastDistance;
    }
    get interactionStrength() {
        var _a, _b;
        const proposedStrength = this.activeTargetingMode === Interactor_1.TargetingMode.Poke
            ? (_a = this.pokeTargetProvider) === null || _a === void 0 ? void 0 : _a.getInteractionStrength()
            : (_b = this.hand) === null || _b === void 0 ? void 0 : _b.getPinchStrength();
        return proposedStrength !== null && proposedStrength !== void 0 ? proposedStrength : null;
    }
    /**
     * Set if the Interactor is should draw a debug gizmo of collider/raycasts in the scene.
     */
    set drawDebug(debug) {
        this._drawDebug = debug;
        // If the target providers have not been created yet, no need to manually set the drawDebug.
        if (!this.indirectTargetProvider || !this.directTargetProvider || !this.pokeTargetProvider) {
            return;
        }
        this.indirectTargetProvider.drawDebug = debug;
        this.directTargetProvider.drawDebug = debug;
        this.pokeTargetProvider.drawDebug = debug;
    }
    /**
     * @returns if the Interactor is currently drawing a debug gizmo of collider/raycasts in the scene.
     */
    get drawDebug() {
        return this._drawDebug;
    }
    updateState() {
        super.updateState();
        this.updateTarget();
        this.updatePinchFilter();
        this.updateDragVector();
        this.processTriggerEvents();
    }
    clearDragProviders() {
        var _a, _b;
        (_a = this.directDragProvider) === null || _a === void 0 ? void 0 : _a.clear();
        (_b = this.indirectDragProvider) === null || _b === void 0 ? void 0 : _b.clear();
        this.planecastDragProvider.clear();
    }
    get planecastDragVector() {
        // If the hand has been recently found, return vec3.zero() to allow time to determine if pinch is sustained.
        if (this.hand === undefined)
            return vec3.zero();
        return this.hand.isRecentlyFound() ? vec3.zero() : this.planecastDragProvider.currentDragVector;
    }
    set currentDragVector(dragVector) {
        this._currentDragVector = dragVector;
    }
    get currentDragVector() {
        // If the hand has been recently found, return vec3.zero() to allow time to determine if pinch is sustained.
        if (this.hand === undefined)
            return vec3.zero();
        return this.hand.isRecentlyFound() ? vec3.zero() : this._currentDragVector;
    }
    get planecastPoint() {
        if (this.activeTargetProvider === this.indirectTargetProvider) {
            return this.raycastPlaneIntersection(this.currentInteractable);
        }
        else {
            return this.colliderPlaneIntersection(this.currentInteractable);
        }
    }
    /**
     * Clears an InteractionPlane from the cache of planes if it is nearby.
     * @param plane
     */
    clearInteractionPlane(plane) {
        this.directTargetProvider.clearInteractionPlane(plane);
        const fieldTargetingMode = this.updateNearestPlane();
        if (this.fieldTargetingMode !== fieldTargetingMode) {
            this._fieldTargetingMode = fieldTargetingMode;
            this.onFieldTargetingModeChangedEvent.invoke(fieldTargetingMode);
        }
    }
    get fieldTargetingMode() {
        return this._fieldTargetingMode;
    }
    get currentInteractionPlane() {
        return this._currentInteractionPlane;
    }
    /**
     * @returns a normalized value between 0 and 1 representing proximity to an InteractionPlane when in near field mode,
     *          null if in FarField mode.
     */
    get nearFieldProximity() {
        if (this.fieldTargetingMode === FieldTargetingMode.FarField || this.currentInteractionPlane === null) {
            return null;
        }
        const planeProjection = this.currentInteractionPlane.projectPoint(this.hand.indexTip.position);
        if (planeProjection === null) {
            return null;
        }
        if (this.fieldTargetingMode === FieldTargetingMode.NearField ||
            this.fieldTargetingMode === FieldTargetingMode.Direct) {
            return 1 - planeProjection.distance / this.currentInteractionPlane.proximityDistance;
        }
        else {
            return 1 + planeProjection.distance / this.currentInteractionPlane.behindDistance;
        }
    }
    isTargeting() {
        var _a, _b;
        return (_b = (_a = this.hand) === null || _a === void 0 ? void 0 : _a.isInTargetingPose()) !== null && _b !== void 0 ? _b : false;
    }
    /**
     * Returns true if the hand interactor and the hand it is associated with are both enabled.
     */
    isActive() {
        var _a, _b;
        return (this.enabled && ((_b = (_a = this.hand) === null || _a === void 0 ? void 0 : _a.enabled) !== null && _b !== void 0 ? _b : false) && !this.hand.isPhoneInHand && this.sceneObject.isEnabledInHierarchy);
    }
    /**
     * Returns true if the hand this interactor is associated with is both enabled and tracked.
     */
    isTracking() {
        (0, validate_1.validate)(this.hand);
        return this.hand.enabled && this.hand.isTracked();
    }
    /**
     * Returns true if the hand is targeting via far field raycasting.
     */
    isFarField() {
        return this.fieldTargetingMode === FieldTargetingMode.FarField;
    }
    isWithinDirectZone() {
        return this.fieldTargetingMode === FieldTargetingMode.Direct;
    }
    clearCurrentHitInfo() {
        var _a, _b, _c;
        (_a = this.indirectTargetProvider) === null || _a === void 0 ? void 0 : _a.clearCurrentInteractableHitInfo();
        (_b = this.directTargetProvider) === null || _b === void 0 ? void 0 : _b.clearCurrentInteractableHitInfo();
        (_c = this.pokeTargetProvider) === null || _c === void 0 ? void 0 : _c.clearCurrentInteractableHitInfo();
    }
    /** @inheritdoc */
    setInputEnabled(enabled) {
        super.setInputEnabled(enabled);
        this.handProvider.getHand(this.handType).setEnabled(enabled);
    }
    defineSceneEvents() {
        this.createEvent("OnDestroyEvent").bind(() => {
            this.onDestroy();
        });
    }
    updateTarget() {
        var _a, _b, _c, _d, _e, _f, _g, _h, _j, _k, _l, _m, _o;
        if (!this.isActive()) {
            (_a = this.indirectTargetProvider) === null || _a === void 0 ? void 0 : _a.reset();
            return;
        }
        // If the user is mid-interaction, do not hijack raycast logic to avoid jerky interactions.
        if (!this.preventTargetUpdate()) {
            const fieldTargetingMode = this.updateNearestPlane();
            if (this.fieldTargetingMode !== fieldTargetingMode) {
                this._fieldTargetingMode = fieldTargetingMode;
                this.onFieldTargetingModeChangedEvent.invoke(fieldTargetingMode);
            }
        }
        (_b = this.pokeTargetProvider) === null || _b === void 0 ? void 0 : _b.update();
        const pokedInteractable = (_e = (_d = (_c = this.pokeTargetProvider) === null || _c === void 0 ? void 0 : _c.currentInteractableHitInfo) === null || _d === void 0 ? void 0 : _d.interactable) !== null && _e !== void 0 ? _e : null;
        const wasPoking = this.previousTrigger === Interactor_1.InteractorTriggerType.Poke;
        // Handle the case where the user slides from poking one Interactable to another. We need to send an onTriggerEnd
        // event for the previous Interactable first.
        if (wasPoking && this.previousInteractable !== null && pokedInteractable !== this.previousInteractable) {
            this.currentTrigger = Interactor_1.InteractorTriggerType.None;
            this.currentInteractable = this.previousInteractable; // Assign the *old* interactable for one frame
            return;
        }
        if (this.isPoking()) {
            this.activeTargetProvider = this.pokeTargetProvider;
            this.dragProvider = this.directDragProvider;
        }
        else {
            (_f = this.directTargetProvider) === null || _f === void 0 ? void 0 : _f.update();
            (_g = this.indirectTargetProvider) === null || _g === void 0 ? void 0 : _g.update();
            if ((this.previousTrigger & Interactor_1.InteractorTriggerType.Select) === 0) {
                if ((_h = this.pokeTargetProvider) === null || _h === void 0 ? void 0 : _h.hasTarget()) {
                    this.activeTargetProvider = this.pokeTargetProvider;
                    this.dragProvider = this.directDragProvider;
                }
                else if ((_j = this.directTargetProvider) === null || _j === void 0 ? void 0 : _j.hasTarget()) {
                    this.activeTargetProvider = this.directTargetProvider;
                    this.dragProvider = this.directDragProvider;
                }
                else if ((_k = this.hand.targetingData) === null || _k === void 0 ? void 0 : _k.intendsToTarget) {
                    if (this.currentInteractionPlane) {
                        const planeProjection = this.currentInteractionPlane.projectPoint(this.hand.indexTip.position);
                        if (planeProjection !== null) {
                            // If the hand is in the direct zone or behind zone, switch to direct or poke target provider.
                            if (planeProjection.isWithinDirectZone || planeProjection.isWithinBehindZone) {
                                const pinchStrength = this.hand.getPinchStrength();
                                this.activeTargetProvider =
                                    pinchStrength !== null && pinchStrength >= exports.MINIMUM_PINCH_STRENGTH
                                        ? this.directTargetProvider
                                        : this.pokeTargetProvider;
                            }
                            // Otherwise, the hand is in the normal interaction zone, so we switch to indirect target provider.
                            else {
                                this.activeTargetProvider = this.indirectTargetProvider;
                            }
                            this.dragProvider = this.directDragProvider;
                        }
                    }
                    else {
                        this.activeTargetProvider = this.indirectTargetProvider;
                        // During a near field raycast, use direct drag threshold.
                        this.dragProvider =
                            this.fieldTargetingMode === FieldTargetingMode.FarField
                                ? this.indirectDragProvider
                                : this.directDragProvider;
                    }
                }
                // If the hand is not intending to raycast target, choose the more likely of the collider target providers.
                else {
                    const pinchStrength = this.hand.getPinchStrength();
                    this.activeTargetProvider =
                        pinchStrength !== null && pinchStrength >= exports.MINIMUM_PINCH_STRENGTH
                            ? this.directTargetProvider
                            : this.pokeTargetProvider;
                    this.dragProvider = this.directDragProvider;
                }
            }
        }
        if (this.isPoking()) {
            this.currentTrigger = Interactor_1.InteractorTriggerType.Poke;
        }
        else if (this.hand && this.hand.isPinching() && (this.previousTrigger & Interactor_1.InteractorTriggerType.Poke) === 0) {
            this.currentTrigger = Interactor_1.InteractorTriggerType.Pinch;
        }
        else {
            this.currentTrigger = Interactor_1.InteractorTriggerType.None;
        }
        this.currentInteractable = (_o = (_m = (_l = this.activeTargetProvider) === null || _l === void 0 ? void 0 : _l.currentInteractableHitInfo) === null || _m === void 0 ? void 0 : _m.interactable) !== null && _o !== void 0 ? _o : null;
        this.handleSelectionLifecycle(this.activeTargetProvider);
    }
    updatePinchFilter() {
        if (!this.isActive()) {
            return;
        }
        if (this.currentInteractable === null) {
            this.hand.useFilteredPinch = false;
            return;
        }
        let useFilteredPinch = this.currentInteractable.useFilteredPinch;
        let ancestor = this.currentInteractable.sceneObject.getParent();
        while (ancestor !== null) {
            const interactable = ancestor.getComponent(Interactable_1.Interactable.getTypeName());
            if (interactable !== null) {
                useFilteredPinch = useFilteredPinch || interactable.useFilteredPinch;
            }
            ancestor = ancestor.getParent();
        }
        this.hand.useFilteredPinch = useFilteredPinch;
    }
    isPoking() {
        var _a, _b;
        return this.activeTargetProvider === this.pokeTargetProvider && ((_b = (_a = this.pokeTargetProvider) === null || _a === void 0 ? void 0 : _a.isTriggering()) !== null && _b !== void 0 ? _b : false);
    }
    get pokeIsValid() {
        var _a, _b;
        return (_b = (_a = this.pokeTargetProvider) === null || _a === void 0 ? void 0 : _a.pokeIsValid) !== null && _b !== void 0 ? _b : false;
    }
    get pokeDepth() {
        var _a, _b;
        return (_b = (_a = this.pokeTargetProvider) === null || _a === void 0 ? void 0 : _a.pokeDepth) !== null && _b !== void 0 ? _b : 0;
    }
    get normalizedPokeDepth() {
        var _a, _b;
        return (_b = (_a = this.pokeTargetProvider) === null || _a === void 0 ? void 0 : _a.normalizedPokeDepth) !== null && _b !== void 0 ? _b : 0;
    }
    /**
     * @returns if we should prevent any updates to the currently targeted item.
     * In the case of pinching (indirect or direct) or poking, we prevent updates to the targeting system.
     * Otherwise, allow updates to the targeted item.
     */
    preventTargetUpdate() {
        return this.hand !== undefined && (this.hand.isPinching() || this.isPoking());
    }
    isPokingNonDominantHand() {
        return this.forcePokeOnNonDominantPalmProximity && this.isNearNonDominantHand();
    }
    isNearNonDominantHand() {
        var _a;
        const nonDominantHand = this.handProvider.getNonDominantHand();
        const dominantHand = this.handProvider.getDominantHand();
        /** If either the dominant or non-dominant hand is not tracked,
         * or if both hands are in an active targeting pose,
         * then the user is not intending to interact with the nondominant hand UI.
         */
        if (!nonDominantHand.isTracked() ||
            !dominantHand.isTracked() ||
            (dominantHand.isInTargetingPose() && nonDominantHand.isInTargetingPose())) {
            return false;
        }
        // Detect if dominant index is within interaction proximity to non-dominant palm
        const palmCenter = nonDominantHand.getPalmCenter();
        const dominantIndexTip = (_a = dominantHand.indexTip) === null || _a === void 0 ? void 0 : _a.position;
        return (palmCenter !== null &&
            dominantIndexTip !== undefined &&
            palmCenter.distanceSquared(dominantIndexTip) <
                HANDUI_INTERACTION_DISTANCE_THRESHOLD_CM * HANDUI_INTERACTION_DISTANCE_THRESHOLD_CM);
    }
    // Check for cached planes (via direct collider overlap), choosing the nearest plane if multiple are available.
    updateNearestPlane() {
        const interactionPlanes = this.directTargetProvider.currentInteractionPlanes;
        let nearestPlane = null;
        let distance = Number.POSITIVE_INFINITY;
        const planeRaycastLocus = this.hand.indexTip.position;
        if (planeRaycastLocus === null) {
            this._currentInteractionPlane = null;
            return FieldTargetingMode.FarField;
        }
        for (const interactionPlane of interactionPlanes) {
            const planeProjection = interactionPlane.projectPoint(planeRaycastLocus);
            // Check if the locus is within the interaction zone or behind zone, then check if the locus is closer to this plane than prior planes.
            const isNearPlane = planeProjection !== null &&
                (planeProjection.isWithinInteractionZone || planeProjection.isWithinBehindZone) &&
                Math.abs(planeProjection.distance) < distance;
            const normal = interactionPlane.normal;
            const handDirection = this.handRayProvider.raycast.getRay();
            // Check if the hand direction faces the plane enough to target the plane.
            const isTowardPlane = handDirection !== null &&
                handDirection.direction.angleTo(normal.uniformScale(-1)) < NEAR_FIELD_ANGLE_THRESHOLD_RADIAN;
            // Rough check if InteractionPlane is mostly in FoV.
            const isInFov = this.cameraProvider.inFoV(interactionPlane.getSceneObject().getTransform().getWorldPosition());
            // If all checks are true, cache the plane.
            if (isNearPlane && isTowardPlane && isInFov) {
                nearestPlane = interactionPlane;
                distance = planeProjection.distance;
            }
        }
        this._currentInteractionPlane = nearestPlane;
        // Return to far field targeting if no nearby planes were found.
        if (this._currentInteractionPlane === null) {
            return FieldTargetingMode.FarField;
        }
        // Check if the index tip is past the plane for purpose of visuals.
        const indexPoint = this.hand.indexTip.position;
        const indexProjection = this._currentInteractionPlane.projectPoint(indexPoint);
        // The projection cannot be null because the HandInteractor just cached an InteractionPlane in the above code.
        const isIndexInBehindZone = indexProjection.isWithinBehindZone;
        const isIndexInDirectZone = indexProjection.isWithinDirectZone;
        if (isIndexInBehindZone) {
            return FieldTargetingMode.BehindNearField;
        }
        else if (isIndexInDirectZone) {
            return FieldTargetingMode.Direct;
        }
        else {
            return FieldTargetingMode.NearField;
        }
    }
    onDestroy() {
        var _a, _b, _c;
        (_a = this.directTargetProvider) === null || _a === void 0 ? void 0 : _a.destroy();
        (_b = this.indirectTargetProvider) === null || _b === void 0 ? void 0 : _b.destroy();
        (_c = this.pokeTargetProvider) === null || _c === void 0 ? void 0 : _c.destroy();
    }
    __initialize() {
        super.__initialize();
        this.handProvider = HandInputData_1.HandInputData.getInstance();
        this.onFieldTargetingModeChangedEvent = new Event_1.default();
        this.onFieldTargetingModeChanged = this.onFieldTargetingModeChangedEvent.publicApi();
        this._fieldTargetingMode = FieldTargetingMode.FarField;
        this._currentInteractionPlane = null;
        this.cameraProvider = WorldCameraFinderProvider_1.default.getInstance();
    }
};
exports.HandInteractor = HandInteractor;
exports.HandInteractor = HandInteractor = __decorate([
    component
], HandInteractor);
//# sourceMappingURL=HandInteractor.js.map