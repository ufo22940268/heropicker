;#SingleInstance force

#SingleInstance
;~ #NoTrayIcon


heroNames := ""
heroes := { "Soldier: 76": "197:879", "Reaper": "248:879", "Pharah": "304:879", "Genji": "379:879", "Tracer": "439:879", "McCree": "487:879", "Sombra": "556:879", "Hanzo": "694:879", "Bastion": "750:879", "Tobjorn": "820:879", "Junkrat": "885:879", "Mei": "939:879", "Widowmaker": "998:879", "D.Va": "1132:879", "Zarya": "1204:879", "Winston": "1251:879", "Reinhardt": "1306:879", "Roadhog": "1357:879", "Lucio": "1507:879", "Mercy": "1565:879", "Ana": "1615:879", "Zenyatta": "1685:879", "Symmetra": "1735:879"}

for key, val in heroes
    heroNames .= key . "|"


Gui, Add, DropDownList,Choose1 x173 y45 w190 h90 vList1 gAction, %heroNames%

Gui, Add, Text, x43 y43 w100 h20 , Select hero
Gui, Add, Text, x43 y81 w290 h30 , Press F3 when start matching
Gui, Show, w401 h130, Hero picker
; Generated using SmartGUI Creator for SciTE
return

selection :=

Action:
Gui, Submit, nohide
result := StrSplit(heroes[List1], ":")
x := % result[1]
y := % result[2]
return

GuiClose:
ExitApp


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



F3::  
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
    MouseClick, left, x, y
    PixelGetColor, color, 1371, 888
    PixelGetColor, color1, 63, 277

    if firstRun
        TrayTip,, select hero program started
        firstRun := false
        
    MouseClick, left, 980, 1000
    if not KeepWinZRunning  ; The user signaled the loop to stop by pressing Win-Z again.
        break  ; Break out of this loop.
    ;~ if Compare(ToRGB(color), ToRGB(0x444344)) 
    ;~ {
        ;~ MouseClick, left, 980, 1000
        ;~ stopPrompt()
        ;~ break  ; Break out of this loop.
    ;~ }
    ;~ else if Compare(ToRGB(color1), ToRGB(0x8EFFFF)) 
    ;~ {
        ;~ KeepWinZRunning := false
        ;~ break
    ;~ }
    ;~ else
    ;~ {
        ;~ if not KeepWinZRunning  ; The user signaled the loop to stop by pressing Win-Z again.
            ;~ break  ; Break out of this loop.
    ;~ }

}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
firstRun := false

return