/HEADER												restitut.frm
/REST1                                                    
                       Restitution Entry Screen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ID No: [_____.]                                                        
Defendant Name: [______________________________]  (Last, First MI)
Address: ______________________________ Address: ______________________________
City: __________________________ St: __ Zip: _________
Identification: Physical (Y/N) _ Driver's License ________ Soc Sec _________
Description: Sex _   Race _  DOB __/__/__   Height _'__"   Weight ___ lbs.
Other ______________________________________________________________________
      ______________________________________________________________________
Previous Credit: ______.__   Total outstanding , Active Offenses: ______.__

Restitution Receipt No: [______.]      Date Received: __/__/____    
Amount: _____.__  
Method of Payment:   <_> M = Money Order      X = Credit Card
                         R = Cashier's Check  C = Cash

Edit Receipt? (Do not use if entering a new receipt) _

/RESTEDIT
        Old Information                            Updated Information
Restitution Receipt No: ______        |  Restitution Receipt No: ______
Defendant ID No: _____                |  Defendant ID No: _____
Date Received: __/__/____             |  Date Received: __/__/____
Amount: _____.__                      |  Amount: _____.__ 
Method of Payment:  <_>               |  Method of Payment:  <_>
    M = Money Order X = Credit Card  R = Cashier's Check  C = Cash
	
Reason for change: _______________________________________________________
Reason contd here: _______________________________________________________
Save changes?: _ (Y/N)

/HELP1          

                       HELP SCREEN - FUNCTION KEYS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


                         F1  =  Help Screens
                         F2  =  Back One Field
                         F3  =  Print Current Receipt
                         F4  =  Print Current Screen
                         F5  =  Not presently used
                         F6  =  Delete Current Record
                         F7  =  Go Forward a Section
                         F8  =  Go Back a Section
                         F9  =  Clear Current Record
                         F10 =  Save Restitution Record


         RIGHT/LEFT/UP/DOWN ARROWS  =  Controls Cursor Movement
                         PG DN KEY  =  Next Record in Index Order
                         PG UP KEY  =  Previous Record in Index Order
                      INS(ERT) KEY  =  Inserts Space in Field
                      DEL(ETE) KEY  =  Deletes Character in Field
                      ESC(APE) KEY  =  Aborts Current Function

/HELP2
                       HELP SCREEN - FIELD DESCRIPTIONS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  ID NO:  field containing a UNIQUE number for each defendant
         DEFENDANT NAME:  must be input in LAST, FIRST MI order
PHYSICAL IDENTIFICATION:  whether or not defendant can be recognized on sight
   OTHER IDENTIFICATION:  field for any free form information wished to be 
                          kept on the defendant
                    SEX:  M = male      F = female      U = unknown
                   RACE:  A = Asian  
                          B = Black
                          H = Hispanic
                          I = Indian
                          W = White
                          X = Unknown

 RESTITUTION RECEIPT NO:  must include defendant Id number and must be
                          UNIQUE for every restitution on file

/RCPT1


            Please enter your initials: ___
/RCPT2



                          ____________________
                          PROSECUTING ATTORNEY
                          Hot Check Account



Receipt No: _____-______                     Date: __/__/____

        Received from: ______________________________

Method of Payment: _______________          Amount: _____.__ 


Received by: ___.




/CHANGES
                          WORTHLESS CHECK SYSTEM
                        Record Changing Entry Screen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


            Operator: ___                       Date: __/__/____

            Changes: (What was changed and Why)

            _______________________________________________________ |
            _______________________________________________________ |
            _______________________________________________________ |

/NOSETUP
                             * * W A R N I N G * *

         There is no record in the HOT CHECK SETUP TABLE for ____ !!


    You MUST add a record to the Setup Table (option 7 on the Master Menu)
    and/or check that the system date is correct.





                          Press any key to continue _


