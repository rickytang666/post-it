// @input Asset.Prefab stickyNotePrefab
// @input SceneObject root
// Spawns sticky notes at tapped locations in AR

function onTap(eventData) {
    var tapPosition = eventData.position;
    // Convert screen tap to world position (pseudo-code, replace with Lens Studio API)
    var worldPos = screenToWorld(tapPosition);
    var note = global.scene.createSceneObject(stickyNotePrefab, root);
    note.getTransform().setWorldPosition(worldPos);
}

// Register tap event (pseudo-code, replace with Lens Studio API)
if (global.touchSystem) {
    global.touchSystem.onTap.add(onTap);
}

function screenToWorld(screenPos) {
    // Placeholder: Replace with Lens Studio's screen-to-world conversion
    return vec3.zero();
}
