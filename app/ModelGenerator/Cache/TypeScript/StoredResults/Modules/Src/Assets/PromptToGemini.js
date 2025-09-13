"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.generateSnap3DPrompt = generateSnap3DPrompt;
const Gemini_1 = require("Remote Service Gateway.lspkg/HostedExternal/Gemini");
function generateSnap3DPrompt(userInput) {
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
    return Gemini_1.Gemini.models(geminiRequest)
        .then((response) => {
        // TypeScript doesn't have strict types for Gemini response here
        const prompt = response.candidates[0].content.parts[0].text.trim();
        print("Gemini prompt: " + prompt);
        return prompt;
    })
        .catch((err) => {
        print("Gemini Error: " + err);
        throw err;
    });
}
//# sourceMappingURL=PromptToGemini.js.map