//********************** S T A R T    O F   C U S T O M

#COMMAND CENTERFIELD E#LGUR "TO" NDIE#LCGUR
   #IFDEF STR$CENTER
   #ELSE
     STRING STR$CENTER 128 TMP$CENTER 128 FILL$CENTER 128
     INTEGER SRC$CENTER DEST$CENTER
     MOVE "." TO FILL$CENTER
     FOR DEST$CENTER FROM 1 TO 7
       APPEND FILL$CENTER FILL$CENTER
     LOOP
   #ENDIF
   TRIM !1 TO TMP$CENTER
   LENGTH TMP$CENTER TO SRC$CENTER
   MOVE FILL$CENTER TO !3
   LENGTH !3 TO DEST$CENTER
   PAD " " TO STR$CENTER ((DEST$CENTER-SRC$CENTER)/2)
   APPEND STR$CENTER TMP$CENTER
   MOVE STR$CENTER TO !3
#ENDCOMMAND


#COMMAND DATE_MACRO_INIT
    INDICATOR ZUSA ZEURO ZMIL
    DATE ZTEMP
    STRING ZSTR 10 ZDELIM 1 ZT 2
    INTEGER ZMONTH ZDAY ZYEAR

    MOVE 29251 TO ZTEMP // 29251 = 2/1/80 (USA FORMAT)
    MOVE ZTEMP TO ZSTR
    POS '01' IN ZSTR TO ZDAY
    POS '02' IN ZSTR TO ZMONTH
    POS '1980' IN ZSTR TO ZYEAR

    MID ZSTR TO ZDELIM 1 3
    INDICATE ZUSA AS ZDAY EQ 4
    INDICATE ZEURO AS ZDAY EQ 1
    INDICATE ZMIL AS ZDAY EQ 7
#ENDCOMMAND

#COMMAND DECOMPOSE_DATE RUSNIE#OLCG "TO" RUDE#OLCG RUDE#OLCG RUDE#OLCG
    // USEAGE: DECOMPOSE_DATE SOURCE_DATE TO DEST_DAY DEST_MONTH DEST_YEAR
    // SOURCE_DATE MUST BE OF TYPE DATE
    // DESTINATION PARAMETERS MAY BE STRING, INTEGER , OR NUMBER
    MID !1 TO !3 2 ZDAY
    MID !1 TO !4 2 ZMONTH
    MID !1 TO !5 4 ZYEAR
#ENDCOMMAND
#COMMAND COMPOSE_DATE RUD#OLG RUD#OLG RUD#OLG "TO" RUSNIE#OLG
    // USEAGE: COMPOSE_DATE SOURCE_DAY SOURCE_MONTH SOURCE_YEAR TO DEST_DATE
    // DEST_DATE MUST BE OF TYPE DATE
    // SOURCE PARAMETERS MAY BE STRING,INTEGER,OR NUMBER
    MOVE '' TO ZSTR
    [ZUSA] APPEND ZSTR !2 ZDELIM !1 ZDELIM !3
    [ZEURO] APPEND ZSTR !1 ZDELIM !2 ZDELIM !3
    [ZMIL] APPEND ZSTR !3 ZDELIM !2 ZDELIM !1
    MOVE ZSTR TO !5
#ENDCOMMAND
#COMMAND FIRST_DAY_OF_MONTH RUNSNI#OLCG "TO" RUSNIE#OLCG
  // USEAGE: FIRST_DAY_OF_MONTH DATE TO DATE
  #IFDEF XDAY
  #ELSE
     INTEGER XDAY XMONTH XYEAR       
  #ENDIF
  DECOMPOSE_DATE !1 TO XDAY XMONTH XYEAR
  COMPOSE_DATE 1 XMONTH XYEAR TO !3
#ENDCOMMAND
#COMMAND LAST_DAY_OF_MONTH RUSNI#OLCG "TO" RUSNIE#OLCG
   // USEAGE: LAST_DAY_OF_MONTH DATE TO DATE
   #IFDEF XDAY
   #ELSE
      INTEGER XDAY XMONTH XYEAR XTEMP
   #ENDIF
   DECOMPOSE_DATE !1 TO XDAY XMONTH XYEAR
   IF XMONTH EQ 12 COMPOSE_DATE 31 XMONTH XYEAR TO !3
   ELSE BEGIN
        COMPOSE_DATE 1 (XMONTH+1) XYEAR TO !3
        MOVE (!3-1) TO !3
   END
