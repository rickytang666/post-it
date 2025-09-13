import { Snap3D } from "Remote Service Gateway.lspkg/HostedSnap/Snap3D";
import { Snap3DInteractable } from "./Snap3DInteractable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider";

@component
export class Snap3DInteractableFactory extends BaseScriptComponent {

  @input
  snap3DInteractablePrefab: ObjectPrefab;

  private wcfmp = WorldCameraFinderProvider.getInstance();

  onAwake() {
    // Generate a model on start
    this.createInteractable3DObject("A cute dog wearing a hat");
  }

  createInteractable3DObject(prompt: string) {
    // Instantiate the Snap3DInteractable prefab
    const obj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
    obj.name = "Snap3DInteractable - " + prompt;

    const interactable = obj.getComponent(Snap3DInteractable.getTypeName());
    interactable.setPrompt(prompt);

    // Position the object in front of the camera
    const position = this.wcfmp.getForwardPosition(80);
    obj.getTransform().setWorldPosition(position);

    // Submit the prompt to Snap3D
    Snap3D.submitAndGetStatus({
      prompt: prompt,
      format: "glb",
      refine: true,
      use_vertex_color: false,
    }).then(result => {
      result.event.add(([type, asset]) => {
        if (type === "base_mesh" || type === "refined_mesh") {
          interactable.setModel(asset.gltfAsset, true);
        } else if (type === "image") {
          interactable.setImage(asset.texture);
        }
      });
    });
  }
}
