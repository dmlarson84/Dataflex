/PAGE1                                   defendnt.frm
                          WORTHLESS CHECK SYSTEM
                          Defendant Entry Screen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ID No: [_____.]                                                        
Defendant Name: [______________________________]  (Last, First MI)
Address: ______________________________ Address: ______________________________
City: __________________________ St: __ Zip: __________
Identification: Physical (Y/N) _ Driver's License _________  Soc Sec _________
Description: Sex _   Race _   DOB __/__/____   Height _.'_."   Weight __. lbs.
Other ______________________________________________________________________
      ______________________________________________________________________
      ______________________________________________________________________
Previous Credit: _____.__                          Last Control Number Used __.

Total Outstanding, Active Offenses: ______.__
/CHANGES
                          WORTHLESS CHECK SYSTEM
                        Record Changing Entry Screen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


            Operator: ___                       Date: __/__/____

            Changes: (What was changed and Why)

            _______________________________________________________ |
            _______________________________________________________ |
            _______________________________________________________ |
/DATE_SCRN
__/__/____
/NOSETUP
                             * * W A R N I N G * *

         There is no record in the PROSECUTOR SETUP TABLE for ____ !!


    You MUST add a record to the Setup Table (option 7 on the Master Menu)
    and/or check that the system date is correct.





                          Press any key to continue _
/WARN1
ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
บ  A change is being attempted to the defendants     บ
บ  credit amount !!!!!                               บ
บ  Changes cannot be made to the credit amount       บ
บ  within this program.                              บ
บ  Please consult your manual or call the office     บ
บ  of the Prosecutor Coordinator                     บ
บ                                                    บ
บ           Press Any Key To Continue                บ
ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ

/info

Recompiled 01-19-2000 by Jeff March
        Recognize new backspace command in calcdate.inc
          

