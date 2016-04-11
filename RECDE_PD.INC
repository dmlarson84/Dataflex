// RECDE_PD.INC
// 07/17, 1991
// LS
//
// include file for creating generic record_pull_down object for entry object
// actions - includes Exit item
//
// 04/08/94 JJT - DAF - Added support for 1st Letter Highlighting

#IFDEF RECORD_EXIT_PULL_DOWN.N
#ELSE
#IFDEF MSG_LOGIN
/Record_Exit_Pull_Down
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³ _____________________________ ³
³ _____________________________ ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³ _____________________________ ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
/*
#ELSE
/Record_Exit_Pull_Down
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³ _____________________________ ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
/*
#ENDIF
#ENDIF

#CHKSUB 1 1 // Verify the UI subsystem.

register_object Record_Pull_Down
on_item '&Record' send Activate_Pull_Down to (Record_Pull_Down( Current_Object ))

object Record_Pull_Down is a Pull_Down_Menu Record_Exit_Pull_Down
    multi$ register_procedure Find_GE Find_Next Find_Previous
    multi$ register_procedure SuperFind Superfind_Next Superfind_Previous

    item_list
        on_item "&Clear/Add \aF5"                send Request_Clear
        on_item "Clear &All \aCtrl+F5"           send Request_Clear_All
        on_item "&Delete \aShift+F2"             send Request_Delete
        on_item "&Find \aF9"                     send Find_GE
        on_item "&Next \aF8"                     send Find_Next
        on_item "&Previous \aF7"                 send Find_Previous
        on_item "S&uperfind \aShift+F9"          send Superfind
        on_item "Sup&erfind Next \aShift+F8"     send Superfind_Next
        on_item "Supe&rfind Previous \aShift+F7" send Superfind_Previous
        on_item "Find F&irst \aCtrl+Home"        send Beginning_Of_Data
        on_item "Find Las&t \aCtrl+End"          send End_Of_Data
        on_item "&Save \aF2"                     send Request_Save
#IFDEF MSG_LOGIN
        on_item "&Login"                         send Login to Desktop
        on_item "Log&out"                        send Logout to Desktop
#ENDIF
        on_item "E&xit \aAlt+F4"                 send Exit_Area
    end_item_list
end_object
