section .text
	global _ft_strlen

_ft_strlen:
	mov rax, 0

	cmp rdi, 0
	je finish

	mov rcx, -1
	mov al, 0
	repnz scasb
	mov rax, rcx
	neg rax
	sub rax, 2

finish:
	ret