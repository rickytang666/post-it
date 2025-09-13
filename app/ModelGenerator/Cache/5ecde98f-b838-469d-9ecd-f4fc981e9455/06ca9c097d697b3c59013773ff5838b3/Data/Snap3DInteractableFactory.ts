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
          { parts: [{ text: "You are an assistant for an app that turns a user's sticky note text into a 3D landmark.  Transform the note into a Snap3D input prompt that: describes an awe-inspiring landmark or marker object, includes cool creative details (glowing, ethereal, futuristic, magical, monumental, etc.), is concise but vivid, directly grounded in the user's text, and importanty, output ONLY the raw prompt string with no commentary, quotes, or formatting" }], role: 'model' },
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

  createInteractable3DObject(originalText: string, overridePosition?: vec3): Promise<string> {
    return new Promise((resolve, reject) => {
      if (!this.avaliableToRequest) {
        print("Already processing a request. Please wait.");
        return;
      }
      this.avaliableToRequest = false;

      this.generateSnap3DPrompt(originalText)
        .then((cleanPrompt) => {
          // Instantiate the object
          let outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
          outputObj.name = "Snap3DInteractable - " + cleanPrompt;

          // Get Snap3DInteractable component
          let snap3DInteractable = outputObj.getComponent(Snap3DInteractable.getTypeName());

          snap3DInteractable.setPrompt(originalText);

          // Find a Text component on the instantiated object or its children
          let textComp = outputObj.getComponent("Component.Text") as Text;
          if (!textComp) {
            for (let i = 0; i < outputObj.getChildrenCount(); i++) {
              const child = outputObj.getChild(i);
              textComp = child.getComponent("Component.Text") as Text;
              if (textComp) break;
            }
          }

          if (textComp) {
            // Wrap long lines horizontally
            textComp.horizontalOverflow = HorizontalOverflow.Wrap;

            // Allow vertical overflow (don't clip). Alternatively use VerticalOverflow.Shrink to scale down.
            textComp.verticalOverflow = VerticalOverflow.Overflow;

            // Optional: disable auto-scaling so text doesn't shrink unexpectedly
            textComp.sizeToFit = false;

            // If you want to make sure the text component immediately shows full string:
            textComp.text = originalText; // safe to set after snap3DInteractable.setPrompt
            print("Text component found — enabled Wrap + Overflow.");
          } else {
            print("No Component.Text found on instantiated prefab. If your text is inside nested children, search deeper or put the Text component on a known child.");
          }

          // Position
          if (overridePosition) {
            outputObj.getTransform().setWorldPosition(overridePosition);
          } else {
            let newPos = this.wcfmp.getForwardPosition(80);
            outputObj.getTransform().setWorldPosition(newPos);
          }

          // Feed cleaned-up prompt to Snap3D for model generation
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
