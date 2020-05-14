# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mweerts <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/14 12:38:27 by mweerts           #+#    #+#              #
#    Updated: 2020/05/14 15:54:47 by mweerts          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

;ft_strdup(cont char *s)
;rdi = *s

section .text
    global ft_strdup
    extern malloc
    extern ft_strlen
    extern ft_strcpy

ft_strdup:
    push rdi
    call ft_strlen
    mov rdi, rax
    call malloc
    cmp rax, 0
        jz error
    pop rsi
    mov rdi, rax
    call ft_strcpy
    ret

error:
    mov rax, 0
    ret