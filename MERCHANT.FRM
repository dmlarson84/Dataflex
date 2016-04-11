/SCREEN                                               merchant.frm
                          WORTHLESS CHECK SYSTEM
                          Merchant Entry Screen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

           Merchant No: [_____.]      
                  Name: [______________________________]
               Address: _________________________ 
                  City: _______________ St: __ Zip: _________

            Salutation: _________________________  (e.g., Miss Jones)
If Salutation is left blank, the merchant letter will be to "Dear Sir:".

                 Phone: ______________
/DATE_SCREEN
__/__/__
/NOSETUP
                             * * W A R N I N G * *

         There is no record in the PROSECUTOR SETUP TABLE for ____ !!


    You MUST add a record to the Setup Table (option 7 on the Master Menu)
    and/or check that the system date is correct.





                          Press any key to continue _

/*
//----------------- Cannot Run Program From Command Line (DOS)
IF NEXT_MENU LE 0 ABORT
INTEGER USER_NUMB USER$_ACCESS   //must be first integers defined in program
STRING USER$ 30
MOVE '' TO USER$
MOVE 0 TO USER$_ACCESS
//------------------------------------------------------------

OPEN MERCHANT
OPEN SETUP

//-------------- Find Logged On User For Program Use
OPEN USERX
CLEAR USERX
MOVE USER_NUMB TO USERX.RECNUM
FIND EQ USERX BY RECNUM
MOVE USERX.USER_NAME TO USER$
MOVE USERX.ACCS_LEVL TO USER$_ACCESS
//----------------------------------------------------

STRING ANSW 1 YEAR 2 YR 4
DATE TODAY
SYSDATE TODAY
MOVE TODAY TO DATE_SCREEN.1
RIGHT DATE_SCREEN.1 TO YEAR 2
MOVE '19' TO YR
APPEND YR YEAR 

CLEAR SETUP
MOVE YR TO SETUP.YEAR
FIND EQ SETUP BY INDEX.1
[FINDERR] GOSUB NOSETUP
IF SETUP.MERCHANT LE 0 IF SETUP.PROSNAME LE '' GOSUB NOSETUP


ENTER MERCHANT

    ENTRY MERCHANT.IDNO    {AUTOFIND}

    IF SCREEN.1 EQ '' BEGIN
       GOTOXY 24 17
       SHOW 'Do you wish to assign a new ID number (Y/N)?'
       INKEY ANSW
       CLEARXY 24 0
       SCREENMODE 1
       IF ANSW IN 'Yy' BEGIN
          LOCK 
          CLEAR SETUP
          MOVE YR TO SETUP.YEAR
          FIND EQ SETUP BY INDEX.1
          MOVE (SETUP.MERCHANT + 1) TO SCREEN.1
          MOVE SCREEN.1 TO SETUP.MERCHANT
          SAVERECORD SETUP
          UNLOCK
       END
    END

    ENTRY MERCHANT.NAME     
    ENTRY MERCHANT.ADDR        
    ENTRY MERCHANT.CITY
    IF SCREEN.5 EQ "" MOVE "AR" TO SCREEN.5
    ENTRY MERCHANT.ST                     {CAPSLOCK}
    ENTRY MERCHANT.ZIP
    ENTRY MERCHANT.SALUTATION
    ENTRY MERCHANT.PHONE

  RETURN
ENTEREND
ABORT

NOSETUP:
      MOVE YR TO NOSETUP.1
      ACCEPT NOSETUP.2
      ABORT
RETURN