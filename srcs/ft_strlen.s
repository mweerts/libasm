# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mweerts <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/20 22:56:22 by mweerts           #+#    #+#              #
#    Updated: 2020/05/13 14:30:12 by mweerts          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	ft_strlen

ft_strlen:
	mov		rax, 0

while:
	cmp		byte[rdi + rax], 0
		jz	end
	inc		rax
	jmp		while

end:
	ret