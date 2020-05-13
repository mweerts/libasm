# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mweerts <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/21 12:44:50 by mweerts           #+#    #+#              #
#    Updated: 2020/05/12 21:41:15 by mweerts          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

;ft_write(int fd, const void *buf, size_t count)
;fd = rdi
;*buf = rsi
;count = rdx

section .text
    global ft_write
    extern __errno_location

ft_write:
    mov rax, 1
    syscall
    cmp rax, 0
        jl error
    ret

error:
    mov rcx, rax
    neg rcx
    call __errno_location
    mov [rax], rcx
    mov rax, -1
    ret