#ENDCOMMAND
#COMMAND NEXT_MONTH RUSNI#OLCG "TO" RUSNI#OLCG
  // USEAGE: NEXT_MONTH DATE TO DATE
  #IFDEF XDAY
  #ELSE
     INTEGER XDAY XMONTH XYEAR XTEMP
  #ENDIF
  DECOMPOSE_DATE !1 TO XDAY XMONTH XYEAR
  IF XMONTH EQ 12 COMPOSE_DATE XDAY 1 (XYEAR+1) TO !3
  ELSE BEGIN
      MOVE (XMONTH+1) TO XTEMP
      COMPOSE_DATE XDAY XTEMP XYEAR TO !3
      DECOMPOSE_DATE !3 TO XDAY XMONTH XYEAR
      IF XMONTH NE XTEMP BEGIN
         COMPOSE_DATE 1 (XTEMP+1) XYEAR TO !3
         MOVE (!3-1) TO !3
     END
  END
#ENDCOMMAND
#COMMAND NEXT_YEAR RUSNI#OLCG "TO" RUSNIE#OLCG
   // USEAGE: NEXT_YEAR DATE TO DATE
    #IFDEF XDAY
    #ELSE
      INTEGER XDAY XMONTH XYEAR XTEMP
    #ENDIF
    DECOMPOSE DATE !1 TO XDAY XMONTH XYEAR
     IF ((XMONTH*100)+XDAY) EQ 229 COMPOSE_DATE 28 2 (XYEAR+1) TO !3
      ELSE COMPOSE_DATE XDAY XMONTH (XYEAR+1) TO !3
#ENDCOMMAND
#COMMAND LAST_MONTH RUSNIE#OLCG "TO" RUSNIE#OLCG
  // USEAGE: LAST_MONTH DATE TO DATE
  #IFDEF XDAY
  #ELSE
     INTEGER XDAY XMONTH XYEAR XTEMP
  #ENDIF
  DECOMPOSE_DATE !1 TO XDAY XMONTH XYEAR
  IF XMONTH EQ 1 COMPOSE_DATE XDAY 12 (XYEAR-1) TO !3
  ELSE BEGIN
       MOVE (XMONTH-1) TO XTEMP
       COMPOSE_DATE XDAY XTEMP XYEAR TO !3
       DECOMPOSE_DATE !3 TO XDAY XMONTH XYEAR
        IF XMONTH NE XTEMP BEGIN
          COMPOSE_DATE 1 (XTEMP+1) XYEAR TO !3
          MOVE (!3-1) TO !3
        END
     END
#ENDCOMMAND
#COMMAND LAST_YEAR RUSNI#OLCG "TO" RUSNI#OLCG
   // USEAGE: LAST_YEAR DATE TO DATE
   #IFDEF XDAY
   #ELSE
      INTEGER XDAY XMONTH XYEAR XTEMP
   #ENDIF
   DECOMPOSE_DATE !1 TO XDAY XMONTH XYEAR
   IF ((XMONTH*100) +XDAY) EQ 229 COMPOSE_DATE 28 2 (XYEAR-1) TO !3
   ELSE COMPOSE_DATE XDAY XMONTH (XYEAR-1) TO !3
#ENDCOMMAND
#COMMAND FIRST_DAY_OF_YEAR RUSNI#OLCG "TO" RUSNI#OLCG
  // USEAGE: FIRST_DAY_OF_YEAR TO DATE
  #IFDEF XDAY
  #ELSE
     INTEGER XDAY XMONTH XYEAR XTEMP
  #ENDIF
  DECOMPOSE_DATE !1 TO XDAY XMONTH XYEAR
  COMPOSE_DATE 1 1 XYEAR TO !3
#ENDCOMMAND
 

#COMMAND SCROLL R R R R R R R R R 
        KEYPROC OFF    // So I can control the flexkeys

#IFDEF SCROLL$ANS
#ELSE
        STRING SCROLL$ANS 1                                     // Define some variables...
        INTEGER SCROLL$ROW$NUM SCROLL$EXTRA                     // And some more...
        INTEGER SCROLL$TR$1 SCROLL$TR$2                         // And some more...
        INTEGER SCROLL$T$COUNT
        INTEGER SCROLL$L$COUNT
        INDICATOR SCROLL_INDICATOR
