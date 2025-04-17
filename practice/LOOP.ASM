.model small
.stack 100h
.data
        str1 db "Numbers (0-9): ", "$"
.code
        mov ax, @data
        mov ds, ax

        ;Print str1
        mov ah, 09h
        mov dx, offset str1
        INT 21h

        ;mov 0 into dl
        mov cx, 10
        mov dl, 97

        COUNT:
                ;Print what is in dl and increment
                mov ah, 02h
                INT 21h
                add dl, 1

        loop COUNT

        mov ah, 4ch
        INT 21h


end
