section	.rodata			; we define (global) read-only variables in .rodata section
	format_string: db "%s", 10, 0	; format string

section .bss			; we define (global) uninitialized variables in .bss section
	an: resb 33		; enough to store integer in [-2,147,483,648 (-2^31) : 2,147,483,647 (2^31-1)]

section .text
	global convertor
	extern printf

convertor:
	push ebp
	mov ebp, esp	
	pushad			

	mov ecx, dword [ebp+8]	; get function argument (pointer to string)
	mov eax,0
	findNum:				; find the value of the hex digit
	mov bh,[ecx]
	cmp bh,'A'				; if the digit is A-F
	jb num
	sub bh,'A'
	add bh,10
	jmp convert
	num:
	sub bh,'0'				; if the digit is a number 0-9
	
	convert:				; start the conversion to binary
	mov bl, 8
	start: 					; start of the loop
	mov dl,bl
	and bl,bh				; finding the value of each byte of the number	
	mov byte [an+eax],'0'
	cmp bl,0
	je cont
	mov byte [an+eax], '1'
	cont:
	inc eax
	mov bl,dl
	shr bl,1				; shift bl right so we can address the next byte
	cmp bl, 0				; check if we reached the last byte
	jnz start				; if not start the loop again
	
	inc ecx
	cmp byte [ecx], 10
	jnz findNum
	mov byte [an+eax], 0	; adding 0 so the output will be null terminated
	push an				; call printf with 2 arguments -  
	push format_string	; pointer to str and pointer to format string
	call printf
	add esp, 8		; clean up stack after call

	popad			
	mov esp, ebp	
	pop ebp
	ret
