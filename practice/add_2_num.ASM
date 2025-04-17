.model small
.stack 100h
.data
        str1 db "Enter first num: ",  "$"
        str2 db 0Ah, "Enter second num: ",  "$"
        str3 db 0Ah, "Sum is: ", "$"
.code
        mov ax, @data
        mov ds, ax

        mov ah, 09h
        mov dx, offset str1
        INT 21h

        mov ah, 01h
        INT 21h
        mov cl, al

        mov ah, 09h
        mov dx, offset str2
        INT 21h


        mov ah, 01h
        INT 21h
        mov bl, al

        add cl, bl
        sub cl, 48

        mov ah, 09h
        mov dx, offset str3
        INT 21h

        mov dl, cl
        mov ah, 02h
        INT 21h

        mov ah, 4Ch
        INT 21h
end


