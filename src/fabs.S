[BITS 64]

	global fabs:function, _fabs:function
	section .text

	; double fabs(double x);
	; xmm0 -> double x

_fabs:
fabs:
fabs ; do float number absolute
ret 0
