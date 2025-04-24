.model small
.stack 100h
.data
        str1 db "PAK", "$"
        str2 db "HELLO", "$"
        str3 db "What", "$"
        str4 db "Yo", "$"
        str5 db "Shit", "$"
        str6 db "Hell", "$"
        str7 db "Aqsa", "$"
        str8 db "Jiyan", "$"
        str9 db "Ahmad", "$"
        str10 db "aa", "$"
        strings dw offset str1, offset str2, offset str3, offset str4, offset str5, offset str6, offset str7, offset str8, offset str9, offset str10
        ; 0, 2, 4, 6, 8, 10, 12, 14, 16, 18
        rand_num db 0
.code
        mov ax, @data
        mov ds, ax

        call generate_random_number
        mov al, rand_num

        mov ah, 0
        add al, al ;Since each address is 16 bits (2 bytes), we mul by 2 get correct offset
        
        
        mov si, offset strings
        add si, ax
        mov di, [si]

        mov ah, 09h
        mov dx, di
        INT 21h

        mov ah, 04ch
        INT 21h

generate_random_number proc
        mov ah, 0
        INT 1ah

        mov ax, dx
        mov dx, 0
        mov bx, 10
        div bx

        mov rand_num, dl
        RET

generate_random_number endp      
end
