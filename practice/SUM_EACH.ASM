.model small
.stack 100h
.data
        str db 0Ah, "Old array: ", "$"
        nums1 db 10, 20, 30
        nums2 db 10, 10, 10
        nums3 db 0, 0, 0
        str2 db "New array: ", "$"
.code
        mov ax, @data
        mov ds, ax

        mov cx, 3
        mov ah, 0
        mov si, offset nums1
        mov di, offset nums2
        mov bx, offset nums3

        sum:
                mov al, [si]
                mov dl, [di]

                add al, dl
                mov [bx], al

                inc si
                inc di
                inc bx
        LOOP sum

        mov cx, 3
        mov si, offset nums3
        PRINT:
            mov al, [si]
            mov bl, 10
            mov ah, 0

            div bl

            push ax

            mov dl, al
            add dl, 48
            mov ah, 02h
            INT 21h

            pop ax
            mov dl, ah
            add dl, 48
            mov ah, 02h
            INT 21h

            mov dl, ' '
            mov ah, 02h
            INT 21h

            inc si

        LOOP PRINT

        mov ah, 04ch
        INT 21h


end
