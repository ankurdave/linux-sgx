/*
* Math library
*
* Copyright (C) 2016 Intel Corporation. All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
*
*   * Redistributions of source code must retain the above copyright
*     notice, this list of conditions and the following disclaimer.
*   * Redistributions in binary form must reproduce the above copyright
*     notice, this list of conditions and the following disclaimer in
*     the documentation and/or other materials provided with the
*     distribution.
*   * Neither the name of Intel Corporation nor the names of its
*     contributors may be used to endorse or promote products derived
*     from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
* OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
* LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
* THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*
* Author Name <jingwei.zhang@intel.com>
*   History:
*   03-14-2016 Initial version. numerics svn rev. 12864
*/
	.file "ccosh.c"
	.text
..TXTST0:
# -- Begin  ccosh
	.text
       .align    16,0x90
	.globl ccosh
ccosh:
# parameter 1: 12 + %ebp
..B1.1:
..L1:

        pushl     %ebp
        movl      %esp, %ebp
        andl      $-64, %esp
        pushl     %esi
        pushl     %edi
        pushl     %ebx
        subl      $116, %esp
        fldz      
        movl      %gs:20, %edx
        movl      8(%ebp), %edi
        xorl      %esp, %edx
        movl      %edx, 88(%esp)
        fstl      72(%esp)
        fstpl     80(%esp)
..B1.2:
        fnstcw    62(%esp)
..B1.3:
        movzwl    18(%ebp), %esi
        andl      $32752, %esi
        shrl      $4, %esi
        call      ..L2
..L2:
        popl      %ebx
        lea       _GLOBAL_OFFSET_TABLE_+[. - ..L2](%ebx), %ebx
        cmpl      $2047, %esi
        jge       ..B1.19
..B1.4:
        testl     %esi, %esi
        jle       ..B1.55
..B1.5:
        movzwl    26(%ebp), %ecx
        andl      $32752, %ecx
        shrl      $4, %ecx
        cmpl      $2047, %ecx
        jge       ..B1.20
..B1.6:
        testl     %ecx, %ecx
        jle       ..B1.53
..B1.7:
        cmpl      $1034, %esi
        jl        ..B1.11
..B1.8:
        fldl      _DBL_MAX_NORMAL@GOTOFF(%ebx)
        fmul      %st(0), %st
        fldl      20(%ebp)
        fstl      (%esp)
        addl      $-16, %esp
        fstpl     (%esp)
        fstpl     24(%esp)
        movl      %ecx, 32(%esp)
        call      cos@PLT
..B1.69:
        fldl      24(%esp)
        fmul      %st, %st(1)
        fldl      12(%ebp)
        movl      32(%esp), %ecx
        addl      $16, %esp
        fmulp     %st, %st(1)
        testl     %ecx, %ecx
        fxch      %st(1)
        fstpl     72(%esp)
        jle       ..B1.10
..B1.9:
        addl      $-16, %esp
        fldl      16(%esp)
        fstpl     (%esp)
        fstpl     24(%esp)
        call      sin@PLT
..B1.70:
        fldl      24(%esp)
        addl      $16, %esp
        fmulp     %st, %st(1)
        fstpl     80(%esp)
        jmp       ..B1.46
..B1.10:
        fmull     (%esp)
        fstpl     80(%esp)
        jmp       ..B1.46
..B1.11:
        movzwl    62(%esp), %ecx
        movl      %ecx, %edx
        andl      $768, %edx
        cmpl      $768, %edx
        je        ..B1.52
..B1.12:
        orl       $-64768, %ecx
        movw      %cx, 60(%esp)
..B1.13:
        fldcw     60(%esp)
..B1.14:
        movl      $1, 56(%esp)
..B1.15:
        fldl      12(%ebp)
        fstpl     48(%esp)
        addl      $-32, %esp
        fldl      20(%ebp)
        lea       32(%esp), %edx
        lea       44(%esp), %ecx
        fstpt     (%esp)
        movl      %edx, 12(%esp)
        movl      %ecx, 16(%esp)
        call      sincosl@PLT
..B1.16:
        fldl      80(%esp)
        lea       56(%esp), %edx
        lea       68(%esp), %ecx
        fstpt     (%esp)
        movl      %edx, 12(%esp)
        movl      %ecx, 16(%esp)
        call      sinhcoshl@PLT
..B1.72:
        addl      $32, %esp
..B1.17:
        fldt      12(%esp)
        fldt      36(%esp)
        fmulp     %st, %st(1)
        fstpl     72(%esp)
        fldt      (%esp)
        fldt      24(%esp)
        fmulp     %st, %st(1)
        fstpl     80(%esp)
        cmpl      $0, 56(%esp)
        je        ..B1.46
