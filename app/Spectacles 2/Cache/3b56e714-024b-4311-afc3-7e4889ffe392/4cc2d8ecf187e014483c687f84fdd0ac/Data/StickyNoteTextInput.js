// @input Component.Text3D text3D
// @input string defaultText
// Updates the sticky note's text from user input

function setText(newText) {
    if (script.text3D) {
        script.text3D.text = newText;
    }
}

// Example: Set default text on start
if (script.text3D && script.defaultText) {
    script.text3D.text = script.defaultText;
}

// TODO: Connect to Lens Studio's text input or voice input system
// Example usage: setText("User entered text");
