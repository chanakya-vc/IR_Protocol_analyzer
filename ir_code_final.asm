
;<IR PROTOCOL ANALYZER BASED ON 8085>
;<Author@ Vaibhav Choudhary, Shubhangi Passi>

jmp start

;data


;code
start:  MVI B, 00H ; Code to display welcome message on the LCD screen
	MVI D, 00H ; Declare D as a counter to count the protocol 
	MVI A , 40H ; Turn SOD to 0
	SIM
loop1:	RIM 		; Wait for the remote to send signal
	ANI 80H
	JZ loop1
loop2:	RIM		;wait for the padding high from remote to be zero
	ANI 80H
	JNZ loop2
	CALL delay1	;initial delay for 1000u-secs
	MVI C, 32H	;delay to detect the high start-bit for RC5
loop3:	RIM
	DCR C
        JNZ loop3
	ANI 80H
	JZ proc2
	MVI A, C0H	;RC5 protocol detected, LED high.
	SIM	
	MVI D, 03H		;LCD code to display protocol 1
proc2:	INR D
	

delay1: MVI C , 7CH ; delay for 1000 u-seconds
loop2:	DCR C
	JNZ loop2
	RET 
	  
	 
hlt