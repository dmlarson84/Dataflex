// HELP_PD.INC
// November 30, 1990
// LS
//
// include file for creating generic help_pull_down object
//
// 04/08/94 JJT - DAF - Added support for 1st Letter Highlighting

#IFDEF HELP_PULL_DOWN.N
#ELSE
/Help_Pull_Down
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³ ________________ ³
³ ________________ ³
³ ________________ ³
³ ________________ ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
/*
#ENDIF

#CHKSUB 1 1 // Verify the UI subsystem.

register_object Help_Pull_Down
on_item '&Help' send Activate_Pull_Down to (Help_Pull_Down( Current_Object ))

object Help_Pull_Down is a Pull_Down_Menu
    multi$ register_procedure Help_For_Help Extended_Help Keys_Help Help_Index

    item_list
        on_item "&Help for Help..." send Help_For_Help to Desktop
        on_item "&Extended Help..." send Extended_Help
        on_item "&Keys Help..."     send Keys_Help     to Desktop
        on_item "Help &Index..."    send Help_Index    to Desktop
    end_item_list
end_object
