
	.global lp
	;; Counting position of long presses
	
lp:
	inc r22		;; Increment the press counter
	cpi r22, 0x01	;; If counter is 1 it is the first signal
	breq lp1	
	cpi r22, 0x02	;; If counter is 2 it is the second signal
	breq lp2		
	cpi r22, 0x03	;; If counter is 3 it is the third signal
	breq lp3		
	cpi r22, 0x04	;; If counter is 4 it is the fourth signal
	breq lp4	
	rjmp 1f		;; If longer than 4 characters not a valid Morse letter
	
	.global lp1
lp1:
	ori r25, 0x08	;; Recording a single dash
	rjmp 1f

	.global lp2
lp2:
	ori r25, 0x04	;; Recording a dash in the second position
	rjmp 1f

	.global lp3
lp3:
	ori r25, 0x02	;; Recording a dash in the third position
	rjmp 1f

	.global lp4
lp4:
	ori r25, 0x01	;; Recording a dash in the fourth position.
	rjmp 1f

	.global sp

;; Counting position of short presses.
sp:		
	inc r22		;; Increment the press counter
	cpi r22, 0x01	;; If counter is 1 it is the first signal
	breq sp1		
	cpi r22, 0x02	;; If counter is 2 it is the second signal
	breq sp2		
	cpi r22, 0x03	;; If counter is 3 it is the third signal
	breq sp3		
	cpi r22, 0x04	;; If counter is 4 it is the third signal
	breq sp4		
	rjmp 1f		;; If longer than 4 characters not a valid Morse letter.

	.global sp1
sp1:
	ori r25, 0x00	;; Recording a single dot
	rjmp 1f

	.global sp2
sp2:
	ori r25, 0x00	;; Recording a dot in the second position
	rjmp 1f

	.global sp3
sp3:
	ori r25, 0x00	;; Recording a dot in the third position
	rjmp 1f

	.global sp4
sp4:
	ori r25, 0x00	;; Recording a dot in the fourth position
	rjmp 1f		;; If longer than 4 characters not a valid Morse letter

1:
	pop r16		;; Pops r16 and clears the timer overflow
	clr r19	
	ret		;; Returns to the previous method

