//  ************************************************
//        WALTMACS.FRM - Commonly Used (Macros)
//  ************************************************

#REM WARNING!!! YOU MUST COMPILE WITH THE COMPILE SWITCH ;M9
#REM Copyright 1988 By Walter F. Howard
#REM This issue Public Domain
#REM Not for Resale

#REPLACE YESNO? YESNO
#REPLACE MESSAGELINE (SCREENEND)
//#REPLACE MESSAGELINE (SCREENEND - 1)
#REPLACE ALTMESSAGE 14
#REPLACE NETWORK FALSE
#REPLACE DEFCOLOR 7
#REPLACE RDISCOLOR  112
#REPLACE MENUCOLOR 112
#REPLACE YESNOCOLOR 112
#REPLACE MINCOLOR  112
#REPLACE WAITCOLOR 112
#REPLACE KEYCOLOR 112

#REPLACE FINDNEXT FINDGREATER
#REPLACE FINDLESS FINDPRIOR

//  ****************************************************
//  All include file variables should begin with "_"
//  to keep them separate from main code variables
//  ****************************************************

string _user 20
string _str7 2
string _str8 2
string _str9 2
string _str6 30
string _str5 30
string _str4 255
string _char 1
string _str2 255
string _str3 255
string _str1 255
string _testr 12
string _menstr 75
string _smenstr 75
string _runstr
integer _charindex _strlen _asc _int _int2 _rightlen _readmode
integer _min _sec _totwidth _int3
indicator _breakok _ind _bool incyesno _notfirst _special
indicator _fil _autoprint _network _con
number _num
integer _choice _base
date _date

//      ****************************************************
//              INITIALIZATION CODE FOR ALL PROGRAMS
//      ****************************************************


#SET J$ 0 //used by SCANENTER macro to enable multiple SCANENTERS

//      *********************************
//              ROUND
//      *********************************

#COMMAND ROUNDCALC // (EXP) TO VAR PLACES
begin
   calc !1 to _num
   move (round(_num * 10 ^ !4)) to _num
   calc (_num /(10 ^ !4)) to _num
   move _num to !3
end
#ENDCOMMAND

//      ******************************************************
//                           LOWERCASE
//       Lowercases an item and puts the result back to itself
//
//                    EXAMPLE LOWERCASE STRING
//      ******************************************************

#COMMAND LOWERCASE
   begin
      move "" to _str2
      trim !1 to !1
      length !1 to _strlen
      for _charindex from 1 to _strlen
         mid !1 to _char 1 _charindex
         ascii _char to _asc
         if _asc ge 64 begin
            if _asc le 90 begin
            calc (_asc + 32) to _asc
            character _asc to _char
         end
      end
      append _str2 _char
      loop
      movestr _str2 to !1
   end
#ENDCOMMAND

//      ***********************************************************
//                                 TITLE
//      uppercases the first letter of every word in the string and
//      lowercases every other letter
//
//                           EXAMPLE: TITLE VAR
//      ***********************************************************

#COMMAND TITLE
   begin
      lowercase !1
      move "" to _str2
      trim !1 to _str1
      length _str1 to _strlen
      for _charindex from 1 to _strlen
         indicate _upit as _char eq " "
         mid _str1 to _char 1 _charindex
         [not _upit] indicate _upit as _charindex eq 1
         [_upit] uppercase _char
         append _str2 _char
      loop
      move _str2 to !1
      #IF (!0>2)
         move _str2 to !3
      #ENDIF
      end
#ENDCOMMAND

//      *******************************************
//                     MAKENAME
//      Appends strings with a space in between
//
//           MAKENAME FIRST LAST TO FULLNAME
//      *******************************************

#COMMAND MAKENAME
begin
    move "" to _str1
    trim !1 to _str1
    trim !2 to _str2
    append _str1 " " _str2

    #IF (!0>4)
       trim !3 to _str2
       append _str1 " " _str2
    #ENDIF

    #IF (!0>5)
       trim !4 to _str2
       append _str1 " " _str2
    #ENDIF

    #IF (!0>6)
       trim !5 to _str2
       append _str1 " " _str2
    #ENDIF

    #IF (!0>6)
       trim _str1 to !7
    #ELSE
        #IF (!0>5)
          trim _str1 to !6
        #ELSE
          #IF (!0>4)
             trim _str1 to !5
          #ELSE
             #IF (!0>3)
                trim _str1 to !4
             #ENDIF
          #ENDIF
       #ENDIF
    #ENDIF
end
#ENDCOMMAND

//      **************************************************
//                       MAKEPHONE
//      Give it 3 string numbers and it will create a full
//      formatted phone string
//
//       EXAMPLE MAKEPHONE "234" "543" "4325" TO PHONENUM
//      ***************************************************

#COMMAND MAKEPHONE
begin
    move "" to _str1
    trim !1 to _str2
    trim !2 to _str3
    append _str1 "(" _str2 ")-" _str3 "-" !3
    replace "()--" in _str1 with ""
    replace "()-" in _str1 with ""
    trim _str1 to !5
end
#ENDCOMMAND

//      *****************************************************
//                          MAKEADDRESS
//      Give it City State Zip and it will format it to
//      another string
//
//      EXAMPLE MAKEADDRESS "New York" "NY" "09987" TO ADDSTR
//      *****************************************************

#COMMAND MAKEADDRESS
    begin
       move "" to _str1
       trim !1 to _str1
       trim !2 to _str2
       append _str1 ", " _str2 " " !3
       trim _str1 to !5
    end
#ENDCOMMAND

