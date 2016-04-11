Program Datetest;
{$V-}

  (*                                                            *)
  (* author  JL Bluma                                           *)
  (* date    11/20/87                                           *)
  (*                                                            *)

  (* this program checks the file date of a file named          *)
  (* 'BACKEDUP.DAT' in the current directory. If the date       *)
  (*  of the file is more than  seven days old, a batchfile     *)
  (*  named 'DOBACKUP.BAT' will be zipped to MS-DOS using the   *)
  (*  TURBOSPAWN utility.  THE  DOBACKUP batch file is a        *)
  (*  standard batch file with any backup commands desired      *)
  (*  for execution.  The final command should be a dir of      *)
  (*  the most important file redirected to BACKEDUP.DAT'       *)

  (*  SAMPLE of a DOBACKUP batch file

  echo off
  echo this is the sample backup bat file zipped by turbo
  echo
  echo put any commands you want for backup here
  echo
  BACKUP *.DAT A:DATABASE
  DIR SMPL.BAT > BACKEDUP.DAT

  end of the sample batch file                                *)

  CONST  BaseDate         = 716256.0;


  TYPE   DateArray        =  array [1..8] of char;
         JulDate          =  integer;
         stype            =  string [80];


         DateType        =   RECORD
            yy, mm, dd   :   INTEGER;
         END;


  VAR    Errstring        : string [80];
         FileDate         : DateType;                (* file date work rtn *)
         DATE             : DateType;
         RelToday         : JulDate;
         erc              : INTEGER;


  TYPE

       workstring = string[65];

  VAR
       ShellName,
       CommandLine           : workstring;


PROCEDURE TURBOSPAWN(var filename, comline:workstring; var error:integer);
                    external'\PROGLIB\SPAWNOST.COM';  (* PROGRAM SPAWNER *)
{-----------------------------------------------------------------------------}
  Procedure ZipBackup ;
     BEGIN
       shellname := '\COMMAND.COM';
       commandline := '/CDOBACKUP' ;
       TURBOSPAWN (shellname, commandline, erc);
     END;

{----------------------------------------------------------------------------}

  PROCEDURE  ToJulian    ( cdate :  DateArray ;  var jdate : integer);

    VAR      m, d, y, err, outdt
                              : integer;
             dwk, indate      : string [8];
             r                : real;

    BEGIN
      jdate  := -32767;
      err    :=  0;
      indate := '        ';
      move (cdate [1], indate [1], 8);

      (*  edit the date string input and convert to integers *)

      if length (indate) = 8
      then
        BEGIN
          dwk := '';
          for  m := 1 to 8 do
            BEGIN
              if indate [m] in ['0'..'9'] then dwk := dwk + indate [m];
            END;
          indate := dwk;
        END;
      If length (indate) <> 6 then EXIT;        (* date must be 6 digits *)


      dwk := copy (indate, 1, 2);               (* get month *)
      Val    (dwk, m,  err);
      if err <> 0 then EXIT;
      if (m = 0)  or (m > 12) then EXIT;        (* validate month *)
      dwk    :=  copy (indate, 3, 2);           (* day of month *)

      Val    (dwk, d, err);
      if err <> 0 then EXIT;

      if (d = 0)  or (d > 31) then EXIT;        (* day in 1 - 31 range *)
      dwk    := copy (indate, 5, 2);            (* year *)
      Val    (dwk, y, err);
      if err <> 0 then EXIT;

      (* date is converted to a real figure in this routine *)

      IF y < 25                               (* years 01 -24 are 20nn *)
      THEN
        y := y + 2000
      ELSE
        Y := y + 1900;                        (* years 25-99 are 19nn *)


      r := INT (30.57 * m) + INT (365.25 * y - 395.25) + d;
      if m > 2 then
        if INT (y/4) = y / 4 then
          r := r - 1
        else
          r := r - 2;

       jdate := TRUNC (r - BaseDate);

    END;     (* of ToJulian *)



{--------------------------------------------------------------------------}

Procedure GetDate;
Var
  X,Y : integer;
Begin
  X := Seg(Date);
  Y := Ofs(Date);
  Inline
    ($8B/$46/$FC/         {     MOV  AX,[BP-4]      ;get segment of Time      }
     $8E/$C0/             {     MOV  ES,AX          ;move to ES               }
     $8B/$7E/$FA/         {     MOV  DI,[BP-6]      ;get offset of Time       }
     $B4/$2A/             {     MOV  AH,2AH         ;function to get the time }
     $CD/$21/             {     INT  21H            ;get the three values     }
     $26/$89/$0D/         {     MOV  ES:[DI],CX     ;year                     }
     $47/                 {     INC  DI             ;forward ptr              }
     $47/                 {     INC  DI             ;again                    }
     $2B/$C9/             {     SUB  CX,CX          ;clear CX                 }
     $8A/$CE/             {     MOV  CL,DH          ;move month               }
     $26/$89/$0D/         {     MOV  ES:[DI],CX     ;month                    }
     $47/                 {     INC  DI             ;forward ptr              }
     $47/                 {     INC  DI             ;again                    }
     $2A/$F6/             {     SUB  DH,DH          ;extend byte              }
     $26/$89/$15);        {     MOV  ES:[DI],DX     ;day                      }
End;

{----------------------------------------------------------------------------}

  Procedure GetSystemDate;

    VAR     WkDate             : DateArray;
            Dstr               : string [4];
            WkJul              : JulDate;
    BEGIN
      GetDate;

      GOtoxy (1, 16);
      Str (Date.mm : 2, dstr);                     (* do date conversion *)
      MOVE (dstr [1], WkDate [1], 2);
      WkDate [3] := '/';
      Str (Date.dd : 2, dstr);
      MOVE (dstr [1], WkDate [4], 2);
      WkDate[6] := '/';
      Str (Date.yy : 2, dstr);
      MOVE (dstr [3], WkDate [7], 2);

      IF WkDate[1] = ' ' THEN WkDate [1] := '0';
      IF WkDate[4] = ' ' THEN WkDate [4] := '0';
      IF WkDate[7] = ' ' THEN WkDate [7] := '0';

      ToJulian (WkDate, RelToday);

    END;

  {--------------------------------------------------------------------}

Function SeekFile(Path: stype): integer;
Var
  X : integer;
Begin
  X := SizeOf(Path);
  Inline
    ($1E/                 {     PUSH DS             ;save Turbo's DS          }
     $8C/$D0/             {     MOV  AX,SS          ;get SS value             }
     $8E/$D8/             {     MOV  DS,AX          ;place it in DS           }
     $8E/$C0/             {     MOV  ES,AX          ;and in ES too            }
     $2B/$C9/             {     SUB  CX,CX          ;clear CX                 }
     $8A/$4E/$04/         {     MOV  CL,[BP+4]      ;get path length          }
     $8B/$FD/             {     MOV  DI,BP          ;BP offset to DI          }
     $8B/$F7/             {     MOV  SI,DI          ;and to SI                }
     $83/$C7/$04/         {     ADD  DI,4           ;pt DI to descriptor      }
     $83/$C6/$05/         {     ADD  SI,5           ;pt SI one byte above     }
     $FC/                 {     CLD                 ;direction flag forward   }
     $F3/$A4/             {     REP  MOVSB          ;shift string downward    }
     $88/$2C/             {     MOV  [SI],CH        ;ASCII zero at path end   }
     $8B/$D5/             {     MOV  DX,BP          ;BP offset to DX          }
     $83/$C2/$04/         {     ADD  DX,4           ;offset to start of path  }
     $B4/$3D/             {     MOV  AH,3DH         ;function to open file    }
     $B0/$00/             {     MOV  AL,0           ;subfunction to read file }
     $CD/$21/             {     INT  21H            ;open the file            }
     $72/$08/             {     JC   L1             ;jump if error            }
     $8B/$D8/             {     MOV  BX,AX          ;shift handle to BX       }
     $B4/$3E/             {     MOV  AH,3EH         ;func to close file       }
     $CD/$21/             {     INT  21H            ;close the file           }
     $2B/$C0/             {     SUB  AX,AX          ;return 0 if file found   }
     $8B/$76/$FC/         { L1: MOV  SI,[BP-4]      ;sizeof Path              }
     $89/$42/$04/         {     MOV  [BP][SI+4],AX  ;set return value         }
     $1F);                {     POP  DS             ;restore DS and quit      }
End;


  Procedure GetFileDate(FilePath: stype);
    Var
        X,Y: integer;
  Begin
    X := Seg(FileDate);
    Y := Ofs(FileDate);
    Inline
    ($1E/$8C/$D0/$8E/$D8/$8E/$C0/$2B/$C9/$8A/$4E/$04/$E3/$57/$8B/$FD/
     $83/$C7/$04/$8B/$F7/$46/$FC/$F3/$A4/$88/$2C/$8B/$D5/$83/$C2/$04/$B4/$3D/
     $B0/$00/$CD/$21/$8B/$D8/$8B/$46/$FC/$8E/$D8/$8B/$76/$FA/$72/$2A/$B4/$57/
     $B0/$00/$CD/$21/$83/$C6/$04/$2B/$C0/$8A/$C2/$24/$1F/$89/$04/$83/$EE/$02/
     $D1/$EA/$B1/$04/$D2/$EA/$8A/$C2/$89/$04/$83/$EE/$02/$8A/$C6/$05/$BC/$07/
     $89/$04/$EB/$05/$B8/$64/$00/$89/$04/$B4/$3E/$CD/$21/$1F);
  End;




  PROCEDURE ValidateBackup;
    VAR     BackUpDate         : DateType;
            WkDate             : DateArray;
            Dstr               : string [4];
            WkJul              : JulDate;

    BEGIN
      IF SeekFile ('BACKEDUP.DAT') = 0
         THEN
          GetFileDate ('BACKEDUP.DAT')
         ELSE
           BEGIN
             Gotoxy (22, 12);
             Writeln ('THE DATABASE HAS NOT BEEN BACKED UP');
             ZipBackup;
             Delay (5000);
             EXIT;
           END;

      BackupDate := FileDate;
      GOtoxy (1, 16);
      Str (filedate.mm : 2, dstr);                     (* do date conversion *)
      MOVE (dstr [1], WkDate [1], 2);
      WkDate [3] := '/';
      Str (filedate.dd : 2, dstr);
      MOVE (dstr [1], WkDate [4], 2);
      WkDate[6] := '/';
      Str (filedate.yy : 2, dstr);
      MOVE (dstr [3], WkDate [7], 2);

      IF WkDate[1] = ' ' THEN WkDate [1] := '0';
      IF WkDate[4] = ' ' THEN WkDate [4] := '0';
      IF WkDate[7] = ' ' THEN WkDate [7] := '0';


      Write ('                ');
      Writeln ('The database was last backed up on : ', WkDate);
      Writeln;
      Writeln;

      ToJulian (WkDate, WkJul);
      IF RelToday - 7 > WkJul    THEN FileDate.yy := 100;
      IF FileDate.yy = 100 THEN
         BEGIN
           Write ('                ');
           Writeln ('The database has not been backed up for 7 days.');
           Write ('                ');
           Writeln ('You ** MUST ** back up before continuing !');
           Delay (5000);
           ZipBackup ;
           EXIT;
         END;
    END;



  BEGIN        (* M A J O R    L O G I C *)

    ClrScr;
    Gotoxy (18, 2);
    Write ('D A T A B A S E     B A C K U P     T E S T');
    GetSystemDate;
    ValidateBackup;

END.
