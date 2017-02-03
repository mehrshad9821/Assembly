#CMPT 295 - Assignment 2
#Mehrshad Matin
#301117102
#Anthony Dixon
#Feb24, 2016

.data 

R:	.quad 				#fnal annswer
IN:	.quad 	67890	#test case
LOW:	.quad -2147483648		# 2^31 - 1
HIGH:	.quad 2147483648		#- 2^31
	.text
	.global main
main:
	mov $IN, %rax
	mov 0(%rax), %rax
	mov $R, %rbx 		#creating a space for the final result
	mov $LOW, %r11		
	mov 0(%r11), %r11	#moving min value to %r11
	mov $HIGH, %r12
	mov 0(%r12), %r12	#moving max value to %r12

	cmp $0, %rax		#if its positive go to "positive" section
	jnl positive
	cmp	%r11, %rax		#if the value is not in range, terminate
	jl	finish
	neg %rax
	add $45, %r14		#if its negative, adding dash
	mov %r14, 0(%rbx)	#mov it to the output		
	mov $4, %r10
	jmp process
positive:			##if its pos, adding space
	cmp %r12,%rax
	jnl finish
	add $32, %r14		#add space
	mov %r14, 0(%rbx)
	cmp $0, %rax		
	je zero	
	jmp process
zero:				#if the input is zero
	mov $48, %r13
	mov %r13, 1(%rbx)
	jmp finish
process:	cmp $0, %rax		#the number is = or less than 0 finish loop
			je	finish
			mov $0, %r15
			add $10, %r15
			mov $0, %rdx
			div %r15
			add $48, %rdx			#converting to ascii
			add $1, %rbx			#increment the bit by 1
			mov %rdx, 0(%rbx)

			jmp process
finish: 

		ret 



