/MENUFRM                                                  
________________________________________                             __________
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
                      ______________________________                          
                      ______________________________                          
                                                                              
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ

                      _ ______________________________
                      _ ______________________________
                      _ ______________________________
                      _ ______________________________
                      _ ______________________________
                      _ ______________________________
                      _ ______________________________
                      _ ______________________________
                      _ ______________________________

                     Please enter your selection -> __
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
 ____________________________________________________ ___ ___ ____            
 ____________________________________________________ _______________________ 
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
  Date: __/__/__         ______________________________          Time: _.:__ 
/HELPSCREEN HELP
DataFlex Menu System                                                       HELP
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
                                                                              
                                                                              
      To select an option from a menu:                                        
                                                                              
            1)  Press the number next to the option you want.                 
                OR                                                            
                Press <UP or DOWN ARROW> to select the line                   
                containing the menu option that you want.                     
                                                                              
                <SPACE BAR> has the same effect as <DOWN ARROW>.              
                                                                              
            2)  When the correct menu option is selected,                     
                press <RETURN> to execute.                                    
                                                                              
      To exit a menu and return to a previous one, press the ESCAPE key.      
                                                                              
                    Memory Available: _____. Bytes                            
                                                                              
                                                                              
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
                Press any key to return to the menu...                        
/EXTRA                                                                        
___________________________________________________                           
/USERSCRN
DataFlex Menu System                                            User Name Entry
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              
                          User Number  _.                                     
                             Password                                         
                                                                              
                                                                              


                                                                              
      Enter  0 for User Number to abort entry into DataFlex system
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              
                                                                              
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
                      Enter User Name and Password                            
