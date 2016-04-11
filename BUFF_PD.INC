// BUFF_PD.INC
// January 10, 1991
// LS
//
// include file for creating generic buffer_pull_down object for edit object
// actions

#IFDEF BUFFER_PULL_DOWN.N
#ELSE
/Buffer_Pull_Down
ÚÄÄÄÄÄÄÄÄÄÄÄ¿
³ _________ ³
³ _________ ³
³ _________ ³
³ _________ ³
ÀÄÄÄÄÄÄÄÄÄÄÄÙ
/*
#ENDIF

#CHKSUB 1 1 // Verify the UI subsystem.

register_object Buffer_Pull_Down
on_item '&Buffer' send Activate_Pull_Down to (Buffer_Pull_Down( Current_Object ))

object Buffer_Pull_Down is a Pull_Down_Menu
    register_procedure Read_File

    item_list
        on_item "&Clear \aF5" send Request_Clear
        on_item "&Read"       send Read_File
        on_item "&Save \aF2"  send Request_Save
        on_item "&Print"      send Print
    end_item_list
end_object