..B1.18:
        fldcw     62(%esp)
        jmp       ..B1.46
..B1.19:
        movzwl    26(%ebp), %ecx
        andl      $32752, %ecx
        shrl      $4, %ecx
..B1.20:
        testl     %ecx, %ecx
        jne       ..B1.27
..B1.21:
        testl     $1048575, 24(%ebp)
        jne       ..B1.27
..B1.22:
        cmpl      $0, 20(%ebp)
        jne       ..B1.27
..B1.23:
        fldl      12(%ebp)
        addl      $-16, %esp
        fstpl     (%esp)
        call      cosh@PLT
..B1.73:
        fldl      20(%ebp)
        addl      $16, %esp
        fstpl     80(%esp)
        cmpl      $2047, %esi
        fstpl     72(%esp)
        jl        ..B1.26
..B1.24:
        testl     $1048575, 16(%ebp)
        jne       ..B1.46
..B1.25:
        cmpl      $0, 12(%ebp)
        jne       ..B1.46
..B1.26:
        movzbl    87(%esp), %esi
        movl      %esi, %edx
        movzbl    19(%ebp), %ecx
        andl      $127, %edx
        shrl      $7, %esi
        shrl      $7, %ecx
        xorl      %ecx, %esi
        shll      $7, %esi
        orl       %esi, %edx
        movb      %dl, 87(%esp)
        jmp       ..B1.46
..B1.27:
        cmpl      $2047, %ecx
        jge       ..B1.41
..B1.28:
        movl      16(%ebp), %edx
        andl      $1048575, %edx
        testl     %esi, %esi
        jne       ..B1.35
..B1.29:
        testl     %edx, %edx
        jne       ..B1.40
..B1.30:
        cmpl      $0, 12(%ebp)
        jne       ..B1.36
..B1.31:
        fldl      20(%ebp)
        fstl      8(%esp)
        addl      $-16, %esp
        fstpl     (%esp)
        movl      %ecx, 32(%esp)
        call      cos@PLT
..B1.74:
        fldl      12(%ebp)
        movl      32(%esp), %ecx
        addl      $16, %esp
        fxch      %st(1)
        fstpl     72(%esp)
        testl     %ecx, %ecx
        jle       ..B1.33
..B1.32:
        addl      $-16, %esp
        fldl      24(%esp)
        fstpl     (%esp)
        fstpl     16(%esp)
        call      sin@PLT
..B1.75:
        fldl      16(%esp)
        addl      $16, %esp
        fmulp     %st, %st(1)
        jmp       ..B1.34
..B1.33:
        fmull     8(%esp)
..B1.34:
        fldl      _DBL_MAX_NORMAL@GOTOFF(%ebx)
        fxch      %st(1)
        fstpl     80(%esp)
        fsubl     _DBL_MIN_NORMAL@GOTOFF(%ebx)
        fstpl     64(%esp)
        jmp       ..B1.46
..B1.35:
        testl     %edx, %edx
        jne       ..B1.40
..B1.81:
        cmpl      $0, 12(%ebp)
..B1.36:
        jne       ..B1.40
..B1.37:
        fldl      12(%ebp)
        cmpl      $1023, %ecx
        fstl      24(%esp)
        fmul      %st(0), %st
        fstpl     16(%esp)
        jge       ..B1.39
..B1.38:
        fldl      16(%esp)
        fstpl     72(%esp)
        fldl      24(%esp)
        fmull     20(%ebp)
        fstpl     80(%esp)
        jmp       ..B1.46
..B1.39:
        fldl      20(%ebp)
        fstl      8(%esp)
        addl      $-16, %esp
        fstpl     (%esp)
        call      sin@PLT
..B1.77:
        addl      $16, %esp
        fstpl     (%esp)
        addl      $-16, %esp
        fldl      24(%esp)
        fstpl     (%esp)
        call      cos@PLT
..B1.76:
        addl      $16, %esp
        fldl      16(%esp)
        fmulp     %st, %st(1)
        fstpl     72(%esp)
        fldl      24(%esp)
        fmull     (%esp)
        fstpl     80(%esp)
        jmp       ..B1.46
..B1.40:
        fldl      12(%ebp)
        fmul      %st(0), %st
        fstl      72(%esp)
        fstpl     80(%esp)
        jmp       ..B1.46
..B1.41:
        cmpl      $2047, %esi
        jge       ..B1.43
