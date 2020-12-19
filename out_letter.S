#include "7segment.S"

	.global checklength

;; getting the length of the inputted Morse signal 
checklength:
	cpi r22, 0x00	;; if signal has length 0
	breq 1f		;; branch to 1
	cpi r22, 0x01	;; if signal has length 1
	breq l1		;; branch to loop of length 1
	cpi r22, 0x02	;; if signal has length 2 
	breq l2		;; branch to loop of length 2
	cpi r22, 0x03	;; if signal has length 3 
	breq l3		;; branch to loop of length 3
	cpi r22, 0x04	;; if signal has length 4 
	breq l4		;; branch to loop of length 4
	;; else
	rjmp error	;; otherwise jump to error

1:	
	ret

	.global l1

;; characters of length 1
l1:
	ldi r18, OUT_E	;; E = length 1
	cpi r25, 0x00	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_T 	;; T = length 1
	cpi r25, 0x08	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1
	;; else
	rjmp error	;; otherwise jump to error

1:	
	ret		;; returns to the previous method

	.global l2

;; characters of length 2
l2:

	ldi r18, OUT_I	;; I = length 2
	cpi r25, 0x00	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_A	;; A = length 2
	cpi r25, 0x04	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1
	
	ldi r18, OUT_N	;; N = length 2
	cpi r25, 0x08	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1
	
	ldi r18, OUT_M	;; M = length 2
	cpi r25, 0x0C	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1
	;; else
	rjmp error	;; otherwise jump to error

1:	
	ret		;; returns to the previous method

	.global l3

;; characters of length 3
l3:

	ldi r18, OUT_D	;; D = length 3
	cpi r25, 0x08	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

        ldi r18, OUT_G	;; G = length 3
	cpi r25, 0x0C	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_K	;; K = length 3
	cpi r25, 0x0A	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_O	;; O = length 3
	cpi r25, 0x0E	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_R	;; R = length 3
	cpi r25, 0x04	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_S	;; S = length 3
	cpi r25, 0x00	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_U	;; U = length 3
	cpi r25, 0x02	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_W	;; W = length 3
	cpi r25, 0x06	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1
	;; else
	rjmp error	;; otherwise jump to error

1:	
	ret

	.global l4

;; characters of length 4
l4:
	ldi r18, OUT_B	;; B = length 4
	cpi r25, 0x08	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi 18, OUT_C	;; C = length 4
	cpi r25, 0x0A	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_F	;; F = length 4
	cpi r25, 0x02	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_H	;; H = length 4
	cpi r25, 0x00	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_J	;; J = length 4
	cpi r25, 0x07	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_L	;; L = length 4
	cpi r25, 0x04	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_P	;; P = length 4
	cpi r25, 0x06	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_Q	;; Q = length 4
	cpi r25, 0x0D	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_V	;; V = length 4
	cpi r25, 0x01	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_X	;; X = length 4
	cpi r25, 0x09	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_Y	;; Y = length 4
	cpi r25, 0x0B	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1

	ldi r18, OUT_Z	;; Z = length 4
	cpi r25, 0x0C	;; compare input from button with Morse code using hex
	breq 1f		;; branch to 1
	;; else
	rjmp error	;; otherwise jump to error

1:	
	ret

	.global error
;; if there is an error
error:
	ldi r18, OUT_ERROR ;; load 7segment character that represents an error
	ret


