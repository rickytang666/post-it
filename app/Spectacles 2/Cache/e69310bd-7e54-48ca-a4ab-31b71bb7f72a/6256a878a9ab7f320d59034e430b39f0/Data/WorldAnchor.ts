/**
 * ## Anchors
 * Define and track poses in world space.
 */

import { State, UserAnchor } from "./Anchor";
import { AlignmentProvider } from "./AlignmentProvider";

/**
 * User created and modifiable anchor that is fixed in world space.
 */
export class WorldAnchor extends UserAnchor {
  private _alignmentProvider: AlignmentProvider;
  // a scene object is manipulated by the current SpatialAnchors implementation. We extract its pose.
  // in the event of load failure the scene object is not present.
  public _sceneObject?: SceneObject; // todo (gbakker) - make private, for now this is needed by AnchorSession

  constructor(
    location: LocationAsset,
    sceneObject?: SceneObject,
    alignmentProvider?: AlignmentProvider,
  ) {
    super(location.getProxyId());
    this._sceneObject = sceneObject;
    this._alignmentProvider = alignmentProvider
      ? alignmentProvider
      : new AlignmentProvider();
  }
  /**
   * Get world pose of anchor when state == found, undefined otherwise
   */
  override get toWorldFromAnchor(): mat4 | undefined {
    if (this.state == State.Found) {
      return this._alignmentProvider.align(
        this._sceneObject.getTransform().getWorldTransform(),
      );
    } else {
      return undefined;
    }
  }
  /**
   * Set world pose of anchor for persistence
   */
  override set toWorldFromAnchor(toWorldFromAnchor: mat4) {
    // todo (gbakker) - we need to think about how to handle alignment here
    this._sceneObject.getTransform().setWorldTransform(toWorldFromAnchor);
  }
}
