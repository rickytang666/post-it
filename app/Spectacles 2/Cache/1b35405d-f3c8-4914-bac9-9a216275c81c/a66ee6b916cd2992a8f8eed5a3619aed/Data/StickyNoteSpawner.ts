// import required modules
const WorldQueryModule = require('LensStudio:WorldQueryModule');
import { SIK } from 'SpectaclesInteractionKit.lspkg/SIK';
import { InteractorTriggerType, InteractorInputType } from 'SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor';
const EPSILON = 0.01;

@component
export class NewScript extends BaseScriptComponent {
  private primaryInteractor;
  private hitTestSession;
  private transform: Transform;

  @input
  targetObject: SceneObject;

  @input
  filterEnabled: boolean;

  onAwake() {
    // create new hit session
    this.hitTestSession = this.createHitTestSession(this.filterEnabled);
    if (!this.sceneObject) {
      print('Please set Target Object input');
      return;
    }
    this.transform = this.targetObject.getTransform();
    // disable target object when surface is not detected
    this.targetObject.enabled = false;
    // create update event
    this.createEvent('UpdateEvent').bind(this.onUpdate.bind(this));
  }

  createHitTestSession(filterEnabled) {
    // create hit test session with options
    var options = HitTestSessionOptions.create();
    options.filter = filterEnabled;

    var session = WorldQueryModule.createHitTestSessionWithOptions(options);
    return session;
  }

  onHitTestResult(results) {
    if (results === null) {
      this.targetObject.enabled = false;
    } else {
      this.targetObject.enabled = true;
      // get hit information
      const hitPosition = results.position;
      const hitNormal = results.normal;

      //identifying the direction the object should look at based on the normal of the hit location.

      var lookDirection;
      if (1 - Math.abs(hitNormal.normalize().dot(vec3.up())) < EPSILON) {
        lookDirection = vec3.forward();
      } else {
        lookDirection = hitNormal.cross(vec3.up());
      }

      const toRotation = quat.lookAt(lookDirection, hitNormal);
      //set position and rotation
      this.targetObject.getTransform().setWorldPosition(hitPosition);
      this.targetObject.getTransform().setWorldRotation(toRotation);

      if (
        this.primaryInteractor.previousTrigger !== InteractorTriggerType.None &&
        this.primaryInteractor.currentTrigger === InteractorTriggerType.None
      ) {
        // Called when a trigger ends
        // Copy the plane/axis object
        this.sceneObject.copyWholeHierarchy(this.targetObject);
      }
    }
  }

  onUpdate() {
    this.primaryInteractor =
      SIK.InteractionManager.getTargetingInteractors().shift();

    if (
      this.primaryInteractor &&
      this.primaryInteractor.isActive() &&
      this.primaryInteractor.isTargeting()
    ) {
      const rayStartOffset = new vec3(
        this.primaryInteractor.startPoint.x,
        this.primaryInteractor.startPoint.y,
        this.primaryInteractor.startPoint.z + 30
      );
      const rayStart = rayStartOffset;
      const rayEnd = this.primaryInteractor.endPoint;

      this.hitTestSession.hitTest(
        rayStart,
        rayEnd,
        this.onHitTestResult.bind(this)
      );
    } else {
      this.targetObject.enabled = false;
    }
  }
}

// // @input Asset.Prefab stickyNotePrefab
// // @input SceneObject root
// // Spawns sticky notes at tapped locations in AR

// interface TapEventData {
//     position: vec2;
// }

// // Removed duplicate implementation of onTap function

// @component
// export class StickyNoteSpawner extends BaseScriptComponent {
//     @input
//     @hint("Sticky note prefab")
//     stickyNotePrefab: ObjectPrefab;

//     @input
//     @hint("Root object for notes")
//     root: SceneObject;

//     private spawnedNotes: SceneObject[] = [];

//     onAwake() {
//         // Register touch event using TouchComponent
//         if (this.touchComponent && this.touchComponent.touchStartEvent) {
//             this.touchComponent.touchStartEvent.add(this.onTap.bind(this));
//         }
//     }

//     private onTap(eventData: { position: vec2 }) {
//         const tapPosition = eventData.position;
//         const worldPos = this.screenToWorld(tapPosition);
//         const note = global.scene.createSceneObject(this.stickyNotePrefab);
//         note.getTransform().setWorldPosition(worldPos);
//         if (this.root) {
//             this.root.addChild(note);
//         }
//         this.spawnedNotes.push(note);
//         print("Spawned sticky note at " + worldPos);
//     }

//     private screenToWorld(screenPos: vec2): vec3 {
//         // Replace with Lens Studio's screen-to-world conversion
//         // Example: return global.camera.screenSpaceToWorldSpace(screenPos, 0);
//         return vec3.zero();
//     }

//     // Public method to clear all notes
//     public clearNotes() {
//         this.spawnedNotes.forEach(note => note.enabled = false);
//         this.spawnedNotes = [];
//     }
// }

// function screenToWorld(screenPos: vec2): vec3 {
//     // Placeholder: Replace with Lens Studio's screen-to-world conversion
//     return vec3.zero();
// }
