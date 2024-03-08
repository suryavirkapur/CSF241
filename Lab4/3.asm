.MODEL SMALL
.STACK 20
.CODE
START: ; here no data segment, using DOS interrupts
MOV AL, 45H ; Number to be Display on screen, store the 45H in AL
MOV BL, AL ; Moving 45H to BL
AND AL, 0F0H ; Get upper digit (nibble), AND operation to 45
ROR AL, 4 ; Rotate to Right
CALL HEXASC ; Convert from hex to ASCII
MOV DL, AL ; moving AL to DL
MOV AH, 02 ; Function code to display single character
INT 21H ; DOS interrupt 21H
MOV AL, BL ; Moving BL to AL
AND AL, 0FH ; Get lower digit by ANDing AL
CALL HEXASC ; call HEXASC Procedure
MOV DL, AL ; move AL to DL
MOV AH, 02 ; 02 to AH to Display second digit
INT 21H ; DOS interrupt 21H
MOV AH, 4CH ; causes the process to terminate
INT 21H ; DOS interrupt 21H
HEXASC: ; HEX TO ASCII procedure start
CMP AL,0AH ; compare 38 with 3A ,To see whether it is between 30H to 39H

; or 41H to 46H,
JB NUM ; Jump if Carry
ADD AL,07 ; For A-F, add 37H
NUM: ; jump address reference
ADD AL,30H ; For 0-9, add 30H
RET ; RET stands for return, used at the end of the procedures
END START
