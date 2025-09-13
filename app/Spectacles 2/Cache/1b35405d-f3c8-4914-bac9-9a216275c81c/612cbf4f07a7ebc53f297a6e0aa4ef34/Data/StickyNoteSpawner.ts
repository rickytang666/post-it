// @input Asset.Prefab stickyNotePrefab
// @input SceneObject root
// Spawns sticky notes at tapped locations in AR

interface TapEventData {
    position: vec2;
}

function onTap(eventData: TapEventData): void {
    const tapPosition = eventData.position;
    // Convert screen tap to world position (pseudo-code, replace with Lens Studio API)
    const worldPos = screenToWorld(tapPosition);
    const note = global.scene.createSceneObject(script.stickyNotePrefab, script.root);
    note.getTransform().setWorldPosition(worldPos);
}

// Register tap event (pseudo-code, replace with Lens Studio API)
if (global.touchSystem) {
    global.touchSystem.onTap.add(onTap);
}

function screenToWorld(screenPos: vec2): vec3 {
    // Placeholder: Replace with Lens Studio's screen-to-world conversion
    return vec3.zero();
}
