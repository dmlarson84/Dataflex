/SCRCHECKS                                                  CHECKS
อออออออ< Cash Disbursements >อออออออออออออออออออออออออออออออออออออออออออออออออ
                                               Sequence Number..{ ______.      
Bank Code..{ __ ______________________________ Current Balance..{ _______.__
                                               GL Account #.....{ ___. ___ __
Check Number...{ _____. Check Date.....{ __/__/__

Payee......{ _____________________________     Reference ..{ _______________

Check Amount...{ ______.__             Balance to Distribute...{ ______.__
ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
Distribution of Check:
 Account   District   Division     Account Description             Amount
 ฤฤฤฤฤฤฤ   ฤฤฤฤฤฤฤฤ   ฤฤฤฤฤฤฤฤ     ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ            ฤฤฤฤฤฤ
1. ___.      ___        __       _________________________         ______.__
2. ___.      ___        __       _________________________         ______.__
3. ___.      ___        __       _________________________         ______.__
4. ___.      ___        __       _________________________         ______.__
5. ___.      ___        __       _________________________         ______.__
6. ___.      ___        __       _________________________         ______.__
________________________________________  _
ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
<F1> Help Screen    <F9> Clear Distribution           <ESC> Return To Menu
                    <F9><F9> Clear Distribution and Check
 
/CHECKSHELP      RESIDENT
อออออออ< Cash Disbursements Help Screen >ออออออออออออออออออออออออออออออออออออออ

    The Sequence Number Will Be Assigned By The Computer
    
    Enter The Bank Code Of The Bank You Will Be Drawing On
       If a valid bank code is entered it will display and show the current
       bank balance

    Enter the date of the check

    Enter the check number if you enter 0 and press enter the computer
    will assign the next number

    Enter the payee's name and the amount of check

    The bottom of the screen will be where you will enter the accounts and
       amounts that the check will be distributed to





  Press any Key to return
ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ

/PRTCDHEAD      RESIDENT
=======< Check Register >=====================================================




/SCRLOAD     RESIDENT
ออออออ< General Ledger System >ออออออออออออออออออออออออออออออออออออออออออออออออ










                Standby Loading General ledger Main Menu









อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
/SCRCHK
ษอออออออ< Check Listing >อออออออออออออออออออออออออออออออออป
บ                                                         บ
บ  Check #      Payee                          Amount     บ
บ  _______   ______________________________  ______.__    บ
บ  _______   ______________________________  ______.__    บ
บ  _______   ______________________________  ______.__    บ
บ  _______   ______________________________  ______.__    บ
บ  _______   ______________________________  ______.__    บ
บ  _______   ______________________________  ______.__    บ
บ  _______   ______________________________  ______.__    บ
บ  _______   ______________________________  ______.__    บ
บ                                                         บ
ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
/SCRLED
ษออออออออออออออออออออออออออออออออป
บ Act#      Description          บ
บ ____ _________________________ บ
บ ____ _________________________ บ
บ ____ _________________________ บ
บ ____ _________________________ บ
บ ____ _________________________ บ
บ ____ _________________________ บ
บ ____ _________________________ บ
บ ____ _________________________ บ
บ ____ _________________________ บ
บ ____ _________________________ บ
บ ____ _________________________ บ
บ ____ _________________________ บ
วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ
บ   Select and Press <Return>    บ
ศออออออออออออออออออออออออออออออออผ
/notes

change made 03/14/91 by Gary Grooms
            Corrected scroll highlight routine to not highlight all 12 rows
            when first used with the f8 key (displaying the accounts in the
            distribution section)


/*
//----------------- Cannot Run Program From Command Line (DOS)
IF NEXT_MENU LE 0 ABORT
INTEGER USER_NUMB USER$_ACCESS   //must be first integers defined in program
STRING USER$ 30
MOVE '' TO USER$
MOVE 0 TO USER$_ACCESS
//------------------------------------------------------------
//-------------- Find Logged On User For Program Use
OPEN USERX
CLEAR USERX
MOVE USER_NUMB TO USERX.RECNUM
FIND EQ USERX BY RECNUM
MOVE USERX.USER_NAME TO USER$
MOVE USERX.ACCS_LEVL TO USER$_ACCESS
//----------------------------------------------------



//********< Declare System Variables >*****************************************

INTEGER COUNT TIMER ADAY AMONTH AYEAR SEQ LEDEX  ACTDEX

NUMBER ACCUM1

INDICATOR CHECK_SCR NEW_REC INBAL INBALOUT INVOID INCHECK INDIST
INDICATOR NOGL CHECK_FIELD

DATE  TODAY

STRING ANSW 1

//********< Set Page >*********************************************************

PAGE SET SCRCHK AT 8 12
PAGE SET SCRLED AT 8 20
//********< Open Files >*******************************************************
MULTI$ OPEN CHECKS DISTRIB REF RECON DIVISION SYSFILE
OPEN JOURNALS
OPEN LEDGER INDEX.1
OPEN BANK   INDEX.1

//********< Main Program >*****************************************************

FORMAT SCRCHECKS.18        {RANGE = .00,9999999.00}
FORMAT SCRCHECKS.23        {RANGE = .00,9999999.00}
FORMAT SCRCHECKS.28        {RANGE = .00,9999999.00}
FORMAT SCRCHECKS.33        {RANGE = .00,9999999.00}
FORMAT SCRCHECKS.43        {RANGE = .00,9999999.00}


CASH_DISB:
CLEAR CHECKS
INDICATE NEW_REC FALSE
SYSDATE TODAY
DATE_MACRO_INIT
DECOMPOSE_DATE TODAY TO ADAY AMONTH AYEAR
INDICATE CHECK_SCR TRUE
CLEARFORM SCRCHECKS.14 THRU SCRCHECKS.43
CLEARFORM SCRCHECKS.44 THRU SCRCHECKS.45
ENTERGROUP
TOP_CHK:
INDICATE INCHECK TRUE
INDICATE INDIST FALSE
AUTOPAGE SCRCHECKS
    ACCEPT SCRCHECKS.1  
      IF SCRCHECKS.1 NE 0 BEGIN
         clear checks
         MOVE SCRCHECKS.1 TO CHECKS.SEQ_NUM   
            FIND ge CHECKS BY INDEX.2
            [found] if checks.bank_code eq "HC" indicate found false
            [FINDERR] GOTO TOP_CHK
            [FOUND] RELATE CHECKS 
            [FOUND] ENTDISPLAY CHECKS
            [FOUND] GOSUB SHOW_DIST
         END
     IF SCRCHECKS.1 EQ 0 INDICATE NEW_REC TRUE
    ENTRY CHECKS.SEQ_NUM      SCRCHECKS.1      {NOENTER}
    IF STATUS CHECKS GOTO DO_CHECKS
    ENTRY BANK.CODE           SCRCHECKS.2      {CAPSLOCK,AUTOFIND,FINDREQ,RETAIN}
     ENTERMODE
    ENTRY BANK.NAME           SCRCHECKS.3      {NOENTER}
    ENTRY BANK.GL_ACCOUNT     SCRCHECKS.5      {NOENTER}
    ENTRY BANK.GL_DIST        SCRCHECKS.6      {NOENTER}
    ENTRY BANK.GL_DIV         SCRCHECKS.7      {NOENTER}
       MOVE BANK.CURRENT_BAL TO SCRCHECKS.4
       INDICATE NOGL AS BANK.GL_ACCOUNT EQ 0
       IF BANK.GL_ACCOUNT EQ 0  BEGIN
               SCREENMODE 112 ON
               MOVE 'Bank Code Not Conneted To Ledger ' TO SCRCHECKS.44
               SCREENMODE 1 ON
               GOTOXY 24 0
               SHOW ' Press any key to continue'
               INKEY ANSW
               CLEARXY 24 0
               CLEARFORM SCRCHECKS
               CLEAR CHECKS DISTRIB BANK LEDGER
               CHAIN 'LEDGER'
            END
DO_CHECKS:
    REPEAT
     INDICATE CHECK_FIELD TRUE
     ACCEPT SCRCHECKS.8
     IF SCRCHECKS.8 EQ 0  MOVE BANK.NEXT_CHECK_NUM TO SCRCHECKS.8

STANDBY:
    ENTRY CHECKS.CHECK_NUM    SCRCHECKS.8      {NOENTER} 
    INDICATE CHECK_FIELD FALSE
       IF SCRCHECKS.8 EQ 0 LOOP
     MOVE SCRCHECKS.8 TO CHECKS.CHECK_NUM
     MOVE SCRCHECKS.2 TO CHECKS.BANK_CODE
        FIND EQ CHECKS BY INDEX.1
        [FINDERR] INDICATE NEW_REC TRUE
        [FINDERR] CLEAR CHECKS
        [FINDERR] CLEARFORM SCRCHECKS.10 THRU SCRCHECKS.45

        [FOUND] BEGIN
                ENTDISPLAY CHECKS
                GOSUB SHOW_DIST
                INDICATE NEW_REC FALSE
                CLEAR CHECKS
                CLEAR DISTRIB
                GOTO DO_CHECKS
             END
   REPEAT
    ENTRY CHECKS.CK_DATE      SCRCHECKS.9      {RETAIN}
      IF SCRCHECKS.9 EQ '' LOOP
    ENTRY CHECKS.PAYEE        SCRCHECKS.10     {CAPSLOCK,REQUIRED}
    ENTRY CHECKS.REFERENCE    SCRCHECKS.11     {CAPSLOCK}
    MOVE TODAY TO CHECKS.JR_DATE
DO$:
    DISPLAY 0.00 TO SCRCHECKS.12
    ENTRY CHECKS.CHK_AMT      SCRCHECKS.12     {REQUIRED,RANGE = .00,9999999.00}
      IF SCRCHECKS.12 EQ 0.00 GOSUB VOID_CHK
      MOVE SCRCHECKS.12 TO SCRCHECKS.13
ENDGROUP

RESTART_DIST:
    MOVE 0 TO COUNT
REPEAT
    MOVE (COUNT * 5 ) TO WINDOWINDEX
DO_DIST:
      INDICATE INCHECK FALSE
      INDICATE INDIST TRUE 
    ACCEPT SCRCHECKS.14&
      INDICATE INBAL AS SCRCHECKS.13 EQ 0
    [INBAL] IF SCRCHECKS.14& EQ 0 GOTO SAVE_CHECKS
    [~ INBAL] IF SCRCHECKS.14& EQ 0 GOSUB OUTBAL
    MOVE REF.DISTRICT TO SCRCHECKS.15&
    IF BANK.GL_DIV NE '' MOVE BANK.GL_DIV TO SCRCHECKS.16
    IF COUNT GT 0 DISPLAY SCRCHECKS.16 TO SCRCHECKS.16&
    ACCEPT SCRCHECKS.16&
     CLEAR LEDGER
     MOVE SCRCHECKS.14& TO LEDGER.NUMBER
     MOVE SCRCHECKS.15& TO LEDGER.DISTRICT
     MOVE SCRCHECKS.16& TO LEDGER.DIVISION
       FIND EQ LEDGER.OVERLAP
         [FINDERR] BEGIN
             ERROR 127
             GOSUB TIME_DELAY
             CLEARWARNING
             BLANKFORM SCRCHECKS.14& THRU SCRCHECKS.18&
             GOTO DO_DIST
           END
      MOVE LEDGER.DESC TO SCRCHECKS.17&
      ACCEPT SCRCHECKS.18&               
         MOVE (SCRCHECKS.13 - SCRCHECKS.18&) TO SCRCHECKS.13
      INCREMENT COUNT
      UNTIL COUNT EQ 6




SAVE_CHECKS:
      [NEW_REC] BEGIN
             REREAD
             IF SCRCHECKS.8 GE BANK.NEXT_CHECK_NUM ;
             MOVE (SCRCHECKS.8 + 1) TO BANK.NEXT_CHECK_NUM

             MOVE REF.REF_NUM TO CHECKS.SEQ_NUM
             MOVE (REF.REF_NUM + 1 ) TO REF.REF_NUM

             MOVE 'X' TO CHECKS.UPDATE
             MOVE 'A' TO CHECKS.STATUS
             MOVE USERX.USER_NUMB TO CHECKS.OPER
             GOSUB CREATE_RECON
             GOSUB CREATE_JR_CREDIT
             SAVE REF BANK CHECKS

             MOVE (SCRCHECKS.4 - CHECKS.CHK_AMT ) TO SCRCHECKS.4     
             CLEAR DISTRIB
             MOVE 0 TO COUNT
                REPEAT
                  MOVE (COUNT * 5) TO WINDOWINDEX
                    IF SCRCHECKS.14& EQ 0 GOTO CLEAR_CHECKS
                      MOVE CHECKS.CK_DATE TO DISTRIB.JR_DATE
                      MOVE CHECKS.CHECK_NUM TO DISTRIB.CHECK_NUMB
                      MOVE CHECKS.BANK_CODE TO DISTRIB.BANK_CODE
                      MOVE COUNT TO DISTRIB.SEQUENCE
                      MOVE SCRCHECKS.14& TO DISTRIB.ACCOUNT
                      MOVE SCRCHECKS.15& TO DISTRIB.DISTRICT
                      MOVE SCRCHECKS.16& TO DISTRIB.DIVISION
                      MOVE SCRCHECKS.17& TO DISTRIB.DESCRIPTION
                      MOVE SCRCHECKS.18& TO DISTRIB.AMOUNT
                      GOSUB CREATE_JR_DEBIT
                      SAVE DISTRIB
                      CLEAR DISTRIB
                INCREMENT COUNT
                UNTIL COUNT EQ 6
              END

CLEAR_CHECKS:
      UNLOCK
      CLEARFORM SCRCHECKS.1
      CLEARFORM SCRCHECKS.8
      CLEARFORM SCRCHECKS.10 THRU SCRCHECKS.45
      CLEAR CHECKS
      CLEAR DISTRIB
      CLEAR LEDGER
      INDICATE NEW_REC FALSE
      GOTO DO_CHECKS










QUIT_CASH_DISB:
INDICATE CHECK_SCR FALSE
PAGE SCRLOAD
CHAIN "LEDGER"


//*******< Subroutines >*******************************************************

TIME_DELAY:
      MOVE 0 TO TIMER
      FOR TIMER FROM 0 TO 600
      LOOP
RETURN

SHOW_DIST:
      MOVE 0 TO COUNT
        REPEAT
         CLEAR DISTRIB
         MOVE CHECKS.CHECK_NUM TO DISTRIB.CHECK_NUMB
         MOVE CHECKS.BANK_CODE TO DISTRIB.BANK_CODE
         MOVE COUNT TO DISTRIB.SEQUENCE
           FIND EQ DISTRIB BY INDEX.6   
           [FOUND] BEGIN
              MOVE (COUNT * 5) TO WINDOWINDEX
              MOVE DISTRIB.ACCOUNT TO SCRCHECKS.14&
              MOVE DISTRIB.DISTRICT TO SCRCHECKS.15&
              MOVE DISTRIB.DIVISION TO SCRCHECKS.16&
              MOVE DISTRIB.DESCRIPTION TO SCRCHECKS.17&
              MOVE DISTRIB.AMOUNT TO SCRCHECKS.18&
           END
           [FOUND] INCREMENT COUNT
           [FOUND] LOOP
RETURN    

VOID_CHK:
      INDICATE INVOID TRUE
      CLEARXY 24 0
      GOTOXY 24 0
      SCREENMODE 112 ON
      SHOW " Will This Be A Voided Check ?                                                "
      SCREENMODE 1 ON
      GOTOXY 24 34
DO_VOID: 
      INKEY ANSW
      UPPERCASE ANSW
        IF ANSW IN 'Y' BEGIN
            CLEARXY 24 0
            DISPLAY "** VOID **" TO SCRCHECKS.11

            REREAD

            MOVE (SCRCHECKS.8 + 1) TO BANK.NEXT_CHECK_NUM
            MOVE REF.REF_NUM TO CHECKS.SEQ_NUM
            MOVE (REF.REF_NUM + 1 ) TO REF.REF_NUM
            SAVE REF
            SAVE BANK
            MOVE CHECKS.JR_DATE TO CHECKS.JR_DATE
            MOVE SCRCHECKS.2 TO CHECKS.BANK_CODE
            MOVE SCRCHECKS.8 TO CHECKS.CHECK_NUM
            MOVE SCRCHECKS.9 TO CHECKS.CK_DATE 
            MOVE SCRCHECKS.10 TO CHECKS.PAYEE
            MOVE SCRCHECKS.11 TO CHECKS.REFERENCE
            MOVE 0.00 TO CHECKS.CHK_AMT
            MOVE 'V' TO CHECKS.STATUS
            MOVE USERX.USER_NUMB TO CHECKS.OPER
            MOVE 'A' TO CHECKS.UPDATE
            SAVE CHECKS
            CLEAR DISTRIB
            MOVE CHECKS.JR_DATE TO DISTRIB.JR_DATE
            MOVE CHECKS.CHECK_NUM TO DISTRIB.CHECK_NUMB
            MOVE CHECKS.BANK_CODE TO DISTRIB.BANK_CODE
            MOVE 0 TO DISTRIB.SEQUENCE
            MOVE 9999 TO DISTRIB.ACCOUNT
            MOVE 'VV' TO DISTRIB.DISTRICT
            MOVE 'VV' TO DISTRIB.DIVISION
            MOVE '***VOID***' TO DISTRIB.DESCRIPTION
            MOVE (0.00) TO DISTRIB.AMOUNT
            SAVE DISTRIB
            CLEAR DISTRIB
            UNLOCK
            INDICATE INVOID FALSE
            RETURN CLEAR_CHECKS
          END
   
     IF ANSW EQ 'N' BEGIN
              CLEARXY 24 0
              INDICATE INVOID FALSE
              RETURN DO$
             END
        IF ~ ANSW IN 'YN' BEGIN
              INDICATE INVOID FALSE
              RETURN DO$
            END
    RETURN



OUTBAL:
    INDICATE INBALOUT TRUE
    CLEARXY 24 0
    GOTOXY 24 0
    SCREENMODE 112 ON
    SHOW " Out of Balance .. D)elete Distribution , R)edo Check , Q)uit.                "
    SCREENMODE 1 ON
    GOTOXY 24 65
    REDO_OUTBAL:
       MOVE '' TO ANSW
       INKEY ANSW
       UPPERCASE ANSW
         IF ANSW EQ 'D' BEGIN
             CLEARXY 24 0
             CLEARFORM SCRCHECKS.14 THRU SCRCHECKS.45
             MOVE SCRCHECKS.12 TO SCRCHECKS.13
             INDICATE INBALOUT FALSE
             RETURN RESTART_DIST
           END
         IF ANSW EQ 'R' BEGIN
             CLEARXY 24 0
             INDICATE INBALOUT FALSE
             RETURN CLEAR_CHECKS
           END
         IF ANSW EQ 'Q' BEGIN
             CLEARXY 24 0
             RETURN QUIT_CASH_DISB
           END
         IF ~ ANSW IN 'DRQ' GOTO REDO_OUTBAL
 RETURN



CREATE_RECON:

   REREAD
   CLEAR RECON
   MOVE (BANK.CURRENT_BAL - CHECKS.CHK_AMT) TO BANK.CURRENT_BAL
   MOVE BANK.CODE TO RECON.BANK_CODE
   MOVE CHECKS.CHECK_NUM TO RECON.CHECK_NUMBER
   MOVE CHECKS.CK_DATE TO RECON.TRANS_DATE
   MOVE CHECKS.PAYEE TO RECON.PAYOR
   MOVE CHECKS.CHK_AMT TO RECON.AMOUNT
   IF CHECKS.STATUS EQ 'V' MOVE 'Y' TO RECON.STATUS
        ELSE MOVE 'N' TO RECON.STATUS
   MOVE TODAY TO RECON.POSTING_DATE
   MOVE CHECKS.REFERENCE TO RECON.REFERENCE
   SAVE RECON
   UNLOCK

RETURN

CREATE_JR_CREDIT:
    LOCK
     CLEAR JOURNALS LEDGER
     MOVE BANK.GL_ACCOUNT TO LEDGER.NUMBER
     MOVE BANK.GL_DIST TO LEDGER.DISTRICT
     MOVE BANK.GL_DIV TO LEDGER.DIVISION
       FIND EQ LEDGER BY INDEX.1
     MOVE (REF.REF_NUM + 1 ) TO SEQ
     MOVE SEQ TO REF.REF_NUM
     SAVERECORD REF
        MOVE (CHECKS.CHK_AMT *(-1)) TO JOURNALS.AMOUNT
        MOVE SEQ TO JOURNALS.CHK
        MOVE BANK.GL_ACCOUNT TO JOURNALS.GL
        MOVE BANK.GL_DIST TO JOURNALS.BR
        MOVE BANK.GL_DIV TO JOURNALS.DP
        MOVE CHECKS.PAYEE TO JOURNALS.DESC
        MOVE 'MC' TO JOURNALS.JR
        MOVE AYEAR TO JOURNALS.YR
        MOVE AMONTH TO JOURNALS.MN
        MOVE ADAY TO JOURNALS.DY
        MOVE USERX.USER_NUMB TO JOURNALS.OPERATOR
        MOVE CHECKS.CHECK_NUM TO JOURNALS.EMPLY
          MOVE (JOURNALS.MN - 1) TO FIELDINDEX
          MOVE (LEDGER.TYJAN& + JOURNALS.AMOUNT ) TO LEDGER.TYJAN&
          MOVE (LEDGER.TYTOTAL + JOURNALS.AMOUNT) TO LEDGER.TYTOTAL
       SAVE LEDGER JOURNALS
     UNLOCK
RETURN


CREATE_JR_DEBIT:
    LOCK
   IF DISTRIB.AMOUNT NE 0 BEGIN
     CLEAR JOURNALS LEDGER
     REREAD
     MOVE DISTRIB.ACCOUNT TO LEDGER.NUMBER
     MOVE DISTRIB.DISTRICT TO LEDGER.DISTRICT
     MOVE DISTRIB.DIVISION TO LEDGER.DIVISION
       FIND EQ LEDGER BY INDEX.1
     MOVE (REF.REF_NUM + 1 ) TO SEQ
     MOVE SEQ TO REF.REF_NUM
     SAVERECORD REF
        MOVE DISTRIB.AMOUNT TO JOURNALS.AMOUNT
        MOVE SEQ TO JOURNALS.CHK
        MOVE DISTRIB.ACCOUNT TO JOURNALS.GL
        MOVE DISTRIB.DISTRICT TO JOURNALS.BR
        MOVE DISTRIB.DIVISION TO JOURNALS.DP
        MOVE CHECKS.PAYEE TO JOURNALS.DESC
        MOVE 'MC' TO JOURNALS.JR
        MOVE AYEAR TO JOURNALS.YR
        MOVE AMONTH TO JOURNALS.MN
        MOVE ADAY TO JOURNALS.DY
        MOVE USERX.USER_NUMB TO JOURNALS.OPERATOR
        MOVE DISTRIB.CHECK_NUMB TO JOURNALS.EMPLY
          MOVE (JOURNALS.MN - 1) TO FIELDINDEX
          MOVE (LEDGER.TYJAN& + JOURNALS.AMOUNT) TO LEDGER.TYJAN&
          MOVE (LEDGER.TYTOTAL + JOURNALS.AMOUNT) TO LEDGER.TYTOTAL
       SAVE LEDGER JOURNALS        
       UNLOCK
     END
RETURN


//*******< KEY PROCEDURES >*****************************************************

KEYPROC KEY.CLEAR
    [INBALOUT] RETURN   
    [INVOID] RETURN DO_VOID
    [INCHECK] BEGIN
        CLEARFORM SCRCHECKS
        CLEAR CHECKS
        CLEAR DISTRIB
        CLEAR LEDGER
        CLEAR BANK
    END
    [INDIST] BEGIN
        CLEARFORM SCRCHECKS.14 THRU SCRCHECKS.45
        CLEAR DISTRIB
        CLEAR LEDGER
        INDICATE INCHECK TRUE
        INDICATE INDIST FALSE
        MOVE SCRCHECKS.12 TO SCRCHECKS.13
        RETURN RESTART_DIST
      END
   RETURN CASH_DISB

KEYPROC KEY.HELP
    [INBALOUT] RETURN   
    [INVOID] RETURN DO_VOID
        PAGE CHECKSHELP
        INKEY ANSW
        PAGE SCRCHECKS
        ENTAGAIN
   RETURN

KEYPROC KEY.SAVE
   [INBALOUT] RETURN   
   [INVOID] RETURN DO_VOID
   ENTAGAIN
RETURN


KEYPROC KEY.ESCAPE
   [INBALOUT] RETURN  
   [INVOID] RETURN DO_VOID

        CLEARXY 24 0
        GOTOXY 24 0
        SCREENMODE 112 ON
        SHOW "Are You Sure You Want To Quit (Y/N)..                                        "
        SCREENMODE 1 ON
        GOTOXY 24 40
    REDO_ESC:
        MOVE '' TO ANSW
        INKEY ANSW
        UPPERCASE ANSW
          IF ANSW EQ 'Y' RETURN QUIT_CASH_DISB
          IF ANSW EQ 'N' CLEARXY 24 0
          IF ANSW EQ 'N' ENTAGAIN
          IF ~ ANSW IN "YN" GOTO REDO_ESC
    RETURN
   

KEYPROC KEY.DELETE
ENTAGAIN
RETURN

KEYPROC KEY.PREVIOUS
    [CHECK_FIELD] IF SCRCHECKS.8 NE (0) BEGIN
      MOVE BANK.CODE TO CHECKS.BANK_CODE
      MOVE SCRCHECKS.8 TO CHECKS.CHECK_NUM
      FIND LT CHECKS BY INDEX.1
      [FINDERR] ERROR 42
      [FOUND] ENTDISPLAY CHECKS
      RELATE CHECKS
      GOSUB SHOW_DIST
      RETURN DO_CHECKS
    END
ENTAGAIN
RETURN


KEYPROC KEY.NEXT
   [CHECK_FIELD] IF SCRCHECKS.8 GE (0) BEGIN
      MOVE BANK.CODE TO CHECKS.BANK_CODE
      MOVE SCRCHECKS.8 TO CHECKS.CHECK_NUM
      FIND GT CHECKS BY INDEX.1
      [FINDERR] ERROR 41
      [FOUND] ENTDISPLAY CHECKS
      RELATE CHECKS
      GOSUB SHOW_DIST
      RETURN DO_CHECKS
    END
ENTAGAIN
RETURN


KEYPROC KEY.FIND
ENTAGAIN
RETURN


KEYPROC KEY.SFIND
ENTAGAIN
RETURN


KEYPROC KEY.UP
ENTAGAIN
RETURN

KEYPROC KEY.PRINT
ENTAGAIN
RETURN


KEYPROC KEY.USER2
   [~ INDIST][CHECK_FIELD] BEGIN
     SCREENMODE 1 ON
     SCROLL SCRCHK 8 3 CHECKS INDEX.1 DISPLAY_SCRCHECKS FIND_LT_THAN;
                              FIND_GT_THAN TEST_SCRCHECKS
      CLEAR CHECKS
      MOVE ((SCROLL$L$COUNT -1) * 3) TO WINDOWINDEX
      MOVE SCRCHK.1& TO CHECKS.CHECK_NUM
      MOVE BANK.CODE TO CHECKS.BANK_CODE
        FIND EQ CHECKS BY INDEX.1
        ENTDISPLAY CHECKS
        GOSUB SHOW_DIST
      RETURN DO_CHECKS
   END
   [INDIST] BEGIN
       CLEAR LEDGER
       MOVE WINDOWINDEX TO LEDEX
       MOVE (0) TO WINDOWINDEX
       screenmode 1 on
       SCROLL SCRLED 12 2 LEDGER INDEX.1 DISPLAY_LED FIND_LT_LED ;
                              FIND_GT_LED TEST_LED
       MOVE ((SCROLL$L$COUNT-1) * 2) TO WINDOWINDEX
       CLEAR LEDGER
       MOVE SCRLED.1& TO ACTDEX
       MOVE LEDEX TO WINDOWINDEX
       MOVE ACTDEX TO SCRCHECKS.14&
    END

ENTAGAIN
RETURN




FIND_GT_THAN:
   MOVE BANK.CODE TO CHECKS.BANK_CODE
   MOVE SCRCHK.22 TO CHECKS.CHECK_NUM
RETURN

FIND_LT_THAN:
   MOVE BANK.CODE TO CHECKS.BANK_CODE
   MOVE SCRCHK.1 TO CHECKS.CHECK_NUM
RETURN

DISPLAY_SCRCHECKS:
   DISPLAY CHECKS.CHECK_NUM TO SCRCHK.1&
   DISPLAY CHECKS.PAYEE TO SCRCHK.2&
   DISPLAY CHECKS.CHK_AMT TO SCRCHK.3&
RETURN


TEST_SCRCHECKS:
   INDICATE SCROLL_INDICATOR AS CHECKS.BANK_CODE EQ BANK.CODE
RETURN

FIND_GT_LED:
    MOVE SCRCHECKS.6 TO LEDGER.DISTRICT
    MOVE SCRCHECKS.7 TO LEDGER.DIVISION
    MOVE SCRLED.23 TO LEDGER.NUMBER
RETURN



FIND_LT_LED:
   MOVE SCRLED.1 TO LEDGER.NUMBER
   MOVE SCRCHECKS.6 TO LEDGER.DISTRICT
   MOVE SCRCHECKS.7 TO LEDGER.DIVISION
RETURN



DISPLAY_LED:
    DISPLAY LEDGER.NUMBER TO SCRLED.1&
    DISPLAY LEDGER.DESC TO SCRLED.2&
RETURN

TEST_LED:
   INDICATE SCROLL_INDICATOR AS LEDGER.DIVISION EQ SCRCHECKS.7
RETURN




