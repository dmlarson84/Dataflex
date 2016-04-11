/PAGE1                                                    hotledg.frm
                          WORTHLESS CHECK SYSTEM
Defendant Entry Screen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ID No: [_____.]                                                        
Defendant Name: [______________________________]  (Last, First MI)
Address: _________________________ City: _______________ St: __ Zip: _________
Identification: Physical (Y/N) _ Driver's License ________ Soc Sec _________
                Other ______________________________________________________
Description: Sex _   Race _   DOB __/__/____  Height _.'_."  Weight __. lbs.
Previous Credit: _____.__
/HEADER
                        SUBSIDIARY RESTITUTION LEDGER
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ID #:   _____.                  Name: ______________________________
DL #:   ________             Address: _________________________ _______________

Date  Ctrl  Merch   Rest    Rest      Paid/    Chgs     PA       Mer     Bal 
       No   #/Name  Paid    Avail     Holder            Fee      Fee     Owed

/SUBHEADER1                                      //Receipts
__/__/____  ____________________________________________________
                ______.__ _____.__                                     _____.__
/BODY                                            //Disbursements
__/__/____  ___________________________________________________________
    _____.                _____.__ ______.__ (____.__)        (___.__)
      __________________  _____.__   ____.__          (___.__)       
/TOTAL

TOTALS          ______.__ _____.__ ______.__ _____.__ ____.__ ____.__ ______.__
/UNPAID                                          //Offenses
__/__/____  _@______________________________________  Active: _
    _____.                                    ____.__  ___.__  ___.__  _____.__
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

#include calcdate.inc
#include macs.frm

//------------------------------------------------------------

#COMMAND SUBSREPORT    T "BY""DOWN" VFW%LGR "BREAK""" 
  #CHECK !1.RECNUM _UVCWG%L 
  //           INTEGER RECCOUNT 
  #REPLACE RECCOUNT |VI!D 
  #SET P$ 0 
  //           MOVEINT 20000 TO LINECOUNT  // start with   a full page 
//  !A []  $82 |CI20000 |VI10 
  //           MOVE 0 TO     RECCOUNT 
  !A []  $82 |CI0 RECCOUNT 
  //           BREAKINIT                 // init breakpoints 
  !A []  $207 
  //           INDICATE FIRSTREC  TRUE   // used for subtotals 
  #IFDEF FIRSTREC 
  #ELSE 
    #REPLACE FIRSTREC |!C 
  #ENDIF 
  !A []  $4028 |CI0 |CI0     FIRSTREC~ 
  #IFSAME !2 BY 
    FIND GE !1 BY !3           // FIND first     record 
  #ELSE 
    FIND LE !1 BY !3 
  #ENDIF 
  [~FOUND] GOTO    END$OF$REPORT 
  //           CLEARSCREEN          // start with a clear screen 
