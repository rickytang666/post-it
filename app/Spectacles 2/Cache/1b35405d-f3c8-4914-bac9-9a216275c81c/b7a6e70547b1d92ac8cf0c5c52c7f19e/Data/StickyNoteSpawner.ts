// @input Asset.Prefab stickyNotePrefab
// @input SceneObject root
// Spawns sticky notes at tapped locations in AR

interface TapEventData {
    position: vec2;
}

// Removed duplicate implementation of onTap function

// Register tap event (pseudo-code, replace with Lens Studio API)
if (global.touchSystem  && global.touchSystem.touchStartEvent) {
    global.touchSystem.touchStartEvent.add(onTap);
}

function screenToWorld(screenPos: vec2): vec3 {
    // Placeholder: Replace with Lens Studio's screen-to-world conversion
    return vec3.zero();
}
