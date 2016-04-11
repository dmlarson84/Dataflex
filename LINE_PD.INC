// LINE_PD.INC
// June 4, 1991
// LS
//
// include file for creating generic line_pull_down object for edit object
// actions

#IFDEF LINE_PULL_DOWN.N
#ELSE
/Line_Pull_Down
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
³ _____________________________ ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
/*
#ENDIF

#CHKSUB 1 1 // Verify the UI subsystem.

register_object Line_Pull_Down
on_item '&Line' send Activate_Pull_Down to (Line_Pull_Down( Current_Object ))

object Line_Pull_Down is a Pull_Down_Menu
    register_procedure To_Line_Num

    item_list
        on_item "&Beginning of Line \aHome"      send Beginning_Of_Line
        on_item "End of Line \aEnd"              send End_Of_line
        on_item "Line#..."                       send To_Line_Num
        on_item "Remove Line \aAlt+-"            send Delete_Line
        on_item "Delete to EOL \aCtrl+Backspace" send Delete_To_EOL
    end_item_list
end_object
