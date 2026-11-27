//readfile.s
//x0 - filename
//x1 - address to the buffer
//x2 - number of bytes to be read
.include "consts.s"
.global readfile

readfile:
	stp x29, x30, [sp, #-16]!
	mov x4, x0
	mov x5, x1
	mov x6, x2
	mov x0, #-100
	mov x1, x5
	mov x2, #O_RDONLY
	mov x3, #0
	mov x8, #SYS_OPENAT
	svc #0
	mov x1, x5
	mov x2, x6
	mov x8, #SYS_READ
	svc #0
	ldp x29, x30, [sp], #16
	ret
