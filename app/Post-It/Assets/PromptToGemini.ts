import { Gemini } from "Remote Service Gateway.lspkg/HostedExternal/Gemini";

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
            print("Gemini prompt: " + prompt);
            return prompt;
        })
        .catch((err: any) => {
            print("Gemini Error: " + err);
            throw err;
        });
}