//  !A []  $144 
  RPT.LOOP:// INDICATE SELECT     TRUE   // default for SELECT 
  #IFDEF SELECT 
  #ELSE 
    #REPLACE SELECT |!C 
  #ENDIF 
  !A []  $4028 |CI0 |CI0     SELECT~ 
  //           GOSUB RPT.SELECTION       // go   to user   selection 
  !A []  $42 |CL0 
  #FREF  RPT.SELECTION !a 
  //[NOT SELECT] GOTO RPT.CONT           // test SELECT 
  !A [~  SELECT]   $41 |CL0 
  #FREF  RPT.CONT !a 
  BREAK$ !5 !6 !7 !8 !9       // set breakpoints 
  #SET X$ !p                   // set up to break down 
  [NOT FIRSTREC] BREAK$DOWN RPT.SUBTOTAL  // break down for SUBTOTAL 
  #SET X$ 0                    // set up to break up 
  //           RELATE !1                 // get related records 
  !A []  $C4 !1.RECNUM 
  BREAK$UP RPT.SUBHEADER      // break up for SUBHEADER 
  //           INCREMENT     RECCOUNT 
  !A []  $083 RECCOUNT |CI0 
  //           GOSUB RPT.BODY            // print body 
  !A []  $42 |CL0 
  #FREF  RPT.BODY !a 
  //           INDICATE FIRSTREC  FALSE       // not first any more 
  !A []  $4028 |CI0 |CI0     FIRSTREC 
  RPT.CONT: 
  #IFSAME !2 BY 
    FIND GT !1 BY !3           // FIND next record 
  #ELSE 
    FIND LT !1 BY !3 
  #ENDIF 
  //           KEYCHECK             // check keyboard 
  !A []  $46 
  //[FOUND NOT KEYPRESS] GOTO RPT.LOOP   // if   ok, loop 
  !A [FOUND ~ KEYPRESS] $41 RPT.LOOP 
  //[KEYPRESS]     GOSUB RPT.KEYPRESS    // user can disable KEYPRESS
  !A [KEYPRESS]    $42 |CL0 
  #FREF  RPT.KEYPRESS !a 
  #SET X$ !p                   // set up for     break down 
  END.OF.REPORT: 
  [~ FIRSTREC]     BREAK$DOWN RPT.SUBTOTAL  $X  // break down for last subtotals

  //[FIRSTREC]     GOSUB RPT.TOTAL            // print TOTAL 
  !A [~  FIRSTREC] $42 |CL0 
  #FREF  RPT.TOTAL !a 
  //           GOTO END$OF$REPORT   // GOTO end 
  !A []  $41 |CL0 
  #FREF  END$OF$REPORT !a 
  NEWPAGE://  GOSUB RPT.HEADER      // new page, print HEADER 
  !A []  $42 |CL0 
  #FREF  RPT.HEADER !a 
  #SET X$ 0    // this will reprint the     page headers if included // 
  [NOT FIRSTREC] BREAK$PRT SUBHEADER     // reprint pages 
  //           RETURN               // end of NEWPAGE 
  !A []  $43 |CI0 
  RPT.SELECTION:               // selection starts after REPORT 
#ENDCOMMAND 


OPEN DEFENDNT 
OPEN OFFENSE
OPEN RESTITUT
OPEN DISBURSE INDEX.1

//-------------- Find Logged On User For Program Use
OPEN USERX
CLEAR USERX
MOVE USER_NUMB TO USERX.RECNUM
FIND EQ USERX BY RECNUM
MOVE USERX.USER_NAME TO USER$
MOVE USERX.ACCS_LEVL TO USER$_ACCESS
//----------------------------------------------------


direct_output "led.txt"

STRING ANSW 1 LINE 80 MERCH 40
INTEGER COUNTER COMP CT 
NUMBER TOTAL_CHARGES BALANCE REST_AVAIL D_MFEE JE_AMT PAID_HOLDER
NUMBER TOTAL_PFEE TOTAL_MFEE TOTAL_PAID TOTAL_REST

MOVE 0 TO JE_AMT
MOVE 22 TO PAGEEND
MOVE -1 TO PAGEFEED

ENTERGROUP 
    AUTOPAGE PAGE1
    ENTRY DEFENDNT.IDNO                   {AUTOFIND}
    ENTRY DEFENDNT.NAME                   {AUTOFIND}
    ENTRY DEFENDNT.ADDR                   {SKIPFOUND}
    

    ENTRY DEFENDNT.CITY                   {SKIPFOUND}
    ENTRY DEFENDNT.ST                     {SKIPFOUND}
    ENTRY DEFENDNT.ZIP                    {SKIPFOUND}
    ENTRY DEFENDNT.PHYS                   {SKIPFOUND}
    ENTRY DEFENDNT.LIC                    {SKIPFOUND}
    ENTRY DEFENDNT.SOCSEC                 {SKIPFOUND}
    ENTRY DEFENDNT.OTHER                  {SKIPFOUND}
    ENTRY DEFENDNT.SEX                    {SKIPFOUND}
    ENTRY DEFENDNT.RACE                   {SKIPFOUND}
    ENTRY DEFENDNT.AGE                    {SKIPFOUND}
    ENTRY DEFENDNT.FT                     {SKIPFOUND}
    ENTRY DEFENDNT.IN                     {SKIPFOUND}
    ENTRY DEFENDNT.LBS                    {SKIPFOUND}
    ENTRY DEFENDNT.CREDIT                 {SKIPFOUND}