//      *****************************************************
//                          PARSE
//         Returns the leftmost part of a
//         string up to a selected character
//         For example use to return single words at a time
//         from a string using " " as the character
//
//      EXAMPLE PARSE STRVAR BY CHARACTER TO TOKEN REMAINDER
//      *****************************************************

#COMMAND PARSE
begin
   move !1 to _str1
   length _str1 to _strlen
   pos !3 in _str1 to _int
   calc (_int - 1) to _int
   left _str1 to !5 _int
   calc (_strlen - _int - 1) to _int
   #IF (!0 > 5)
      right _str1 to !6 _int
   #ENDIF
end
#ENDCOMMAND

//      *********************************
//                 REVERSE
//      Change the sense of an indicator
//      *********************************

#COMMAND REVERSE
begin
   indicate !1 as [not !1]
end
#ENDCOMMAND

//      ***************************************************
//                       REPLACEALL
//      Replaces ALL occurances of a string with
//      another string. The FLEX REPLACE command only does
//      a single replacement
//      WARNING: This routine will recurse forever
//      if the REPLACING String contains the
//      REPLACED string
//
//      EXAMPLE REPLACEALL "JOE" IN "I AM JOE" WITH "BILL"
//      ***************************************************

#COMMAND REPLACEALL
begin
   repeat
   replace !1 in !3 with !5
   until [finderr]
end
#ENDCOMMAND

//      ****************************************************************
//                              BREAKLINE
//      This routine will break a line ON a
//      space, / or comma and return the leftside
//      as a string with NO broken words. The leftside
//      is guaranteed to be equal to or less than
//      INTEGERVAR in length
//
//      EXAMPLE BREAKLINE "Hello There" LENGTH 10 TO LEFTSIDE RIGHTSIDE
//      Will put "Hello" in leftside and "There" in rightside
//      ***************************************************************

#COMMAND BREAKLINE
begin
   move "." to _char
   trim !1 to _str1
   append _str1 " "
   length _str1 to _strlen
   move !3 to _charindex
   while _char ne " "
      mid _str1 to _char 1 _charindex
      calc (_charindex - 1) to _charindex
      if _charindex lt 1 move " " to _char
   end
   if _charindex lt 1 begin
      move !3 to _charindex
      increment _strlen
   end
   left _str1 to !5 _charindex
   trim !5 to !5
   #IF (!0>5)
      calc (_strlen - _charindex - 1) to _strlen
      right _str1 to !6 _strlen
      trim !6 to !6
   #ENDIF
end
#ENDCOMMAND

//      *********************************
//              CHOPLINE
//      *********************************

#COMMAND CHOPLINE
begin
   move "$" to _char
   trim !1 to _str1
   length _str1 to _strlen
   move (!3 < _strlen) to _charindex
   increment _charindex
   ifnot _strlen le !3 begin
      increment _charindex
      repeat
         calc (_charindex - 1) to _charindex
         mid _str1 to _char 1 _charindex
         if _charindex lt 1 move " " to _char
         indicate _ind as _char in "/-.,:; "
      until [_ind]
      if _charindex lt 1 begin
         move !3 to _charindex
         increment _strlen
      end
   end
   left _str1 to !5 (_charindex - 1)
   trim !5 to !5
   #IF (!0>5)
      calc (_strlen - _charindex + 1) to _strlen
      right _str1 to !6 _strlen
      trim !6 to !6
   #ENDIF
end
#ENDCOMMAND

//      *********************************
//                  RANGE
//      Checks for whether one thing is
//      between two others. Returns result
//      in incyesno (For  Boolean)
//      example RANGE low checked high
//      (The checked variable is the second one)
//      *********************************
//
#COMMAND RANGE?
begin
   indicate incyesno false
   if !2 ge !1 begin
      if !2 le !3 begin
         indicate incyesno true
      end
   end
end
#ENDCOMMAND
//
// *********************************
// FINDFIRST - Wednesday  2-18-87
// findfirst apinvoic.test eq this
// *********************************

#COMMAND FINDFIRST
begin
   if status !1 clear !1
   move !4 to !1.!2
   #IF (!0>4)
      find ge !1 by !6
   #ELSE
      find ge !1.!2
   #ENDIF
   [not found] clear !1
   indicate found as !4 match !1.!2
end
#ENDCOMMAND

//      *********************************
//              FINDNEXT
//      *********************************

#COMMAND FINDNEXT
begin
   #IF (!0>4)
      find gt !1 by !6
   #ELSE
      find gt !1.!2
   #ENDIF
   #IF (!0>2)
   [found] indicate found as !4 match !1.!2
   #ENDIF
end
#ENDCOMMAND

//      *********************************
//              FINDPRIOR
//      *********************************

#COMMAND FINDPRIOR
begin
   #IF (!0>4)
      find lt !1 by !6
   #ELSE
      find lt !1.!2
   #ENDIF
   #IF (!0>2)
      [found] indicate found as !4 match !1.!2
   #ENDIF
end
#ENDCOMMAND

// *********************************
// FINDEQUAL - Wednesday  2-18-87
// findequal apinvoic test for this
// *********************************

#COMMAND FINDEQUAL
begin
if status !1 clear !1
move !4 to !1.!2
   #IF (!0>4)
      find eq !1 by !6
   #ELSE
      find eq !1.!2
   #ENDIF
end
#ENDCOMMAND

//      *********************************
//                   SCAN
//      Scans through an entire database
//      based on an indexed field value
//
//            USE WITH ENDSCAN!!!
//      Example
//
//              SCAN DATEBASE ELEMENT FOR "GEORGE"
//              ... statements ...
//              ENDSCAN DATABASE.ELEMENT
//
//      This will execute the ...statements..
//      for every record in DATABASE where
//      DATABASE.ELEMENT is equal to george
//      SCAN TEST FIELD FOR "JOE" (NOTE TEST.FIELD, PERIOD IS
//      INTENTIONALLY MISSING
//      *********************************

