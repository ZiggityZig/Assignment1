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
	mov bh,[ecx]
	cmp bh,65
	jb dig
	sub bh,65
	add bh,10
	jmp convert
	dig:
	sub bh,48
	convert:
	mov bl, 8
	
	start: 
	mov dl,bl
	and bl,bh
	mov byte [an+eax],'0'
	cmp bl,0
	je cont
	mov byte [an+eax], '1'
	cont:
	inc eax
	mov bl,dl
	shr bl,1
	cmp bl, 0
	
	jnz start
	
	inc ecx
	cmp byte [ecx], 10
	jnz findNum
	mov byte [an+eax+1], 0
	push an				; call printf with 2 arguments -  
	push format_string	; pointer to str and pointer to format string
	call printf
	add esp, 8		; clean up stack after call

	popad			
	mov esp, ebp	
	pop ebp
	ret
