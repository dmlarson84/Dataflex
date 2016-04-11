/SCR                                          JRMON.
อออออออออ< General Ledger \ Print Account Detail >ออออออออออออออออออออออออออออ

   This program will print the ledger account detail for the month/s as
      entered.


          Enter District ID #......................{ ___

          Enter Division...........................{ _.

          Enter starting month.....................{ _.   Year.{ _.

          Enter ending month.......................{ _.   Year.{ _.
           
          D)ebits only    C)redits only   B)oth....{ _
          
 Output this report: P)rinter   C)onsole   A)bort..{ _

 If output to printer, Print new page per account..{ _  (Y/N)

 <F2> to backfield            <F9> to restart              <Esc>  to quit

ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
/SELHEADER RESIDENT
=========< General Ledger Detail >=============================================
Date Printed             General Ledger Detail By Months                Page _.
__/__/__                 ______________________________  
===============================================================================

/SELSUBHEADER1 RESIDENT
____ ___ __ _________________________        BEGINNING BALANCE   __,___,___.__ 
Oper     Date   Description               JR  Ref#   Off # Rec # 
/SELBODY RESIDENT
 ____. _./_./__ _________________________ __ ____Z. ____Z. ____Z. _,___,___.__ 
/SELSUBTOTAL1 RESIDENT
                                                                 -------------
              Transaction Total __,___,___.__     Account Total  __,___,___.__ 

/SELTOTAL RESIDENT
                                 General Ledger Out Of Balance By _,___,___.__ 
/OPABORT

******  Aborted By Operator  ******
/STNBYDET   RESIDENT
อออ< General Ledger Detail Printing >อออออออออออออออออออออออออออออออออออออออ=







                         <<<<<  STANDBY  >>>>>


                Now(HjiLlmoElAiCmUnt Number ____ Detail





Press any Key To Quit:




/*
//*********< Print Ledger Account Detail >*************************************


//----------------- Cannot Run Program From Command Line (DOS)
//IF NEXT_MENU LE 0 ABORT
INTEGER USER_NUMB USER$_ACCESS   //must be first integers defined in program
STRING USER$ 30
MOVE '' TO USER$
MOVE 0 TO USER$_ACCESS
//------------------------------------------------------------


START:

DATE_MACRO_INIT

INDICATOR        MON_SCR DIV

DATE             DFR_DATE DFR_DATE2

NUMBER           ANSWER TRANS
 
INTEGER          COUNT LCOUNT LINE GLCOUNT ADAY AMONTH AYEAR
INTEGER          USER_ACCESS UHC
  
STRING           QUIT 1 ANSW 1 USER 30

OPEN LEDGER
OPEN JOURNALS
OPEN REF
OPEN SYSFILE
OPEN USERX


//==========< Track Logged On User and Their Access Level >===================

CLEAR USERX
MOVE USER_NUMB TO USERX.USER_NUMB
     FIND EQ USERX BY INDEX.1
     MOVE USERX.USER_NAME TO USER
     MOVE USERX.ACCS_LEVL TO USER_ACCESS
     MOVE USERX.HC_LEVEL TO UHC
//=========< Start Program >==================================================


  PRINT_JR_MON:           

    MOVE (0) TO PAGECOUNT
    INDICATE DIV AS REF.DIVISION EQ 'Y'
    INDICATE SEL_SCR TRUE
    INDICATE STOP_PRINT FALSE
    INCREMENT PAGECOUNT
    SYSDATE DFR_DATE

    FORMAT SCR.1 {CAPSLOCK}
    FORMAT SCR.3 {RANGE=1,12}
    FORMAT SCR.4 {RANGE=80,99}
    FORMAT SCR.5 {RANGE=1,12}
    FORMAT SCR.6 {RANGE=80,99}
    FORMAT SCR.7 {CAPSLOCK,CHECK="CDB"}
    FORMAT SCR.8 {CAPSLOCK,CHECK="CPA"}
    FORMAT SCR.9 {CAPSLOCK,CHECK="YN"}

  CLEARFORM SCR


   FIRST_DAY_OF_YEAR DFR_DATE TO DFR_DATE2
   DECOMPOSE_DATE DFR_DATE2 TO ADAY AMONTH AYEAR

   DECOMPOSE_DATE DFR_DATE TO ADAY AMONTH AYEAR
  
  PAGE SCR
   MOVE 0 TO GLCOUNT
LOOKUP:
        DISPLAY REF.DISTRICT TO SCR.1
        ACCEPT SCR.1
  [DIV]	ACCEPT SCR.2 
        ACCEPT SCR.3
        DISPLAY AYEAR TO SCR.4
        ACCEPT SCR.4
        ACCEPT SCR.5
        DISPLAY AYEAR TO SCR.6
        ACCEPT SCR.6
        DISPLAY "B" TO SCR.7
        ACCEPT SCR.7
        DISPLAY "C" TO SCR.8
        ACCEPT SCR.8
        IF SCR.8 EQ "P" DISPLAY "Y" TO SCR.9
        IF SCR.8 EQ "P" ACCEPT SCR.9


  CONT:


   GOSUB SELECT_OUTPUT_SEL
   [STOP_PRINT] GOTO QUIT_PRT_JR_SELECT

   MOVE 0 TO GLCOUNT

  FORMAT SELSUBHEADER1.5 {SIGNRT}
  FORMAT SELBODY.10 {SIGNRT}
  FORMAT SELSUBTOTAL1.2  {SIGNRT}
  FORMAT SELTOTAL.1 {SIGNRT}
  
  GOSUB JRHEAD

  CLEAR LEDGER
    MOVE (0) TO LEDGER.NUMBER
    MOVE SCR.1 TO LEDGER.DISTRICT
    MOVE SCR.2 TO LEDGER.DIVISION
  FIND_AGAIN:
      FIND GT LEDGER BY INDEX.1
        [FOUND] BEGIN
            INDICATE SELECT AS LEDGER.DISTRICT EQ SCR.1
            [SELECT] INDICATE SELECT AS LEDGER.DIVISION EQ SCR.2
            [SELECT] GOTO MASTER
            [~ SELECT] GOTO FIND_AGAIN
          END
        [FINDERR] GOTO QUIT_PRT_JR_SELECT

  MASTER:	REPEAT  //FIND,COMPUTE BEGINNING BALANCE, PRINT SCRGENERAL LEDGER ACCOUNT

            INDICATE SELECT AS LEDGER.DISTRICT EQ SCR.1
            [SELECT] INDICATE SELECT AS LEDGER.DIVISION EQ SCR.2
            [~ SELECT] GOTO REDO_FIND
   
                        MOVE (0) TO COUNT
                        MOVE LEDGER.TYBEG TO ANSWER
 		 	PRINT LEDGER.NUMBER TO SELSUBHEADER1.1
   			PRINT LEDGER.DISTRICT TO SELSUBHEADER1.2
   			PRINT LEDGER.DIVISION TO SELSUBHEADER1.3
   			PRINT LEDGER.DESC TO SELSUBHEADER1.4
  	 		 MOVE COUNT TO FIELDINDEX
        	   			WHILE REF.PER1& NE SCR.3
                  		      MOVE REF.PER1& TO FIELDINDEX
  				      CALC (ANSWER+LEDGER.CD&) TO ANSWER
  	 			      INCREMENT COUNT
  		 		      MOVE COUNT TO FIELDINDEX
  	   			END
   			PRINT ANSWER TO SELSUBHEADER1.5
                        MOVE LEDGER.NUMBER TO STNBYDET.1
  		       OUTPUT SELSUBHEADER1
                       KEYCHECK GOSUB STOP_PRT_SEL
      		      MOVE (0.00) TO TRANS
   		      INCREMENT LINE
  
  		CLEAR JOURNALS
  		MOVE LEDGER.OVERLAP TO JOURNALS.DIST_DIV
          	MOVE SCR.4 TO JOURNALS.YR
          	MOVE SCR.3 TO JOURNALS.MN 
   
  	REPEAT  //FIND AND PRINT SUPPORTING JOURNALS
  JRNALS:   	FIND GT JOURNALS BY INDEX.2
  [FINDERR]	GOTO LASTJR
               INDICATE GOOD AS JOURNALS.DIST_DIV EQ LEDGER.OVERLAP
  [NOT GOOD]	GOTO LASTJR
  [GOOD] INDICATE GOOD AS JOURNALS.YR LE SCR.6 
  [GOOD] IF JOURNALS.YR EQ SCR.6 INDICATE GOOD AS JOURNALS.MN LE SCR.5
  [NOT GOOD]	GOTO LASTJR
  [GOOD] IF SCR.7 MATCH "C" INDICATE GOOD AS JOURNALS.AMOUNT LT (0.00)
  [GOOD] IF SCR.7 MATCH "D" INDICATE GOOD AS JOURNALS.AMOUNT GE (0.00) 
  [NOT GOOD]	GOTO JRNALS

                   PRINT USER_NUMB TO SELBODY.1                           
                   PRINT JOURNALS.MN TO SELBODY.2                               
                   PRINT JOURNALS.DY TO SELBODY.3                               
                   PRINT JOURNALS.YR TO SELBODY.4                               
                   PRINT JOURNALS.DESC TO SELBODY.5                             
                   PRINT JOURNALS.JR TO SELBODY.6
                   PRINT JOURNALS.EMPLY TO SELBODY.7                            
                   PRINT JOURNALS.JOB TO SELBODY.8                              
                   PRINT JOURNALS.RECNUM TO SELBODY.9                              
                   PRINT JOURNALS.AMOUNT TO SELBODY.10                          
                   MOVE (JOURNALS.AMOUNT+ANSWER) TO ANSWER                   
                   MOVE (JOURNALS.AMOUNT+TRANS) TO TRANS                     
                   INCREMENT LINE                                            
                  OUTPUT SELBODY                                                
                   KEYCHECK GOSUB STOP_PRT_SEL
                   [STOP_PRINT] GOTO QUIT_PRT_JR_SELECT
                   IF LINE GE 53 GOSUB JRHEAD
    LOOP // TO NEXT JOURNAL

  LASTJR: 	PRINT ANSWER TO SELSUBTOTAL1.2
   		SUBTOTAL SELBODY.10 TO SELSUBTOTAL1.1
   		OUTPUT SELSUBTOTAL1
   		INCREMENT LINE
   		INCREMENT LINE

  	INCREMENT GLCOUNT
    IF SCR.8 MATCH "C" INPUT "Depress Enter (Return) to continue." QUIT
    IF SCR.9 MATCH "Y" GOSUB JRHEAD

REDO_FIND:
    FIND GT LEDGER BY INDEX.1
      [FOUND] LOOP    
       
                           


  TOTAL:

  	CLEARSCREEN
   	PAGECHECK 100
        DESPOOL
        GOTO QUIT_PRT_JR_SELECT

  JRHEAD:
  	PAGECHECK 54
   	MOVE 0 TO LINE
   	MOVE (1) TO SYSFILE.RECNUM
   	FIND EQ SYSFILE.RECNUM
        MOVE PAGECOUNT TO SELHEADER.1
   	MOVE SYSFILE.TODAY TO SELHEADER.2
   	MOVE REF.PROSECUTOR TO SELHEADER.3
       OUTPUT SELHEADER
   RETURN

SELECT_OUTPUT_SEL:
        IF SCR.8 EQ 'P' BEGIN
           OUTFILE "LST:"
           MOVE 62 TO PAGEEND
           MOVE 0 TO PAGEFEED
           CLEARFORM STNBYDET
           PAGE STNBYDET
           GOTO END_SELECT_SEL
          END
        IF SCR.8 EQ 'C' BEGIN
           OUTFILE "CON:"
           CLEARSCREEN
           GOTO END_SELECT_SEL
          END
         IF SCR.8 EQ 'A' BEGIN
           GOTOXY 24 0
           SHOW " Are You Sure You Want To Abort..(Y/N) "
           GOTOXY 24 40
 REDO_ANSW_SEL:
           MOVE '' TO ANSW
           INKEY ANSW
           UPPERCASE ANSW
             IF ~ ANSW IN "YN" GOTO REDO_ANSW_SEL
             IF ANSW EQ 'Y' INDICATE STOP_PRINT TRUE
           CLEARXY 24 0
           GOTO END_SELECT_SEL
         END

END_SELECT_SEL:

RETURN

STOP_PRT_SEL:
        CLEARXY 24 0
        GOTOXY 24 0
        SHOW " A Key Has Been Pressed , Do You Wish To Abort..? "
        GOTOXY 24 60
        MOVE '' TO ANSW
          INKEY ANSW
          UPPERCASE ANSW
          IF ~ ANSW IN "YN" GOTO STOP_PRT_SEL
          IF ANSW EQ 'Y' BEGIN
             PAGECHECK 5
             [PAGEBREAK] FORMFEED
             OUTPUT OPABORT
             FORMFEED
             INDICATE STOP_PRINT TRUE 
             GOTO QUIT_PRT_JR_SELECT
          END
         CLEARXY 24 0

RETURN


DO_MORE:
     GOTOXY 24 0
      SHOW " Do You Wish To Print More Accounts ? (Y/N) "
     GOTOXY 24 46
     MOVE '' TO ANSW
     INKEY ANSW
     UPPERCASE ANSW
     IF ~ ANSW IN "YN" GOTO DO_MORE    
     IF ANSW EQ 'Y' BEGIN
          CLEARXY 24 0
          CLEARFORM SCR
          CLEAR LEDGER
          CLEAR JOURNALS
          MOVE 0 TO PAGECOUNT
          RETURN PRINT_JR_MON          
        END
     CLEARXY 24 0
RETURN




QUIT_PRT_JR_SELECT:
  INDICATE SEL_SCR FALSE
  CLEAR LEDGER
  CLEAR JOURNALS
  CLEARFORM SCR
  ABORT





//**********< KEYPROC ROUTINES >**********************************************

KEYPROC KEY.ESCAPE
     ABORT
RETURN


KEYPROC KEY.CLEAR
   CLEARFORM SCR
   CLEAR LEDGER
   CLEAR JOURNALS
RETURN START


KEYPROC KEY.DELETE
   ENTAGAIN
RETURN


KEYPROC KEY.SAVE
   ENTAGAIN
RETURN


KEYPROC KEY.UP
   BACKFIELD
RETURN


KEYPROC KEY.DOWN
RETURN



KEYPROC KEY.FIELD
   BACKFIELD
RETURN