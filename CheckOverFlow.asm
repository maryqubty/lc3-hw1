.ORIG X412C
CheckOverflow:	
;If 2 Two's Complement numbers are added, and they both have the same sign (both positive or both negative), then overflow occurs if and only if the result has the opposite sign
;IF ONE NUMBER IS POSITIVE AND THE SECOND IS NEGATIVE THEN WE DON'T HAVE OVERFLOW, SINCE BOTH NUMBERS ARE IN RANGE AND ADD THEM WILL KEEP US IN RANGE.

ST R7, LABEL7
AND R2, R2, #0    ;WE INITIATE R2 WITH 0
ST R3, LABEL3 ; WE WIL SAVE THE ADD OPERATION RESULT IN THIS REGISTER

;CASE 1: ONE OF THE REGISTERS IS 0---> WE WON'T HAVE OVERFLOW 
;CASE 2: BOTH REGISTERS HAVE OPPOSITE SIGNS ----> WON'T HAVE OVERFLOW
ADD R0, R0, #0
BRz FINISH
BRp R0_POSITIVE
;IF REACHED HERE, R0 IS NEGATIVE
ADD R1, R1, #0
BRz FINISH
BRp FINISH ; THIS MEANS THAT R0<0, R1>0 --> DOESN'T CAUSE OVERFLOW
ADD R3, R0, R1 ;ADDING TWO NEGATIVE NUMBERS 
BRn FINISH 
ADD R2, R2, #1 ;IF RECHED HERE, THEN THE RESULT IS POSITIVE, WHICH MEANS OVERFLOW
BR FINISH 

R0_POSITIVE:
ADD R1, R1, #0
BRz FINISH 
BRn FINISH ;THIS MEANS THAT R0>0, R1<0 --> DOESN'T CAUSE OVERFLOW
ADD R3, R0, R1 ; ADDING TWO POSITIVE NUMBERS 
BRp FINISH  
ADD R2, R2, #1 ;IF RECHED HERE, THEN THE RESULT IS NEGATIVE, WHICH MEANS OVERFLOW

FINISH:
; Your code here. Remember to save the registers that you will use to subroutine-specific labels, and then load them just before the RET command.			
LD R7, LABEL7
LD R3, LABEL3
RET

LABEL7 .FILL #0	
LABEL3 .FILL #0	
; Put your various labels here, between RET and .END.
; Remember to write comments that thoroughly explain everything you do - this is assembly code, not Python or C! It's hard to follow otherwise.	

; Make sure to properly write your real ID at the top of this asm file, don't just leave the default values there!
.END