..B1.42:
        fldl      20(%ebp)
        addl      $-16, %esp
        fstpl     (%esp)
        call      cos@PLT
        jmp       ..B1.79
..B1.43:
        fldl      12(%ebp)
        addl      $-16, %esp
        fstpl     (%esp)
        call      cosh@PLT
..B1.79:
        addl      $16, %esp
        fstpl     72(%esp)
..B1.44:
        testl     %esi, %esi
        jle       ..B1.59
..B1.45:
        fldl      20(%ebp)
        addl      $-16, %esp
        fstpl     (%esp)
        call      sin@PLT
..B1.80:
        addl      $16, %esp
        fstpl     80(%esp)
..B1.46:
        movzwl    86(%esp), %edx
        testl     $32752, %edx
        jne       ..B1.50
..B1.47:
        testl     $1048575, 84(%esp)
        jne       ..B1.49
..B1.48:
        cmpl      $0, 80(%esp)
        je        ..B1.50
..B1.49:
        fldl      _DBL_MIN_NORMAL@GOTOFF(%ebx)
        fmul      %st(0), %st
        fstpl     64(%esp)
..B1.50:
        movl      72(%esp), %edx
        movl      %edx, (%edi)
        movl      76(%esp), %ecx
        movl      80(%esp), %esi
        movl      84(%esp), %edx
        movl      %ecx, 4(%edi)
        movl      %esi, 8(%edi)
        movl      %edx, 12(%edi)
        movl      88(%esp), %edx
        xorl      %esp, %edx
        cmpl      %gs:20, %edx
        jne       ..B1.58
..B1.51:
        movl      %edi, %eax
        addl      $116, %esp
        popl      %ebx
        popl      %edi
        popl      %esi
        movl      %ebp, %esp
        popl      %ebp
        ret       $4
..B1.52:
        movl      $0, 56(%esp)
        jmp       ..B1.15
..B1.53:
        testl     $1048575, 24(%ebp)
        jne       ..B1.7
..B1.54:
        cmpl      $0, 20(%ebp)
        jne       ..B1.7
        jmp       ..B1.20
..B1.55:
        testl     $1048575, 16(%ebp)
        jne       ..B1.5
..B1.56:
        cmpl      $0, 12(%ebp)
        jne       ..B1.5
        jmp       ..B1.19
..B1.58:
        call      __stack_chk_fail@PLT
..B1.59:
        testl     $1048575, 16(%ebp)
        jne       ..B1.45
..B1.60:
        cmpl      $0, 12(%ebp)
        jne       ..B1.45
..B1.61:
        testl     $1048575, 24(%ebp)
        jne       ..B1.66
..B1.62:
        cmpl      $0, 20(%ebp)
        jne       ..B1.66
..B1.63:
        movzbl    19(%ebp), %ecx
        movzbl    27(%ebp), %edx
        andl      $128, %ecx
        andl      $128, %edx
        shrl      $7, %ecx
        shrl      $7, %edx
        cmpl      %ecx, %edx
        je        ..B1.65
..B1.64:
        fldl      _DBL_NZERO@GOTOFF(%ebx)
        fstpl     80(%esp)
        jmp       ..B1.46
..B1.65:
        fldl      _DBL_PZERO@GOTOFF(%ebx)
        fstpl     80(%esp)
        jmp       ..B1.46
..B1.66:
        fldl      _DBL_PZERO@GOTOFF(%ebx)
        fstpl     80(%esp)
        jmp       ..B1.46
        .align    16,0x90
	.type	ccosh,@function
	.size	ccosh,.-ccosh
	.data
# -- End  ccosh
	.section .rodata, "a"
	.align 16
	.align 16
_DBL_MAX_NORMAL:
	.long	-1
	.long	2146435071
	.type	_DBL_MAX_NORMAL,@object
	.size	_DBL_MAX_NORMAL,8
	.space 8, 0x00 	# pad
	.align 16
_DBL_MIN_NORMAL:
	.long	0
	.long	1048576
	.type	_DBL_MIN_NORMAL,@object
	.size	_DBL_MIN_NORMAL,8
	.space 8, 0x00 	# pad
	.align 16
_DBL_NZERO:
	.long	0
	.long	-2147483648
	.type	_DBL_NZERO,@object
	.size	_DBL_NZERO,8
	.space 8, 0x00 	# pad
	.align 16
_DBL_PZERO:
	.long	0
	.long	0
	.type	_DBL_PZERO,@object
	.size	_DBL_PZERO,8
	.data
	.section .note.GNU-stack, ""
# End
