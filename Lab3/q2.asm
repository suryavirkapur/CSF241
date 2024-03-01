.MODEL SMALL
.STACK 100H

.DATA
    numArray DB 10, 25, 38, 47, 52, 63, 74, 89  ; Replace with your 8-bit number array

.CODE
MAIN PROC
    MOV AX, @DATA   ; Initialize the data segment
    MOV DS, AX

    LEA SI, numArray ; Load the address of the array into SI
    MOV CX, 8        ; Set the loop counter to the number of elements in the array

ARRAY_LOOP:
    MOV AL, [SI]     ; Load the current element into AL
    AND AL, 1        ; AND operation with 1 to check LSB

    ; Display result based on the least significant bit
    CMP AL, 0
    JE  XEVEN         ; Jump if Zero (LSB is 0)

ODD:
    ; Code to handle odd number
    ; (You can replace this with your logic)
    ; For now, we'll print a message indicating odd.
    MOV AH, 9
    LEA DX, MsgOdd
    INT 21H
    JMP CONTINUE

XEVEN:
    ; Code to handle even number
    ; (You can replace this with your logic)
    ; For now, we'll print a message indicating even.
    MOV AH, 9
    LEA DX, MsgEven
    INT 21H

CONTINUE:
    INC SI           ; Move to the next element in the array
    LOOP ARRAY_LOOP  ; Repeat the loop until all elements are processed

    ; Your program exit code here
    MOV AH, 4CH
    INT 21H

MAIN ENDP

.DATA
    MsgEven DB 'The number is even.', 0Dh, 0Ah, '$'
    MsgOdd  DB 'The number is odd.', 0Dh, 0Ah, '$'

END MAIN
