
.MODEL SMALL
.STACK 20
.DATA ; Data segment start here
ORG 1000H ; Memory address initialization
BCD DW 1234H ; 4-digit BCD number is 1234H, here BCD is a variable
HEX DW 0 ; HEX is a variable to store the results
.CODE ; Code start here
START:
MOV AX, @DATA ; Initializing DS: segment register
MOV DS, AX
MOV AX, 0000H ; Moving AX=0000
MOV BX, 0001H ; Weight for LSD, storing 0001H into BX register (once position)
CALL BCD2BIN ; calling BCD2BIN procedure. See the written procedure in the last lines
MOV BX, 000AH ; Weight for 2nd digit, Storing 000AH in to BX register (10th Position)
CALL BCD2BIN ; calling BCD2BIN procedure. See the written procedure in the last lines
MOV BX, 0064H ; Weight for 3rd digit, Storing 0064H into BX register (100th Position)
CALL BCD2BIN ; calling BCD2BIN procedure. See the written procedure in the last lines
MOV BX,03E8H ; Weight for MSD, Storing 03E8H in the BX register (1000th Position)
CALL BCD2BIN ; calling BCD2BIN procedure. See the written procedure in the last lines
INT 3 ; Breakpoint interrupt
BCD2BIN PROC NEAR ; BCD2BIN is a procedure called 4 times in the main program
MOV AX, BCD ; Subroutine multiplies digits with respective weights and adds the partial
; product to get equivalent HEX moving the desired digit LSD position

AND AX, 000FH ; ANDing operation with BCD value i.e 1234
MUL BX ; multiplies BX with AX
ADD HEX, AX ; add AX value with Hex variable, initially Hex variable have 0
MOV CL, 04 ; moving 04 to CL
ROR BCD, CL ; Rotate Right
RET ; RET instruction stands for return, used at the end of the procedures
BCD2BIN ENDP ; end the procedure
END START