/WARN1
ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
บ     Receipts can no longer be deleted by this program.    บ
บ   If you need to delete a receipt, please contact PCO.    บ
บ                                                           บ
บ               Press Any Key To Continue                   บ
บ                                                           บ
ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
/WARN2
ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
บ       This Receipt has not been deposited in the bank                   บ
บ                                                                         บ
บ       Your options are:   T)ransfer Receipt To Another Defendant        บ
บ                          D)elete Receipt / no further action required   บ
บ                                                                         บ
บ       Please enter your choice...{ _                                    บ
บ                                                                         บ
บ       ____________________________________   _____.                     บ
ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
/scrlrcpt
ษอออPartial receiptsออออออออออออออออออออป
บ Number    Date     Amount     Method  บ
บ ______. __/__/__  ______.__     _     บ
บ ______. __/__/__  ______.__     _     บ
บ ______. __/__/__  ______.__     _     บ
บ ______. __/__/__  ______.__     _     บ
บ ______. __/__/__  ______.__     _     บ
บ ______. __/__/__  ______.__     _     บ
บ ______. __/__/__  ______.__     _     บ
บ ______. __/__/__  ______.__     _     บ
บ ______. __/__/__  ______.__     _     บ
บ ______. __/__/__  ______.__     _     บ
วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ
บ<PgUp><PgDn><KeyUp><KeyDn>  <Return>   บ
ศอออออออออออออออออออออออออออออออออออออออผ
/EXIT            RESIDENT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~










              Please Standby, Closing Files and returning to the Menu
/info

  Change MAde  03/01/91 by gary grooms
               added exit screen and page command prior to any aborts

  Change Made 07/29/91 by gary grooms
              took out "J" entries -- Will not allow journal entries
              within partial receipt entry routine.
              delete all references to "J" entries

  Change Made 09/05/91 thru 09/09/91 by gary grooms
              moved the creation of journal entries into the enter. routines.

              moved the decompose date command for receipt deleting into the
              enter.delete sub routine to place the correct date into the
              journals.

              added highlights to some messages at line 24

              Added a defendant scroll window.

              Added routine to keep operator from savinga record with 0
              for a receipt number but use an old receipt number if necessary.



/*
//-------- Cannot run program from the command line (DOS)
IF NEXT_MENU LE 0 ABORT
INTEGER USER_NUMB USER$_ACCESS UHC
STRING USER$ 30
MOVE '' TO USER$
MOVE 0 TO USER$_ACCESS
MOVE 0 TO UHC
//--------------------------------------------------------
USE Y2K.PKG

Read_dfini "df23ini.cfg"

#include calcdate.inc
#include macs.frm

MULTI$ OPEN SETUP DEFENDNT RESTITUT  RECHANGE TRANSACT USERX
MULTI$ OPEN REF LEDGER JOURNALS BANK

//------------- Find Logged on User For Program Access

PAGE SET WARN1 AT 16 6 colors 79 79
PAGE SET WARN2 AT 10 1 colors 79 79
page set scrlrcpt at 6 12 colors 79 79

CLEAR USERX
MOVE USER_NUMB TO USERX.USER_NUMB
FIND EQ USERX BY INDEX.1
MOVE USERX.USER_NAME TO USER$
MOVE USERX.ACCS_LEVL TO USER$_ACCESS
MOVE USERX.HC_LEVEL TO UHC


STRING ANSW 1 YEAR 4 pmethod bell 2
string tempDesc1 55 tempDesc2 55 tempDesc3 55

INTEGER MONTH ADAY AMONTH AYEAR OLD_DEF NEW_DEF
INTEGER RDAY RMONTH RYEAR prid pseqno
integer tempID tempSeqno tempRestID

NUMBER PREVIOUS_AMT OLD_CREDIT OLD_RCPT TCREDIT pamt

DATE TODAY  pdate
SYSDATE TODAY

DATE_MACRO_INIT
DECOMPOSE_DATE TODAY TO ADAY AMONTH AYEAR

// Do I change this to 20 or remove these two lines all together?
//MOVE '20' TO YEAR
//APPEND YEAR AYEAR
MOVE ayear to year

INDICATOR DELETER LIMIT_AMT CHANGE_MADE TDISBURSE stop_num noOffenses valueChanged new

CLEAR BANK
MOVE 'HC' TO BANK.CODE
FIND EQ BANK BY INDEX.1

FORMAT CHANGES.1 THRU CHANGES.3 {REQUIRED}

AUTOPAGE REST1 1
NAME DID DNAME DADDR1 DADDR2 DCITY DST DZIP DPHYS DL DSSN DSEX DRACE
//   1   2      3      4       5   6   7     8    9  10   11    12
NAME DDOB DFT DIN DWT DOTHER DOTHER2 DCREDIT DBAL
//    13   14  15  16   17     18      19     20
NAME RSEQNO RDT RAMT RMETHOD REDIT
//    21     22  23    24     25

CLEAR SETUP
MOVE YEAR TO SETUP.YEAR
FIND EQ SETUP BY INDEX.1
[FINDERR] GOSUB NOSETUP
IF SETUP.PROSNAME LE " " GOSUB NOSETUP
IF SETUP.LSTREC LE 0 GOSUB NOSETUP

character 7 to bell

AUTOPAGE REST1

keyproc off
ENTER RESTITUT DEFENDNT
CLEAR RECHANGE
CLEAR TRANSACT

DEFENDANT:
    INDICATE DELETER FALSE
    INDICATE ALLOW_CHANGE FALSE
    page rest1
    clearxy 24 0
    gotoxy 24 8
    screenmode 112 on
    show ' Press <F9><F9> to clear , <ESC> to quit  '
    screenmode 1 on
	keyproc on
 //=   ENTRY DEFENDNT.IDNO                   {AUTOFIND,RETAIN,FORCEPUT}

def2:
	ENTRY DEFENDNT.IDNO                   {AUTOFIND,RETAIN}
    ENTRY DEFENDNT.NAME                   {AUTOFIND,RETAIN,SKIPFOUND}
    clearxy 24 0
	[FINDERR] GOSUB ERRMESG
    ENTRY DEFENDNT.ADDR        {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.ADDR2       {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.CITY        {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.ST          {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.PHYS        {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.ZIP  	   {NOENTER,RETAIN,SKIPFOUND}
	ENTRY DEFENDNT.LIC         {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.SOCSEC      {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.SEX         {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.RACE        {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.AGE         {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.FT          {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.IN          {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.LBS         {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.OTHER       {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.OTHER2      {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.CREDIT      {NOENTER,RETAIN,SKIPFOUND}
    ENTRY DEFENDNT.BAL         {NOENTER,RETAIN,SKIPFOUND}

RESTITUTION:
//    MOVE ID TO tempRestID
//	MOVE ID TO RID
//	ENTRY RESTITUT.IDNO					 {NOPUT}
	clearform rdt thru rmethod
//	[finderr] clearform rdt thru rmethod
    keyproc on
	move setup.lstrec to rest1.21
	ACCEPT rest1.21 to RESTITUT.SEQNO
	if RESTITUT.SEQNO eq setup.lstrec begin
		ENTRY RESTITUT.RECDT
		ENTRY RESTITUT.RESAMT
		ENTRY RESTITUT.TYPE	
		gosub skipseq
	end
	else begin
		find eq restitut by index.4
			
//	ENTRY RESTITUT.SEQNO		{AUTOFIND,RETAIN}
	[finderr] show 'Record not found. If it belongs to another defendant, search for them first.'
	[finderr] goto def2
	end
	move 'N' to REST1.25
	
SKIPSEQ:
	ENTRY RESTITUT.RECDT		{NOENTER,RETAIN,SKIPFOUND}	
	ENTRY RESTITUT.RESAMT		{NOENTER,RETAIN,SKIPFOUND}
	ENTRY RESTITUT.TYPE			{NOENTER,RETAIN,SKIPFOUND}


//	RELATE DEFENDNT
	reread restitut
	reread defendnt
	
//=	move rseqno to restitut.seqno
//	find eq restitut by index.4
//	[finderr] clearform rdt thru rmethod
//	[finderr] show 'Record not found. If it belongs to another defendant, search for them first.'
//	[finderr] goto def2

//	move restitut.idno to rid
	move DID to defendnt.idno 
//	find eq defendnt by index.1
	reread restitut
	reread defendnt

	accept REST1.25	to REDIT	 {CAPSLOCK,CHECK='YN'}
	
	if restitut.dep_date eq '' indicate allow_change true
	else begin
		clearform rest1
		gosub defendant
	end
	
//	[allow_change] 
	if REDIT eq 'Y' begin
		page RESTEDIT
		move RSEQNO to restedit.1	//can I do my autofind here? Or just prevent the user from messing with it?
//	    ENTERGROUP
			ENTRY RESTITUT.SEQNO	RESTEDIT.1		{AUTOFIND}
			ENTRY RESTITUT.IDNO		RESTEDIT.3		{SKIPFOUND,NOPUT,RETAIN}
			ENTRY RESTITUT.RECDT	RESTEDIT.5		{SKIPFOUND,NOPUT,RETAIN}
			ENTRY RESTITUT.RESAMT	RESTEDIT.7		{SKIPFOUND,NOPUT,RETAIN}
			ENTRY RESTITUT.TYPE		RESTEDIT.9		{SKIPFOUND,NOPUT,RETAIN}
//		ENDGROUP
		MOVE RESTITUT.SEQNO			TO RESTEDIT.2
		MOVE RESTITUT.IDNO			TO RESTEDIT.4
		MOVE RESTITUT.RECDT			TO RESTEDIT.6
		MOVE RESTITUT.RESAMT		TO RESTEDIT.8
		MOVE RESTITUT.TYPE			TO RESTEDIT.10
		ACCEPT RESTEDIT.2 //TO RESTITUT.SEQNO ? May need to do this with these accepts
		ACCEPT RESTEDIT.4 
		ACCEPT RESTEDIT.6 {RANGE = 01/01/1980,12/31/2020}
		ACCEPT RESTEDIT.8
		ACCEPT RESTEDIT.11
		ACCEPT RESTEDIT.12 TO tempDesc1
		ACCEPT RESTEDIT.13 TO tempDesc2
		
	end



//-	if DEFENDNT.IDNO ne RESTITUT.IDNO begin
//-		clearxy 24 0
//-		gotoxy 24 0
//-		screenmode 112
//-		show 'Ownership of receipts cannot be altered. Press <Space> to restart.'
//-		inkey answ
//-		screenmode 1
//		clearform rid thru rmethod
//-		clearxy 24 0
//-		goto restitution
//-	end
//-	if DID ne RESTITUT.IDNO begin
//-		clearxy 24 0
//-		gotoxy 24 0
//-		screenmode 112
//-		show 'Ownership of receipts cannot be altered. Press <Enter> to restart.'
//-		inkey answ
//-		screenmode 1
//-		clearform rseqno thru rmethod
//-		clearxy 24 0
//-		goto restitution
//-	end
//	if rest1.1 ne rest1.20 begin
//		clearxy 24 0
//		gotoxy 24 0
//		screenmode 112
//		show 'Ownership of receipts cannot be altered. Press <Enter> to restart.'
//		inkey answ
//		screenmode 1
//		clearform rid thru rmethod
//		clearxy 24 0
//		goto restitution
//	end

	if rseqno le setup.lstrec begin
//-		gosub seqnoLessThanCheck
//- Commenting this out because with the new method this won't be necessary
	end
	if rseqno gt setup.lstrec begin
		gosub seqnoGreaterThanCheck
	end

	
	
	
	
//    [finderr] clearform rdt thru rmethod
//   ifchange rest1.22 begin
//		clear RESTITUT
//		clear DEFENDNT
//		if rest1.1 ne rest1.21 begin
//			clearxy 24 0
//			gotoxy 24 4
//			screenmode 112
//			show 'Ownership of receipts cannot be altered. Press <Enter> to restart.'
//			inkey answ
//			screenmode 1
//			clearform rid thru rmethod
//			clearxy 24 0
//			goto restitution
//		end
//		if rseqno le setup.lstrec begin
//			gosub seqnoLessThanCheck
//		end
//		else if rseqno gt (setup.lstrec + 1) begin
//			gosub seqnoGreaterThanCheck
//		end
//	end
	
//	IF RSEQNO EQ '' BEGIN
//		keyproc off
//		GOTOXY 24 9
//		screenmode 112 on
//		SHOW '             Issue a new receipt number (Y/N)                     '
//		screenmode 1 on
//		move '' to answ
//		INKEY ANSW
//		keyproc on
//		CLEARXY 24 0
//		INDICATE NEW AS ANSW IN ' Yy'
//		[~ new] goto restitution
//		[NEW] BEGIN
//			GOTOXY 24 7
//			screenmode 112 on
//			SHOW '  Receipt number will not be assigned until record is saved  '
//			screenmode 1 on
//		END
//		move ( setup.lstrec + 1 ) to rseqno
//	END
	
//	[finderr] if rseqno ne '' begin
//		keyproc off
//		show bell							// What is the point of bell???
//		trim rseqno to rseqno
//		trim rid to rid
//		move rid to RESTITUT.IDNO
//		move rseqno to RESTITUT.SEQNO
//		FIND EQ RESTITUT by Index.4
//		move RESTITUT.IDNO to tempID
//		trim tempID to DEFENDNT.IDNO
//		FIND EQ DEFENDNT by Index.1
//		if RESTITUT.IDNO ne DEFENDNT.IDNO begin
//			clearxy 24 0
//			gotoxy 24 4
//			screenmode 112
//			show 'Ownership of receipts cannot be altered. Press <Enter> to restart.'
//			inkey answ
//			screenmode 1
//			clearform rid thru rmethod
//			clearxy 24 0
//			goto restitution
//			end
		// Under no condition will we re-use a receipt sequence number that we're past. 
		// If the user enters one, bounce them back to the start.
		// We'll do the same if they try to enter a receipt sequence number that's past the last record, too.
		// If rseqno is the the same 
 
//			trim rseqno to rseqno
//			trim rid to rid
//			move rseqno to RESTITUT.SEQNO
//			FIND EQ RESTITUT BY INDEX.4
//			if RESTITUT.IDNO ne rid begin //Doing this again in case user tries to edit invalid receipt.
//				clearxy 24 0
//				gotoxy 24 4
//				screenmode 112
//				show 'Receipt is tied to another def and cannot be changed. Press <Enter> to restart.'
//				inkey answ
//				screenmode 1
//				clearform rid thru rmethod
//				clearxy 24 0
//				goto restitution
//				end		

//		end
	
	
//-	keyproc on
//-    ENTRY RESTITUT.RECDT       			{required}
//-    LEFT RDT TO MONTH 2
//-    MOVE MONTH TO RESTITUT.MONTH
//-    [new] CLEARXY 24 0
	
AMT:
	move defendnt.credit to OLD_CREDIT
//	if defendnt.credit to 
//-	MOVE DEFENDNT.CREDIT TO OLD_CREDIT
//-	IF DEFENDNT.CREDIT EQ 0 INDICATE LIMIT_AMT TRUE
//-	if DEFENDNT.BAL eq 0 indicate noOffenses true
//-	MOVE RESTITUT.RESAMT TO OLD_RCPT
//-	ENTRY RESTITUT.RESAMT      {POINTS=2,RANGE=.01,999999.99}
//-	indicate valueChanged as ramt ne OLD_RCPT
//-	[~new] [valueChanged] if RESTITUT.DEP_DATE ne '' begin
//-		clearxy 24 0
//-		screenmode 112
//-		show ' Deposited receipt $ values cannot be changed. Contact PCO for support. '
//-		inkey answ
//-		clearxy 24 0
//-		screenmode 1
//		CLEARFORM RID THRU RMETHOD
//-		goto restitution
//-	end
	
//-	[new][noOffenses] begin			// Checking for new turned out to be the trick here.
//-		clearxy 24 0
//-		gotoxy 24 2
//-		screenmode 112
//-		show ' WARNING Defendant has no active offenses. Enter receipt anyway? (Y/N) '
//-		inkey answ
//-		clearxy 24 0
//-		screenmode 1
//-		if answ in 'Nn' begin
//			CLEARFORM RID THRU RMETHOD
//-			goto restitution
//-		end
//-	end
		
    IF ~ STATUS RESTITUT BEGIN
        GOTOXY 24 7
        screenmode 112 on
        SHOW '  Press F4 AFTER restitution has been saved to print receipt   '
        screenmode 1 on
    END
//-    ENTRY RESTITUT.TYPE        {CAPSLOCK,CHECK='MRCX'}
	[new] MOVE 'A' TO RESTITUT.UPDATE						// Does this mark it undeposited?? Are there situations an existing receipt being edited could be marked new==true??
	[new] MOVE 'RE' TO RESTITUT.JR				// Moves RE to .JR instead of HR because it has not been disbursed yet.
	CLEARXY 24 0
    GOTOXY 24 17
    screenmode 112 on
    SHOW '    SAVING RESTITUTION RECORDS    '
    screenmode 1 on
	DECOMPOSE_DATE RDT TO RDAY RMONTH RYEAR
RETURN

enter.delete:
	// The easiest way to handle this would probably just be to leave it here blank except for the return command
	// This allows me to override the default delete record behavior with nothing. I could try to do it at the FlexKey level instead.
	
	// I leave this warning message about deleting receipts as a placeholder. I'll put a message here simply saying
	// that they can't be deleted anymore. This should bounce them back to the start.
    PAGE WARN1
    INKEY ANSW
    CLEAR RESTITUT
    abort
return

ENTER.EDIT:
	ifchange restedit.13 indicate allow_change true
	[~ ALLOW_CHANGE]  if status restitut if restitut.jr ne 'RE' begin
		page WARN1
		inkey answ
		clear restitut
		return return DEFENDANT
		end
	
	[~ deleter] if restitut.dep_date eq ''  
//-    if status restitut IFCHANGE  RMETHOD INDICATE ALLOW_CHANGE TRUE
//-    [~ ALLOW_CHANGE] IFCHANGE RDT INDICATE ALLOW_CHANGE TRUE
//-    [~ ALLOW_CHANGE] IF STATUS RESTITUT IF RESTITUT.JR NE 'RE' BEGIN
//-		PAGE WARN1
//-		INKEY ANSW
//-		CLEAR RESTITUT
//-		RETURN return DEFENDANT
//-		END
//-	[~ DELETER] IF RESTITUT.DEP_DATE EQ '';
//-                 IF OLD_RCPT NE RAMT GOSUB EDIT_RECEIPT
//-	ENTDISPLAY DEFENDNT
//-	if status restitut IFCHANGE RAMT INDICATE CHANGE_MADE TRUE
//-	[CHANGE_MADE] GOSUB RECORD_CHANGE
//-	[CHANGE_MADE] GOSUB RECORD_TRANSACT
RETURN

ENTER.SAVE:
	[new][~ deleter]  GOSUB NEW_JR_RECEIPT
	[~ new][~ deleter] IF RSEQNO EQ '' IF RAMT NE '' GOSUB NEW_RECEIPT
	[new][~ stop_num]  GOSUB NEW_RECEIPT
//	move rid to prid
//	move rseqno to pseqno
//	move rdt to pdate
//	move rmethod to pmethod
//	move ramt to pamt
	[new] DISPLAY SETUP.LSTREC TO REST1.22
	[new] MOVE SETUP.LSTREC TO RESTITUT.SEQNO
	INDICATE CHANGE_MADE FALSE
	[new] begin
		CALC (DEFENDNT.CREDIT + RESTITUT.RESAMT) TO DEFENDNT.CREDIT
		SAVERECORD DEFENDNT
		ENTDISPLAY DEFENDNT
		entdisplay restitut
	end
    indicate new false
    indicate deleter false
    CLEARXY 24 0
RETURN

ENTEREND

NEW_RECEIPT:
  [stop_num] goto pass_new
          CLEAR SETUP
          MOVE YEAR TO SETUP.YEAR
          FIND EQ SETUP BY INDEX.1
          MOVE (SETUP.LSTREC + 1) TO RSEQNO
          MOVE RSEQNO TO SETUP.LSTREC
          ENTDISPLAY SETUP
          SAVERECORD SETUP      

pass_new:
RETURN

//========< keyproc section >================================================

keyproc key.return
	
	move rseqno to restitut.seqno
	find eq restitut by index.4
//	move restitut.idno to rid
	move DID to defendnt.idno 
	find eq defendnt by index.1
	
//-	if DEFENDNT.IDNO ne RESTITUT.IDNO begin
//-		clearxy 24 0
//-		gotoxy 24 0
//-		screenmode 112
//-		show 'Ownership of receipts cannot be altered. Press <Spac> to restart.'
//-		inkey answ
//-		screenmode 1
//		clearform rid thru rmethod
//-		clearxy 24 0
//-		goto restitution
//-	end
//-	if DID ne RESTITUT.IDNO begin
//-		clearxy 24 0
//-		gotoxy 24 0
//-		screenmode 112
//-		show 'Ownership of receipts cannot be altered. Press <Ente> to restart.'
//-		inkey answ
//-		screenmode 1
//-		clearform rseqno thru rmethod
//-		clearxy 24 0
//-		goto restitution
//-	end
//	entagain
	return



keyproc key.any
   clearxy 24 0
return

KEYPROC KEY.ESCAPE
  GOTOXY 24 8
  screenmode 112 on
  SHOW '    Do you really want to return to the main menu (Y/N)?    '
  screenmode 1 on
  INKEY ANSW
  if answ in 'Yy' page exit
  IF ANSW IN 'Yy' ABORT
  CLEARXY 24 0
  ENTAGAIN
  RETURN

KEYPROC KEY.PRINT

 if status restitut begin        // routine to print receipt if old receipt
//   move rid to prid             // is called up to the buffer
    move rseqno to pseqno
    move rdt to pdate
    move rmethod to pmethod
    move ramt to pamt
  end

  GOTOXY 24 7
  screenmode 112 on
  SHOW "        Please Wait ...... Printing Current Receipt           "
  screenmode 1 on
  PRINT SETUP.PROSNAME TO RCPT2.1
  PRINT pRID TO RCPT2.2
  PRINT pSEQNO TO RCPT2.3
  PRINT pDaTe TO RCPT2.4
  PRINT DNAME    TO RCPT2.5 
  IF pMETHOD EQ "M" PRINT "Money Order    " TO RCPT2.6
  IF pMETHOD EQ "R" PRINT "Cashier's Check" TO RCPT2.6
  IF pMETHOD EQ "C" PRINT "Cash           " TO RCPT2.6
  IF pMETHOD EQ "X" PRINT "Credit Card    " TO RCPT2.6
  PRINT pAMT TO RCPT2.7
  PRINT user_numb TO RCPT2.8
  OUTPUT RCPT2
  DESPOOL
  CLEARXY 23 0
  clear restitut
//  clearform rid thru rmethod
  RETURN 

KEYPROC KEY.UP
	backfield
return

//=======<subroutines>========================================================

ERRMESG:
 keyproc off
  clearxy 24 0
  GOTOXY 24 9
  screenmode 112 on
  show  "    Defendant record not found - Try again (Y/N)?    "
  screenmode 1 on
  inkey answ
  keyproc on
  CLEARXY 24 0
  IF ANSW IN "Yy" BEGIN
    clearform rest1
    clearxy 24 0
    RETURN DEF2
  END 
  ELSE BEGIN
    clearform rest1
    clearxy 24 0
  END
return defendant

RECORD_CHANGE:
       MOVE 'RESTITUT' TO RECHANGE.FILE
       MOVE DCREDIT TO RECHANGE.OLD_CREDIT
       MOVE DEFENDNT.CREDIT TO RECHANGE.NEW_CREDIT
       CLEARFORM CHANGES
       PAGE CHANGES
       DISPLAY USER_NUMB TO CHANGES.1
       MOVE CHANGES.1 TO RECHANGE.OPERATOR
       DISPLAY TODAY TO CHANGES.2
       MOVE CHANGES.2 TO RECHANGE.DATE
       [DELETER] MOVE 'RECORD DELETED ' TO CHANGES.3         
       [DELETER] GOTO PASS_DESC
       ACCEPT CHANGES.3 TO RECHANGE.DESC1
PASS_DESC:   
       ACCEPT CHANGES.4 TO RECHANGE.DESC2
       ACCEPT CHANGES.5 TO RECHANGE.DESC3
//	   MOVE RID TO RECHANGE.ID_NUMBER
       MOVE RSEQNO TO RECHANGE.CONTROL_NUMBER
       MOVE RESTITUT.RESAMT TO RECHANGE.OLD_RESAMT   
       [~DELETER] MOVE RAMT TO RECHANGE.NEW_RESAMT
       [CHANGE_MADE] BEGIN
             MOVE TODAY TO TRANSACT.DATE//           MOVE RID TO TRANSACT.IDNO
             MOVE RSEQNO TO TRANSACT.CTRL_SEQ_NO
             MOVE REST1.2 TO TRANSACT.DEF_NAME
             MOVE 'RESTITUT' TO TRANSACT.FILE
             MOVE (RAMT - OLD_RCPT) TO TRANSACT.RESAMT
             MOVE ((DCREDIT + (RAMT - OLD_RCPT)) - DCREDIT) TO TRANSACT.CREDIT
             MOVE CHANGES.3 TO TRANSACT.DESC1
             MOVE CHANGES.4 TO TRANSACT.DESC2
             MOVE CHANGES.5 TO TRANSACT.DESC3
           END
       SAVERECORD RECHANGE
       RETURN

NOSETUP:
      MOVE YEAR TO NOSETUP.1
      ACCEPT NOSETUP.2
      page exit
      ABORT
RETURN

RECORD_TRANSACT:
    SAVERECORD TRANSACT
    CLEAR TRANSACT
  RETURN



NEW_JR_RECEIPT:
    //DEBIT ENTRY
          MOVE REF.DEPOSITS TO JOURNALS.GL
          MOVE RAMT TO JOURNALS.AMOUNT
         GOSUB GL_JRNLS

    //CREDIT ENTRY
          MOVE (1215) TO JOURNALS.GL
          MOVE (RAMT * (-1)) TO JOURNALS.AMOUNT
         GOSUB GL_JRNLS
    
RETURN

EDIT_RECEIPT:
    IF OLD_RCPT LT RAMT BEGIN

     //DEBIT ENTRY
          MOVE REF.DEPOSITS TO JOURNALS.GL
          MOVE (RAMT - OLD_RCPT) TO JOURNALS.AMOUNT
         GOSUB GL_JRNLS

     //CREDIT ENTRY
          MOVE (1215) TO JOURNALS.GL
          MOVE ((RAMT - OLD_RCPT) * (-1)) TO JOURNALS.AMOUNT
         GOSUB GL_JRNLS

         move (defendnt.credit - (ramt - old_rcpt)) to defendnt.credit
         saverecord defendnt
    END

    IF OLD_RCPT GT RAMT BEGIN

         //DEBIT ENTRY
              MOVE (1215) TO JOURNALS.GL
              MOVE (OLD_RCPT - RAMT) TO JOURNALS.AMOUNT
              GOSUB GL_JRNLS

         //CREDIT ENTRY
              MOVE REF.DEPOSITS TO JOURNALS.GL
              MOVE ((OLD_RCPT - RAMT) * (-1)) TO JOURNALS.AMOUNT
              GOSUB GL_JRNLS

          move (defendnt.credit - (old_rcpt - ramt)) to defendnt.credit
          saverecord defendnt
    END

FIND_GL:
   MOVE JOURNALS.GL TO LEDGER.NUMBER
   MOVE JOURNALS.BR TO LEDGER.DISTRICT
   MOVE JOURNALS.DP TO LEDGER.DIVISION
    FIND EQ LEDGER BY INDEX.1
RETURN

UPDATE_GL:
    MOVE (JOURNALS.MN - 1) TO FIELDINDEX
    MOVE (LEDGER.TYJAN& + JOURNALS.AMOUNT) TO LEDGER.TYJAN&
    MOVE (LEDGER.TYTOTAL + JOURNALS.AMOUNT) TO LEDGER.TYTOTAL
RETURN 

GL_JRNLS:
     [~ DELETER] MOVE 'RE' TO JOURNALS.JR
     [DELETER] MOVE 'RD' TO JOURNALS.JR
     MOVE RYEAR TO JOURNALS.YR
     MOVE RMONTH TO JOURNALS.MN
     MOVE RDAY TO JOURNALS.DY
     MOVE REF.DISTRICT TO JOURNALS.BR
     MOVE '20' TO JOURNALS.DP
     MOVE DEFENDNT.NAME TO JOURNALS.DESC
     MOVE DEFENDNT.IDNO TO JOURNALS.EMPLY
     MOVE '' TO JOURNALS.JOB  
     MOVE (REF.REF_NUM + 1) TO JOURNALS.CHK
     MOVE (REF.REF_NUM +1 ) TO REF.REF_NUM
      SAVERECORD REF
      GOSUB FIND_GL
      GOSUB UPDATE_GL
    SAVE JOURNALS LEDGER
    CLEAR JOURNALS LEDGER
RETURN

seqnoLessThanCheck:
	clearxy 24 0
	gotoxy 24 0
	show ' Receipt number already in use. Press <Y> to edit receipt or <N> to start over.'
	screenmode 1 on
	inkey answ
	keyproc on
	indicate stop_num as answ in 'Yy' //will not increase setup receipt number if this indicator set true
	[~ stop_num] begin
//		clearform rid thru rmethod
		clearxy 24 0
		goto restitution
		end
	clearxy 24 0
	return
	
seqnoGreaterThanCheck:
	clearxy 24 0
	gotoxy 24 1
	show ' Receipt number greater than next setup number. Press <SPACE> to start over. '
	screenmode 1 on
	inkey answ
	keyproc on
//	clearform rid thru rmethod
	clearxy 24 0
	goto restitution
	return