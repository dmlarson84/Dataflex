/MMASK
Dataflex Menu System                                             Menu Selection
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
/MSELECT                                                                     
Dataflex Menu System                                             Menu Selection
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ

               Number                     Header

                 __.         ______________________________
                             ______________________________

                 __.         ______________________________
                             ______________________________

                 __.         ______________________________
                             ______________________________

                 __.         ______________________________
                             ______________________________

                 __.         ______________________________
                             ______________________________


อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
                Enter number of the menu you wish to edit: __.
/SELECTHELP
Dataflex Menu System                                        Menu Selection Help
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ



  This configuration will help you set up the menu system to guide the
  operator through your customized DataFlex system.

  Each menu screen has a unique menu number assigned, starting at 1.

  You must select the number of the menu you wish to edit.

  If you want to start a NEW MENU, press the <RETURN> key.

  To delete a menu: first select that menu, then press the DELETE Flex-Key.
  You will then be prompted as to whether you really wish to delete.

  You may display the next set of menus (if you have more than 5) by
  pressing the NEXT RECORD Flex-Key.


อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
                     MEMORY AVAILABLE: _________
/MENUCFG
Dataflex Menu System                                         Menu Configuration
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
  Menu Number: __.              Header : ______________________________
                                Header : ______________________________
                          Default Menu : __. (on return)
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ

    Prompt                          Action                         Access Lvl
  1  ______________________________  ______________________________      _.
  2  ______________________________  ______________________________      _.
  3  ______________________________  ______________________________      _.
  4  ______________________________  ______________________________      _.
  5  ______________________________  ______________________________      _.
  6  ______________________________  ______________________________      _.
  7  ______________________________  ______________________________      _.
  8  ______________________________  ______________________________      _.
  9  ______________________________  ______________________________      _.

อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
      (N)ew Menu  (H)eader  (Q)uestions  (P)rint   (S)ave         Help
      (I)nsert    (D)elete  (C)hange     (A)ppend  (E)xit  _    Available
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
      _____________________________________________________________  _ _
/MHELP1
Dataflex Menu System                                            Menu Entry Help
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ

  This configuration will help you to configure the DataFlex menu system
  to your custom requirements.  A PROMPT (what you see) and an ACTION (what
  the computer does) can be set up for each line displayed on each menu.
  QUESTIONS can be asked of the user and the response included in the ACTION.

                         -----  DEFINITIONS  -----

  MENU NUMBER:  This is the number of the menu that you selected to edit.
  No Menu Number will be displayed if you are entering a new menu. A number
  will be assigned when the new menu is saved.

  HEADER LINES:  These appear at the top of the menu.  The header should
  provide a title for the menu as a whole.

  DEFAULT MENU:  The default menu will be displayed when you hit the <RETURN>
  key when prompted for a menu option.  Typically MENU 1 is the default menu.

  MORE HELP IS AVAILABLE...
/MHELP2
Dataflex Menu System                                 Menu Entry Help (Screen 2)
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
  The following options refer to the menu edit options at the bottom of the
  screen.  The menu edit options allow you to modify the menu prompts,
  actions and passwords that are displayed.

           (N)ew menu, (H)eader, (Q)uestions, (P)rint, (S)ave

  (N)ew menu:  Returns you to the Menu Selection screen so you can enter
               a new menu number to edit.

  (H)eader:    Puts the cursor in the header section for editing.

  (Q)uestions: Loads the Questions entry screen.  "Questions" are used to
               prompt an input to the command line.

  (P)rint:     Prints the menu.

  (S)ave:      Saves the menu on disk.  A menu must be saved to be permanent.

  To delete an entire menu, press the DELETE Flex-Key.

  MORE HELP IS AVAILABLE....
/MHELP3
DATAFLEX MENU SYSTEM                                 MENU ENTRY HELP (SCREEN 3)
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ


          (I)nsert, (D)elete, (C)hange, (A)ppend, (E)xit

  These options modify the PROMPTS and ACTIONS and will ask you for the menu
  line to modify.

  (I)nsert:   Inserts a new menu line and moves the body down one line.

  (D)elete:   Deletes one line and moves the body up one line.

  (C)hange:   Allows you to edit a menu line.

  (A)ppend:   Places the cursor on the last line so you can add a new line.
              Append should be used when you are creating a new menu.

  (E)xit:     Terminates the menu definition program.


  MORE HELP IS AVAILABLE....