ENDGROUP

CLEARSCREEN
PRINT DEFENDNT.IDNO TO HEADER.1
PRINT DEFENDNT.NAME TO HEADER.2
PRINT DEFENDNT.LIC TO HEADER.3
PRINT DEFENDNT.ADDR TO HEADER.4 
PRINT DEFENDNT.CITY TO HEADER.5
OUTPUT HEADER

CLEAR OFFENSE                                                   //Find offenses
INDICATE NOTOT TRUE
MOVE PAGE1.1 TO OFFENSE.IDNO
FIND GT OFFENSE BY INDEX.3
[FOUND] WHILE OFFENSE.IDNO EQ PAGE1.1 
           RELATE OFFENSE
           AUTOPAGE UNPAID
           PRINT OFFENSE.CKDT
           MOVE OFFENSE.MERCHANT TO MERCH
           APPEND MERCH ' ' OFFENSE.NAME
           PRINT MERCH
           PRINT OFFENSE.ACTIVE
           PRINT OFFENSE.CTRLNO
           PRINT OFFENSE.CKAMT
           CALC (TOTAL_CHARGES + OFFENSE.CKAMT) TO TOTAL_CHARGES
           PRINT OFFENSE.PFEE
           CALC (TOTAL_PFEE + OFFENSE.PFEE) TO TOTAL_PFEE
           PRINT OFFENSE.MFEE
           CALC (TOTAL_MFEE + OFFENSE.MFEE) TO TOTAL_MFEE
           CALC (BALANCE + OFFENSE.PFEE + OFFENSE.MFEE + OFFENSE.CKAMT) TO BALANCE
	   IF OFFENSE.ACTIVE IN 'BPFIM' BEGIN
		CALC (TOTAL_CHARGES - OFFENSE.CKAMT) TO TOTAL_CHARGES
		CALC (TOTAL_PFEE - OFFENSE.PFEE) TO TOTAL_PFEE 
		CALC (TOTAL_MFEE - OFFENSE.MFEE) TO TOTAL_MFEE
 		CALC (BALANCE - OFFENSE.PFEE - OFFENSE.MFEE - OFFENSE.CKAMT) TO BALANCE
	   END
           PRINT BALANCE
        IF LINECOUNT EQ 0 BEGIN
          CLEARSCREEN
          OUTPUT HEADER
        END
           PAGECHECK 2
[PAGEBREAK] BEGIN
              CLEARSCREEN
              OUTPUT HEADER
            END
            OUTPUT UNPAID
           FIND GT OFFENSE BY INDEX.3
[FINDERR]  CLEAR OFFENSE
        END

CLEAR RESTITUT                                                  //Find receipts
MOVE PAGE1.1 TO RESTITUT.IDNO
SUBSREPORT RESTITUT BY INDEX.1 BREAK RESTITUT.OVERLAP

INDICATE SELECT AS RESTITUT.IDNO EQ PAGE1.1
[~ SELECT] GOTO END.OF.REPORT

SECTION SUBHEADER1
        BLANKFORM SUBHEADER1
        PRINT RESTITUT.RECDT 
        MOVE 'Receipt #: ' TO LINE
        APPEND LINE RESTITUT.SEQNO
        IF RESTITUT.TYPE EQ 'J' APPEND LINE '  --  JE'
        PRINT LINE
        IF RESTITUT.TYPE NE 'J' BEGIN
         CALC (TOTAL_REST + RESTITUT.RESAMT) TO TOTAL_REST
         CALC (REST_AVAIL + RESTITUT.RESAMT) TO REST_AVAIL
        END
        PRINT RESTITUT.RESAMT TO SUBHEADER1.3
        PRINT REST_AVAIL TO SUBHEADER1.4
        CALC (BALANCE - RESTITUT.RESAMT) TO BALANCE
        PRINT BALANCE TO SUBHEADER1.5
        IF LINECOUNT EQ 0 BEGIN
          CLEARSCREEN
          OUTPUT HEADER
        END
        PAGECHECK 2
[PAGEBREAK] BEGIN
              CLEARSCREEN
              OUTPUT HEADER
            END
        OUTPUT SUBHEADER1

