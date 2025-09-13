"use strict";
/**
 * ## Anchors
 * Define and track poses in world space.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.WorldAnchor = void 0;
const Anchor_1 = require("./Anchor");
const AlignmentProvider_1 = require("./AlignmentProvider");
/**
 * User created and modifiable anchor that is fixed in world space.
 */
class WorldAnchor extends Anchor_1.UserAnchor {
    constructor(location, sceneObject, alignmentProvider) {
        super(location.getProxyId());
        this._sceneObject = sceneObject;
        this._alignmentProvider = alignmentProvider
            ? alignmentProvider
            : new AlignmentProvider_1.AlignmentProvider();
    }
    /**
     * Get world pose of anchor when state == found, undefined otherwise
     */
    get toWorldFromAnchor() {
        if (this.state == Anchor_1.State.Found) {
            return this._alignmentProvider.align(this._sceneObject.getTransform().getWorldTransform());
        }
        else {
            return undefined;
        }
    }
    /**
     * Set world pose of anchor for persistence
     */
    set toWorldFromAnchor(toWorldFromAnchor) {
        // todo (gbakker) - we need to think about how to handle alignment here
        this._sceneObject.getTransform().setWorldTransform(toWorldFromAnchor);
    }
}
exports.WorldAnchor = WorldAnchor;
//# sourceMappingURL=WorldAnchor.js.map