#COMMAND SCAN
begin
   findfirst !1 !2 for !4
   [found] while [found]
#ENDCOMMAND

//      *********************************
//              ENDSCAN
//      *********************************

#COMMAND ENDSCAN
      findnext !1 !2 for !4
   end
   clear !1
end
#ENDCOMMAND

//      *********************************
//                   list
//      Scans through an entire database
//      starting on an indexed field value
//
//            USE WITH ENDLIST!!!
//      Example
//
//              LIST DATEBASE ELEMENT STARTING "GEORGE"
//              ... statements ...
//              ENDLIST DATABASE.ELEMENT
//
//      This will execute the ...statements..
//      for every record in DATABASE starting
//      with DATABASE.ELEMENT equal to george
//      LIST TEST FIELD FOR "JOE" (NOTE TEST.FIELD, PERIOD IS
//      INTENTIONALLY MISSING
//      *********************************

                //FILE ELEMENT "STARTING" VALUE "ENDING" VALUE
#COMMAND LIST   //FILE ELEMENT "STARTING" VALUE "BY" INDEX
   if status !1 clear !1
   #IFSAME !2 RECNUM
      move !4 to !1.RECNUM
   #ELSE
      move !4 to !1.!2
   #ENDIF
   #IF (!0>4)
      #IFSAME !5 BY
         find ge !1 by !6
      #ELSE
         #IFSAME !2 RECNUM
            find ge !1
         #ELSE
            find ge !1.!2
         #ENDIF
      #ENDIF
   #ENDIF
   #IF (!0<5)
      #IFSAME !2 RECNUM
         find ge !1
      #ELSE
         find ge !1.!2
      #ENDIF
   #ENDIF
   #IF (!0>4)
      #IFSAME !5 ENDING
         if !1.!2 gt !6 indicate found false
      #ENDIF
   #ENDIF
   [not found] clear !1
   while [found]
#ENDCOMMAND

//      *********************************
//              ENDLIST
//      *********************************

#COMMAND ENDLIST
   #IF (!0>4)
      #IFSAME !5 BY
         find gt !1 by !6
      #ELSE
         #IFSAME !2 RECNUM
            find gt !1
         #ELSE
            find gt !1.!2
         #ENDIF
      #ENDIF
   #ENDIF
   #IF (!0<5)
      #IFSAME !2 RECNUM
         find gt !1
      #ELSE
         find gt !1.!2
      #ENDIF
   #ENDIF
   #IF (!0>4)
      #IFSAME !5 ENDING
         if !1.!2 gt !6 indicate found false
      #ENDIF
   #ENDIF
   end
clear !1
#ENDCOMMAND

//      *********************************
//              MESSAGE
//      *********************************

#COMMAND MESSAGE
   Screenmode 112 on
   begin
      move !1 to _str1

      #IF (!0>1)
        append _str1 !2
      #ENDIF
      #IF (!0>2)
        append _str1 !3
      #ENDIF
      #IF (!0>3)
         append _str1 !4
      #ENDIF
      #IF (!0>4)
         append _str1 !5
      #ENDIF
      #IF (!0>5)
         append _str1 !6
      #ENDIF
      length _str1 to _int
      calc ((80 - _int) /2) to _int3
      move MESSAGELINE to _int
      #IFDEF _con
      #ELSE
         if current_image eq 0 move ALTMESSAGE to _int
      #ENDIF
      clearxy _int 0
      gotoxy _int _int3
      show _str1
      Screenmode 1 on
   end
#ENDCOMMAND

//      *********************************
//              CLEARMESSAGE
//      *********************************

#COMMAND CLEARMESSAGE
   begin
     gotoxy MESSAGELINE 0
     clearxy messageline 0
//     screenmode 2
//     show "                                                                               "
//     screenmode 1
   end
#ENDCOMMAND

//      *********************************
//              CHECKEXIT
//      *********************************

#COMMAND CHECKEXIT
      begin
         yesno "EXIT PROGRAM ARE YOU SURE"
         [incyesno] begin
            terminate
         end
      end
#ENDCOMMAND

//      *********************************
//              ABORTCHECK
//      *********************************

#COMMAND ABORTCHECK
// #IFSAME !1 SAVE
//    begin
//       yesno "EXIT WITHOUT SAVING - ARE YOU SURE"
//       [incyesno] begin
//          terminate
//       end
//    end
// #ELSE
//    begin
//       yesno "EXIT PROGRAM ARE YOU SURE"
//       [incyesno] begin
terminate
//       end
//    end
// #ENDIF
#ENDCOMMAND

//      *********************************
//              BEEP
//      *********************************

#COMMAND BEEP
   begin
      character 7 to _char
      show _char
   end
#ENDCOMMAND

//      *********************************
//              YESNO
//      *********************************

#COMMAND YESNO
begin
   #IF (!0<2)
     message !1 "? [Y/N/ды= N] "
   #ELSE
     message !1 "? [Y/N/ды= " !2 "] "
   #ENDIF
   inkey _char
   uppercase _char
   show _char
   #IF (!0>1)
      if _char ne "N" if _char ne !2 move !2 to _char
   #ENDIF
   indicate incyesno as _char eq 'Y'
   clearmessage
end
#ENDCOMMAND

//      *********************************
//              MINIMENU
//      MINIMENU PROMPT OPTIONS CHOICE (1,2,3...))
//      *********************************

