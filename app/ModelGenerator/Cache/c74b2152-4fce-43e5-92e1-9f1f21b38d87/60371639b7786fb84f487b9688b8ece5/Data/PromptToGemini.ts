@component
export class NewScript extends BaseScriptComponent {
    import { Gemini } from "Remote Service Gateway.lspkg/HostedExternal/Gemini";

/**
 * Converts user text into a creative Snap3D prompt using Gemini.
 * @param userInput - The text to rewrite.
 * @returns A Promise that resolves to the improved prompt string.
 */
export function generateSnap3DPrompt(userInput: string): Promise<string> {
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
            // TypeScript doesn't have strict types for Gemini response here
            const prompt: string = response.candidates[0].content.parts[0].text.trim();
            console.log("Gemini prompt: " + prompt);
            return prompt;
        })
        .catch((err: any) => {
            console.error("Gemini Error: " + err);
            throw err;
        });
}

// Example usage:
generateSnap3DPrompt("There is a cute dog wearing a hat")
    .then(prompt => {
        console.log("Got prompt: " + prompt);
    });

}
