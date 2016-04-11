// RECD_PD.INC
// January 10, 1991
// LS
//
// include file for creating generic file_pull_down object for entry object
// actions
//
// 04/08/94 JJT - DAF - Added support for 1st Letter Highlighting

#IFDEF RECORD_PULL_DOWN.N
#ELSE
/Record_Pull_Down
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
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
/*
#ENDIF

#CHKSUB 1 1 // Verify the UI subsystem.

register_object Record_Pull_Down
on_item '&Record' send Activate_Pull_Down to (Record_Pull_Down( Current_Object ))

object Record_Pull_Down is a Pull_Down_Menu
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
    end_item_list
end_object