/*
Use y2k.pkg
Read_dfini "df23ini.cfg"
//----------------- Cannot Run Program From Command Line (DOS)
IF NEXT_MENU LE 0 ABORT
INTEGER USER_NUMB USER$_ACCESS   //must be first integers defined in program
STRING USER$ 30
MOVE '' TO USER$
MOVE 0 TO USER$_ACCESS
//------------------------------------------------------------
#include calcdate.inc
#include macs.frm

OPEN DEFENDNT
OPEN RECHANGE
OPEN SETUP
OPEN TRANSACT
OPEN OFFENSE


PAGE SET WARN1 AT 10 6 COLORS 112


//-------------- Find Logged On User For Program Use
OPEN USERX
CLEAR USERX
MOVE USER_NUMB TO USERX.USER_NUMB
FIND EQ USERX BY INDEX.1
MOVE USERX.USER_NAME TO USER$
MOVE USERX.ACCS_LEVL TO USER$_ACCESS
//----------------------------------------------------

INTEGER COUNTER
NUMBER OLD_CRED
STRING YR 4 YEAR 4 ANSW 1
DATE TODAY
SYSDATE4 TODAY
MOVE TODAY TO DATE_SCRN.1
RIGHT DATE_SCRN.1 TO YR 4
START:
CLEARXY 24 0
CLEAR SETUP
MOVE YR TO SETUP.YEAR
FIND EQ SETUP BY INDEX.1
[FINDERR] GOSUB NOSETUP
IF SETUP.PROSNAME LE " " GOSUB NOSETUP
IF SETUP.LSTID LE 0 GOSUB NOSETUP


FORMAT CHANGES.1 THRU CHANGES.3 {REQUIRED}

ENTER DEFENDNT

    CLEAR RECHANGE
    CLEAR TRANSACT
    AUTOPAGE PAGE1

    ENTRY DEFENDNT.IDNO                   {AUTOFIND}

    IF PAGE1.1 EQ '' BEGIN
       GOTOXY 24 17
       SHOW 'Do you wish to assign a new ID number (Y/N)?'
       INKEY ANSW
       CLEARXY 24 0
       SCREENMODE 1
       INDICATE NEW AS ANSW IN 'Yy' 
       [NEW] BEGIN
         GOTOXY 24 10
         SHOW 'Actual ID number will be assigned when record is saved'
       END
    END

    ENTRY DEFENDNT.NAME                   {AUTOFIND}
    CLEARXY 24 0
    ENTRY DEFENDNT.ADDR                   
    ENTRY DEFENDNT.ADDR2
    ENTRY DEFENDNT.CITY                   
    IF PAGE1.6 EQ "" MOVE "AR" TO PAGE1.6
    ENTRY DEFENDNT.ST                     {CAPSLOCK}
    ENTRY DEFENDNT.ZIP                    
    GOTOXY 24 10
    SHOW 'Can the defendant be recognized on sight     Y=yes   N=no'
    ENTRY DEFENDNT.PHYS                   {CAPSLOCK,CHECK ="YN "}
    CLEARXY 24 0
    ENTRY DEFENDNT.LIC                    
    ENTRY DEFENDNT.SOCSEC                 
    GOTOXY 24 20
    SHOW 'M = male       F = female '
    ENTRY DEFENDNT.SEX                    {CAPSLOCK,CHECK ="MFU "}  
    CLEARXY 24 0
    GOTOXY 24 10
    SHOW 'A=Asian  B=Black  H=Hispanic  I=Indian  W=White  X=Unknown'
    ENTRY DEFENDNT.RACE                   {CAPSLOCK}
   CLEARXY 24 0
    ENTRY DEFENDNT.AGE        
    ENTRY DEFENDNT.FT                     {RANGE = 0,9}
    ENTRY DEFENDNT.IN                     {RANGE = 0,11}
    ENTRY DEFENDNT.LBS                    
    GOTOXY 24 10
    SHOW 'This first line of OTHER comments will appear on the warrant'
    ENTRY DEFENDNT.OTHER                  
    CLEARXY 24 0
    ENTRY DEFENDNT.OTHER2
    ENTRY DEFENDNT.OTHER3
    MOVE PAGE1.20 TO RECHANGE.OLD_CREDIT
[~ NEW] MOVE DEFENDNT.CREDIT TO OLD_CRED
    ENTRY DEFENDNT.CREDIT
    MOVE PAGE1.20 TO RECHANGE.NEW_CREDIT
    ENTRY DEFENDNT.LAST_CTRL#
[~ NEW] IF PAGE1.1 EQ '' IF PAGE1.2 NE '' INDICATE NEW TRUE
[NEW] GOSUB NEW_DEF
    ENTRY DEFENDNT.BAL
  RETURN


  ENTER.SAVE:
  IFCHANGE DEFENDNT GOSUB RECORD_CHANGE
  IFCHANGE PAGE1.20 GOSUB RECORD_TRANSACT
  clearform page1
  RETURN

ENTEREND
ABORT

RECORD_CHANGE:
       MOVE 'DEFENDNT' TO RECHANGE.FILE
       CLEARFORM CHANGES
       PAGE CHANGES
       MOVE USER_NUMB TO CHANGES.1
       GOTO PASS_OPER
       ACCEPT CHANGES.1 TO RECHANGE.OPERATOR
PASS_OPER:
       ENTERMODE
       MOVE TODAY TO CHANGES.2
       MOVE CHANGES.2 TO RECHANGE.DATE
	   MOVE CHANGES.1 TO RECHANGE.OPERATOR
       ACCEPT CHANGES.3 TO RECHANGE.DESC1
       ACCEPT CHANGES.4 TO RECHANGE.DESC2
       ACCEPT CHANGES.5 TO RECHANGE.DESC3
       MOVE PAGE1.1 TO RECHANGE.ID_NUMBER
       IFCHANGE PAGE1.19 BEGIN
       MOVE CHANGES.3 TO TRANSACT.DESC1
       MOVE CHANGES.4 TO TRANSACT.DESC2
       MOVE CHANGES.5 TO TRANSACT.DESC3
       MOVE CHANGES.1 TO TRANSACT.OPERATOR
       MOVE (RECHANGE.NEW_CREDIT - RECHANGE.OLD_CREDIT) TO TRANSACT.CREDIT
       END
//    CLEARXY 24 0
//    GOTOXY 24 10
//    SHOW USER_NUMB " - " Changes.1 " - " RECHANGE.OPERATOR
//	INKEY ANSW
      SAVERECORD RECHANGE
       RETURN

RECORD_TRANSACT:
       MOVE TODAY TO TRANSACT.DATE
       MOVE DEFENDNT.IDNO TO TRANSACT.IDNO
       MOVE DEFENDNT.LAST_CTRL# TO TRANSACT.CTRL_SEQ_NO
       MOVE DEFENDNT.NAME TO TRANSACT.DEF_NAME
       MOVE 'DEFENDNT' TO TRANSACT.FILE
       SAVERECORD TRANSACT
       CLEAR TRANSACT
  RETURN

NEW_DEF:
          LOCK 
          CLEAR SETUP
          MOVE YR TO SETUP.YEAR
          FIND EQ SETUP BY INDEX.1
          MOVE (SETUP.LSTID + 1) TO PAGE1.1
          MOVE PAGE1.1 TO SETUP.LSTID
          SAVERECORD SETUP
          UNLOCK
          INDICATE NEW FALSE
       RETURN

NOSETUP:
      MOVE YEAR TO NOSETUP.1
      ACCEPT NOSETUP.2
      ABORT
RETURN


STOP_CHANGE:
    CLEARXY 24 0
    PAGE WARN1
    INKEY ANSW
    MOVE OLD_CRED TO PAGE1.20
RETURN


KEYPROC KEY.DELETE
       CLEAR OFFENSE
       IF STATUS DEFENDNT BEGIN
           MOVE DEFENDNT.IDNO TO OFFENSE.IDNO
           FIND GE OFFENSE BY INDEX.1
          [FOUND] IF DEFENDNT.IDNO EQ OFFENSE.IDNO BEGIN
              CLEARXY 24 0
              GOTOXY 24 0
              SCREENMODE 112 ON
              SHOW 'Active Offense against this Defendant !! Cannot Delete                        '
              SCREENMODE 1 ON
              MOVE 0 TO COUNTER
                REPEAT
                    INCREMENT COUNTER
                  UNTIL COUNTER EQ 2500
              CLEARXY 24 0
               RETURN START
            END
           [FOUND] IF DEFENDNT.IDNO NE OFFENSE.IDNO BEGIN
             CLEAR OFFENSE
             CLEARXY 24 0
             GOTOXY 24 0
             SCREENMODE 112 ON
             SHOW 'Are You Sure You Want To Delete This Defendant ????                           '
             GOTOXY 24 55
             SCREENMODE 1 ON
  DO_ANSW:
             INKEY ANSW
             UPPERCASE ANSW
             IF NOT ANSW IN 'YN' GOTO DO_ANSW
               IF ANSW EQ 'Y' BEGIN
                  CLEAR OFFENSE
                  DELETE DEFENDNT
                  CLEAR DEFENDNT
                  CLEARXY 24 0
                  CLEARFORM
                  RETURN START
               END
                IF ANSW EQ 'N' RETURN START
          END
     END
ENTAGAIN
RETURN
