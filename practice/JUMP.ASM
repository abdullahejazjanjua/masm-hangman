.model small
.stack 100h
.data
       num1 db 3
       num2 db 3
       str1 db "Equal", "$"
       str2 db "NOT Equal", "$"
.code
main proc
        mov ax, @data
        mov ds, ax

        mov al, num1
        mov dl, num2

        cmp al, dl
        je EQUAL

        mov ah, 09h
        mov dx, offset str2
        INT 21h

        mov ah, 4ch
        INT 21h


        EQUAL:
                mov ah, 09h
                mov dx, offset str1
                INT 21h

        mov ah, 4ch
        INT 21h


main endp
end main
S
