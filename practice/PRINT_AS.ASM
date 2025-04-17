.model small
.stack 100h
.data
        str1 db "ASCII Table: ", 0Ah, "$"
.code
main proc
        mov ax, @data
        mov ds, ax

        mov ah, 09h
        mov dx, offset str1
        INT 21h

        mov cx, 95
        mov al, 32

        COUNT:
                mov dl, al
                mov ah, 02h
                INT 21h

               ; mov dl, 'A'
                ;mov ah, 02h
               ; INT 21h
               

                add al, 1
      loop COUNT


        mov ah, 4ch
        INT 21h

main endp
end main