#COMMAND MINIMENU
begin
  message !1 " "
  move !1 to _str1
  move "" to _str2
  repeat
     pos "]" in _str1 to _int
     replace "]" in _str1 with ""
     calc (_int - 1) to _int
     mid _str1 to _char 1 _int
     append _str2 _char
  until [not found]
  repeat
     inkey _char
     uppercase _char
     indicate _ind as _char in _str2
     [key.return] indicate _ind true
     [not _ind] beep
  until [_ind]
  show _char
  pos _char IN _str2 to !2
  clearmessage
end
#ENDCOMMAND

//      *********************************
//              PAUSE
//      *********************************

#COMMAND PAUSE
begin
   sysdate _int _int _int _int
   repeat
      sysdate _int2 _int2 _int2 _int2
      if _int2 lt _int calc (_int2 + 60) to _int2
   until (_int2 - _int) ge !1
end
#ENDCOMMAND

//      *********************************
//              CLRBUF
//      *********************************

#COMMAND CLRBUF
begin
  repeat
  keycheck loop
end
#ENDCOMMAND

//      *********************************
//              RDISPLAY
//      *********************************

#COMMAND RDISPLAY
   begin
      [not _con] begin
      move !1 to _str1

      #IF (!0>1)
         append _str1 !2
      #ENDIF

      #IF (!0>2)
         append _str1 !3
      #ENDIF

      #IF (!0>3)
         append _str1 !4
      #ENDIF

      #IF (!0>4)
         append _str1 !5
      #ENDIF

      length _str1 to _int
      calc ((80 - _int) /2) to _int2
      if current_image eq 0 gotoxy 12 _int2
      if current_image gt 0 gotoxy MESSAGELINE _int2
      showln _str1
      end
   end
#ENDCOMMAND

//      *********************************
//              PUSHREC
//      *********************************

#COMMAND PUSHREC
begin
  move !1.recnum to _num
end
#ENDCOMMAND

//      *********************************
//              POPREC
//      *********************************

#COMMAND POPREC
begin
   clear !1
   move _num to !1.recnum
   find eq !1.recnum
   [not found] clear !1
end
#ENDCOMMAND

//      *********************************
//              RPAD
//      example RPAD "joe" to 10 with "*"
//      *********************************

#COMMAND RPAD
begin
   length !1 to _strlen
   while _strlen lt !3
      append !1 !5
      length !1 to _strlen
   end
   left !1 to !1 !3
end
#ENDCOMMAND

//      *********************************
//              LPAD
//      example LPAD strvar to 10 with "*"
//      *********************************

#COMMAND LPAD
begin
   makestr !3 !5 to _str2
   append _str2 !1
   right _str2 to !1 !3
end
#ENDCOMMAND

//      *********************************
//              OVERLAY
//                !1    !2    !3   !4  !5
//      OVERLAY string into string at pos
//      *********************************

#COMMAND OVERLAY
begin
   length !1 to _int
   length !3 to _int2
   calc (!5 - 1) to _strlen
   left !3 to _str1 _strlen
   calc (_int2 - _strlen - _int) to _strlen
   right !3 to _str2 _strlen
   move "" to _str3
   append _str3 _str1 !1 _str2
   move _str3 to !3
end
#ENDCOMMAND

//      *********************************
//              DAY_OF_WEEK
//      *********************************
//
//#COMMAND DAY_OF_WEEK
//   begin
//      calc (!1/7) to _int
//      calc (_int * 7) to _int2
//      calc (!1 - _int2) to _int
//      move _int to !3
//   end
//#ENDCOMMAND
//
//      *********************************
//              DAY
//      *********************************
//
//#COMMAND DAY
//   begin
//     if !1 eq 0 move "Sunday" to !3
//     if !1 eq 1 move "Monday" to !3
//     if !1 eq 2 move "Tuesday" to !3
//     if !1 eq 3 move "Wednesday" to !3
//     if !1 eq 4 move "Thursday" to !3
//     if !1 eq 5 move "Friday" to !3
//     if !1 eq 6 move "Saturday" to !3
//   end
//#ENDCOMMAND
//
//      *********************************
//              EXIST?
//      *********************************

#COMMAND EXIST?
   begin
      indicate incyesno true
      direct_input !1
      [seqeof] indicate incyesno false
      close_input
   end
#ENDCOMMAND

//      *********************************
//              WAIT
//      *********************************

#COMMAND WAIT
   begin
      move "" to _str1
      #IF (!0>0)
        append _str1 !1
      #ENDIF
      #IF (!0>1)
        append _str1 !2
      #ENDIF
      #IF (!0>2)
        append _str1 !3
      #ENDIF
      #IF (!0>3)
        append _str1 !4
      #ENDIF

      MESSAGE _str1

      inkey _char
      CLEARMESSAGE
   end
#ENDCOMMAND

//      *********************************
//              FILNAM
//      *********************************

#COMMAND FILENAM
   begin
      length !1 to _strlen
      pos "." in !1 to _int
      if _int eq 0 move (_strlen + 1) to _int
      calc (_int - 1) to _int
      left !1 to !3 _int
      uppercase !3
   end
#ENDCOMMAND

//      *********************************
//              FILTYP
//      *********************************

#COMMAND FILETYP
   begin
      length !1 to _strlen
      pos "." in !1 to _int
      if _int eq 0 move (_strlen + 1) to _int
      calc (_strlen - _int) to _int
      right !1 to !3 _int
      uppercase !3
   end
#ENDCOMMAND

//      *********************************
//              EXTEND
//      *********************************

