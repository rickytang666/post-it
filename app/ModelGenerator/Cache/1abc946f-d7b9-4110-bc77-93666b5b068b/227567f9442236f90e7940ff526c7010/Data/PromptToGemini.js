const Gemini = require('Remote Service Gateway.lspkg/HostedExternal/Gemini').Gemini;

/**
 * Converts user text into a creative Snap3D prompt using Gemini.
 * @param {string} userInput - The text to rewrite.
 * @returns {Promise<string>} - Resolves with the improved prompt.
 */
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

    return Gemini.models(geminiRequest)
        .then(response => {
            const prompt = response.candidates[0].content.parts[0].text.trim();
            print("Gemini prompt: " + prompt);
            return prompt;
        })
        .catch(err => {
            print("Gemini Error: " + err);
            throw err;
        });
}

// Example usage
generateSnap3DPrompt("There is a cute dog wearing a hat")
    .then(prompt => {
        print("Got prompt: " + prompt);
    });
