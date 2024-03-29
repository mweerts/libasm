# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mweerts <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/13 12:53:43 by mweerts           #+#    #+#              #
#    Updated: 2020/05/14 15:26:44 by mweerts          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; *strcpy(char *dest, const char *src)
; rdi = *dest
; rsi = *src

section .text
    global ft_strcpy

ft_strcpy:
    mov rcx, 0

loop:
    mov al, byte[rsi + rcx]
    mov byte[rdi + rcx], al
    cmp byte[rsi + rcx], 0
		jz end
	inc rcx
    jmp loop

end:
    mov     byte[rdi + rcx + 1], 0
    mov     rax, rdi
    ret