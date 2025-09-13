"use strict";
/**
 * ## AlignmentProvider
 * Environment-compliant alignment of tracked frames
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.SurfaceAlignmentProvider = exports.AlignmentProvider = exports.SurfaceAlignment = void 0;
/**
 * Alignment filter specification
 */
var SurfaceAlignment;
(function (SurfaceAlignment) {
    /**
     * Snap to horizontal surfaces
     */
    SurfaceAlignment[SurfaceAlignment["Horizontal"] = 0] = "Horizontal";
    /**
     * Snap to vertical surfaces
     */
    SurfaceAlignment[SurfaceAlignment["Vertical"] = 1] = "Vertical";
    /**
     * Snap to any surface
     */
    SurfaceAlignment[SurfaceAlignment["Any"] = 2] = "Any";
})(SurfaceAlignment || (exports.SurfaceAlignment = SurfaceAlignment = {}));
/**
 * Base alignment provider
 */
class AlignmentProvider {
    /**
     * Subclasses override align to provide alignment of a world pose to ambient conditions
     * Baseclass implementation is passthrough
     */
    align(toWorldFromLocal) {
        return toWorldFromLocal;
    }
}
exports.AlignmentProvider = AlignmentProvider;
/**
 * Surface alignment.
 *
 * Positioned in world space by a ray intersection with a surface
 */
class SurfaceAlignmentProvider extends AlignmentProvider {
    /**
     * align toWorldFromLocal to a surface in world space
     */
    align(toWorldFromLocal) {
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
    static async createFromView(toWorldFromView, maxDepth, orientation = SurfaceAlignment.Any) {
        throw new Error("Method not implemented.");
    }
}
exports.SurfaceAlignmentProvider = SurfaceAlignmentProvider;
//# sourceMappingURL=AlignmentProvider.js.map