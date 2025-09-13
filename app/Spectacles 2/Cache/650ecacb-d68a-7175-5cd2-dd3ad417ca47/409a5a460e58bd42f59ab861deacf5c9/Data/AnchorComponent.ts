import { Anchor } from "./Anchor";

/**
 * Apply the pose tracked by an Anchor to a SceneObject.
 */
@component
export class AnchorComponent extends BaseScriptComponent {
  anchor: Anchor;

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
}
