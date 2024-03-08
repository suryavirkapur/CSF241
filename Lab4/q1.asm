.model small
.stack 100h
.data
    hex_num dw 0A23Fh  ; 4-digit hexadecimal number stored in memory
    bcd_result dw ?, ? ; memory locations to store the BCD result
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ax, hex_num  ; load the hexadecimal number into AX
        
        ; convert hexadecimal to decimal (BCD)
        mov bx, 10h      ; divisor: 16
        mov cx, 0        ; counter for BCD digits
        
    convert:
        mov dx, 0        ; clear DX for division
        div bx           ; divide AX by 16
        push dx          ; push the remainder (BCD digit) onto the stack
        inc cx           ; increment the BCD digit counter
        cmp ax, 0        ; check if quotient is zero
        jnz convert      ; if not zero, continue conversion
        
        ; store the BCD result in memory
        mov bx, offset bcd_result  ; load the address of bcd_result into BX
        
    store_bcd:
        pop ax           ; pop a BCD digit from the stack into AX
        mov [bx], al     ; store the BCD digit in memory
        inc bx           ; move to the next memory location
        loop store_bcd   ; repeat until all BCD digits are stored
        
        mov ah, 4ch
        int 21h          ; exit program
    main endp
end main