#COMMAND EXTEND
   begin
      FILENAM !1 to _str1
      append _str1 ".BAK"
      erasefile _str1
      renamefile !1 to _str1
      outfile !1
      direct_input _str1
      while [not seqeof]
         readln _str1
         [not seqeof] writeln _str1
      end
      close_input
   end
#ENDCOMMAND

//      *********************************
//              LINELOOP
//      *********************************

#COMMAND LINELOOP
   direct_input !1
   while [not seqeof]
      readln !2
#ENDCOMMAND

//      *********************************
//              ENDLINELOOP
//      *********************************

#COMMAND ENDLINELOOP
   end
   close_input
#ENDCOMMAND

//      *********************************
//              RPTPRMS
//      *********************************

#COMMAND RPTPRMS
begin

   #IFDEF _con
   #ELSE
      INDICATOR _con
      INDICATOR _lpt
   #ENDIF

   MINIMENU "Send Report To [S]creen [P]rinter Or [F]ile [ды = Screen]?" _int

   indicate _network NETWORK
   indicate _lpt false
   indicate _con false
   indicate _con false

   if _int eq 0 move 1 to _int
   if _int eq 1 begin
      move 22 to pageend
      move -1 to pagefeed
      outfile "CON:"
      indicate _con true
      screenmode 4
   end

   if _int eq 3 begin

      #IF (!0<1)
         move 0 to _int2
         while _int2 eq 0
            move 1 to _int2
            MINPUT "Enter Filename To Send Report To " _str3
            EXIST? _str3
            [incyesno] begin
               MINIMENU "This File Already Exists. [E]rase It [A]dd To It [ды = New File]" _int2
            end
         end
         if _int2 eq 1 outfile _str3
         if _int2 eq 2 begin
            extend _str3
         end
      #ELSE
         move !1 to _str3
         outfile _str3
      #ENDIF

      [_network] begin
         YESNO "Print When Finished"
         indicate _autoprint as [incyesno]
         [_autoprint] begin
            move "" to _runstr
            append _runstr _str3 " 0"
         end
      end
      indicate _fil true
   end

   if _int eq 2 begin
      outfile "LST:"
      indicate _lpt true
   end

   [not _con] begin
      MINPUT "How Many Lines Do You Want Printed On Each Page [ды = 55]? " _int
      if _int eq 0 move 55 to _int
      CLEARMESSAGE
      move _int to pageend

      MINIMENU "Page Break How? [F]ormfeed, [L]ines [ды = Formfeed]?"  _int
      if _int eq 0 move 1 to _int
      if _int eq 1 move 0 to pagefeed
      if _int eq 2 begin
         MINPUT "How Many Lines Long is The Whole Page? [ды = 66] " pagefeed
         if pagefeed eq 0 move 66 to pagefeed
      end
   end
   [_lpt] begin
      WAIT "Make Sure Your Printer is Connected and On Then Press Any Key"
   end
   [_con] clearscreen
end
#ENDCOMMAND

//      *********************************
//              PRINTFILE
//      *********************************

#COMMAND PRINTFILE
[_network _autoprint] begin
   close_output
   runprogram WAIT "PRNFILE" _runstr
end
#ENDCOMMAND

//      *********************************
//              FINDACCEPT
//      *********************************

#COMMAND FINDACCEPT //WINDOW OPTIONS FILE FIELD ERRORNUM TO OPTIONALVAR
begin
   indicate found false
   while [not found]
       ACCEPT !1 !2
       FINDFIRST !3 !4 FOR !1
       [NOT FOUND] ERROR !5
   end
   #IFSAME !6 TO
      move !1 to !7
   #ENDIF
end

#ENDCOMMAND

//      *********************************
//              ENTRYFIND
//      *********************************

#COMMAND ENTRYFIND //DATABASE.FIELD WINDOW FILE FIELD ERRORNUM
begin
   indicate found false
   while [not found]
      indicate found true
      #IF (!0<5)
         #REM NOT ENOUGH PARAMETERS IN ENTRYFIND STATEMENT
      #ENDIF
      #IF (!0=5)
         entry !1 !2
         if !2 ne "" begin
            findfirst !3 !4 for !2
            [not found] begin
               error !5
            end
         end
      #ENDIF
      #IF (!0=6)
         entry !1 !2 !3
         if !2 ne "" begin
            findfirst !4 !5 for !2
            [not found] begin
               error !6
            end
         end
      #ENDIF
   end
end
#ENDCOMMAND

//      *********************************
//              MONPAD
//      *********************************

//#COMMAND MONPAD
//begin
//   length !1 to _int
//   pos "." in !1 to _int2
//   move (_int - _int2) to _charindex
//   indicate _ind as _int2 eq 0
//   [_ind] append !1 ".00"
//   [not _ind] begin
//      while _charindex lt 2
//         append !1 "0"
//         length !1 to _int
//         pos "." in !1 to _int2
//         move (_int - _int2) to _charindex
//      end
//   end
//end
//#ENDCOMMAND

//      *********************************
//              CPAGE
//      *********************************

#COMMAND CPAGE
begin
   move "" to _str1
   move "[F2]-Find [PgUp]-Prev [PgDn]-Next [F8]-Clear [ESC]-Exit " to _str2
   #IFSAME !2 READONLY
      append _str2 "[F3]-Done"
      #IF (!0=3)
         trim !3 to _str1
      #ENDIF
   #ELSE
      append _str2 "[F3]-Save [F4]-Delete"
      #IF (!0=2)
         trim !2 to _str1
      #ENDIF
   #ENDIF

   move !1.LINES to _int
   #IFSAME !2 COLORS
      page !1 !2 !3 !4
   #ENDIF
   #IFSAME !3 COLORS
      page !1 !3 !4 !5
   #ENDIF
  
   length _str2 to _asc
   calc ((80 - _asc) /2) to _int2
   gotoxy _int _int2
   show _str2

   if _str1 ne "" begin
      increment _int
      length _str1 to _asc
      calc ((80 - _asc) /2) to _int2
      gotoxy _int _int2
      show _str1
   end

