; SURYAIVR KAPUR
; 2022A7PS0293U
.MODEL SMALL
.STACK 20
.DATA
ORG 1000H
NUM DB 8H
ANS DW ?

.CODE 
START:
MOV AX,@DATA
MOV DS,AX
MOV CX,8H
MOV SI,1H
MOV AL,1H
REPEAT:
MUL SI
INC SI
LOOP REPEAT
MOV ANS,AX
INT 3
END START