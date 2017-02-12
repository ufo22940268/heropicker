ToRGB(color) {
    return { "r": (color >> 16) & 0xFF, "g": (color >> 8) & 0xFF, "b": color & 0xFF }
}

Compare(c1, c2, vary=2) {
    rdiff := Abs( c1.r - c2.r )
    gdiff := Abs( c1.g - c2.g )
    bdiff := Abs( c1.b - c2.b )

    return rdiff <= vary && gdiff <= vary && bdiff <= vary
}

stopPrompt() {
        TrayTip,, select hero program stopped
}

#MaxThreadsPerHotkey 3
F3::  ; Win+Z hotkey (change this hotkey to suit your preferences).
#MaxThreadsPerHotkey 1
if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    stopPrompt()
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepWinZRunning := true

firstRun := true

Loop
{
    MouseClick, left, 1379, 891
    PixelGetColor, color, 1371, 888
    PixelGetColor, color1, 63, 277

    if firstRun
        TrayTip,, select hero program started
        firstRun := false

    if Compare(ToRGB(color), ToRGB(0x444344)) 
    {
        MouseClick, left, 980, 1000
        stopPrompt()
        break  ; Break out of this loop.
    }
    else if Compare(ToRGB(color1), ToRGB(0x8EFFFF)) 
    {
        ;MsgBox colora: %color% match
        KeepWinZRunning := false
        break
    }
    else
    {
        if not KeepWinZRunning  ; The user signaled the loop to stop by pressing Win-Z again.
            break  ; Break out of this loop.
    }

}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
firstRun := false

return
