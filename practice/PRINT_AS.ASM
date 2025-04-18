.model small
.stack 100h
.data
        str1 db "ASCII Table: ", 0Ah, "$"
.code
        mov ax, @data
        mov ds, ax

        mov ah, 09h
        mov dx, offset str1
        INT 21h

        mov cx, 26
        mov al, 97

        COUNT:
                push ax ; Save ax (al)

                mov dl, al
                mov ah, 02h
                INT 21h
                
                

                mov dl, ' '
                mov ah, 02h ; Returns ' ' into al overwriting the ascii code
                INT 21h

                pop ax ; Restore ax (al) 

                add al, 1
      loop COUNT


        mov ah, 4ch
        INT 21h
end
