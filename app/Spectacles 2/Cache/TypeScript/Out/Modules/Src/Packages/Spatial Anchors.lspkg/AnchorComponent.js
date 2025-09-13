"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AnchorComponent = void 0;
var __selfType = requireType("./AnchorComponent");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * Apply the pose tracked by an Anchor to a SceneObject.
 */
let AnchorComponent = class AnchorComponent extends BaseScriptComponent {
    onAwake() {
        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
    }
    onUpdate() {
        if (this.enabled && this.anchor) {
            let toWorldFromAnchor = this.anchor.toWorldFromAnchor;
            if (toWorldFromAnchor) {
                this.getTransform().setWorldTransform(toWorldFromAnchor);
            }
        }
    }
};
exports.AnchorComponent = AnchorComponent;
exports.AnchorComponent = AnchorComponent = __decorate([
    component
], AnchorComponent);
//# sourceMappingURL=AnchorComponent.js.map