.global countsym
countsym:
	stp x29, x30, [sp, #-16]!
	mov x5, x0
	b count_loop
count_loop:
	ldrb w4, [x5, x6]
	cmp w4, #0
	beq done_loop
	add x6, x6, #1
	b count_loop
done_loop:
	mov x0, x6
	ldp x29, x30, [sp], #16
	ret
