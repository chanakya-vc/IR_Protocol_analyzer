
;<IR PROTOCOL ANALYZER BASED ON 8085>
;<Author@ Vaibhav Choudhary, Shubhangi Passi>

jmp start

;data


;code
start:  MVI B, 00H ; Code to display welcome message on the LCD screen
	MVI D, 00H ; Declare D as a counter to count the protocol 
loop1:	RIM 
	ANI 80H
	JZ loop1
	CALL delay1
	CALL detect1
	ANI 80H
	JZ proc2
	;LCD code to display protocol 1
proc2:	INR D
	

delay1: MVI C , 6BH ; delay for 1508 u-seconds
loop2:	DCR C
	JNZ loop2
	RET 

detect1: MVI C ,16H
loop3:	 RIM
	 DCR C
         JNZ loop3
	 RET
	  
	 
hlt