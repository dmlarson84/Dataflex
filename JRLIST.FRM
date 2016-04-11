/JRLST
ออออออ< Journal Types Master >อออออออออออออออออออออออออออออออออออออออออออออออออ








           Code....{ __    Description...{ _________________________






<F6> Delete       <F9> Clear      <F10> Save     <ESC> Quit To Menu




/*

STRING ANSW 1

OPEN JRLIST

ENTER JRLIST

AUTOPAGE JRLST
  ENTRY JRLIST.CODE       {CAPSLOCK,AUTOFIND}
  ENTRY JRLIST.DESC       {CAPSLOCK}
RETURN

ENTERE BJIRMR
AUT
KEYPROC KEY.ESCAPE
    CLEARXY 24 0
    GOTOXY 24 0
    SHOW " Do you wish to print a Journal Codes list (Y/N)"
    GOTOXY 24 52
    REPEAT
      INKEY ANSW
      UPPERCASE ANSW
      IF ~ ANSW IN 'YN' LOOP
      IF ANSW EQ 'Y' CHAIN "LISTJR"
      ABORT
RETURN 
