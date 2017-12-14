	.file	"mat.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
movl	$0, -16(%rbp)
movl	$1, -12(%rbp)
movl	$2, -8(%rbp)
movl	-12(%rbp), %eax
addl	%eax, -16(%rbp)
movl	$3, -4(%rbp)
movl	-8(%rbp), %eax
addl	%eax, -16(%rbp)
movl	-4(%rbp), %eax
addl	%eax, -16(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
