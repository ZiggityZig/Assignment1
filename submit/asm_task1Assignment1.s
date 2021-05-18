section .data
    form: db "%d",10,0
    
section .text                    	
        global assFunc
        extern printf
        extern c_checkValidity

assFunc:
    push ebp              		
    mov ebp, esp         		
    pushad  
    mov ecx, dword [ebp+8]          
    push ecx
    call c_checkValidity
    add esp,4
    mov ecx, dword [ebp+8]          ; get function arg again in case c_checkValidity used ecx
    cmp eax, 1
    jne odd
    even:
    shl ecx, 2                      ; mult by 4
    jmp end
    odd:
    shl ecx, 3                      ; mult by 8
    end:
    push ecx
    push form
    call printf
    add esp,8
    popad                    	     		
    mov esp, ebp			
    pop ebp				
    ret