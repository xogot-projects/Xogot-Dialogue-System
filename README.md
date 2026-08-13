# Dialogue & Interaction System (Xogot Tutorial)

This project demonstrates how to build a **reusable interaction and dialogue system**
entirely in **Xogot** — the iPad and iPhone version of the Godot game engine.

The tutorial shows how to create interactable NPCs and objects, display contextual
interaction prompts, and present animated dialogue boxes that automatically resize
to fit their text. The system also includes typewriter-style text, speech sound
effects, multi-line conversations, and input locking while dialogue is active.

---

## Features

* Reusable **InteractionArea** component built with `Area2D`
* Composition-based interaction system that can be added to NPCs and objects
* Global **Interaction Manager** that tracks nearby interactable areas
* Automatic selection of the closest available interaction
* Contextual interaction prompts such as **Talk** or **Toggle**
* Dynamically sized dialogue boxes using **NinePatchRect**
* Automatic text wrapping for longer dialogue
* Pop-up dialogue box animation using tweens
* Typewriter-style character-by-character text display
* Separate timing for letters, spaces, and punctuation
* Speech sound effects with randomized pitch variation
* Global **Dialogue Manager** for multi-line conversations
* Interaction locking while dialogue is active
* Example NPC integration
* Designed to work smoothly on **iPad and iPhone** with Xogot
* Compatible with **Godot 4.x**

---

## Video Tutorial

Watch the full video walkthrough by **Jhello** on the Xogot YouTube channel:

[Dialogue & Interaction System in Xogot - Godot on iPad](https://youtu.be/mdSTOb5dbzA)

---

## How to Use

1. Download or clone this repository:

```bash
git clone https://github.com/xogot-projects/Xogot-Dialogue-System.git
```

2. Open the project in **Xogot** on iPad or iPhone.

3. Open the main scene and run the project.

4. Approach an interactable NPC or object and use the configured **Interact** action.

When the player enters an interaction area, a prompt appears for the closest
available object. Triggering an NPC interaction starts its dialogue, and the same
input can be used to advance through the conversation after each line finishes
displaying.

---

## What You'll Learn

This sample project covers the core pieces needed for reusable interactions and
dialogue in Godot:

* Building reusable systems with composition instead of inheritance
* Creating an `Area2D`-based interaction component
* Registering and unregistering nearby interaction areas
* Sorting interactable objects by distance from the player
* Using autoloads to create globally accessible managers
* Creating scalable UI with `NinePatchRect` and containers
* Measuring and wrapping dialogue text dynamically
* Animating UI with tweens
* Revealing text one character at a time with `Timer`
* Using different delays for letters, spaces, and punctuation
* Adding character-by-character speech sounds with pitch variation
* Using signals to coordinate dialogue display and progression
* Managing multi-line conversations from a global dialogue manager
* Locking and restoring player interaction while dialogue is active
* Connecting the completed system to an NPC

---

## Project Structure

The project is organized around several reusable components that work together to
handle interaction and dialogue.

### Interaction Area

The reusable interaction component uses:

* `Area2D` as its root
* Collision detection for determining when the player is nearby
* An exported action name for prompts such as **Talk**
* An interaction callable that can be overridden by individual objects

Interaction areas register themselves with the global Interaction Manager when the
player enters their range and unregister when the player leaves.

### Interaction Manager

The global Interaction Manager:

* Keeps an array of currently active interaction areas
* Finds the closest interactable object to the player
* Positions and displays the interaction prompt
* Listens for the **Interact** input action
* Calls the selected object's interaction callable
* Locks additional interactions until the current interaction finishes

### Dialogue Box

The reusable dialogue box scene uses:

* `MarginContainer` for layout and padding
* `NinePatchRect` for a scalable text box background
* `Label` for dialogue text
* `Timer` for the typewriter effect
* `AudioStreamPlayer` for speech sounds

The dialogue box measures each line before displaying it, limits its maximum width,
wraps longer text vertically, positions itself above the speaker, animates into
view, and then reveals the dialogue one character at a time.

### Dialogue Manager

The global Dialogue Manager:

* Accepts a speaker position, an array of dialogue lines, and a speech sound
* Spawns a new dialogue box for each line
* Waits until each line finishes displaying before allowing the player to advance
* Removes completed dialogue boxes
* Emits a signal when the full conversation is finished

### NPC Example

The example NPC combines an Interaction Area with the Dialogue Manager. Its
interaction callable starts a conversation using the NPC's position, dialogue
lines, and configured speech sound. The Interaction Manager remains locked until
the conversation is complete.

---

## Requirements

* Xogot for iPad or iPhone
* Godot 4.x compatible project files

---

## About Xogot

**Xogot** brings the Godot editor to iPad and iPhone, making it possible to
build, edit, and test Godot projects directly on iOS devices.

Learn more at: https://xogot.com

---

## Join the Community

Join the Xogot Discord to ask questions, share projects, and connect with other
Godot creators using Xogot:

https://discord.gg/TDEcyfHZAh
