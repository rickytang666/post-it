/**
 * ## AlignmentProvider
 * Environment-compliant alignment of tracked frames
 */

/**
 * Alignment filter specification
 */
export enum SurfaceAlignment {
  /**
   * Snap to horizontal surfaces
   */
  Horizontal,
  /**
   * Snap to vertical surfaces
   */
  Vertical,
  /**
   * Snap to any surface
   */
  Any,
}

/**
 * Base alignment provider
 */
export class AlignmentProvider {
  /**
   * Subclasses override align to provide alignment of a world pose to ambient conditions
   * Baseclass implementation is passthrough
   */
  align(toWorldFromLocal: mat4): mat4 {
    return toWorldFromLocal;
  }
}

/**
 * Surface alignment.
 *
 * Positioned in world space by a ray intersection with a surface
 */
export class SurfaceAlignmentProvider extends AlignmentProvider {
  /**
   * Origin of the ray in world space.
   */
  rayOrigin: vec3;
  /**
   * Normalized direction of the ray in world space.
   */
  rayDirection: vec3;
  /**
   * Maximum distance to look for a surface in cm.
   */
  maxDepth: number;
  /**
   * Surface alignment filter.
   */
  orientation: SurfaceAlignment;

  /**
   * align toWorldFromLocal to a surface in world space
   */
  override align(toWorldFromLocal: mat4): mat4 {
    throw new Error("Method not implemented.");
  }

  /**
   * Helper to create a surface aligned anchor.
   *
   * For use with a view that is tracking the user's gaze, eg the world transform on the rendering camera. The anchor created will be positioned near to the surface the current view.
   *
   * @param toWorldFromView - World pose of the view that will be traversed to find a suitable surface for anchoring to.
   * @param maxDepth - Maximum distance to look for a surface in cm from the intersection point forward.
   * @param alignment - Surface alignment filter.
   */
  static async createFromView(
    toWorldFromView: mat4,
    maxDepth: Number,
    orientation: SurfaceAlignment = SurfaceAlignment.Any,
  ): Promise<SurfaceAlignmentProvider> {
    throw new Error("Method not implemented.");
  }
}