end
#ENDCOMMAND

//      *********************************
//              FOOT
//      *********************************

#COMMAND FOOT
begin
   move !1.LINES to _int
   clearxy _int 0
   move !2 to _str2
   length _str2 to _asc
   calc ((80 - _asc) /2) to _int2
   gotoxy _int _int2
   show _str2
end
#ENDCOMMAND

//      *********************************
//              MAKESTR
//      *********************************

#COMMAND MAKESTR
begin
   move "" to !4
   for _int from 1 to !1
      append !4 !2
   loop
end
#ENDCOMMAND

//      *********************************
//              PURGE
//      *********************************

#COMMAND PURGE
begin
   length !1 to _int
   for _int2 from 1 to _int
      mid !1 to _str1 1 _int2
      replaceall _str1 in !3 with ""
   loop
end
#ENDCOMMAND

//      *********************************
//              CENTER
//      *********************************

#COMMAND CENTER // STRING ON WIDTH TO VARIABLE
begin
   length !1 to _int2
   calc ((!3 - _int2) / 2) to _int2
   makestr _int2 " " to  _str2
   append _str2 !1
   move _str2 to !5
end
#ENDCOMMAND

//      *********************************
//              TIMESTR
//      *********************************

#COMMAND TIMESTR // HOURS MINUTES SECONDS TO STR
begin

   trim !1 to _str7
   trim !2 to _str8
   trim !3 to _str9

   lpad _str7 to 2 with "0"
   lpad _str8 to 2 with "0"
   lpad _str9 to 2 with "0"

   move "" to !5
   append !5 _str7 ":" _str8 ":" _str9

end
#ENDCOMMAND

//      *********************************
//              PACCEPT
//      *********************************

#COMMAND PACCEPT //(PROMPTED ACCEPT)
begin
   MESSAGE !1
   accept !2 !3 !4
   CLEARMESSAGE
end
#ENDCOMMAND

//      *********************************
//              MINPUT
//      *********************************

#COMMAND MINPUT  //(PROMPTED INPUT AT MESSAGELINE)
begin
   #IF (!0<3)
      message !1
      input !2
   #ELSE
      #IFTYPE !2 "S"
         message !1
         input !2 !3
      #ELSE
         repeat
            message !1
            input !2
            RANGE? !3 !2 !4
            [NOT INCYESNO] ERROR 17
         until [INCYESNO]
      #ENDIF
   #ENDIF
   clearmessage
end
#ENDCOMMAND

//      *********************************
//              SCANENTER
//      0 display, 1 accept, 2 save, 3 first time, 4 return from jump
//      *********************************

#COMMAND SCANENTER // file element page lines keyval functions keyprompt func1 func2

   indicator _scrambled!J _forward!j _records!j _adding!j _displayed!j
   integer _curline!j _width!j
   integer _lines!j _svwndx!j
   number _savrec!j _anchor!j

   !A [] $82 |CI9999 |VI33
   move !4 to _lines!j
   scaninit!j:
   indicate _displayed!j false
   indicate _scrambled!j false
   indicate _records!j false
   indicate _adding!j false
   indicate _forward!j true
   gosub makefoot!j
   clear !1
   move 3 to _readmode
   move 0 to _curline!j
   move 0 to _anchor!j
   move 0 to windowindex
   scanbegin!j:

      calc (_curline!j * _width!j) to windowindex

      move windowindex to _base

      if _readmode eq 3 begin
         move 0 to _width!j
         goto noskip!j1
      end

#SET H$ 0
#ENDCOMMAND

//      *********************************
//              SCANENTRY
//      *********************************

#COMMAND SCANENTRY // item window (options U upper, D display only, R1,2)

   noskip!j!H:

   if _readmode eq 3 begin
      increment _width!j
      goto entrybegin!j!h
   end

   if _readmode eq 0 begin
      print !1 to !2&
      indicate _displayed!j true
      goto entrybegin!j!h
   end

   if _readmode eq 2 begin
      #IF (!0>2)
         ifnot "N" in !3 move !2& to !1
      #ELSE
         move !2& to !1
      #ENDIF
   end

   if _readmode eq 1 begin
      #IF (!0>2)
         ifnot "D" in !3 begin
      #ELSE
         begin
      #ENDIF
         accept !2&
         gosub keyscheck!j
         #IFTYPE !2 S
            #IF (!0>2)
               if "U" in !3 uppercase !2&
            #ENDIF
         #ENDIF
      end
      #IF (!0>2)
         if "D" in !3 print !1 to !2&
      #ELSE
      #ENDIF
   end

entrybegin!j!h:

#IF (!h<2)
   if _readmode ne 1 begin
      [_forward!j] if _readmode ne 3 increment _curline!j
      [not _forward!j] if _readmode ne 3 calc (_curline!j - 1) to _curline!j
   end
   goto skclr!j
   clears!j:
      move windowindex to _svwndx!j
      calc (((_lines!j) * _width!j) - 1) to windowindex
      clearform !2 THRU !2&
      move _svwndx!j to windowindex
   return
   skclr!j:
#ENDIF

#ENDCOMMAND

//      *********************************
//              ENDSCANENTER
//      *********************************

