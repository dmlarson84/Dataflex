// NAVI_PD.INC
// June 27, 1991
// LS
//
// include file for creating generic navigate_pull_down object for object
// navigation actions
//
// 04/08/94 JJT - DAF - Added support for 1st Letter Highlighting

#IFDEF NAVIGATE_PULL_DOWN.N
#ELSE
/Navigate_Pull_Down
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³ ________________________ ³
³ ________________________ ³
³ ________________________ ³
³ ________________________ ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³ ________________________ ³
³ ________________________ ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
/*
#ENDIF

#CHKSUB 1 1 // Verify the UI subsystem.

register_object Navigate_Pull_Down
on_item '&Navigate' send Activate_Pull_Down to (Navigate_Pull_Down( Current_Object ))

object Navigate_Pull_Down is a Pull_Down_Menu
    multi$ register_procedure Prompt Zoom

    item_list
        on_item "&Next Area \aF6"           send Switch
        on_item "Previous &Area \aShift+F6" send Switch_Back
        on_item "N&ext Panel \aAlt+F6"      send Switch_Next_Group
        on_item "P&revious Panel \aCtrl+F6" send Switch_Prior_Group
        on_item "&Prompt \aF4"              send Prompt
        on_item "&Zoom \aAlt+F9"            send Zoom
    end_item_list
end_object