/MHELP4
Dataflex Menu System                                 Menu Entry Help (Screen 4)
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
 Use the following commands in the ACTION field to achieve the desired results

 <Any program (COM/CMD) filename, including argument(s)>: Execute the program.

 CHAIN <configuration name>: Chain to another configuration.

 MENU <menu number>: Go to another menu.

 SYSTEM: Return to operating system.

 ERASEFILE <filename>: Delete a file from disk.

 RENAMEFILE <from> <to>: Rename a file.

 COPYFILE <from> <to>: Copy a disk file ("*" and "?" allowed).

 DIRECTORY <drivespec>: Display a directory.

 $ <question #>: Display the Question; append the answer to the Action field.
/QUEST
Dataflex Menu System                                                  Questions
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ

      Explanation: ____________________________________________________
      Question 1 : ____________________________________________________

      Explanation: ____________________________________________________
      Question 2 : ____________________________________________________

      Explanation: ____________________________________________________
      Question 3 : ____________________________________________________

      Explanation: ____________________________________________________
      Question 4 : ____________________________________________________

      Explanation: ____________________________________________________
      Question 5 : ____________________________________________________

      Explanation: ____________________________________________________
      Question 6 : ____________________________________________________
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
   Enter the screen prompt for each question referenced in the ACTION
   section of the other screen, or ESCAPE to return. _____________________ _
/QHELP1
Dataflex Menu System                                              Question Help
อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ

 The menu system can ask questions of the user when a menu entry is selected.
 Your response to that question is then inserted into the ACTION command line.

 A command line that requires a question to be asked should have a "$" sign
 followed by a number from one to six ($2) as part of the ACTION. The cor-
 responding question (e.g. Question 2) will be displayed and the response
 inserted into the command line in place of the $number symbol.

 This screen allows you to create and edit the six prompting questions that
 can be asked.  Each question can have up to two lines of text to describe
 the required response.  The two lines are labeled EXPLANATION and QUESTION,
 with the idea that the first line will explain the requirement and the
 second line will actually ask the question.

 Use the forward <RETURN> and back field keys to edit the questions.
 Press the <ESCAPE> key to return to the main menu edit screen.

 PRESS ANY KEY TO CONTINUE...
