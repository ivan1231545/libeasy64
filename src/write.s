.global writeln
writeln:
	stp x29, x30, [sp, #-16]!

	mov x5, x0
	mov x4, #0
	mov x6, #0
	
	b count_loop
count_loop:
	ldrb w4, [x5, x6]
	cmp w4, #0
	beq done_loop
	add x6, x6, #1
	b count_loop
done_loop:
	mov x0, #1
	mov x1, x5
	mov x2, x6
	mov x8, #64
	svc #0

	ldp x29, x30, [sp], #16
	ret
