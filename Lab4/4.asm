.MODEL SMALL
.STACK 20
.CODE
START:
CALL READKB ; Read Keyboard Procedure Call
MOV BL,AL ; move AL to BL
CALL NXTLINE ; Nextline procedure call
CALL READKB ; Read Keyboard Procedure Call
MUL BL ; Multiply BL with AL
MOV BL, AL ; move AL to BL
CALL NXTLINE ; Nextline procedure call
CALL DISP ; Call DISP procedure
MOV AH, 4CH ; causes the process to terminate
INT 21H ; DOS interrupt 21H

READKB PROC NEAR ; Read Keyboard Procedure Start here
MOV AH,01 ; Accepting number from keyboard
INT 21H ; DOS interrupt 21H
CALL ASCHEX ; Procedure to Ascii to Hex
RET ; RET used at the end of the procedures
READKB ENDP ; Read Keyboard Procedure ends here

ASCHEX PROC NEAR ; ASCII to Hex procedure start here
CMP AL, 3AH ; compare AL value with 3AH
JC SUB30 ; jump if carry, Sub30 is address
SUB AL, 07H ; no carry the subtract 07H with AL
SUB30: ; In compare carry generates, SUB30: start executes
SUB AL,30H ; ASCII to hex conversion
AND AL,0FH ; AND operation with 0Fh with AL value
RET ; RET used at the end of the procedures
ASCHEX ENDP ; Ascii to Hex procedure ends here

NXTLINE PROC NEAR ; NEXTLINE procedure start here
MOV AH, 2 ;
MOV DL, 0AH ; Line feed
INT 21H ; DOS interrupt 21H
MOV DL,0DH ; Carriage return
INT 21H ; DOS interrupt 21H
RET ; RET used at the end of the procedures
NXTLINE ENDP ; NEXTLINE Procedure ends here

DISP PROC NEAR ; DISP procedure start here
MOV AL, BL ; Moving BL to AL
AND AL, 0F0H ; AND operation of AL and 0F0h
ROR AL, 4 ; rotate right AL, 4 times
CALL HEXASC
MOV DL, AL ; Moving AL contents to DL
MOV AH, 02
INT 21H ; DOS interrupt 21H
MOV AL, BL ; Moving BL contents to AL
AND AL, 0FH ; AND operation of AL and 0Fh
CALL HEXASC
MOV DL, AL ; Moving AL contents to DL
MOV AH, 02
INT 21H ; DOS interrupt 21H
RET ; RET used at the end of the procedures
DISP ENDP ; DISP procedure ends here

HEXASC PROC NEAR ; HEXASC, Hex to Ascii procedure start here
CMP AL, 0AH ; compare AL with 0AH
JB NUM
ADD AL, 07 ; add 07 to AL
NUM:
ADD AL, 30H ; Add 30h to AL
RET ; RET instruction used at the end of the procedures
HEXASC ENDP ; HEXASC procedure ends here
END START
