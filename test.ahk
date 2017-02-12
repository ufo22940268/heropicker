; Create the ListView with two columns, Name and Size:
 Gui, Add, ListView, r20 w400 gMyListView, 英雄

;   heroes := [{"name": 路霸, "x": 10, "y": 20}]
heroes := {"路霸": 123, "士兵76": 123}
; Gather a list of file names from a folder and put them into the ListView:
For index, hero in heroes
    ;  MsgBox, % "iiii" hero
    LV_ADD("", index)

LV_ModifyCol()  ; Auto-size each column to fit its contents.

; Display the window and return. The script will be notified whenever the user double clicks a row.
Gui, Show
return

MyListView:
MsgBox A_GuiEvent
if A_GuiEvent = Normal
{
    LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
    ;  LV_Modify(number, "Select")
    ToolTip You double-clicked row number %A_EventInfo%. Text: "%RowText%"
}
return

F3:
    MsgBox number
return

GuiClose:  ; Indicate that the script should exit automatically when the window is closed.
ExitApp