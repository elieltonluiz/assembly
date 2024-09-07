section .data
    msg db 'Olá, Mundo!', 0xA  ; mensagem com um newline (0xA)
    len equ $ - msg             ; tamanho da mensagem

section .text
    global _start               ; ponto de entrada do programa

_start:
    ; sys_write chamada de sistema (syscall número 1)
    mov rax, 1                  ; número da syscall para sys_write
    mov rdi, 1                  ; file descriptor (1 = saída padrão, stdout)
    mov rsi, msg                ; endereço da mensagem
    mov rdx, len                ; tamanho da mensagem
    syscall                     ; invoca a chamada de sistema

    ; sys_exit chamada de sistema (syscall número 60)
    mov rax, 60                 ; número da syscall para sys_exit
    xor rdi, rdi                ; código de retorno (0)
    syscall                     ; invoca a chamada de sistema
