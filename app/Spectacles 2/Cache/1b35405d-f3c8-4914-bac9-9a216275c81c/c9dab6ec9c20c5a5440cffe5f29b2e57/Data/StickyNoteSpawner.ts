// @input Asset.Prefab stickyNotePrefab
// @input SceneObject root
// Spawns sticky notes at tapped locations in AR

interface TapEventData {
    position: vec2;
}

// Removed duplicate implementation of onTap function

@component
export class StickyNoteSpawner extends BaseScriptComponent {
    @input
    @hint("Sticky note prefab")
    stickyNotePrefab: Asset.Prefab;

    @input
    @hint("Root object for notes")
    root: SceneObject;

    @input
    @hint("Touch component for tap detection")
    touchComponent: Component.TouchComponent;

    private spawnedNotes: SceneObject[] = [];

    onAwake() {
        // Register touch event using TouchComponent
        if (this.touchComponent && this.touchComponent.touchStartEvent) {
            this.touchComponent.touchStartEvent.add(this.onTap.bind(this));
        }
    }

    private onTap(eventData: { position: vec2 }) {
        const tapPosition = eventData.position;
        const worldPos = this.screenToWorld(tapPosition);
        const note = global.scene.createSceneObject(this.stickyNotePrefab);
        note.getTransform().setWorldPosition(worldPos);
        if (this.root) {
            this.root.addChild(note);
        }
        this.spawnedNotes.push(note);
        print("Spawned sticky note at " + worldPos);
    }

    private screenToWorld(screenPos: vec2): vec3 {
        // Replace with Lens Studio's screen-to-world conversion
        // Example: return global.camera.screenSpaceToWorldSpace(screenPos, 0);
        return vec3.zero();
    }

    // Public method to clear all notes
    public clearNotes() {
        this.spawnedNotes.forEach(note => note.enabled = false);
        this.spawnedNotes = [];
    }
}

function screenToWorld(screenPos: vec2): vec3 {
    // Placeholder: Replace with Lens Studio's screen-to-world conversion
    return vec3.zero();
}
