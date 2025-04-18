.model small
.stack 100h
.data
        str1 db "Enter string: ", "$"
        str2 db 0Ah, "You entered: ", "$"
        wd db 10 dup(?) ; Array of length 10
.code
        mov ax, @data
        mov ds, ax

        mov ah, 09h
        mov dx, offset str1
        INT 21h

        mov cx, 10  ;Loop till 10
        mov si, offset wd ; Give start index of array

        enter:
                ;Take user input
                mov ah, 01h
                INT 21h

                ;If enter was pressed, stop loop
                cmp al, 0dh
                je EXIT

                ;else store in array
                mov [si], al

                ;increment si
                inc si

        LOOP enter

        EXIT:
            ;Load "\0" to end string
            mov bl, "$"
            mov [si], bl

            ;Print the array
            mov ah, 09h
            mov dx, offset str2
            INT 21h

            mov ah, 09h
            mov dx, offset wd
            INT 21h

        mov ah, 04ch
        INT 21h
end
