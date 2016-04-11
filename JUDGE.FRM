/PAGE1                                              judge.frm

                         WORTHLESS CHECK SYSTEM
                       Warrant Information Table
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

					Judge Initials: [___] 

            Name: ________________________________________________

                   In the County of: ______________

                     In the City of: ____________________


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
#include Calcdate.inc
#include macs.frm

STRING ANSW 1
OPEN JUDGE

//-------------- Find Logged On User For Program Use
OPEN USERX
CLEAR USERX
MOVE USER_NUMB TO USERX.RECNUM
FIND EQ USERX BY RECNUM
MOVE USERX.USER_NAME TO USER$
MOVE USERX.ACCS_LEVL TO USER$_ACCESS
//----------------------------------------------------


ENTER JUDGE
  ENTRY JUDGE.INIT          {CAPSLOCK,AUTOFIND}
  ENTRY JUDGE.NAME 
  ENTRY JUDGE.COUNT 
  ENTRY JUDGE.CITY 
RETURN
ENTEREND
ABORT

KEYPROC KEY.ESCAPE
  GOTOXY 23 1
  INPUT "CONFIRM EXIT (Y/N)?" ANSW
  CLEARXY 23 0
  IF ANSW IN "yY" ABORT
  ENTAGAIN
RETURN
