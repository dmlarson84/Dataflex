// TXTW_PD.INC
// June 7, 1991
// LS
//
// include file for creating generic text_pull_down object for text_window
// object actions - ShdTxtPd MUST be used before this file can be included.
//
// 04/08/94 JJT - DAF - Added support for 1st Letter Highlighting

#IFDEF TEXT_WINDOW_PULL_DOWN.N
#ELSE
/Text_Window_Pull_Down
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³ ___________________________ ³
³ ___________________________ ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
³ ___________________________ ³
³ ___________________________ ³
³ ___________________________ ³
³ ___________________________ ³
³ ___________________________ ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
/*
#ENDIF

#CHKSUB 1 1 // Verify the UI subsystem.

register_object Text_Pull_Down
on_item '&Text' send Activate_Pull_Down to (Text_Pull_Down( Current_Object ))

object Text_Pull_Down is a Shadow_Text_Pull_Down_Menu Text_Window_Pull_Down
    multi$ register_procedure Mark_Block Mark_Column Cut_Marked_Area
    multi$ register_procedure Copy_Marked_Area Paste_Block

    item_list
        on_item "&Start of Text \aCtrl+Home" send Beginning_Of_Data
        on_item "&End of Text \aCtrl+End"    send End_Of_Data
        on_item "&Block Mark \aCtrl+\"       send Mark_Block
        on_item "Column &Mark"               send Mark_Column
        on_item "Cu&t Marked Text \aAlt+-"   send Cut_Marked_Area
        on_item "&Copy Marked Text \aCtrl+-" send Copy_Marked_Area
        on_item "&Paste Text \aAlt++"        send Paste_Block
    end_item_list
end_object
