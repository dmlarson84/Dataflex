/SCREEN                                  sysfile.frm
ออออออ< System File Update Screen >อออออออออออออออออออออออออออออออออออออออออออ

 Prosecutor: ______________________________              
                                                                      
 County: _________________________                       
                                                                      
 District: _________________                             
                                                                      
 Circuit Clerk: ___________________________________      
                                                                      
 Defendant #:   _______.            Case #:  _.-____.    
           
 Exit Program  ____________________

 Time Out ___.

 Password _

 Use System Date _    

 Today  __/__/__                                           
/*
//----------------- Cannot Run Program From Command Line (DOS)
IF NEXT_MENU LE 0 ABORT
INTEGER USER_NUMB USER$_ACCESS   //must be first integers defined in program
STRING USER$ 30
MOVE '' TO USER$
MOVE 0 TO USER$_ACCESS
//------------------------------------------------------------

OPEN SYSFILE
//-------------- Find Logged On User For Program Use
OPEN USERX
CLEAR USERX
MOVE USER_NUMB TO USERX.RECNUM
FIND EQ USERX BY RECNUM
MOVE USERX.USER_NAME TO USER$
MOVE USERX.ACCS_LEVL TO USER$_ACCESS
//----------------------------------------------------


PAGE SCREEN
CLEAR SYSFILE
FIND GT SYSFILE BY RECNUM

ENTERGROUP
AUTOPAGE SCREEN
IF STATUS SYSFILE ENTDISPLAY SYSFILE
ENTRY SYSFILE.PROSNAME
ENTRY SYSFILE.COUNTY
ENTRY SYSFILE.DIST
ENTRY SYSFILE.CLERK
ENTRY SYSFILE.DEFENDANT
ENTRY SYSFILE.YEAR
ENTRY SYSFILE.CASE_NUMBER
ENTRY SYSFILE.EXIT_PROG
ENTRY SYSFILE.TIME_OUT
ENTRY SYSFILE.PASSWORD
ENTRY SYSFILE.SYSTEM_DATE
ENTRY SYSFILE.TODAY



LOCK
ENDGROUP
SAVE SYSFILE
UNLOCK
ABORT	

KEYPROC KEY.ESCAPE
        ABORT