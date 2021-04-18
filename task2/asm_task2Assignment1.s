section	.rodata			; we define (global) read-only variables in .rodata section
	format_string: db "%s", 10, 0	; format string

section .bss			; we define (global) uninitialized variables in .bss section
	an: resb 33		; enough to store integer in [-2,147,483,648 (-2^31) : 2,147,483,647 (2^31-1)]
	num: resd 1

section .data
	index: dd 0

section .text
	global convertor
	extern printf

convertor:
	push ebp
	mov ebp, esp	
	pushad			

	mov ecx, dword [ebp+8]	; get function argument (pointer to string)
	mov eax,0
	findNum:
	push dword [ecx]
	cmp byte [ecx],'A'
	jb dig
	sub byte [ecx],'A'
	add byte [ecx],10
	jmp convert
	dig:
	sub byte [ecx],'0'
	convert:
	mov edx, 8
	start: 
	mov dword ebx, [ecx]
	and ebx, edx
	cmp ebx,0
	jnz one
	mov byte [an+eax], "0"
	jmp cont
	one:
	mov byte [an+eax], "1"
	cont:
	inc eax
	shr edx,1
	cmp edx, 1
	jnz start
	pop dword [ecx]
	inc ecx
	cmp byte [ecx], 0
	jnz findNum
	;mov byte [an], 0
	push an				; call printf with 2 arguments -  
	push format_string	; pointer to str and pointer to format string
	call printf
	add esp, 8		; clean up stack after call

	popad			
	mov esp, ebp	
	pop ebp
	ret
