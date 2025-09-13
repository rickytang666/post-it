# Post-It: AR Sticky Note Constellation

## Overview

AR app for Snapchat Spectacles. Users leave virtual sticky notes at real locations that appear in 3D space for future visitors.

## MVP Features

1. **Create Notes**: Place text notes at locations using gestures
2. **Persist Notes**: Notes stay anchored to locations across sessions
3. **Guide**: Display arrows pointing to distant notes
4. **View Notes**: Click on notes to expand and see details

## Tech Stack

Lens Studio

- **Custom Locations** API for location mapping and memory of notes
- **Path Pioneer** for navigation
- **Essentials** template for basic interactions

## Team Roles (4 people)

- **Dev 1**: Creating notes and placing them in the world (essential and custom locations)
- **Dev 2**: Store/retrieve notes at locations (custom locations)
- **Dev 3**: Arrows pointing to distant notes (path pioneer)
- **Dev 4**: Clicking on notes to expand and see details (essentials, crop, etc.)

## GitHub Dev Guide

- Create a new branch for your feature. Branch name `[your name]/[feature name]`. e.g. `monkey/create-notes`
