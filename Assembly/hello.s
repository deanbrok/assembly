.text
HELLO: .asciz "Dean\ndnguyenvietqua\nAssignment 1a: Hello world\nI am years old\n" 
#Name, netID, name of the assignment

string: .asciz "You got it!\n"

num: .asciz "0"

ex: .asciz "%s"




.global main

main:
	pushq %rbp
	movq %rsp, %rbp
	
		
	/*
pushq $4
	movq $0, %r13   
	popq %rax
	count:
		xor %rdx, %rdx
		movq $10, %r14

		divq %r14

		addq $48, %rdx
		pushq %rdx
		incq %r13
		cmpq $0, %rax
		jne count
		
	print_u:
			
		movq $1, %rax
		movq $1, %rdi
		movq %rsp, %rsi
		movq $1, %rdx
		syscall
			
		cmpq $0, %r13
		jne decrement
			
		incq %rbx
			
 		decrement:
			decq %r13	
			jmp print_u
	*/
	movq $0, %r10
	movq $10, %r11
	movq $56, %rax

	loop:
		incq %r10
		movq $0, %rdx
		divq %r11
		addq $48, %rdx
		pushq %rdx

		movq $1, %rax
		movq $1, %rdi
		movq %rsp, %rsi
		movq $1, %rdx
		syscall

		popq %r14
		cmpq $2, %r10
		jne loop


/*
	movq $0, %r13
	movq $48, %r12
	loop:
		
		pushq %r12
		incq %r13
		incq %r12
		movq $1, %rax
		movq $1, %rdi
		movq %rsp, %rsi
		movq $1, %rdx
		syscall

		subq $8, %rsp
		cmpq $9,%r13
		jle loop
*/		
	movq %rbp,%rsp
	popq %rbp

	movq $0, %rdi
  call exit #exit the program

 

	
	
	

	