/MASK
DataFlex Menu System                   ________________________________________
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
/QUITSCR
ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
บ    Are you sure you wish to abort the DataFlex System.?.... (Y/N)...        บ
ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
/*                                                                            

//

#IFDEF USER_NUMB
#ELSE
   INTEGER   USER_NUMB                                                           
#ENDIF

NAME      MENUFRM    REGNAME    REGNUMBER  HEAD1      HEAD2      FIRST1     
NAME      FIRST2

AUTOPAGE MENUFRM 23

NAME      OPTION     QUESTIONA  AREA_CODE  EXCHANGE   PNUMBER    QUESTIONB  
NAME      RESPONSE

DATE      DATE1

INTEGER   COUNT      
INTEGER   ARGPOS     
INTEGER   ITEMP      
INTEGER   QNUM       
INTEGER   OPTN       
INTEGER   CHK       
INTEGER   HR         
INTEGER   MN         
INTEGER   NUM        
INTEGER   CNTR_LNGT  
INTEGER   T1         
INTEGER   USER_COUNT 

STRING    ACTION     
STRING    STEMP 255  
STRING    XTEMP      
STRING    CHR 1      
STRING    BS 1       
STRING    PRGNAME 20 
STRING    ITEM       
STRING    USER_PASS  
STRING    CNTR_USER  
STRING    CNTR_STRG  
STRING    MINUTES    
STRING    VALID_ITM  
STRING    PROMPT     
STRING    ANSW 1

NUMBER    RESP_COUNT

INDICATOR THREE      
INDICATOR LOCL       
INDICATOR USE_PASS   

PAGE SET QUITSCR AT 20 0

OPEN SYSFILE

INDICATE USE_PASS AS SYSFILE.PASSWORD EQ 'Y'

INDICATE HELPKEY FALSE
FORMAT MENUFRM.29 {FILL="0"}
CHARACTER 8 TO BS
REGISTRATION REGNAME  REGNUMBER

STRING REGI_TEMP$  
STRING REGI_NAME$  
STRING RJ$1  
STRING RJ$2  
STRING REGI$TER
NUMBER S$ERL_NUMB

REGISTRATION REGI_NAME$ S$ERL_NUMB
TRIM REGI_NAME$ TO REGI_NAME$
MOVE '' TO REGI_TEMP$
MOVE '                              ' TO REGI_TEMP$
APPEND REGI_TEMP$ REGI_NAME$
RIGHT REGI_TEMP$ TO MASK.1 40

[MULTIUSER] DESPOOL

        OPEN MENU
        OPEN USERX

[USE_PASS] IF USER_NUMB GT 0 BEGIN
           CLEAR USERX
           MOVE USER_NUMB TO USERX.USER_NUMB
           FIND EQ USERX BY INDEX.1
[FINDERR]  GOSUB USER_SCRN
        END
[USE_PASS] IF USER_NUMB EQ 0 GOSUB USER_SCRN
        IF SYSFILE.SYSTEM_DATE EQ 'Y' BEGIN
           SYSDATE DATE1 HR MN
           MOVE DATE1 TO SYSFILE.TODAY
           SAVERECORD SYSFILE
        END
        IF SYSFILE.SYSTEM_DATE NE 'Y' BEGIN
           IF NEXT_MENU LE 0 BEGIN
              BLANKFORM HEAD1 THRU MENUFRM.33
              MOVE SYSFILE.TODAY TO MENUFRM.30
              PAGE MENUFRM
              MOVE 'Please enter Todays Date before continuing' TO QUESTIONA
              MOVE 'Press RETURN to accept Date as Displayed' TO QUESTIONB
              ACCEPT MENUFRM.30
              MOVE MENUFRM.30 TO DATE1
              BLANKFORM QUESTIONA THRU MENUFRM.32
              MOVE DATE1 TO SYSFILE.TODAY
              SAVERECORD SYSFILE
           END
           IF NEXT_MENU GT 0 MOVE SYSFILE.TODAY TO MENUFRM.30
        END
        IF NEXT_MENU LE 0 MOVE 1 TO NEXT_MENU
        IF HR GT 12 CALCULATE (HR-12) TO HR
        MOVE ( MN - 1 ) TO T1         // MULTIUSER INACTIVE TIME CHECK
        IF T1 LT 0 MOVE 0 TO T1

// remove buffered characters
        REPEAT
            KEYCHECK LOOP

NEWMENU:
        BLANKFORM HEAD1 THRU RESPONSE
        BLANKFORM MENUFRM.30 THRU MENUFRM.33
        IF NEXT_MENU LE 0 MOVE 1 TO NEXT_MENU
        CLEAR MENU
        MOVE NEXT_MENU TO MENU.RECNUM
        FIND EQ MENU.RECNUM
[FINDERR]BEGIN
            MOVE 1 TO NEXT_MENU
            ERROR 25
            GOTO NEWMENU
        END
        MOVE MENU.RECNUM TO NEXT_MENU
        AUTOPAGE MENUFRM 3
        DISPLAY MENU.HEADER1
        DISPLAY MENU.HEADER2
        INDICATE DOMORE TRUE

#COMMAND XDISP
         MOVE !2 TO ITEM
         INDICATE DOMORE AS MENU.!1 GT ''
[NOT DOMORE] MOVE '' TO ITEM
         INDICATE USE_PWRD TRUE
         IF SYSFILE.PASSWORD EQ 'Y' INDICATE USE_PWRD AS USERX.ACCS_LEVL GE MENU.!3
[USE_PWRD] DISPLAY ITEM
[USE_PWRD] DISPLAY MENU.!1
[USE_PWRD] APPEND VALID_ITM ITEM
#ENDCOMMAND

REDISPLAY:
        PAGE MENUFRM
        SCREENMODE 2
          MOVE '' TO VALID_ITM
          MOVE REGNAME TO REGNAME
          MOVE REGNUMBER TO REGNUMBER
          XDISP PR1 '1' PW1
          XDISP PR2 '2' PW2
          XDISP PR3 '3' PW3
          XDISP PR4 '4' PW4
          XDISP PR5 '5' PW5
          XDISP PR6 '6' PW6
          XDISP PR7 '7' PW7
          XDISP PR8 '8' PW8
          XDISP PR9 '9' PW9
        SCREENMODE 2
        MOVE ' ' TO RESPONSE
        SCREENMODE 1
        MOVE 1 TO OPTN
        INDICATE ZERO TRUE
        MOVE 'Type the Number you wish to do then Press <RETURN>' TO QUESTIONA
        MOVE DATE1 TO MENUFRM.30
[USE_PASS] BEGIN
           MOVE '               ' TO CNTR_STRG
           TRIM USERX.USER_NAME TO CNTR_USER
           LENGTH CNTR_USER TO CNTR_LNGT
           APPEND CNTR_STRG CNTR_USER
           RIGHT CNTR_STRG TO MENUFRM.31 ((15 - (CNTR_LNGT / 2)) + CNTR_LNGT)
        END
        IF SYSFILE.SYSTEM_DATE EQ 'Y' BEGIN
           MOVE HR TO MENUFRM.32
           MOVE '0' TO MINUTES
           APPEND MINUTES MN
           RIGHT MINUTES TO MENUFRM.33 2
        END

GETANS:

// display optn in high intensity

        SCREENMODE 2
[NOT ZERO] MOVE FIRST2& TO FIRST2&
        SCREENMODE 1
[ZERO]  MOVE 'Press <ESCAPE> to return to previous menu' TO QUESTIONB
        MOVE (OPTN+OPTN-2) TO WINDOWINDEX
        INDICATE ZERO AS OPTN EQ 0
[NOT ZERO] IF FIRST2& EQ '' BEGIN
            MOVE 0 TO OPTN
            INDICATE ZERO TRUE
        END
[NOT ZERO] MOVE FIRST2& TO FIRST2&
[ZERO]  MOVE 'Press <RETURN> to exit to a previous menu' TO QUESTIONB

        MOVE OPTN TO OPTION
        APPEND OPTION BS
        MOVE 0 TO CHK
        REPEAT
          INCREMENT CHK
          IF CHK GE 2000 BEGIN
                          IF SYSFILE.SYSTEM_DATE EQ 'Y' BEGIN
                             SYSDATE DATE1 HR MN
[MULTIUSER]                  IF MN EQ T1 BEGIN     // INACTIVE 59 MINUTE TIMEOUT
                                CLEARSCREEN
                                RUNPROGRAM SYSFILE.EXIT_PROG
                             END
                             PRINT DATE1 TO MENUFRM.30
[USE_PASS]                   BEGIN
                                MOVE '               ' TO CNTR_STRG
                                TRIM USERX.USER_NAME TO CNTR_USER
                                LENGTH CNTR_USER TO CNTR_LNGT
                                APPEND CNTR_STRG CNTR_USER
                                RIGHT CNTR_STRG TO MENUFRM.31 ((15 - (CNTR_LNGT / 2)) + CNTR_LNGT)
                             END
                             IF HR GT 12 CALCULATE (HR-12) TO HR
                             MOVE HR TO MENUFRM.32
                             MOVE '0' TO MINUTES
                             APPEND MINUTES MN
                             RIGHT MINUTES TO MENUFRM.33 2
                          END
                          MOVE OPTION TO OPTION
                          MOVE 0 TO CHK
                          END
//          INKEY$ CHR          // USE FOR SIXTEEN BIT
          INKEY CHR           // USE FOR 8 BIT
          ASCII CHR TO NUM
        UNTIL NUM GT 0
        IF CHR IN '0123456789' BEGIN
            MOVE CHR TO OPTN
            GOTO GETANS
        END

[NOT KEY.DOWN]INDICATE KEY.DOWN AS CHR EQ ' '
[KEY.UP] INDICATE KEY.DOWN FALSE
[NOT KEY.RETURN][NOT KEY.ESCAPE] BEGIN
           INDICATE OKTOMOVE AS OPTN GE 1
           INDICATE OKTOMOVE GROUP ALL [OKTOMOVE] AND ANY [KEY.FIELD KEY.UP]
[OKTOMOVE] BEGIN
KEY_UP_LOOP:
             MOVE (OPTN-1) TO OPTN
             IF OPTN EQ 0 MOVE 9 TO OPTN
             IF NOT OPTN IN VALID_ITM GOTO KEY_UP_LOOP
          END
[KEY.DOWN] BEGIN
KEY_DOWN_LOOP:
             IF OPTN EQ 9 MOVE 0 TO OPTN
             IF OPTN LT 9 MOVE (OPTN+1) TO OPTN
             IF NOT OPTN IN VALID_ITM GOTO KEY_DOWN_LOOP
          END 
       GOTO GETANS
       END

[KEY.ESCAPE] MOVE 0 TO OPTN

        IF OPTN LE 0 BEGIN
            MOVE MENU.DEFAULT TO NEXT_MENU
            GOTO NEWMENU
        END

        MOVE (OPTN-1*3) TO FIELDINDEX
        MOVE MENU.AC1& TO EXTRA.1
        MOVE EXTRA.1 TO ACTION
        IF ACTION EQ '' GOTO GETANS

[USE_PASS] IF MENU.PW1& GT '' BEGIN
            BLANKFORM QUESTIONA
            IF USERX.ACCS_LEVL LT MENU.PW1& BEGIN
                BLANKFORM OPTION THRU RESPONSE
                DISPLAY 'Invalid Access Level' TO QUESTIONB
                GOTO GETANS
            END
            BLANKFORM QUESTIONB THRU RESPONSE
        END

// process the action line

SUBST:  POS '$' IN ACTION TO ARGPOS
        IF ARGPOS EQ 0 GOTO DOLINE
        RIGHT ACTION TO STEMP (STRLEN-2)

// display the questions
        MOVE ARGPOS TO ITEMP
        INCREMENT ITEMP
        MID ACTION TO QNUM 1 ITEMP
        IF QNUM LE 0 GOTO NEWMENU
        IF QNUM GT 6 GOTO NEWMENU
        MOVE (QNUM-1*2) TO FIELDINDEX
        MOVE MENU.QA1& TO QUESTIONA
        MOVE MENU.QB1& TO QUESTIONB

// process response to questions
        CLEARFORM RESPONSE
        ACCEPT RESPONSE
        UPPERCASE RESPONSE
        LEFT ACTION TO ACTION (ARGPOS-1)
        APPEND ACTION RESPONSE STEMP
        GOTO SUBST

DOLINE:
        POS ' ' IN ACTION TO ARGPOS
        INDICATE ARGS AS ARGPOS GT 0
[ARGS]  RIGHT ACTION TO STEMP (STRLEN-1)
[NOT ARGS] MOVE '' TO STEMP
[ARGS]  LEFT ACTION TO PRGNAME (ARGPOS-1)
[NOT ARGS] MOVE ACTION TO PRGNAME

DO2:    UPPERCASE PRGNAME
        IF PRGNAME EQ 'MENU' BEGIN
            MOVE STEMP TO NEXT_MENU
            GOTO NEWMENU
        END
        IF PRGNAME EQ 'FLEX' CHAIN STEMP
        IF PRGNAME EQ 'CHAIN' BEGIN
           PAGE MASK
           GOTOXY 12 24
           SHOW 'Now Loading Program Selected' 
           GOTOXY (SCREENEND - 1) 0
           CHAIN STEMP
        END
        IF PRGNAME EQ 'SYSTEM' BEGIN
            CLEARSCREEN
            SYSTEM
        END
        IF PRGNAME EQ 'RESTART' BEGIN
           MOVE 0 TO NEXT_MENU
[USE_PASS] GOTO USER_SCRN
           GOTO NEWMENU
        END
        IF PRGNAME EQ 'ERASEFILE' BEGIN
            ERASEFILE STEMP
            GOTO NEWMENU
        END
        IF PRGNAME EQ 'TYPE' BEGIN
            IF STEMP LT '.z' GOTO NEWMENU
            CLEARSCREEN
            DIRECT_INPUT STEMP
[SEQEOF]    SHOWLN STEMP ' NOT FOUND!'
[NOT SEQEOF]REPEAT
               READLN STEMP
              SHOWLN STEMP
               KEYCHECK GOSUB WAITKEY
[NOT SEQEOF]LOOP
            CLOSE_INPUT
            GOTO ENDKEY
        END

        IF PRGNAME EQ 'RENAMEFILE' BEGIN
            GOSUB SPLIT
[NOT THREE] GOTO NEWMENU
            RENAMEFILE STEMP TO XTEMP
            GOTO NEWMENU
        END

        IF PRGNAME EQ 'COPYFILE' BEGIN
            GOSUB SPLIT
[NOT THREE] GOTO NEWMENU
            CLEARSCREEN
            COPYFILE STEMP TO XTEMP
            GOTO ENDKEY
        END

        IF PRGNAME EQ 'DIRECTORY' BEGIN
            CLEARSCREEN
            DIRECTORY STEMP
            GOTO ENDKEY
        END
    // XCHANGE will run a program on another disk drive after a disk change.
        IF PRGNAME EQ 'XCHANGE' BEGIN

            MOVE 'Please load the development disk' TO QUESTIONA
            MOVE 'in drive A: THEN press <RETURN>' TO QUESTIONB
            CLEARFORM RESPONSE
            GOSUB SPLIT
            RUN$ STEMP XTEMP
        END

    // Run a program and come back to flex
        IF PRGNAME EQ 'WAIT' BEGIN
            GOSUB SPLIT
            PAGE MASK
            GOTOXY 15 0
            RUNPROGRAM WAIT STEMP XTEMP
            GOTO ENDKEY
        END

   // run a named .COM or .CMD program
        CLEARSCREEN
        RUNPROGRAM PRGNAME STEMP
        SHOW ''
        GOTO ENDKEY  // in case of no file //

// wait for user input
ENDKEY:
        SHOWLN
        SHOW 'Please press <RETURN> to continue: '
        INPUT STEMP
        GOTO NEWMENU

// split the keyed input into 2 parts:  STEMP=program name
//                                      XTEMP=program argument
SPLIT:
        IF STEMP EQ '' RETURN NEWMENU
        POS ' ' IN STEMP TO ARGPOS
[FOUND] RIGHT STEMP TO XTEMP (STRLEN-1)
[FOUND] LEFT  STEMP TO STEMP (ARGPOS-1)
[NOT FOUND] MOVE '' TO XTEMP
        INDICATE THREE AS XTEMP GT ' '
        RETURN

WAITKEY:
        INKEY XTEMP
[KEY.ESCAPE] RETURN NEWMENU
        RETURN

USER_SCRN:                    //   ENTER USER NUMBER AND PASSWORD ROUTINE

        MOVE 0 TO USER_COUNT
        CLEARFORM USERSCRN
        PAGE USERSCRN

REDO_USER:

        MOVE 0 TO USER_NUMB
        IF USER_COUNT GT 2 BEGIN
           CLEARSCREEN
           RUNPROGRAM SYSFILE.EXIT_PROG
        END
        CLEARFORM USERSCRN
        MOVE 0 TO COUNT
        MOVE '' TO USER_PASS
        ACCEPT USERSCRN.1                  {REQUIRED}
         IF USERSCRN.1 LE (0) BEGIN
            PAGE QUITSCR
            INKEY ANSW
            UPPERCASE ANSW
            IF ANSW EQ 'Y' BEGIN
               CLEARFORM USERSCRN
               CLEAR MENU
               CLEAR USERX
               SYSTEM
            END
            
            PAGE USERSCRN
            GOTO REDO_USER
         END
          

        INCREMENT USER_COUNT
        CLEAR USERX
        MOVE USERSCRN.1 TO USERX.USER_NUMB
        FIND EQ USERX BY INDEX.1

        GOTOXY 8 40
        show "               "
        gotoxy 8 40
        REPEAT
           INKEY RESPONSE
[KEY.RETURN] GOTO USER_DONE
           SHOW '*'
           APPEND USER_PASS RESPONSE
        UNTIL COUNT EQ 15

USER_DONE:
        IF USER_PASS IN 'Qq' ABORT
        IF USERX.PASSWORD NE USER_PASS GOTO REDO_USER
        MOVE USERX.USER_NUMB TO USER_NUMB
        RETURN

KEYPROC KEY.HELP

[USE_PASS] IF USER_NUMB EQ 0 RETURN USER_SCRN

[HELPKEY] RETURN INSIDE
        INDICATE HELPKEY TRUE
        PAGE HELPSCREEN
        INKEY XTEMP
INSIDE:
        BLANKFORM FIRST1 THRU OPTION
        INDICATE HELPKEY FALSE
        RETURN REDISPLAY

