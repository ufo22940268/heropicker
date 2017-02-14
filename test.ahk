#SingleInstance
; Create the ListView with two columns, Name and Size:
 Gui, Add, ListView, r20 w400 gMyListView, 英雄Gui, Add, Button, x83 y221 w160 h70 , Button
Gui, Add, Text, x63 y31 w240 h130 , Text
; Generated using SmartGUI Creator for SciTE
Gui, Show, w478 h378, Untitled GUI
return

GuiClose:
ExitApp

;   heroes := [{"name": 路霸, "x": 10, "y": 20}]
heroes := {"路霸": 123, "士兵76": 123}
; Gather a list of file names from a folder and put them into the ListView:
For index, hero in heroes
    ;  MsgBox, % "iiii" hero
    LV_ADD("", index)

; Display the window and return. The script will be notified whenever the user double clicks a row.
Gui, Show
return

MyListView:
return

F3::
    number := LV_GetNext(0)
    MsgBox %number%
return

GuiClose:  ; Indicate that the script should exit automatically when the window is closed.
ExitApp