import { Snap3D } from "Remote Service Gateway.lspkg/HostedSnap/Snap3D";
import { Snap3DTypes } from "Remote Service Gateway.lspkg/HostedSnap/Snap3DTypes";
import { Snap3DInteractable } from "./Snap3DInteractable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider";
import { Gemini } from "Remote Service Gateway.lspkg/HostedExternal/Gemini";

@component
export class Snap3DInteractableFactory extends BaseScriptComponent {
  @ui.separator
  @ui.group_start("Submit and Get Status Example")
  @input
  @widget(new TextAreaWidget())
  private prompt: string = "A cute dog wearing a hat";
  @input
  private refineMesh: boolean = true;
  @input
  private useVertexColor: boolean = false;
  @ui.group_end
  @input
  runOnTap: boolean = false;

  @input
  snap3DInteractablePrefab: ObjectPrefab;

  private avaliableToRequest: boolean = true;
  private wcfmp = WorldCameraFinderProvider.getInstance();

  onAwake() {
    this.createEvent("TapEvent").bind(() => {
      if (!this.runOnTap) return;
      this.createInteractable3DObject(this.prompt);
    });
  }

  /** Helper to clean up prompt using Gemini */
  private generateSnap3DPrompt(userInput: string): Promise<string> {
    const geminiRequest = {
      model: 'gemini-2.0-flash',
      type: 'generateContent',
      body: {
        contents: [
          { parts: [{ text: "Rewrite this into a creative 3D prompt for Snap3D:" }], role: 'model' },
          { parts: [{ text: userInput }], role: 'user' }
        ]
      }
    };

    return Gemini.models(geminiRequest)
      .then((response: any) => {
        const prompt: string = response.candidates[0].content.parts[0].text.trim();
        print("Gemini prompt: " + prompt);
        return prompt;
      });
  }

  createInteractable3DObject(input: string, overridePosition?: vec3): Promise<string> {
    return new Promise((resolve, reject) => {
      if (!this.avaliableToRequest) {
        print("Already processing a request. Please wait.");
        return;
      }
      this.avaliableToRequest = false;

      this.generateSnap3DPrompt(input)
        .then((cleanPrompt) => {
          let outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
          outputObj.name = "Snap3DInteractable - " + cleanPrompt;
          let snap3DInteractable = outputObj.getComponent(Snap3DInteractable.getTypeName());
          snap3DInteractable.setPrompt(cleanPrompt);

          if (overridePosition) {
            outputObj.getTransform().setWorldPosition(overridePosition);
          } else {
            let newPos = this.wcfmp.getForwardPosition(80);
            outputObj.getTransform().setWorldPosition(newPos);
          }

          Snap3D.submitAndGetStatus({
            prompt: cleanPrompt,
            format: "glb",
            refine: this.refineMesh,
            use_vertex_color: this.useVertexColor
          }).then((submitGetStatusResults) => {
            submitGetStatusResults.event.add(([value, assetOrError]) => {
              if (value === "image") {
                snap3DInteractable.setImage((assetOrError as Snap3DTypes.TextureAssetData).texture);
              } else if (value === "base_mesh") {
                snap3DInteractable.setModel((assetOrError as Snap3DTypes.GltfAssetData).gltfAsset, !this.refineMesh);
                if (!this.refineMesh) {
                  this.avaliableToRequest = true;
                  resolve("Created base mesh: " + cleanPrompt);
                }
              } else if (value === "refined_mesh") {
                snap3DInteractable.setModel((assetOrError as Snap3DTypes.GltfAssetData).gltfAsset, true);
                this.avaliableToRequest = true;
                resolve("Created refined mesh: " + cleanPrompt);
              } else if (value === "failed") {
                print("Snap3D failed: " + (assetOrError as Snap3DTypes.ErrorData).errorMsg);
                this.avaliableToRequest = true;
                reject("Failed to create mesh: " + cleanPrompt);
              }
            });
          });
        })
        .catch((err) => {
          print("Error generating Snap3D prompt: " + err);
          this.avaliableToRequest = true;
          reject(err);
        });
    });
  }
}
