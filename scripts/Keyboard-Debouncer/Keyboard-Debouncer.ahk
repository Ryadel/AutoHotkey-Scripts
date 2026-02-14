; Keyboard-Debouncer v0.1
; https://www.ryadel.com/en/keyboard-double-typing-fix-windows/
; https://github.com/Ryadel/AutoHotkey-Scripts/scripts/Keyboard-Debouncer/

#Requires AutoHotkey v2.0
#UseHook true

debounceThreshold := 120
lastTap := Map()   ; ultimo "tap" valido (down non-repeat)
isDown := Map()    ; stato fisico: true dopo down, false dopo up

ignoreWindows := [
    "ahk_exe cs2.exe",
    "ahk_exe GenshinImpact.exe"
]

; Attiva debounce solo se la finestra NON è ignorata
HotIf(WinNotIgnored)

; Crea hotkey globali per scancode 0x01..0xFF (quasi tutta la tastiera)
; Escludo i modificatori per non rompere combinazioni / press&hold.
excludedSC := Map(
    "SC02A", true, ; LShift
    "SC036", true, ; RShift
    "SC01D", true, ; LCtrl
    "SC11D", true, ; RCtrl (extended)
    "SC038", true, ; LAlt
    "SC138", true, ; RAlt / AltGr (extended)
    "SC15B", true, ; LWin (extended)
    "SC15C", true, ; RWin (extended)
    "SC00E", true, ; Backspace (Canc)
    "SC152", true, ; Insert
    "SC153", true  ; Delete	
)

; Handler DOWN: debounce solo sui "tap", non sugli auto-repeat da hold
DebounceDown(*) {
    global debounceThreshold, lastTap, isDown

    hk := A_ThisHotkey
    sc := RegExReplace(hk, "^\$?\*?") ; "$*SC01E" -> "SC01E"

    ; Se è già fisicamente down, è auto-repeat: NON debouncare
    if isDown.Has(sc) && isDown[sc] {
        Send("{Blind}{" sc "}")
        return
    }

    ; Primo down reale (tap)
    isDown[sc] := true
    now := A_TickCount

    if lastTap.Has(sc) && (now - lastTap[sc] < debounceThreshold)
        return  ; sopprime solo il 2° tap rapido (bounce)

    lastTap[sc] := now
    Send("{Blind}{" sc "}")
}

; Handler UP: marca il tasto come rilasciato
KeyUp(*) {
    global isDown
    hk := A_ThisHotkey
    sc := RegExReplace(hk, "^\$?\*?", "")
    sc := RegExReplace(sc, "\s+up$", "") ; "$*SC01E up" -> "SC01E"
    isDown[sc] := false
}

Loop 0xFF {
    sc := Format("SC{:03X}", A_Index)
    if excludedSC.Has(sc)
        continue

    try {
        Hotkey("$*" sc, DebounceDown, "On")
        Hotkey("$*" sc " up", KeyUp, "On")
    }
}

WinNotIgnored(*) {
    global ignoreWindows
    for pattern in ignoreWindows {
        if WinActive(pattern)
            return false
    }
    return true
}