#ENDIF

        BLANKFORM !1                                            // Clear page. Change blankforms to clearforms for lines
        MOVE 0 TO SCROLL$T$COUNT
        MOVE 1 TO SCROLL$L$COUNT
        SCROLL$FORWARD$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9       // Fill first page
        IF SCROLL$T$COUNT NE 0 ;
            BEGIN
                screenmode 63 on
                SCROLL$HILITE$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
            END
        PAGE !1                                                 // Display Page

        REPEAT                                                  // Enter loop
                INKEY SCROLL$ANS                                // Get key

                [KEY.UP] IF SCROLL$T$COUNT NE 0 ;
                    BEGIN
                        SCROLL$UP$ROUTINE   !1 !2 !3 !4 !5 !6 !7 !8 !9
                    END

                [KEY.DOWN] IF SCROLL$T$COUNT NE 0 ;
                    BEGIN
                        SCROLL$DOWN$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
                    END

                [KEY.PREVIOUS]  ;
                    BEGIN
                        SCROLL$BACKWARD$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9         // Determine & act
                    END

                [KEY.NEXT] ;
                    BEGIN
                        SCROLL$FORWARD$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
                    END

                MOVE '' TO SCROLL$ANS
                INDICATE SCROLL$VALID GROUP ANY [KEY.ESCAPE KEY.RETURN]             // Escape or Return breaks loop
                [NOT SCROLL$VALID] LOOP

        [KEY.ESCAPE] MOVE 0 TO SCROLL$L$COUNT // So we know escape was pressed
        SCROLL$UNHILITE$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
        MOVE SCROLL$L$COUNT TO WINDOWINDEX
        SCREENMODE 1 OFF

        KEYPROC ON                                                                  // Restore keyprocs
#ENDCOMMAND                                                                         // Scroll Macro

//=====> Scroll Forward Routine <==============================================

#COMMAND SCROLL$FORWARD$ROUTINE R R R R R R R R R
        INDICATE SCROLL.FOUND.STATUS AS [FOUND]

        MOVE 0 TO SCROLL$T$COUNT

        SCROLL$UNHILITE$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
        MOVE 1 TO SCROLL$L$COUNT

        CLEAR !4
        GOSUB !8
        MOVE SCROLL$TR$1 TO !4.RECNUM   //THIS ONE COMMENTED OUT

        MOVE 1 TO SCROLL$ROW$NUM

        REPEAT
                FIND GT !4 BY !5
                        [FOUND] GOSUB !9
                        [FOUND] [SCROLL_INDICATOR] ;
                            BEGIN
                                INCREMENT SCROLL$T$COUNT
                                MOVE ((SCROLL$ROW$NUM - 1) * !3) TO WINDOWINDEX
                                GOSUB !6
                                IF SCROLL$ROW$NUM EQ 1 MOVE !4.RECNUM TO SCROLL$TR$1   //
                                IF SCROLL$ROW$NUM NE 1 MOVE !4.RECNUM TO SCROLL$TR$2   //
                                INCREMENT SCROLL$ROW$NUM
                            END
                        [FOUND] IF SCROLL$ROW$NUM LE !2 LOOP
                      [FINDERR] ;
                        BEGIN
                            SCROLL$CLEAR$ROW !1 !2 !3 !4 !5 !6 !7 !8 !9
                        END

        SCROLL$HILITE$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
        INDICATE FOUND AS [SCROLL.FOUND.STATUS]
#ENDCOMMAND

//=====> Scroll Backward Routine <=============================================

#COMMAND SCROLL$BACKWARD$ROUTINE
        INDICATE SCROLL.FOUND.STATUS AS [FOUND]
        MOVE 0 TO SCROLL$T$COUNT

        SCROLL$UNHILITE$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
        MOVE 1 TO SCROLL$L$COUNT

        CLEAR !4
        GOSUB !7
        MOVE SCROLL$TR$2 TO !4.RECNUM      //

        MOVE !2 TO SCROLL$ROW$NUM

        REPEAT
                FIND LT !4 BY !5
                        [FOUND] GOSUB !9
                        [FOUND] [SCROLL_INDICATOR] ;
                            BEGIN
                                INCREMENT SCROLL$T$COUNT
                                MOVE ((SCROLL$ROW$NUM - 1) * !3) TO WINDOWINDEX
                                GOSUB !6
                                IF SCROLL$ROW$NUM EQ 1 MOVE !4.RECNUM TO SCROLL$TR$1  //
                                IF SCROLL$ROW$NUM NE 1 MOVE !4.RECNUM TO SCROLL$TR$2  //
                                MOVE (SCROLL$ROW$NUM - 1) TO SCROLL$ROW$NUM
                            END
                        [FOUND] IF SCROLL$ROW$NUM GE 1 LOOP
                      [FINDERR] ;
                        BEGIN
                            SCROLL$CLEAR$BOTTOM !1 !2 !3 !4 !5 !6 !7 !8 !9
                            SCROLL$FORWARD$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
                        END

        SCROLL$HILITE$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
        INDICATE FOUND AS [SCROLL.FOUND.STATUS]
