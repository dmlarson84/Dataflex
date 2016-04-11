// BUFFE_PD.INC
// 07/17, 1991
// LS
//
// include file for creating generic buffer_pull_down object for edit object
// actions - includes Exit item
//
// 04/08/94 JJT - DAF - Added support for 1st Letter Highlighting

#IFDEF BUFFER_EXIT_PULL_DOWN.N
#ELSE
#IFDEF MSG_LOGIN
/Buffer_Exit_Pull_Down
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³ _____________ ³
³ _____________ ³
³ _____________ ³
³ _____________ ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³ _____________ ³
³ _____________ ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³ _____________ ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
/*
#ELSE
/Buffer_Exit_Pull_Down
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³ _____________ ³
³ _____________ ³
³ _____________ ³
³ _____________ ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³ _____________ ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
/*
#ENDIF
#ENDIF

#CHKSUB 1 1 // Verify the UI subsystem.

register_object Buffer_Pull_Down
on_item '&Buffer' send Activate_Pull_Down to (Buffer_Pull_Down( Current_Object ))

object Buffer_Pull_Down is a Pull_Down_Menu Buffer_Exit_Pull_Down
    register_procedure Read_File

    item_list
        on_item "&Clear \aF5"    send Request_Clear
        on_item "&Read"          send Read_File
        on_item "&Save \aF2"     send Request_Save
        on_item "&Print"         send Print
#IFDEF MSG_LOGIN
        on_item "&Login"         send Login to Desktop
        on_item "Log&out"        send Logout to Desktop
#ENDIF
        on_item "E&xit \aAlt+F4" send Exit_Area
    end_item_list
end_object
