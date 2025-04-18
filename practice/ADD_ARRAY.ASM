.model small
.stack 100h
.data
        nums1 db 10, 20, 30
        sum db ?
        str db "SUM: ", "$"
.code
        mov ax, @data
        mov ds, ax

        mov ah, 09h
        mov dx, offset str
        INT 21h

        mov cx, 3
        mov si, offset nums1
        mov al, 0
        ADD_Array:
                
                mov bl, [si]
                add al, bl

                inc si

        LOOP ADD_Array

        ;Seperate the two digits
        mov ah, 0
        mov bl, 10
        div bl ; result is as ah (ones digit): al (tens digit)
        push ax ;Store tens place digit as we need ah

        ;Display al
        mov dl, al
        add dl, 48
        mov ah, 02h
        INT 21h

        ;Display ah
        pop ax
        mov dl, ah
        add dl, 48
        mov ah, 02h
        INT 21h

        mov ah, 04ch
        INT 21h
end
