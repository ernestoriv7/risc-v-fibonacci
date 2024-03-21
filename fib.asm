.text

main: 
	addi a0, zero, 7 #Colocar en esta constante el valor de n que deseen evaluar
	jal fib
	
end:
	j end
	
fib:
	addi sp, sp, -12
	sw ra, 8(sp)
	sw a0, 4(sp)
	
	if:
		bne a0, zero, elseif
		addi a0, zero, 0
		addi sp, sp, 12
		jr ra
	
	elseif:
		addi t0, zero, 1
		bne a0, t0, else
		addi a0, zero, 1
		addi sp, sp, 12
		jr ra
	
	else:
		addi a0, a0, -1
		jal fib
		sw a0, 0(sp)
		
		lw a0, 4(sp)
		addi a0, a0, -2
		jal fib
		
		lw t0, 0(sp)
		lw ra, 8(sp)
		addi sp, sp, 12
		
		add a0, a0, t0
		
		jr ra
