.MODEL small
.STACK 100h

.DATA
    prompt DB 'Enter a character: $'
    result DB 0Dh, 0Ah, 'ASCII value: $'

.CODE
    main PROC
        mov ax, @data
        mov ds, ax

        ; Display prompt
        mov ah, 09h
        lea dx, prompt
        int 21h

        ; Read character from keyboard
        mov ah, 01h
        int 21h
        mov bl, al

        ; Display result message
        mov ah, 09h
        lea dx, result
        int 21h

        ; Display ASCII value
        mov ah, 02h
        mov dl, bl
        int 21h

        ; Exit program
        mov ah, 4Ch
        int 21h
    main ENDP
END main