#COMMAND ENDSCANENTER //file element page lines keyval functions keyprompt func1 func2

   move _width!j to _totwidth

   if _readmode eq 1 begin
      move 2 to _readmode
      ifnot "N" IN !6 reread
         goto scanbegin!j
   end

   if _readmode eq 2 begin
         ifnot "N" IN !6 begin
            if "R" in !6 save !1
            ifnot "R" in !6 saverecord !1
            unlock
         end
      move 1 to _readmode
   end

   [_adding!j] begin
      indicate _adding!j false
      goto scaninit!j
   end

   scanend!j:
   gosub scanewline!j
   goto scanbegin!j

   keyscheck!j:
        indicate _special group any [key.user key.user2]
        #IF (!0>7)
        [_special] begin
           move windowindex to _svwndx!j
           move !1.recnum to _savrec!j
           !A [] $82 |CI0 |VI33
           [key.user] gosub !8
           indicate key.user false
           #IF (!0>8)
             [key.user2] gosub !9
             indicate key.user2 false
           #ELSE
             [key.user2] gosub !8
             indicate key.user2 false
           #ENDIF
	   indicate key.escape false
           !A [] $82 |CI9999 |VI33
           [_scrambled!j] return scaninit!j
           page !3
           gosub makefoot!j
           foot !3 _menstr
           clear !1
           move _savrec!j to !1.recnum
           find eq !1
           move _svwndx!j to windowindex
        end
        #ENDIF
        [key.escape] return endscanent!j
        [key.find] return endscanent!j
        [key.field] begin
           indicate _forward!j false
           calc (_curline!j - 1) to _curline!j
           return scanend!j
        end
        [key.down] begin
           indicate _forward!j true
           move 2 to _readmode
           ifnot "N" IN !6 reread
           return scanbegin!j
        end
        [key.next] goto key.next.proc!j
        [key.previous] goto key.prev.proc!j
        [key.clear] if "A" in !6 goto key.save.proc!j
        [key.delete] if "X" in !6 goto key.del.proc!j
        [key.save] begin
           move 2 to _readmode
           ifnot "N" IN !6 reread
           return scanbegin!j
        end
        [key.return] begin
           indicate _forward!j true
        end
     return

   scanewline!j:

      #IFSAME !5 ALL
         [_forward!j] findnext !1 !2
         [not _forward!j] findprior !1 !2
      #ELSE

           [_forward!j] begin
              if status !1 begin
                 findnext !1 !2 for !5
              end
              else begin
                 findfirst !1 !2 for !5
              end
           end

           [not _forward!j] begin
              findprior !1 !2 for !5
           end

      #ENDIF

      [found] begin
         indicate _records!j true
         [_forward!j] if _curline!j ge _lines!j goto scanewpage!j
         [not _forward!j] if _curline!j lt 0 goto scanewpage!j
      end
      if _readmode eq 3 begin
         gosub clears!j
         page !3
         foot !3 _menstr
         move !1.recnum to _anchor!j
         move 0 to _readmode
      end
      [not found] begin
         [not _displayed!j] begin
            foot !3 "NO RECORDS - [ESC] to Exit or Enter Record Now"
            ifnot "A" in !6 begin
                wait
                return endscanent!j
            end
            if "A" in !6 goto key.save.proc!j
         end
         if _readmode eq 1 begin
            if "1" in !6 return endscanent!j
            return scaninit!j
         end
#REM     [not _forward!j] if _curline!j lt 0 goto scanewpage!j
         [not _forward!j] begin
            return scaninit!j
         end
         [_forward!j] if _readmode ne 1 goto scanewpage!j
      end
   return

   scanewpage!j:
      if "D" IN !6 return endscanent!j
      if _readmode eq 1 begin
         gosub clears!j
         move !1.recnum to _anchor!j
         move 0 to _readmode
      end
      else begin
         clear !1
         move _anchor!j to !1.recnum
         find eq !1 by recnum
         move 1 to _readmode
      end
      [_forward!j] calc 0 to _curline!j
      [not _forward!j] calc (_lines!j - 1) to _curline!j
   return

   key.prev.proc!j:
      clear !1
      move _anchor!j to !1.recnum
      find eq !1 by recnum
      for _int from 1 to (_lines!j - 1)
      #IFSAME !5 ALL
         findprior !1 !2
      #ELSE
         findprior !1 !2 for !5
      #ENDIF
      [found] loop
      [not found] clear !1
      move !1.recnum to _anchor!j
      move 3 to _readmode
      move 0 to _curline!j
      indicate _forward!j true
   return scanend!j

   key.next.proc!j:
      clear !1
      move _anchor!j to !1.recnum
      find eq !1 by recnum
      for _int from 1 to (_lines!j - 1)
      #IFSAME !5 ALL
         findnext !1 !2
      #ELSE
         findnext !1 !2 for !5
      #ENDIF
      [found] loop
      [not found] clear !1
      move !1.recnum to _anchor!j
      move 3 to _readmode
      move 0 to _curline!j
      indicate _forward!j true
   return scanend!j

   key.save.proc!j:
      if "N" in !6 return
      clear !1
      gosub clears!j
      move 1 to _readmode
      indicate _adding!j true
      move 0 to _curline!j
   return scanbegin!j

   key.del.proc!j:
      YESNO "Delete Line - Are You Sure"
      [not incyesno] return
      delete !1
      clear !1
      move _anchor!j to !1.recnum
      find eq !1 by recnum
      [not found] clear !1
      move !1.recnum to _anchor!j
      move 3 to _readmode
      move 0 to _curline!j
      gosub clears!j
   return scanend!j

   makefoot!j:
      move "[][][PgDn][PgUp][ESC]-Done " to _menstr
      ifnot "N" in !6 append _menstr "[F3]-Save "
      if "X" in !6 append _menstr "[F4]-Del "
      if "A" in !6 append _menstr "[F8]-Add "
      #IF (!0>6)
         append _menstr !7
      #ENDIF
   return

   endscanent!j:
   if "B" in !6 gosub clears!j
   clearmessage
   !A [] $82 |CI0 |VI33
   indicate key.escape false