#ENDCOMMAND

//=====> Scroll Clear Row <====================================================

#COMMAND SCROLL$CLEAR$ROW
        FOR SCROLL$ROW$NUM FROM SCROLL$ROW$NUM TO !2
                MOVE ((SCROLL$ROW$NUM - 1) * !3) TO WINDOWINDEX

                MOVE 0 TO SCROLL$EXTRA
                WHILE SCROLL$EXTRA LT !3
                        BLANKFORM !1.1&
                        INCREMENT SCROLL$EXTRA
                        INCREMENT WINDOWINDEX
                END
        LOOP
#ENDCOMMAND

//=====> Scroll Clear Bottom <=================================================

#COMMAND SCROLL$CLEAR$BOTTOM
        MOVE ((!3 * !2) - !3) TO WINDOWINDEX

        WHILE WINDOWINDEX LT (!2 * !3)
                BLANKFORM !1.1&
                INCREMENT WINDOWINDEX
        END
#ENDCOMMAND

//=====> Scroll Hilite Routine <===============================================

#COMMAND SCROLL$HILITE$ROUTINE
    MOVE ((SCROLL$L$COUNT - 1) * !3) TO WINDOWINDEX

    SCREENMODE 112 ON

    WHILE WINDOWINDEX LT (SCROLL$L$COUNT * !3)
        MOVE !1.1& TO !1.1&
        INCREMENT WINDOWINDEX
    END
    
    SCREENMODE 63 On
#ENDCOMMAND

//=====> Scroll Unhilite Routine <=============================================

#COMMAND SCROLL$UNHILITE$ROUTINE
    MOVE ((SCROLL$L$COUNT - 1) * !3) TO WINDOWINDEX

    SCREENMODE 63 ON

    WHILE WINDOWINDEX LT (SCROLL$L$COUNT * !3)
        MOVE !1.1& TO !1.1&
        INCREMENT WINDOWINDEX
    END
    
 // SCREENMODE 1 On
#ENDCOMMAND

//=====> Up Routine <==========================================================

#COMMAND SCROLL$UP$ROUTINE
    REPEAT
        SCROLL$UNHILITE$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
    
        MOVE (SCROLL$L$COUNT - 1) TO SCROLL$L$COUNT
    
        IF SCROLL$L$COUNT LT 1 ;
            MOVE 1 TO SCROLL$L$COUNT
    
        MOVE ((SCROLL$L$COUNT - 1) * !3) TO WINDOWINDEX

        IF !1.1& EQ '' ;
            IF SCROLL$L$COUNT GE 1 ;
                LOOP

    IF SCROLL$L$COUNT LT 1 ;
        MOVE 1 TO SCROLL$L$COUNT

    SCROLL$HILITE$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
#ENDCOMMAND

//=====> Down Routine <========================================================

#COMMAND SCROLL$DOWN$ROUTINE
    REPEAT
        SCROLL$UNHILITE$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
    
        MOVE (SCROLL$L$COUNT + 1) TO SCROLL$L$COUNT
       
        IF SCROLL$L$COUNT GT !2 ;
            MOVE 1 TO SCROLL$L$COUNT
        
        MOVE ((SCROLL$L$COUNT - 1) * !3) TO WINDOWINDEX
    
        IF !1.1& EQ '' ;
            IF SCROLL$L$COUNT LE !2 ;
                LOOP

    IF SCROLL$L$COUNT GT !2 MOVE 1 TO SCROLL$L$COUNT

    SCROLL$HILITE$ROUTINE !1 !2 !3 !4 !5 !6 !7 !8 !9
#ENDCOMMAND

//=====> Scroll Macro End <====================================================

#COMMAND SETPAGE RT .
   #CHECK !1.N UVFG
   #SET M$ !1.N
   MOVE !M TO CURRENT_IMAGE
   PAGE !1
#ENDCOMMAND

CLEAR_OPTION WP_BACKSP
CLEAR_OPTION MODAL_INSERT
