<div align="center">
  <h1>Post-It</h1>
  <p>AR sticky notes for real-world exploration</p>
</div>

<div align="center">
  <a href="https://www.snapchat.com/spectacles">
    <img src="https://img.shields.io/badge/AR-Snap%20Spectacles-yellow" alt="AR Snap Spectacles">
  </a>
  <a href="https://lensstudio.snapchat.com/">
    <img src="https://img.shields.io/badge/Built%20with-Lens%20Studio-blue" alt="Built with Lens Studio">
  </a>
  <a href="https://ai.google.dev/gemini-api">
    <img src="https://img.shields.io/badge/AI-Gemini%20%2B%20Snap3D-green" alt="AI Gemini + Snap3D">
  </a>
</div>

---

## Overview

An AR experience that turns the real world into a digital bulletin board. Place virtual sticky notes anywhere, leave messages for others to discover. Your thoughts become part of the physical space.

<div>
  <div style="display: flex; align-items: center;">
    <img src="https://pbs.twimg.com/profile_images/1937652850353491968/4xmJWnn3_400x400.jpg" width="15" height="15" style="margin-right: 10px;" alt="Hack the North" />
    <span>Semi-Finalist Submission of Hack the North 2025</span>
  </div>
</div>

## Inspirations

We wanted to bring back the joy of exploring. Turn everyday spaces into a shared, interactive canvas. Make city exploration fun, social, and personal again.

## Features

- **Place Notes**: Tap anywhere to anchor a sticky note to that location
- **AI-Generated Icons**: Gemini AI converts your voice message to appropriate prompts, which is passed to **Snap3D API** to generate symbolic 3D models
- **Interactive Discovery**: Through the lens, users can find and read notes left by others
- **Toggle View**: Switch between symbolic icons and full note text, fully controllable by hand gestures

## Tech Stack

- Snap Lens Studio (AR framework)
- TypeScript & JavaScript
- Gemini AI and snap3D API (3D model generation)
- Spectacles Interaction Kit

## Quick Start

### Prerequisites

> [! WARNING]
> Requires Snap Spectacles (currently in developer preview, not publicly available)

- Snap Spectacle Lenses (currently unreleased)
- Snap Lens Studio v5.12 (do NOT use v5.13)
- Snap Spectacles App installed on your phone

### Setup

1. Clone this repository
2. Open the projects under the `app` folder in Snap Lens Studio
3. Power on the Snap Spectacles and connect to your phone
4. Send the lenses in Lens Studio to your Spectacles

---

👇 See more details and the demo video in [DEVPOST](https://devpost.com/software/post-it-jrswqx)
