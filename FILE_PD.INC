// FILE_PD.PKG
// June 21, 1990
// LS
//
// package for creating generic file_pull_down object for entry object actions
// (assumed to be used as first pull down menu, hence EXIT option as last item)
//
// 04/08/94 JJT - DAF - Added support for 1st Letter Highlighting

#CHKSUB 1 1 // Verify the UI subsystem.

use UI

#IFDEF FILE_PULL_DOWN.N
#ELSE
#IFDEF MSG_LOGIN
/File_Pull_Down
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
/File_Pull_Down
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

register_object File_Pull_Down
on_item '&File' send Activate to (File_Pull_Down( Current_Object ))

object File_Pull_Down is a Pull_Down_Menu
    multi$ register_procedure Find_GE Find_Next Find_Previous
    multi$ register_procedure SuperFind Superfind_Next Superfind_Previous

    item_list
        on_item "&Clear \aF5"                    send Request_Clear
        on_item "Clear &All \aCtrl+F5"           send Request_Clear_All
        on_item "&Delete \aShift+F2"             send Request_Delete
        on_item "&Find \aF9"                     send Find_GE
        on_item "&Next \aF8"                     send Find_Next
        on_item "&Previous \aF7"                 send Find_Previous
        on_item "S&uperfind \aShift+F9"          send Superfind
        on_item "Sup&erfind Next \aShift+F8"     send Superfind_Next
        on_item "Supe&rfind Previous \aShift+F7" send Superfind_Previous
        on_item "Find &Last \aCtrl+End"          send Find_Last
        on_item "Find F&irst \aCtrl+Home"        send Find_First
        on_item "&Save \aF2"                     send Request_Save
#IFDEF MSG_LOGIN
        on_item "&Login"                         send Login to Desktop
        on_item "Log&out"                        send Logout to Desktop
#ENDIF
        on_item "E&xit \aAlt+F4"                 send Exit_Area
    end_item_list
end_object
