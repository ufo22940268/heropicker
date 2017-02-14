#SingleInstance
#NoTrayIcon
#SingleInstance

Gui, Add, DropDownList,sort vColorChoice gAction x173 y45 w190 h90, wefwefwef|111


Gui, Add, Text, x43 y43 w100 h20 , Select hero
Gui, Add, Text, x43 y81 w290 h30 , Press F3 when start matching
Gui, Show, w401 h130, Hero picker
; Generated using SmartGUI Creator for SciTE
return

selection :=

Action:
msgbox, changed
selection := "ijijij"
return

GuiClose:
ExitApp

F3::
MsgBox %selection%
return