/*

//#IFDEF USER_NUMB
//#ELSE
//   INTEGER USER_NUMB 
//#END
//MOVE 99 TO USER_NUMB
INTEGER NUMLINES I 
INTEGER TMPINDEX 
INTEGER STOPAT

AUTOPAGE MENUCFG 32

NAME OPERATION OPTEXT OPYN OPANSWER

FORMAT OPYN {CAPSLOCK,CHECK='YN'}

FORMAT MENUCFG.6  {CAPSLOCK}
FORMAT MENUCFG.9  {CAPSLOCK}
FORMAT MENUCFG.12 {CAPSLOCK}
FORMAT MENUCFG.15 {CAPSLOCK}
FORMAT MENUCFG.18 {CAPSLOCK}
FORMAT MENUCFG.21 {CAPSLOCK}
FORMAT MENUCFG.24 {CAPSLOCK}
FORMAT MENUCFG.27 {CAPSLOCK}
FORMAT MENUCFG.30 {CAPSLOCK}
FORMAT MENUCFG.32 {CAPSLOCK}

OPEN SYSFILE

//INDICATE USE_PASS AS SYSFILE.PASSWORD EQ 'Y'

//[USE_PASS] IF USER_NUMB LT 1 RUNPROGRAM SYSFILE.EXIT_PROG

OPEN MENU

INDICATE TOP TRUE             //on first page of configuration

NEWMENU:                        //create or find a new menu

  PAGE MMASK
  CLEARFORM MENUCFG
  CLEARFORM QUEST
  BLANKFORM OPTEXT THRU OPANSWER
MDISP1:
  CLEAR MENU                    //start at 
  CLEARFORM M menu file
MDISP2:
  BLANKFORM MSELECT
  FOR WINDOWINDEX FROM 0 TO 13
        FIND GT MENU BY RECNUM  //find the next menu in the file
[NOT FOUND] GOTO GSELECT        //no more menus to display
        MOVE MENU.RECNUM  TO MSELECT.1&         //display the found
        MOVE MENU.HEADER1 TO MSELECT.2&         //menu header
        MOVE MENU.HEADER2 TO MSELECT.3&
        CALC (WINDOWINDEX+2) TO WINDOWINDEX     //go by three
  LOOP
GSELECT:
  INDICATE INSEL TRUE
  ACCEPT MSELECT.16                             //which menu?
[KEY.NEXT][NOT FOUND] GOTO MDISP1               //sorry no more menus
[KEY.NEXT] GOTO MDISP2                          //continue display
[KEY.PREVIOUS] GOTO MDISP1                      //start from begining
  INDICATE INSEL FALSE
  IF MSELECT.16 EQ 0 GOTO ASK                   //create a new menu
  CLEAR MENU                                    //set up for find
  MOVE MSELECT.16 TO MENU.RECNUM
  FIND EQ MENU.RECNUM                           //find the selected menu
[FINDERR] GOTO GSELECT                          //if not found try again
  MOVE MSELECT.16 TO MENUCFG.1                  //put the menu number
  GOSUB DISPLAYIT                               //and display the menu
  GOTO ASK                                      //goto main loop

DISPLAYIT:                                      //display a found menu
  MOVE 0 TO FIELDINDEX
  DISPLAY MENU.RECNUM TO MENUCFG.1
  FOR WINDOWINDEX FROM 0 TO 29                  //loop thru first page
    DISPLAY MENU.HEADER1& TO MENUCFG.2&
    INCREMENT FIELDINDEX
  LOOP
  MOVE 0 TO FIELDINDEX
  FOR WINDOWINDEX FROM 0 TO 11
    DISPLAY MENU.QA1& TO QUEST.1&               //loop thru questions 
    INCREMENT FIELDINDEX
  LOOP
  RETURN


QUST:                                           //edit questions
  INDICATE TOP FALSE                            //on question page now
  DISPLAY 'EDIT WHICH QUESTION?' TO QUEST.13
  CLEARFORM QUEST.14
  ACCEPT QUEST.14         
  IF QUEST.14 EQ 0 GOTO ASK                     //if done return to main
  MOVE ((QUEST.14-1)*2) TO WINDOWINDEX          //use answer to set up
  ACCEPT QUEST.1&                               //index
  ACCEPT QUEST.2&
  GOTO QUST                                     //loop till no more quest.

UPDATEREC:                                      //save a menu to disk
  MOVE 0 TO FIELDINDEX
  MOVE MENUCFG.1 TO MENU.RECNUM
  FOR WINDOWINDEX FROM 0 TO 29
    MOVE MENUCFG.2& TO MENU.HEADER1&            //move page 1 to record buffer
    INCREMENT FIELDINDEX
  LOOP
  MOVE 0 TO FIELDINDEX
  FOR WINDOWINDEX FROM 0 TO 11
    MOVE QUEST.1& TO MENU.QA1&                  //move quest to record buffer
    INCREMENT FIELDINDEX
  LOOP
  SAVE MENU                                     //save the menu to disk
  RETURN

CHECKLINES:                                     //how many lines on this menu?
  FOR I FROM 0 TO 8                             //go from back to front
    MOVE ((8-I)*3) TO WINDOWINDEX
    IF MENUCFG.6& GT '' GOTO LASTONE
  LOOP
LASTONE:
  MOVE (9-I) TO NUMLINES                        //nine is a full menu
  RETURN

ASK:                                            //main line routine
  INDICATE TOP TRUE                             //on the main page
  GOSUB CHECKLINES
OPRN:
  CLEARFORM OPERATION
  BLANKFORM OPTEXT THRU OPANSWER
  ACCEPT OPERATION                              //what do you want to do?
  POS OPERATION IN 'HQEIDCASNP' TO I            //sneaky way to do checks
  ON I GOTO HEADR QUST QUIT INSRT DELTE EDIT APPND SAVEIT NEWMENU PRINTIT
  GOTO OPRN                                     //not one of the above

HEADR:
  MOVE -3 TO WINDOWINDEX                        //three windows less than
  GOTO DO_LINE                                  //the first action

PRINTIT:                                        //print the main screens
  OUTPUT MENUCFG
  OUTPUT QUEST
  GOTO ASK

INSRT:                                          //insert a line on the screen
  GOSUB CHECKFULL                               //are we full?
  DISPLAY 'INSERT BEFORE WHICH LINE?' TO OPTEXT   
  GOSUB GETPRAM                                 //get the line number
  IF OPANSWER GT NUMLINES GOTO ASK              //error check
  MOVE ((NUMLINES*3)-1) TO WINDOWINDEX          //set up start window
  MOVE ((OPANSWER-1)*3) TO STOPAT               //when we are done moving
  WHILE WINDOWINDEX GE STOPAT                   //do till done
    MOVESTR MENUCFG.5& TO MENUCFG.8&            //move into unused space
    CALC (WINDOWINDEX-1) TO WINDOWINDEX
  END
  MOVE STOPAT TO WINDOWINDEX
  BLANKFORM MENUCFG.5& THRU MENUCFG.7&          //blank the new lines
  GOTO DO_LINE                                  //get input for the new one

DELTE:                                          //delete a menu line
  DISPLAY 'DELETE WHICH LINE?' TO OPTEXT
  GOSUB GETPRAM                                 //which line to delete
  IF OPANSWER GT NUMLINES GOTO ASK              //out of range
  MOVE (NUMLINES*3-1) TO STOPAT

  FOR WINDOWINDEX FROM ((OPANSWER-1)*3) TO STOPAT
    MOVESTR MENUCFG.8& TO MENUCFG.5&
  LOOP

  MOVE (STOPAT-2) TO WINDOWINDEX
  BLANKFORM MENUCFG.5& THRU MENUCFG.7&          //blank the last line
  GOTO ASK
 
EDIT:                                           //change an existing line
  DISPLAY 'CHANGE WHICH LINE?' TO OPTEXT
  GOSUB GETPRAM                                 //which line to edit
  MOVE ((OPANSWER-1)*3) TO WINDOWINDEX
  GOTO DO_LINE                                  //edit it

SAVEIT:                                         //save a menu to disk
  DISPLAY 'SAVE THIS MENU?' TO OPTEXT
  GOSUB SAVEPROC                                //actually save it
  GOTO ASK

DELETEIT:                                       //delete an existing menu
  DISPLAY 'DELETE THIS MENU?' TO OPTEXT
  DISPLAY 'N' TO OPYN                           //default so no mistakes
  ACCEPT OPYN 
  IF OPYN NE 'Y' GOTO ASK                       //abort if not exact!
  DELETE MENU                                   //otherwise say goodbye
  GOTO NEWMENU                                  //back to top of cfg

QUIT:                                           //exit configuration
  DISPLAY 'BEFORE YOU EXIT, SAVE YOUR CHANGES?' TO OPTEXT
  GOSUB SAVEPROC                                //last chance to save it
  ABORT                                         //return to flex menu

SAVEPROC:                                       //save the menu prompted
  DISPLAY 'Y' TO OPYN 
  ACCEPT OPYN 
  IF OPYN EQ 'Y' GOSUB UPDATEREC                //real save routine
  RETURN

CHECKFULL:                                      //menu gt nine lines?
  IF NUMLINES EQ 9 BEGIN
    DISPLAY 'MENU FULL, DELETE AN ITEM OR CREATE A NEW MENU' TO OPTEXT
    FOR I FROM 0 TO 350 
    LOOP
    RETURN ASK                                  //if error return to main line 
  END
  RETURN                                        //otherwise return to caller

APPND:
  GOSUB CHECKFULL                               //is there a place to put it?
  MOVE (NUMLINES*3) TO WINDOWINDEX              //this is a good place
  GOTO DO_LINE                                  //get the new line

GETPRAM:                                        //get a numeric answer
  ACCEPT OPANSWER   
  IF OPANSWER EQ 0 RETURN ASK                   //nobody likes a zero!
  BLANKFORM OPTEXT
  RETURN

DO_LINE:                                        //change a menu line
  ACCEPT MENUCFG.5&
  ACCEPT MENUCFG.6&
  ACCEPT MENUCFG.7&
  GOTO ASK

KEYPROC KEY.FIELD
  BACKFIELD                             //back up one window
  RETURN

KEYPROC KEY.ESCAPE
[INSEL] ABORT                           //in select screen - bye
[TOP] GOTO QUIT                         //prompted exit
KEYPROC KEY.UP
KEYPROC KEY.DOWN
  RETURN ASK                            //disable these keys

KEYPROC KEY.FIND                        //deal with finds as a group
KEYPROC KEY.NEXT
KEYPROC KEY.PREVIOUS
[INSEL]RETURN                           //can't find in select page
MOVE WINDOWINDEX TO TMPINDEX            //save the index for later
  CLEAR MENU
  MOVE MENUCFG.1 TO MENU.RECNUM
[KEY.FIND] FIND GE MENU.RECNUM
[KEY.NEXT] FIND GT MENU.RECNUM
[KEY.PREVIOUS] FIND LT MENU.RECNUM
[FOUND] GOSUB DISPLAYIT                 //if menu found then show it
  GOSUB CHECKLINES                      //update numlines for this new menu
  MOVE TMPINDEX TO WINDOWINDEX          //restore if in line or quest
  ENTAGAIN                              //accept to same window
RETURN

KEYPROC KEY.CLEAR 
[INSEL] RETURN
  RETURN NEWMENU

KEYPROC KEY.SAVE
[INSEL] RETURN
  RETURN SAVEIT

KEYPROC KEY.DELETE
[INSEL] RETURN
  RETURN DELETEIT

KEYPROC KEY.HELP
HELP
ENTAGAIN
RETURN
