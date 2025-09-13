"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.StickyNoteSpawner = void 0;
var __selfType = requireType("./StickyNoteSpawner");
function component(target) { target.getTypeName = function () { return __selfType; }; }
// import required modules
const WorldQueryModule = require('LensStudio:WorldQueryModule');
const SIK_1 = require("SpectaclesInteractionKit.lspkg/SIK");
const Interactor_1 = require("SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor");
const EPSILON = 0.01;
let StickyNoteSpawner = class StickyNoteSpawner extends BaseScriptComponent {
    onAwake() {
        // create new hit session
        this.hitTestSession = this.createHitTestSession(this.filterEnabled);
        if (!this.sceneObject) {
            print('Please set Target Object input');
            return;
        }
        this.transform = this.targetObject.getTransform();
        // disable target object when surface is not detected
        this.targetObject.enabled = false;
        // create update event
        this.createEvent('UpdateEvent').bind(this.onUpdate.bind(this));
    }
    createHitTestSession(filterEnabled) {
        // create hit test session with options
        var options = HitTestSessionOptions.create();
        options.filter = filterEnabled;
        var session = WorldQueryModule.createHitTestSessionWithOptions(options);
        return session;
    }
    onHitTestResult(results) {
        if (results === null) {
            this.targetObject.enabled = false;
        }
        else {
            this.targetObject.enabled = true;
            // get hit information
            const hitPosition = results.position;
            const hitNormal = results.normal;
            //identifying the direction the object should look at based on the normal of the hit location.
            var lookDirection;
            if (1 - Math.abs(hitNormal.normalize().dot(vec3.up())) < EPSILON) {
                lookDirection = vec3.forward();
            }
            else {
                lookDirection = hitNormal.cross(vec3.up());
            }
            const toRotation = quat.lookAt(lookDirection, hitNormal);
            //set position and rotation
            this.targetObject.getTransform().setWorldPosition(hitPosition);
            this.targetObject.getTransform().setWorldRotation(toRotation);
            if (this.primaryInteractor.previousTrigger !== Interactor_1.InteractorTriggerType.None &&
                this.primaryInteractor.currentTrigger === Interactor_1.InteractorTriggerType.None) {
                // Called when a trigger ends
                // Copy the plane/axis object
                this.sceneObject.copyWholeHierarchy(this.targetObject);
            }
        }
    }
    onUpdate() {
        this.primaryInteractor =
            SIK_1.SIK.InteractionManager.getTargetingInteractors().shift();
        if (this.primaryInteractor &&
            this.primaryInteractor.isActive() &&
            this.primaryInteractor.isTargeting()) {
            const rayStartOffset = new vec3(this.primaryInteractor.startPoint.x, this.primaryInteractor.startPoint.y, this.primaryInteractor.startPoint.z + 30);
            const rayStart = rayStartOffset;
            const rayEnd = this.primaryInteractor.endPoint;
            this.hitTestSession.hitTest(rayStart, rayEnd, this.onHitTestResult.bind(this));
        }
        else {
            this.targetObject.enabled = false;
        }
    }
};
exports.StickyNoteSpawner = StickyNoteSpawner;
exports.StickyNoteSpawner = StickyNoteSpawner = __decorate([
    component
], StickyNoteSpawner);
//# sourceMappingURL=StickyNoteSpawner.js.map