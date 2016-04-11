/PAGE1                                                setup.frm
                           WORTHLESS CHECK SYSTEM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  YEAR: ____      Prosecuting Attorney Name: ______________________________

  Address: _________________________   City: _______________ Zip: __________
  County: ____________________         District: ___
  Last Receipt No: _____.              Last ID No: ______.
  Last Merchant: _____.                Beginning Balance: ______.__
  Last Check #: _______.

   Name on Defendant Letters   ______________________________
                       Title   ______________________________
   Name on Merchant Letter/Prosecutor checks: ______________________________
                                       Title: ______________________________
   Offense Entry Defaults:    Judge Initials: ___       Merchant Fee:  __.__
                              Bank Location: ______________________________
   Warrant Information:  Felony Bond: $_____.__  Misdemeanor Bond: $_____.__
                         Court in which Felonies are filed: _________
                                                           (Circuit, Municipal)
                         Court Costs $____.__
  Office Hours: _____________________________________
/DATE_SCRN
__/__/____
/INFO
 Change Made 08-15-95 by Gary Grooms
       Changed the RANGE of merchant fees from 0 to 15.00 to 0 to 20.00
       as allowed by new law passed 1995 effective July 28 1995
/*
//----------------- Cannot Run Program From Command Line (DOS)
IF NEXT_MENU LE 0 ABORT
INTEGER USER_NUMB USER$_ACCESS   //must be first integers defined in program
STRING USER$ 30
MOVE '' TO USER$
MOVE 0 TO USER$_ACCESS
//------------------------------------------------------------

OPEN SETUP
OPEN TRANSACT
//-------------- Find Logged On User For Program Use
OPEN USERX
CLEAR USERX
MOVE USER_NUMB TO USERX.RECNUM
FIND EQ USERX BY RECNUM
MOVE USERX.USER_NAME TO USER$
MOVE USERX.ACCS_LEVL TO USER$_ACCESS
//----------------------------------------------------


STRING ANSW 1 YEAR 4 SHORT_YR 2
NUMBER OLD_BEGBAL
DATE TODAY
SYSDATE DATE_SCRN.1
SYSDATE TODAY
RIGHT DATE_SCRN.1 TO SHORT_YR 2
MOVE '19' TO YEAR
APPEND YEAR SHORT_YR

CLEAR SETUP
CLEAR TRANSACT
MOVE YEAR TO SETUP.YEAR
FIND EQ SETUP BY INDEX.1

ENTER SETUP
  IF STATUS SETUP ENTDISPLAY SETUP
  ENTRY SETUP.YEAR
  ENTRY SETUP.PROSNAME 
  ENTRY SETUP.ADDR 
  ENTRY SETUP.CITY 
  ENTRY SETUP.ZIP
  ENTRY SETUP.COUNTY
  ENTRY SETUP.DIST 
  ENTRY SETUP.LSTREC 
  ENTRY SETUP.LSTID 
  ENTRY SETUP.MERCHANT
    MOVE SETUP.BEGBAL TO OLD_BEGBAL
  ENTRY SETUP.BEGBAL
  ENTRY SETUP.LAST_CHECK
  ENTRY SETUP.SIGNS_DEFLTR
  ENTRY SETUP.DL_SIGNERS_TITL
  ENTRY SETUP.SIGNS_MERLTR
  ENTRY SETUP.ML_SIGNERS_TITL
  ENTRY SETUP.JUDGE_INIT                    {CAPSLOCK}
  ENTRY SETUP.MFEE_DEFAULT                  {RANGE=0.00,20.00}
  ENTRY SETUP.LOC_DEFAULT
  ENTRY SETUP.FBOND
  ENTRY SETUP.MBOND
  IF PAGE1.22 EQ '' MOVE 'Municipal' TO PAGE1.22
  ENTRY SETUP.FEL_COURT                     {CHECK='Circuit  |Municipal'}
  ENTRY SETUP.COURT_COST
  ENTRY SETUP.HOURS
RETURN


ENTER.SAVE:
    IFCHANGE PAGE1.10 GOSUB RECORD_TRANSACT
RETURN


ENTEREND
ABORT


RECORD_TRANSACT: 
           SYSDATE TODAY
        MOVE USER_NUMB TO TRANSACT.OPERATOR
        MOVE TODAY TO TRANSACT.DATE
        MOVE 9999 TO TRANSACT.IDNO
        MOVE 9999 TO TRANSACT.CTRL_SEQ_NO
        MOVE SETUP.PROSNAME TO TRANSACT.DEF_NAME
        MOVE 'SETUP' TO TRANSACT.FILE
        MOVE ( PAGE1.10 - OLD_BEGBAL ) TO TRANSACT.BEGBAL
        MOVE 'BANK BALANCE HAS BEEN CHANGED' TO TRANSACT.DESC1
        MOVE 'BANK BALANCE HAS BEEN CHANGED' TO TRANSACT.DESC2
        MOVE 'BANK BALANCE HAS BEEN CHANGED' TO TRANSACT.DESC3
        SAVERECORD TRANSACT
  RETURN
