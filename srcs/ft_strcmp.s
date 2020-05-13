# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mweerts <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/13 16:20:58 by mweerts           #+#    #+#              #
#    Updated: 2020/05/13 20:57:08 by mweerts          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

;ft_strcmp(const char *s1, const char *s2)
;rdi = s1
;rsi = s2

section .text
    global ft_strcmp

ft_strcmp:
    mov rcx, 0
    mov rax, 0
    jmp loop

loop:
    mov al, byte[rdi + rcx]
    mov bl, byte[rsi + rcx]
    cmp rax, 0
        jz end
    cmp rax, rbx
        jnz end
    inc rcx
    jmp loop

end:
    sub rax, rbx
    ret