#ENDCOMMAND

//      *********************************
//              BREAK
//      *********************************

#COMMAND BREAK
   goto scanend!j
#ENDCOMMAND

//      ************************************
//      RPTCHECK //use just before reportend
//      ************************************

#COMMAND RPTCHECK

return

rpt.keypress:
  yesno "EXIT PROGRAM ARE YOU SURE"
  #IFDEF RPT.TOTAL
     [incyesno] return end.of.report
  #ELSE
     [incyesno] begin
        TERMINATE
     end
  #ENDIF
return rpt.loop

#ENDCOMMAND

//      *********************************
//              PARSEDATE
//      *********************************

#COMMAND PARSEDATE //DATE TO YEARS MONTHS DAYS
begin
   move !1 to _str2
   trim _str2 to _str2
   append _str2 "/"
   parse _str2 by "/" to _str3 _str2
   #IF (!0 > 3)
      move _str3 to !4
   #ENDIF
   parse _str2 by "/" to _str3 _str2
   #IF (!0 > 4)
      move _str3 to !5
   #ENDIF
   parse _str2 by "/" to !3
end
#ENDCOMMAND

//      *********************************
//              CALCAGE
//      *********************************

#COMMAND CALCAGE //BDAY TODAY TO YEARS MONTHS DAYS
begin
   calc (!2 - !1) to _num
   move _num to _date
   parsedate _date to !4 !5 !6
end
#ENDCOMMAND

//      *********************************
//              RIGHTJUSTIFY
//      *********************************

#COMMAND RIGHTJUSTIFY //VALUE "IN" VARIABLE "WIDTH" WIDTH
begin
   trim !1 to _str1
   lpad _str1 to !5 with " "
   move _str1 to !3
end
#ENDCOMMAND

//      *********************************
//      FSYSDATE (This is to fix the bug in 2.3 
//      where the day is off by one
//      *********************************

#COMMAND FSYSDATE //date hour minute second
begin
   sysdate _date _int _int2 _int3
   calc (_date - 1) to !1
   #IF (!0>1)
      move _int to !2
   #ENDIF
   #IF (!0>2)
      move _int2 to !3
   #ENDIF
   #IF (!0>3)
      move _int3 to !4
   #ENDIF
end
#ENDCOMMAND

//      *********************************
//              TERMINATE
//      *********************************

#COMMAND TERMINATE
begin
   clearscreen
   abort
end
#ENDCOMMAND

//      *********************************
//              MONTH
//      *********************************

#COMMAND MONTHOFDATE //DATE TO STRING
begin
   parsedate !1 TO _int _int2
   if _int2 eq 1 move "january" to !3
   if _int2 eq 2 move "february" to !3
   if _int2 eq 3 move "march" to !3
   if _int2 eq 4 move "april" to !3
   if _int2 eq 5 move "may" to !3
   if _int2 eq 6 move "june" to !3
   if _int2 eq 7 move "july" to !3
   if _int2 eq 8 move "august" to !3
   if _int2 eq 9 move "september" to !3
   if _int2 eq 10 move "october" to !3
   if _int2 eq 11 move "november" to !3
   if _int2 eq 12 move "december" to !3
end
#ENDCOMMAND

#COMMAND DAYOFWEEK //DATE TO STRING
begin
   calc (!1 - ((!1/7)*7)) to _int
   if _int eq 0 move "sunday" to !3
   if _int eq 1 move "monday" to !3
   if _int eq 2 move "tuesday" to !3
   if _int eq 3 move "wednesday" to !3
   if _int eq 4 move "thursday" to !3
   if _int eq 5 move "friday" to !3
   if _int eq 6 move "saturday" to !3
end
#ENDCOMMAND

#COMMAND DOSHADOW %#USGLR %#USGLR %#USGLR %#USGLR
   #IFDEF XCOORD
   #ELSE
      INTEGER XCOORD
   #ENDIF
   #IFDEF YCOORD
   #ELSE
      INTEGER YCOORD
  #ENDIF
  #IFDEF HIGHT
  #ELSE
     INTEGER HIGHT
  #ENDIF
  #IFDEF WIDTH
  #ELSE
     INTEGER WIDTH
  #ENDIF
  MOVE !1 TO XCOORD
  MOVE !2 TO YCOORD
  MOVE !3 TO HIGHT
  MOVE !4 TO WIDTH
  #IFDEF POSITION
  #ELSE
     INTEGER POSITION
  #ENDIF
  GOSUB DO_SHADOW
 #IFDEF DO_SHADOW
 #ELSE
   GOTO ENDOFSHADOW

DO_SHADOW:
  MOVE (YCOORD + WIDTH) TO YCOORD
  SCREENMODE 3
  FOR POSITION FROM 1 TO HIGHT
    INCREMENT XCOORD
    GOTOXY XCOORD YCOORD
    SHOW " "
 LOOP
 FOR POSITION FROM 2 TO WIDTH
   MOVE  (YCOORD - 1 ) TO YCOORD
   GOTOXY XCOORD YCOORD
   SHOW " "
 LOOP
 SCREENMODE 63
RETURN
ENDOFSHADOW:
  #ENDIF
#ENDCOMMAND
//      *********************************
//              END OF WALTMACS.FRM
//      *********************************
