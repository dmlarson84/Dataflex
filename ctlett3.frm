/SUBHEADER1 RESIDENT             Jefferson      ctlett3.rpt








                                                                   
                                                        
                                                                   __/__/____
        ______________________________
        ______________________________
        ______________________________
        ________________________________

		
           A complaint has been made to this office that you have violated the
   Arkansas "Hot Check Law" (Ark. Code Ann. 5-37-302 et. seq.).  Violations of
   this law are  punishable  by fine and/or imprisonment in the county jail or
   state penitentiary.
           The purpose  of this letter is to give you  the opportunity to make
   restitution on the following check(s) and all other bad checks by __/__/_____
   or a summons  or  warrant for  your  arrest  will be  issued by the  Court.
   NO PERSONAL CHECKS OR CASH WILL BE ACCEPTED. RESTITUTION MUST BE PAID BY 
   CREDIT CARD, MONEY ORDER OR CASHIER`S CHECK MADE PAYABLE TO THE PROSECUTING
   ATTORNEY. The amount of restitution required is the amount of the check, plus
   a service charge for the merchant, and a collection fee for the Prosecuting
   Attorney.  Restitution MUST be made in person, online or mailed to:   
         Physical Address:           Mailing Address:
         Hot Check Division          PROSECUTING ATTORNEY
         101 W. Barraque St.         _________________________
         Pine Bluff, AR  71601       ___________________   _________

   O F F I C E   H O U R S :  ______________________________________
     Make your payments now online at https://www.ark.org/hotcheck/, use the
     following information to log on to your account:
       County: Jefferson      IDNO: __________  USERNAME: ______________________
     
   ____________________________                 Sincerely,
   ____________________________                         
   ____________________________                      
   ____________________________
   ____________________________                 ______________________________
   ____________________________                 ______________________________
   ____________________________    
 CHECK     CHECK                                CHECK   PROS   MERCH   TOTAL DUE
 DATE      NUMBER  PAYEE                        AMOUNT  FEE     FEE    PER CHECK

/INTERNET1


 
 

 
/INTERNET


Make your payments now online at https://www.ark.org/hotcheck/, use the
following information to log on to your account:

  County: Jefferson        IDNO: __________     USERNAME: ______________________
/BLKLINES













__
/BLANKLINES















/BODY RESIDENT
__/__/____ ______  __________________________ _____.__  __.__  __.__ _,_____.__
/SUBTOTAL1 RESIDENT
                                                                     ----------
      ***  TOTAL DUE  ***                                           _$,_____.__
/FINALE RESIDENT









  


  
  
  
  
  TOTAL OF ALL OFFENSES IN LETTER BATCH OF __/__/____             _$,_____.__
/DATE_SCRN
__/__/____
/PRESELECT
                            HOT CHECK SYSTEM
                         DEFENDANT WARNING LETTERS 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




              Print Single or Aggregated letters?  (S/A)    _







Single means that a separate letter will print for each offense.  (A defendant
may receive more than one letter.)

Aggregated means that only one letter prints for a defendant.  The letter will
list all that defendant's offenses for which letters have not been previously
printed.
/SELECT
                            HOT CHECK SYSTEM
                         DEFENDANT WARNING LETTERS 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




          Enter H to use handfed paper     _

          Print the Prosecutor Fees table? (Y/N)  _

         
          
          
/NOSETUP
                             * * W A R N I N G * *

         There is no record in the HOT CHECK SETUP TABLE for ____ !!


    You MUST add a record to the Setup Table (option 7 on the Master Menu)
    and/or check that the system date is correct.





                          Press any key to continue _

/INFO


    CHANGES MADE ON 10/05/1999 BY JEFF MARCH
        ADDED DIRECT_OUTPUT TO LPT1 FOR PRINTING OF WARNING LETTERS.

    Change made on 11/17/1999 by Jeff March
        Margin from top 1 1/2 inches (8 lines)

    Change made on 01/06/2000 by Jeff March
        Changed date in body of letter to 4 digit year.
		
	Change made on 03/01/2007 by Jeff March		
		Changed Letter to display url: and logon information on back page 
		Allows 1 offense to print at bottom than formfeeds to print remaining
		offenses, total line and logon info under letterhead.
	
	Change made on 3/17/2016 by Don Larson
		Changed their hardcoded physical address info. Couple other minor tweaks. Recompiled.
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
OPEN SETUP
OPEN DEFENDNT
OPEN OFFENSE INDEX.7

//-------------- Find Logged On User For Program Use
OPEN USERX
CLEAR USERX
MOVE USER_NUMB TO USERX.RECNUM
FIND EQ USERX BY RECNUM
MOVE USERX.USER_NAME TO USER$
MOVE USERX.ACCS_LEVL TO USER$_ACCESS
//----------------------------------------------------

NUMBER TOTAMT SUBAMT
INTEGER WHERE LGTH PAGE_LNTH
DATE TODAY TENDAY
INDICATOR PTAB COVER FINISH_UP NEWPG
STRING LNAME 22 FNAME 30 LINE ANSW
STRING CITY 20 CSZ 32 BLNK 1
STRING TABLE1 28 TABLE2 28 TABLE3 28 TABLE4 28 TABLE5 28
STRING TABLE6 28 TABLE7 28 
STRING YEAR 4 SHORT_YR 2 BLANKS
INTEGER PGLNTH KOUNTER PGCHK DATEDUE
SYSDATE4 DATE_SCRN.1
RIGHT DATE_SCRN.1 TO Year 4

CLEAR SETUP
MOVE YEAR TO SETUP.YEAR
FIND EQ SETUP BY INDEX.1
[FINDERR] GOSUB NOSETUP
IF SETUP.PROSNAME LE '' GOSUB NOSETUP

SYSDATE4 TODAY



MOVE 0 TO PAGEFEED
MOVE 60 TO PAGEEND

INDICATE PTAB FALSE
INDICATE COVER TRUE
BLANKFORM SUBHEADER1
BLANKFORM BODY

MOVE 'A' TO PRESELECT.1
ACCEPT PRESELECT.1           {CAPSLOCK,CHECK='SA'}
IF PRESELECT.1 EQ 'S' CHAIN 'CTLETT1'

ACCEPT SELECT.1
IF SELECT.1 IN 'Hh' MOVE -1 TO PAGEFEED
MOVE 'N' TO SELECT.2
ACCEPT SELECT.2






IF SELECT.2 IN 'Yy' BEGIN
    INDICATE PTAB TRUE
    MOVE '    PROSECUTING ATTORNEY    ' TO TABLE1
    MOVE '      COLLECTION FEES       ' TO TABLE2
    MOVE '  AMOUNT OF CHECK       FEE ' TO TABLE3
    MOVE '$   .01 - $ 100.00    $15.00' TO TABLE4
    MOVE '$100.01 - $ 300.00    $30.00' TO TABLE5
    MOVE '$300.01 - $ 500.00    $50.00' TO TABLE6
    MOVE '$500.01 -   over      $75.00' TO TABLE7
END
MOVE 3 TO PAGE_LNTH

CALC (46 + PAGE_LNTH) TO PGCHK

 
MOVE (TODAY + 10) TO TENDAY


MOVE 0 TO KOUNTER
MOVE 0 TO TOTAMT
MOVE 0 TO SUBAMT


Direct_Output "lpt1"

REPORT OFFENSE BY INDEX.7 BREAK OFFENSE.IDNO
         
           INDICATE SELECT AS OFFENSE.ACTIVE EQ ''
[~ SELECT] BEGIN
              INDICATE FINISH_UP TRUE
              GOTO END.OF.REPORT
END
[SELECT]   INDICATE SELECT AS OFFENSE.LETDT EQ ''
         
SECTION SUBHEADER1
    [~ COVER] PAGECHECK (PGCHK-1)
    [~ COVER PAGEBREAK] MOVE 0 TO LINECOUNT
 IF KOUNTER LT 1 BEGIN
    INCREMENT KOUNTER
        POS "," IN DEFENDNT.NAME TO WHERE
        LEFT DEFENDNT.NAME TO LNAME (WHERE-1)
        RIGHT DEFENDNT.NAME TO FNAME (30-WHERE)
        TRIM FNAME TO FNAME
        APPEND FNAME " " LNAME
        GOTOXY 12 12
        SHOW 'Processing letter to ' FNAME '            '

        TRIM SETUP.CITY TO CITY
        APPEND CITY ", AR"
        TRIM DEFENDNT.CITY TO CSZ
        APPEND CSZ ", " DEFENDNT.ST "   " DEFENDNT.ZIP
        PRINT TODAY  

        BLANKFORM SUBHEADER1.2 THRU SUBHEADER1.5
        CLEARFORM INTERNET
        PRINT DEFENDNT.IDNO TO SUBHEADER1.11
        PRINT LNAME TO SUBHEADER1.12
        
        IF DEFENDNT.ADDR2 GT ' ' IF DEFENDNT.ADDR GT ' ' BEGIN
          PRINT FNAME TO SUBHEADER1.2
          PRINT DEFENDNT.ADDR  TO SUBHEADER1.3
          PRINT DEFENDNT.ADDR2 TO SUBHEADER1.4
        END
        ELSE BEGIN
          PRINT FNAME TO SUBHEADER1.3
          IF DEFENDNT.ADDR  GT ' ' PRINT DEFENDNT.ADDR  TO SUBHEADER1.4
          IF DEFENDNT.ADDR2 GT ' ' PRINT DEFENDNT.ADDR2 TO SUBHEADER1.5
        END

        AUTOPAGE SUBHEADER1 5
        PRINT CSZ 
        PRINT TENDAY
        PRINT SETUP.ADDR
        PRINT CITY
        PRINT SETUP.ZIP    TO SUBHEADER1.9
        PRINT SETUP.HOURS  TO SUBHEADER1.10
        [PTAB] BEGIN
              PRINT TABLE1 TO SUBHEADER1.13
              PRINT TABLE2 TO SUBHEADER1.14
              PRINT TABLE3 TO SUBHEADER1.15
              PRINT TABLE4 TO SUBHEADER1.16
              PRINT TABLE5 TO SUBHEADER1.17
              PRINT TABLE6 TO SUBHEADER1.19
              PRINT TABLE7 TO SUBHEADER1.21
              
        END 
        PRINT SETUP.SIGNS_DEFLTR    TO SUBHEADER1.18
        PRINT SETUP.DL_SIGNERS_TITL TO SUBHEADER1.20
         INDICATE COVER TRUE
         MOVE 0 TO PGLNTH
//[COVER]	    OUTPUT INTERNET	
[COVER]     OUTPUT SUBHEADER1
END

SECTION BODY
         INCREMENT PGLNTH
[COVER]  IF PGLNTH GT PAGE_LNTH INDICATE NEWPG TRUE
[~ COVER] IF PGLNTH GE PGCHK INDICATE NEWPG TRUE

[NEWPG] BEGIN
         FORMFEED
         MOVE 0 TO LINECOUNT
         MOVE 0 TO PGLNTH
         BLANKFORM BLKLINES
         OUTPUT BLKLINES
         INDICATE COVER FALSE
         INDICATE NEWPG FALSE
       END
        PRINT OFFENSE.CKDT
        PRINT OFFENSE.CKNO
        PRINT OFFENSE.NAME
        PRINT OFFENSE.CKAMT
        PRINT OFFENSE.PFEE
        PRINT OFFENSE.MFEE
        PRINT OFFENSE.TOTAL
         CALC (TOTAMT + OFFENSE.TOTAL) TO TOTAMT
        OUTPUT BODY
        reread Offense
        MOVE TODAY TO OFFENSE.LETDT
        SAVERECORD OFFENSE
        Unlock
SECTION SUBTOTAL1
    SUBTOTAL BODY.7 TO SUBTOTAL1.1
//    SHOW TOTAMT '       '
		MOVE 0 TO PGLNTH
		MOVE 0 TO KOUNTER

    IF LINECOUNT LT 8 BEGIN
		MOVE 0 TO PGLNTH
		MOVE 0 TO KOUNTER
		OUTPUT BLANKLINES
	END
	INCREMENT PGLNTH	 
	OUTPUT SUBTOTAL1
//	OUTPUT INTERNET
	[FINISH_UP] BEGIN
//   				GOSUB ENDING
					GOTO DONE
                END
    [~ COVER] FORMFEED
    [~ COVER] GOSUB NEWPAGE

DONE:
REPORTEND

gosub ending

FORMFEED
ABORT

KEYPROC KEY.ESCAPE
ABORT

NOSETUP:
      MOVE YEAR TO NOSETUP.1
      ACCEPT NOSETUP.2
      ABORT
RETURN

ENDING:
    FORMFEED
    PRINT TODAY TO FINALE.1
    PRINT TOTAMT TO FINALE.2
    OUTPUT FINALE
RETURN
