
;Title: Write X86/64 ALP to convert 5-digit BCD number into its equivalent HEX number.
section .data
  msg1 db "Enter 4 digit BCD number: "     ; Message asking user to enter BCD number
  len1 equ $-msg1                          ; Length of msg1
  msg2 db 10,"Equivalent HEX number: "     ; Message before displaying HEX result
  len2 equ $-msg2                          ; Length of msg2

section .bss
  num resb 5        ; Buffer to store 4-digit BCD input (ASCII + Enter)
  hex resb 4        ; Buffer to store 4 HEX digits
; ----------------------------------------------------
; Macro for Linux system calls
; scall syscall_no, fd, buffer, length
; ----------------------------------------------------
%macro scall 4
  mov rax,%1       ; System call number
  mov rdi,%2       ; File descriptor
  mov rsi,%3       ; Buffer address
  mov rdx,%4       ; Length
  syscall
%endmacro

section .text
  global _start

_start:
 ; ----------------------------------------------------
; Display input message
; ----------------------------------------------------
  scall 1,1,msg1,len1      ; write() → print msg1
; ----------------------------------------------------
; Read BCD number from user
; ----------------------------------------------------
  scall 0,0,num,5          ; read() → accept 4 digits
; ----------------------------------------------------
; ASCII → Decimal Conversion
; Example: "1234" → 1234
; ----------------------------------------------------
  mov rsi,num              ; RSI points to input buffer
  xor rax,rax              ; Clear RAX (will hold decimal value)
  mov rcx,4                ; Process 4 digits

dec_convert:
  mov bl,[rsi]            ; Load ASCII digit
 sub bl,'0'              ; Convert ASCII → numeric value
 imul rax,10             ; result = result * 10
 add rax,rbx             ; Add new digit
 inc rsi                 ; Move to next character
 loop dec_convert        ; Repeat for all digits
; ----------------------------------------------------
; Decimal → HEX Conversion
; Repeated division by 16
; ----------------------------------------------------
  mov rbx,16               ; Divisor = 16
  mov rdi,hex+3            ; Store digits from right to left
  mov rcx,4                ; Generate 4 HEX digits

hex_loop:
   xor rdx,rdx             ; Clear remainder register
   div rbx                 ; RAX / 16 → Quotient:RAX  Remainder:RDX
   cmp dl,9                ; Check if remainder > 9
   jbe digit               ; If 0–9 → numeric digit
   add dl,7                ; Adjust for A–F characters
digit:
  add dl,'0'              ; Convert to ASCII
  mov [rdi],dl            ; Store HEX digit
  dec rdi                 ; Move left in buffer
  loop hex_loop           ; Repeat for 4 digits
; ----------------------------------------------------
; Display result
; ----------------------------------------------------
  scall 1,1,msg2,len2      ; Print result message
  scall 1,1,hex,4          ; Print HEX number
; ----------------------------------------------------
; Exit program
; ----------------------------------------------------
  mov rax,60               ; exit syscall
  xor rdi,rdi              ; return status = 0
  syscall
