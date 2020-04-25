.text                   #put instructions in .text 
info: .asciz "\nName:Dean and Harry\nNetID:dnguyenvietqua and heconomides\nAssignment 1b: inout\n" #Name, netID, name of the assignment

formatstr: .asciz "%d"  #specify the format

space: .asciz "\n"      #add a line after the result

base: .asciz "Base "    

exponent: .asciz "Exponent "

.global main            #globalize main subroutine

main:                   #program starts

  movq $0, %rax         #no vector argument  
  movq $info, %rdi      #second argument 
  call printf           #call print subroutine
  call inout            #call inout subroutine
  movq $0, %rax         #no vector argument  
  movq $space, %rdi     #second argument 
  call printf           #call print subroutine
  
end: 
  movq $0, %rdi
  call exit             #exit the program

inout:

  pushq %rbp            #pushes the base pointer
  movq %rsp, %rbp       #moves the base pointer to the stack pointer 

  subq $24, %rsp        #reserve stack space for the two inputs

  #ask for base
  movq $0, %rax           
  movq $base, %rdi      
  call printf           

  leaq -8(%rbp), %rsi   #load address of base
  movq $formatstr, %rdi #load first argument of scanf
  movq $0, %rax         #no vector registers for scanf
  call scanf            #call scanf

 
  #ask for exponent
  movq $0, %rax         
  movq $exponent, %rdi      
  call printf           

  leaq -16(%rbp), %rsi  #load address of exponent
  movq $formatstr, %rdi #load first argument of scanf
  movq $0, %rax         #no vector registers for scanf
  call scanf            #call scanf
  
  movq -16(%rbp), %rsi #move the exponent to register rsi
  movq -8(%rbp),  %rdi #move the base to register rdi
  
  call pow

  movq %rax, %rsi
  movq $formatstr, %rdi #format for print subroutine
  movq $0, %rax        
  call printf           #no vector registers for printf

  movq  %rbp, %rsp     # clears local variables
  popq  %rbp           # restores base pointer

  ret                  #return to the next line in main

pow:

  movq $0, %rcx        #set the counter to 0
  
  
  #if the exponent is 0 return 1
  cmpq $0, %rsi
  jne loop  
  movq $1, %rax 
  jmp endpow

  loop:
    mulq %rdi          #multiply by the base
    incq %rcx          #increment the counter
    
    cmpq %rsi, %rcx    #if the counter is greater or equal 
    jl loop	       #to the exponent jump to the end of the loop	  

  endpow:
  

  ret

