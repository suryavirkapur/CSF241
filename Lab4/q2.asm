.MODEL small
.STACK 100h

.STARTUP
    ; Read character from keyboard
    mov ah, 01h
    int 21h
    mov bl, al

    ; Display hexadecimal value
    mov ah, 02h
    mov dl, '0'
    int 21h

    mov ah, 02h
    mov dl, 'x'
    int 21h

    mov cl, 4
    ror bl, cl
    call display_hex_digit

    ror bl, cl
    call display_hex_digit

    ; Exit program
    .EXIT

display_hex_digit PROC
    cmp bl, 9
    jg display_letter
    add bl, '0'
    jmp display_digit

display_letter:
    add bl, 'A' - 10

display_digit:
    mov ah, 02h
    mov dl, bl
    int 21h
    ret
display_hex_digit ENDP

END