SECTION BODY                                               //Find disbursements
        CLEAR DISBURSE
        MOVE RESTITUT.OVERLAP TO DISBURSE.OVERLAP
        FIND GE DISBURSE BY INDEX.1
[FOUND] WHILE DISBURSE.OVERLAP EQ RESTITUT.OVERLAP
          RELATE DISBURSE
          AUTOPAGE BODY
          PRINT DISBURSE.DISPDT
          MOVE OFFENSE.MERCHANT TO LINE
          TRIM OFFENSE.NAME TO MERCH
          APPEND LINE ' ' MERCH
          IF DISBURSE.MANUAL EQ 'J' APPEND LINE ' -- JE'
          IF DISBURSE.MANUAL NE 'J' APPEND LINE ' Disb. Ck # ' DISBURSE.CHKNO
          PRINT LINE
          PRINT DISBURSE.SEQNO
          IF DISBURSE.MANUAL NE 'J' BEGIN
              CALC (REST_AVAIL - DISBURSE.DISPAMT) TO REST_AVAIL
          END
          PRINT REST_AVAIL
          MOVE DISBURSE.DISPAMT TO PAID_HOLDER
          //IF DISBURSE.MANUAL EQ 'J' MOVE JE_AMT TO PAID_HOLDER
          PRINT PAID_HOLDER
          PRINT OFFENSE.CKAMT
          CALC (DISBURSE.DISPAMT - OFFENSE.CKAMT) TO D_MFEE
          PRINT D_MFEE      
          CALC (TOTAL_CHARGES - OFFENSE.CKAMT) TO TOTAL_CHARGES
          CALC (TOTAL_MFEE - D_MFEE) TO TOTAL_MFEE
          MOVE '' TO LINE
          IF DISBURSE.MANUAL NE 'J' BEGIN
            MOVE 'Pros. Ck # ' TO LINE
            APPEND LINE DISBURSE.PCKNO
          END
          PRINT LINE
          IF DISBURSE.MANUAL NE 'J' BEGIN
              CALC (REST_AVAIL - DISBURSE.PROSAMT) TO REST_AVAIL
          END
          PRINT REST_AVAIL
          MOVE DISBURSE.PROSAMT TO PAID_HOLDER
          //IF DISBURSE.MANUAL EQ 'J' MOVE JE_AMT TO PAID_HOLDER
          PRINT PAID_HOLDER
          PRINT DISBURSE.PROSAMT
          CALC (TOTAL_PFEE - DISBURSE.PROSAMT) TO TOTAL_PFEE
          IF DISBURSE.MANUAL NE 'J' BEGIN
              CALC (BODY.5 + BODY.10 + TOTAL_PAID) TO TOTAL_PAID
          END
        IF LINECOUNT EQ 0 BEGIN
          CLEARSCREEN
          OUTPUT HEADER
        END
          PAGECHECK 3
[PAGEBREAK] BEGIN
              CLEARSCREEN
              OUTPUT HEADER
            END
          OUTPUT BODY
          FIND GT DISBURSE BY INDEX.1
[FINDERR] CLEAR DISBURSE
       END

SECTION TOTAL
        PRINT TOTAL_REST
        PRINT REST_AVAIL
        PRINT TOTAL_PAID
        PRINT TOTAL_CHARGES
        PRINT TOTAL_PFEE
        PRINT TOTAL_MFEE
        PRINT SUBHEADER1.5
        IF LINECOUNT EQ 0 BEGIN
          CLEARSCREEN
          OUTPUT HEADER
        END
        PAGECHECK 2
[PAGEBREAK] BEGIN
              CLEARSCREEN
              OUTPUT HEADER
            END
        OUTPUT TOTAL
        INDICATE NOTOT FALSE

REPORTEND

[NOTOT] BEGIN
   BLANKFORM TOTAL
   AUTOPAGE TOTAL 4
   PRINT TOTAL_CHARGES
   PRINT TOTAL_PFEE
   PRINT TOTAL_MFEE
   PRINT BALANCE
   OUTPUT TOTAL
END
INKEY ANSW
ABORT

KEYPROC KEY.ESCAPE
        ABORT
