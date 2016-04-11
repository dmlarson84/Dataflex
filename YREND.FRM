/SCRYREND
อออ< General Ledger / Process Year End >อออออออออออออออออออออออออออออออออออออออ

   This routine will: 

      1.  Transfer all journal entries to last year's files
      2.  Clear all journals
      3.  Move all General Ledger Totals to Last Year Column


      <<<<<  ONCE THIS ROUTINE IS STARTED DO NOT INTERRUPT  >>>>>

      C)ontinue or A)bort..............................{ _

      Process Status:  _________________________________________  ____.
                                                                 
   
      This routine will return to the main Ledger Menu when finished


/SCRLOAD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~








                  STANDBY RETURNING TO GENERAL LEDGER




/*
OPEN LEDGER         

PAGE SCRYREND
    BLANKFORM SCRYREND.2 THRU SCRYREND.3
    FORMAT SCRYREND.1      {CAPSLOCK,CHECK='CA'}
       ACCEPT SCRYREND.1
         IF SCRYREND.1 EQ 'A' GOTO QUIT_PROCESS_YREND
 
    GOSUB RESET_JOURNALS

OPEN JOURNALS
OPEN REF
   MOVE (REF.CURRENT_YR + 1 ) TO REF.CURRENT_YR
   SAVERECORD REF


    BLANKFORM SCRYREND.2 THRU SCRYREND.3
    SCREENMODE 240 ON
    MOVE ' Now moving Ledger Record # ' to SCRYREND.2
    SCREENMODE 1 ON
    FIND GE LEDGER BY RECNUM
    [FINDERR] GOTO QUIT_PROCESS_YREND
 



REPEAT
  MOVE LEDGER.RECNUM TO SCRYREND.3
  MOVE (0.00) TO LEDGER.LYTOTAL
 FOR FIELDINDEX FROM 0 TO 12
   MOVE  LEDGER.TYJAN&  TO LEDGER.LYJAN&
   MOVE (LEDGER.TYJAN& + LEDGER.LYTOTAL) TO LEDGER.LYTOTAL
   MOVE (0.00) TO LEDGER.TYJAN&
   MOVE (0.00) TO LEDGER.BJAN&
 LOOP
  MOVE (0.00) TO LEDGER.TYTOTAL
  MOVE (0.00) TO LEDGER.BYTOTAL
   IF LEDGER.BR MATCH "B" MOVE LEDGER.LYTOTAL TO LEDGER.TYBEG
  SAVERECORD LEDGER

   FIND GT LEDGER BY RECNUM
   [FOUND] LOOP
   BLANKFORM SCRYREND.2 THRU SCRYREND.3

   SCREENMODE 240 ON
   MOVE ' Now Clearing Journals' TO SCRYREND.2
   SCREENMODE 1 ON

   ZEROFILE JOURNALS

QUIT_PROCESS_YREND:
   PAGE SCRLOAD
   CHAIN "LEDGER"



RESET_JOURNALS:
SCREENMODE 240 ON
MOVE 'Now Transfering Journal Records'  TO SCRYREND.2
COPYFILE "JOURNALS.DAT" TO "LASTYRJR.DAT
COPYFILE "JOURNALS.K1" TO "LASTYRJR.K1"
COPYFILE "JOURNALS.K2" TO "LASTYRJR.K2"
COPYFILE "JOURNALS.K3" TO "LASTYRJR.K3"
SCREENMODE 1 ON
MOVE '' TO SCRYREND.2
RETURN   // for (reset_journals:)
