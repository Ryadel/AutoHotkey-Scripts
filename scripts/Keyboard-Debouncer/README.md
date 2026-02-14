# Keyboard-Debouncer v0.1

A lightweight AutoHotkey v2 script that reduces unintended double key presses ("key chatter") by applying a global debounce mechanism to keyboard input.

## What it does

This script:

- Intercepts most keyboard scancodes globally
- Suppresses rapid unintended double taps within a configurable time window
- Preserves normal key hold behavior (auto-repeat is not blocked)
- Excludes modifier keys and selected system keys
- Can be automatically disabled for specific applications (e.g. games)

The goal is to mitigate accidental duplicate keystrokes without interfering with normal typing or key hold functionality.

## Requirements

- Windows 10 / 11
- AutoHotkey v2

## Configuration

You can adjust the following variables at the top of the script:

- `debounceThreshold` → debounce window in milliseconds (default: 120)
- `ignoreWindows` → list of applications where debounce is disabled
- `excludedSC` → scancodes excluded from debounce

## Usage

1. Install AutoHotkey v2.
2. Run the `.ahk` script.
3. (Optional) Add it to Windows Startup to enable it automatically at boot.

## References

- https://www.ryadel.com/en/keyboard-double-typing-fix-windows/
