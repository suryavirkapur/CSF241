.MODEL SMALL
.STACK 20
.DATA ; Data segment start here
ORG 1000H ; Memory address initialization
Hex_Digit DB 38H ; Given Hex value is 38H, Hex_Digit is a variable
ASCII DB ? ; ASCII is the variable to store the ASCII equivalent Hex of 38H
.CODE ; Code start here
START:
MOV AX, @DATA ; Initializing DS: segment register
MOV DS, AX
MOV AL, Hex_Digit ; Moving Hex_Digit value 38H to AL register
CMP AL, 3AH ; compare 38 with 3A, To see whether it is between 30H to 39H

; or 41H to 46H

JC SUB30 ; if carry generated then jump to location SUB30
SUB AL, 07H ; if no carry then subtract 07H with AL value
SUB30: ; User defined location name
SUB AL,30H ; subtract 30H with AL
MOV ASCII, AL ; Store the AL value into Hex Digit variable
INT 3 ; Breakpoint interrupt
END START
