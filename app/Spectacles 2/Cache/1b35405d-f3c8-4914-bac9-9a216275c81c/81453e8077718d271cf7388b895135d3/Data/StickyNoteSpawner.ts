// @input Asset.Prefab stickyNotePrefab
// @input SceneObject root
// @input TouchComponent touchComponent
// Spawns sticky notes at tapped locations in AR

// Store spawned notes for management
var spawnedNotes = [];

// Register touch event using TouchComponent
if (script.touchComponent && script.touchComponent.touchStartEvent) {
    script.touchComponent.touchStartEvent.add(onTap);
}

function onTap(eventData) {
    var tapPosition = eventData.position;
    var worldPos = screenToWorld(tapPosition);
    var note = global.scene.createSceneObject(script.stickyNotePrefab);
    note.getTransform().setWorldPosition(worldPos);
    if (script.root) {
        note.setParent(script.root);
    }
    spawnedNotes.push(note);
    print("Spawned sticky note at " + worldPos);
}

function screenToWorld(screenPos) {
    // Replace with Lens Studio's screen-to-world conversion
    // Example: return global.camera.screenSpaceToWorldSpace(screenPos, 0);
    return vec3.zero();
}

// Optional: public method to clear all notes
function clearNotes() {
    spawnedNotes.forEach(function(note) { note.enabled = false; });
    spawnedNotes = [];
}