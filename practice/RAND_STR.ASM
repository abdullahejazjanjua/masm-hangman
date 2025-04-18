.model small
.stack 100h
.data
        str1 db "PAK", "$"
        str2 db "HELLO", "$"
        str3 db "What", "$"
        strings dw offset str1, offset str2, offset str3
        num_strs db 3
        rand_num db 0
.code
        mov ax, @data
        mov ds, ax

        call generate_random_number
        mov al, rand_num
        mov ah, 0
        add ax, ax
        
        mov si, offset strings
        mov di, [si+dl]

        mov ah, 09h
        mov dx, di
        INT 21h

        mov ah, 04ch
        INT 21h

generate_random_number PROC 
        
        INT 1ah
        mov ah, 0
        mov dx, 0
        mov bx, 3
        div bx

        mov rand_num, dl
        RET
generate_random_number ENDP        
end
