// WIND_PD.INC
// November 30, 1990
// LS
//
// package for creating generic window_pull_down object for edit object actions
//
// 04/08/94 JJT - DAF - Added support for 1st Letter Highlighting

#IFDEF WINDOW_PULL_DOWN.N
#ELSE
/Window_Pull_Down
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³ ___________________________ ³
³ ___________________________ ³
³ ___________________________ ³
³ ___________________________ ³
³ ___________________________ ³
³ ___________________________ ³
³ ___________________________ ³
³ ___________________________ ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
/*
#ENDIF

#CHKSUB 1 1 // Verify the UI subsystem.

register_object Window_Pull_Down
on_item "&Window" send Activate_Pull_Down to (Window_Pull_Down( Current_Object ))

object Window_Pull_Down is a Pull_Down_Menu
    multi$ register_procedure Change_Margin Status_Line_Off Status_Line_On
    register_procedure Resize

    item_list
        on_item "&Change Margin..."        send Change_Margin
        on_item "&Status Line Off"         send Status_Line_Off
        on_item "Status &Line On"          send Status_Line_On
        on_item "&Next Page \aPgDn"        send Page_Down
        on_item "&Previous Page \aPgUp"    send Page_Up
        on_item "&Resize..."               send ReSize
        on_item "&End of Window \aCtrl+Dn" send End_Of_Panel
        on_item "&Top of Window \aCtrl+Up" send Beginning_Of_Panel
    end_item_list
end_object
