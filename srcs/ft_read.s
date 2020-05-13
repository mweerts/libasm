# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mweerts <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/13 12:36:37 by mweerts           #+#    #+#              #
#    Updated: 2020/05/13 12:46:57 by mweerts          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

;ft_read(int fd, void *buf, size_t count)
;fd = rdi
;*buf = rsi
;count = rdx

section .text
    global ft_read
    extern __errno_location

ft_read:
    mov rax, 0
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
