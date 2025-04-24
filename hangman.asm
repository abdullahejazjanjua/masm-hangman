display_str MACRO str

    
    mov ah, 09h
    mov dx, offset nl
    INT 21h

    
    mov ah, 09h
    mov dx, offset str
    INT 21h

    mov ah, 09h
    mov dx, offset nl
    INT 21h


ENDM

delay MACRO 

    mov cx, 10000
    RUN:
    LOOP RUN
ENDM

get_len MACRO str

    mov si, offset str
    mov bl, len_wrd
    get:
        mov al, [si]
        cmp al, "$"
        je got_it
        add len_wrd, 1
        inc si
        jmp get
        
        got_it:
ENDM

add_null MACRO
    
    mov si, offset guesses_wrd
    mov dh, 0
    mov dl, len_wrd
    mov cx, dl

    add_end_char:
        inc si
    LOOP add_end_char

    mov BYTE PTR [si], '$'
ENDM

print_guess_word MACRO

    display_str nl

    mov si, offset guesses_wrd

    print_loop:
        mov dl, [si]

        cmp dl, '$'
        je completed
        mov ah, 02h
        INT 21h

        inc si
        jmp print_loop
    completed:
        display_str nl

ENDM


.model small
.stack 100h
.data
    str1 db "Ahamd", "$"
    selected db 10 dup('$')
    enter db "Enter a letter: ", "$"
    nl db 0Ah, "$"
    guesses_wrd db 10 dup("-")
    not_str db "Wrong guess! You lost a point", "$"
    yes_str db "Thats right! You got it", "$"
    lost db "You lost!! Another game?", "$"
    len_wrd db 0
    entered_words db 26 dup("-"), "$"
    bf db "Change entered_words size", "$"
    exp db "!!!!!!!!!!!!!!!!!!!!!!!!!!!", "$"
    won db "Congrats! You won the game", "$"

    words    db "APPLE", 0, "MANGO", 0, "GRAPE", 0, "BANANA", 0, "CHERRY", 0
    wordPtrs dw offset words, offset words+6, offset words+12, offset words+18, offset words+25

.code
    mov ax, @data
    mov ds, ax
    
    call get_string 

    display_str selected

    get_len selected
    add_null
    mov bx, 10


    gameloop:

        try_again:
            display_str enter
            ;Take user input
            mov ah, 01h
            int 21h
            push ax ;Store al as is_entered returns values in it
        
            call is_entered
            cmp al, 1 ;Duplicate was found
            je try_again
            cmp al, 2
            je warning 
            jmp continue
    
        warning:
            display_str bf

        continue:
            pop ax

            call compare_and_store_word
            push dx ;Below uses dx also. So I have save dx
            print_guess_word 
            pop dx

            cmp dx , 1
            jne skip_gameloop
            jmp gameloop
            skip_gameloop:
    
            jne WRONG
    WRONG:
        sub bx, 1 ;Decrement this to check if user found all words
        cmp bx, 0
        je game_end ;if 0 then game over
        display_str not_str
        jmp gameloop

    game_over:
        mov al, len_wrd
        cmp al, 0
        je game_win
        cmp bx, 0
        je game_over_actually
        

        game_win:
            display_str exp
            display_str won
            display_str exp
            jmp game_over_actually

        game_end:
            display_str lost
        game_over_actually:
            mov ah, 04ch
            INT 21h

compare_and_store_word PROC 
    xor dx, dx
    display_str selected
    
    ; Get index of word
    mov si, offset selected
    mov di, offset guesses_wrd


    COMPARE:
        ;compare entered letter with letters in chosen word
        mov cl, [si]
        cmp al, cl
        je EQUAL

        RETURN:
            inc si
            inc di
            cmp cl, "$"
            je finish
            
            jmp COMPARE
    EQUAL:
        display_str yes_str
        mov [di], al
        mov dx, 1 ;return true
        call end_game

        jmp RETURN
        finish:
            RET
compare_and_store_word ENDP

end_game PROC
    sub len_wrd, 1
    cmp len_wrd, 0
    jne skip
    jmp game_over
        skip:


    RET
end_game ENDP

is_entered PROC
    mov si, offset entered_words

    search_loop:
        mov cl, [si]
        cmp cl, al
        je duplicate_found
        cmp cl, '$'
        je not_found
        inc si
        jmp search_loop

    duplicate_found:
        mov al, 1      ; flag = 1 means duplicate found
        ret

    not_found:
        mov si, offset entered_words

    find_empty:
        mov cl, [si]
        cmp cl, '-'
        je store_letter
        cmp cl, '$'
        je buffer_full
        inc si
        jmp find_empty

    store_letter:
        mov [si], al
        mov al, 0      ; flag = 0 means stored successfully
        ret

    buffer_full:
        mov al, 2      ; flag = 2 means buffer full
        ret

is_entered ENDP


get_string PROC
    ; Generate random number between 0-4
    mov ah, 00h
    int 1Ah                 ; CX:DX has the tick count
    mov al, dl              ; Use lower byte of ticks for randomness
    and al, 00000111b       ; Limit to 0-7
    cmp al, 04              ; Limit to 0-4 (5 words)
    jbe ok_index
    mov al, 03              ; fallback to 3
    
ok_index: 
    mov bl, al
    xor bh, bh              ; Clear upper byte to use BX as index
    shl bx, 1               ; Multiply by 2 (for word offset)
    mov si, wordPtrs[bx]    ; Get pointer from array using index

    ; Copy word to selected
    lea di, selected
    
copy_loop:
    mov al, [si]            ; Get character from source
    cmp al, 0               ; Check for null terminator
    je done_copy
    mov [di], al            ; Store character in destination
    inc si
    inc di
    jmp copy_loop

done_copy:
    mov byte ptr [di], '$'  ; Add string terminator for DOS
    RET
get_string ENDP

 

END