str_disp macro str

    mov ah, 09h
    mov dx, offset str
    INT 21h

endm
.model small
.stack 100h
.data
        str1 db 0Ah, "Enter a number: ", "$"
        intro db "You have to guess the randomly chosen number.", "$"
        finish db "Congrats! You wun!", "$"
        again db "Wrong! Try again.", "$"
        nl db 0Ah, "$"
        total_attempts db "You took: ", "$"
        count db 0
        rand_num db 0
.code

     mov ax, @data
     mov ds, ax

     str_disp intro

     call generate_random_number
     mov bl, rand_num
     add bl, 48
     mov cx, 0

     INPUT:
        str_disp str1

        mov ah, 01h
        INT 21h

        cmp al, bl
        je EXIT
        str_disp nl
        str_disp again
        str_disp nl
        inc cx
        jmp INPUT
 

     EXIT:
          str_disp nl
          str_disp finish
          str_disp nl
          str_disp total_attempts
          mov dl, cl
          add dl, 48
          mov ah, 02h
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
