*----------------------------------------------------------------------
* Programmer: Jose Carlos Gomez
* Class Account: cssc1268
* Assignment or Title: Program 1
* Filename: prog1.s
* Date completed:  10/12/17
*----------------------------------------------------------------------
* Problem statement: 
* Input: 2 numbers
* Output: The day determined by the numbers
* Error conditions tested: 
* Included files: 
* Method and/or pseudocode: 
* References: 
*----------------------------------------------------------------------
*
        ORG     $0
        DC.L    $3000           * Stack pointer value after a reset
        DC.L    start           * Program counter value after a reset
        ORG     $3000           * Start at location 3000 Hex
*
*----------------------------------------------------------------------
*
#minclude /home/cs/faculty/cs237/bsvc/macros/iomacs.s
#minclude /home/cs/faculty/cs237/bsvc/macros/evtmacs.s
*
*----------------------------------------------------------------------
*
* Register use
*
*----------------------------------------------------------------------
*
start:  initIO                  * Initialize (required for I/O)
	setEVT			* Error handling routines
*	initF			* For floating point macros only	

		lineout header
		lineout prompt
		linein  input
		cvta2   input,#1
		move.b  D0,dayNum
		cvta2   input+2,#2
		move.b  D0,D3
		add.b   dayNum,D3
		
		divu    #7,D3
		swap    D3	
		ext.l   D3
		
		lea     days,A1
		mulu    #23,D3
		add.l   D3,A1

		lineout (A1)


        break                   * Terminate execution
*
*----------------------------------------------------------------------
*       Storage declarations

header:	dc.b	'Program #1, Jose Carlos Gomez, cssc1268',0
prompt:	dc.b	'Enter the start day [1-7] and the number to add [01-20]: ',0
input:	ds.b	10
dayNum:	dc.b	00
daysA:	dc.b	00
days:	dc.b	'That day is Sunday.   ',0
	dc.b	'That day is Monday.   ',0
	dc.b	'That day is Tueday.   ',0
	dc.b	'That day is Wednesday.',0
	dc.b	'That day is Thursday. ',0
	dc.b	'That day is Friday.   ',0
	dc.b	'That day is Saturday. ',0
	dc.b	'That day is Sunday.   ',0

        end
