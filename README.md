# AutoHotkey-Scripts

Collection of practical AutoHotkey v2 scripts for Windows productivity, input control and keyboard fixes (including global debounce and key chatter solutions).

---

## Overview

This repository contains a curated set of lightweight, real-world AutoHotkey v2 utilities designed to improve daily workflows on Windows.

The scripts focus on:

- Productivity enhancements  
- Input customization and control  
- Keyboard behavior improvements  
- Window and application automation  
- Quality-of-life system tweaks  

All scripts are written for **AutoHotkey v2** and aim to be clean, configurable, and safe for everyday use.

---

## Requirements

- Windows 10 / 11  
- AutoHotkey v2  

AutoHotkey v1 is not supported.

---

## Repository Structure

AutoHotkey-Scripts/
│
├── scripts/ # Individual script folders
├── lib/ # Shared libraries (if applicable)
├── docs/ # Additional documentation
└── README.md


Each script resides in its own folder and may include:

- The main `.ahk` file  
- A local README with usage instructions  
- Configuration notes  
- Known limitations or troubleshooting guidance  

---

## Featured Scripts

### 🔹 Keyboard-Debouncer

A global AutoHotkey v2 debounce utility that reduces unintended double key presses ("key chatter") by filtering rapid duplicate taps while preserving normal key hold behavior (auto-repeat is not blocked).

**Key features:**

- Global scancode interception
- Configurable debounce threshold
- Modifier key exclusions
- Application-based ignore list
- Safe handling of key hold vs. double tap

Location: `scripts/Keyboard-Debouncer/`
References: https://www.ryadel.com/en/keyboard-double-typing-fix-windows/

---

## Getting Started

1. Install AutoHotkey v2.  
2. Clone or download this repository.  
3. Navigate to the desired script folder.  
4. Run the `.ahk` file.  

Optional: Add frequently used scripts to your Windows Startup folder.

---

## Design Principles

Scripts in this repository aim to be:

- Predictable  
- Minimal in overhead  
- Clearly structured  
- Easy to configure  
- Suitable for daily environments  

Where applicable, application-specific filters are included to avoid unintended side effects.

---

## License

This repository is licensed under the MIT License.
