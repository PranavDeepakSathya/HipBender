
# __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa--gfx942
	.amdgcn_target "amdgcn-amd-amdhsa--gfx942"
	.amdhsa_code_object_version 6
	.text
	.protected	_Z6matmulPKfS0_Pf       ; -- Begin function _Z6matmulPKfS0_Pf
	.globl	_Z6matmulPKfS0_Pf
	.p2align	8
	.type	_Z6matmulPKfS0_Pf,@function
_Z6matmulPKfS0_Pf:                      ; @_Z6matmulPKfS0_Pf
; %bb.0:
	s_load_dwordx4 s[4:7], s[0:1], 0x0
	s_load_dwordx2 s[2:3], s[0:1], 0x10
	v_and_b32_e32 v1, 31, v0
	v_lshlrev_b32_e32 v2, 1, v1
	v_lshrrev_b32_e32 v3, 5, v0
	v_add_lshl_u32 v2, v2, v3, 2
	s_waitcnt lgkmcnt(0)
	global_load_dword v2, v2, s[4:5]
	v_lshlrev_b32_e32 v0, 2, v0
	global_load_dword v0, v0, s[6:7]
	v_lshlrev_b32_e32 v1, 2, v1
	v_lshl_or_b32 v16, v3, 9, v1
	v_add_u32_e32 v17, 0x400, v16
	v_add_u32_e32 v18, 0x800, v16
	v_add_u32_e32 v19, 0xc00, v16
	s_waitcnt vmcnt(0)
	v_mfma_f32_32x32x2_f32 v[0:15], v2, v0, 0
	s_nop 7
	s_nop 7
	s_nop 1
	global_store_dword v16, v0, s[2:3]
	global_store_dword v16, v1, s[2:3] offset:128
	global_store_dword v16, v2, s[2:3] offset:256
	global_store_dword v16, v3, s[2:3] offset:384
	global_store_dword v17, v4, s[2:3]
	global_store_dword v17, v5, s[2:3] offset:128
	global_store_dword v17, v6, s[2:3] offset:256
	global_store_dword v17, v7, s[2:3] offset:384
	global_store_dword v18, v8, s[2:3]
	global_store_dword v18, v9, s[2:3] offset:128
	global_store_dword v18, v10, s[2:3] offset:256
	global_store_dword v18, v11, s[2:3] offset:384
	global_store_dword v19, v12, s[2:3]
	global_store_dword v19, v13, s[2:3] offset:128
	global_store_dword v19, v14, s[2:3] offset:256
	global_store_dword v19, v15, s[2:3] offset:384
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z6matmulPKfS0_Pf
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 24
		.amdhsa_user_sgpr_count 2
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_kernarg_preload_length 0
		.amdhsa_user_sgpr_kernarg_preload_offset 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_enable_private_segment 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 20
		.amdhsa_next_free_sgpr 8
		.amdhsa_accum_offset 20
		.amdhsa_reserve_vcc 0
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end0:
	.size	_Z6matmulPKfS0_Pf, .Lfunc_end0-_Z6matmulPKfS0_Pf
                                        ; -- End function
	.set _Z6matmulPKfS0_Pf.num_vgpr, 20
	.set _Z6matmulPKfS0_Pf.num_agpr, 0
	.set _Z6matmulPKfS0_Pf.numbered_sgpr, 8
	.set _Z6matmulPKfS0_Pf.private_seg_size, 0
	.set _Z6matmulPKfS0_Pf.uses_vcc, 0
	.set _Z6matmulPKfS0_Pf.uses_flat_scratch, 0
	.set _Z6matmulPKfS0_Pf.has_dyn_sized_stack, 0
	.set _Z6matmulPKfS0_Pf.has_recursion, 0
	.set _Z6matmulPKfS0_Pf.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 252
; TotalNumSgprs: 14
; NumVgprs: 20
; NumAgprs: 0
; TotalNumVgprs: 20
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 2
; NumSGPRsForWavesPerEU: 14
; NumVGPRsForWavesPerEU: 20
; AccumOffset: 20
; Occupancy: 8
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 4
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.section	.AMDGPU.gpr_maximums,"",@progbits
	.set amdgpu.max_num_vgpr, 0
	.set amdgpu.max_num_agpr, 0
	.set amdgpu.max_num_sgpr, 0
	.text
	.type	__hip_cuid_f4fe96ac2fdb5770,@object ; @__hip_cuid_f4fe96ac2fdb5770
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_f4fe96ac2fdb5770
__hip_cuid_f4fe96ac2fdb5770:
	.byte	0                               ; 0x0
	.size	__hip_cuid_f4fe96ac2fdb5770, 1

	.ident	"AMD clang version 20.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-7.0.0 25314 f4087f6b428f0e6f575ebac8a8a724dab123d06e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __hip_cuid_f4fe96ac2fdb5770
	.amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     0
    .args:
      - .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 24
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z6matmulPKfS0_Pf
    .private_segment_fixed_size: 0
    .sgpr_count:     14
    .sgpr_spill_count: 0
    .symbol:         _Z6matmulPKfS0_Pf.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     20
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx942
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata

# __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa--gfx942

# __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu-
	.file	"matmul.cpp"
	.text
	.globl	_Z21__device_stub__matmulPKfS0_Pf # -- Begin function _Z21__device_stub__matmulPKfS0_Pf
	.p2align	4
	.type	_Z21__device_stub__matmulPKfS0_Pf,@function
_Z21__device_stub__matmulPKfS0_Pf:      # @_Z21__device_stub__matmulPKfS0_Pf
	.cfi_startproc
# %bb.0:
	subq	$104, %rsp
	.cfi_def_cfa_offset 112
	movq	%rdi, 72(%rsp)
	movq	%rsi, 64(%rsp)
	movq	%rdx, 56(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 80(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 88(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 96(%rsp)
	leaq	40(%rsp), %rdi
	leaq	24(%rsp), %rsi
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rcx
	callq	__hipPopCallConfiguration
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edx
	movq	24(%rsp), %rcx
	movl	32(%rsp), %r8d
	leaq	80(%rsp), %r9
	movl	$_Z6matmulPKfS0_Pf, %edi
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel
	addq	$120, %rsp
	.cfi_adjust_cfa_offset -120
	retq
.Lfunc_end0:
	.size	_Z21__device_stub__matmulPKfS0_Pf, .Lfunc_end0-_Z21__device_stub__matmulPKfS0_Pf
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function main
.LCPI1_0:
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI1_1:
	.long	0x3a83126f                      # float 0.00100000005
	.text
	.globl	main
	.p2align	4
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$8904, %rsp                     # imm = 0x22C8
	.cfi_def_cfa_offset 8928
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$42, %edi
	callq	srand
	xorl	%ebx, %ebx
	.p2align	4
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	callq	rand
	cltq
	imulq	$1717986919, %rax, %rcx         # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$34, %rcx
	addl	%edx, %ecx
	addl	%ecx, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, 448(%rsp,%rbx,4)
	incq	%rbx
	cmpq	$64, %rbx
	jne	.LBB1_1
# %bb.2:
	xorl	%ebx, %ebx
	.p2align	4
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	callq	rand
	cltq
	imulq	$1717986919, %rax, %rcx         # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$34, %rcx
	addl	%edx, %ecx
	addl	%ecx, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, 192(%rsp,%rbx,4)
	incq	%rbx
	cmpq	$64, %rbx
	jne	.LBB1_3
# %bb.4:
	movaps	192(%rsp), %xmm0
	movaps	%xmm0, 176(%rsp)                # 16-byte Spill
	movaps	208(%rsp), %xmm0
	movaps	%xmm0, 160(%rsp)                # 16-byte Spill
	movaps	224(%rsp), %xmm0
	movaps	%xmm0, 144(%rsp)                # 16-byte Spill
	movaps	240(%rsp), %xmm0
	movaps	%xmm0, 128(%rsp)                # 16-byte Spill
	movaps	320(%rsp), %xmm0
	movaps	%xmm0, 112(%rsp)                # 16-byte Spill
	movaps	336(%rsp), %xmm0
	movaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	movaps	352(%rsp), %xmm6
	movaps	368(%rsp), %xmm7
	movaps	256(%rsp), %xmm8
	movaps	272(%rsp), %xmm9
	movaps	384(%rsp), %xmm10
	movaps	400(%rsp), %xmm11
	movaps	288(%rsp), %xmm12
	movaps	304(%rsp), %xmm13
	movaps	416(%rsp), %xmm14
	movaps	432(%rsp), %xmm15
	leaq	4912(%rsp), %rax
	xorl	%ecx, %ecx
	xorps	%xmm0, %xmm0
	.p2align	4
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	movss	448(%rsp,%rcx,8), %xmm4         # xmm4 = mem[0],zero,zero,zero
	movss	452(%rsp,%rcx,8), %xmm5         # xmm5 = mem[0],zero,zero,zero
	shufps	$0, %xmm5, %xmm5                # xmm5 = xmm5[0,0,0,0]
	shufps	$0, %xmm4, %xmm4                # xmm4 = xmm4[0,0,0,0]
	movaps	%xmm4, %xmm2
	mulps	176(%rsp), %xmm2                # 16-byte Folded Reload
	movaps	%xmm4, %xmm3
	mulps	160(%rsp), %xmm3                # 16-byte Folded Reload
	addps	%xmm0, %xmm2
	addps	%xmm0, %xmm3
	movaps	%xmm5, %xmm1
	mulps	112(%rsp), %xmm1                # 16-byte Folded Reload
	addps	%xmm2, %xmm1
	movaps	%xmm5, %xmm2
	mulps	96(%rsp), %xmm2                 # 16-byte Folded Reload
	addps	%xmm3, %xmm2
	movaps	%xmm1, -112(%rax)
	movaps	%xmm2, -96(%rax)
	movaps	%xmm4, %xmm1
	mulps	144(%rsp), %xmm1                # 16-byte Folded Reload
	movaps	%xmm4, %xmm2
	mulps	128(%rsp), %xmm2                # 16-byte Folded Reload
	addps	%xmm0, %xmm1
	addps	%xmm0, %xmm2
	movaps	%xmm5, %xmm3
	mulps	%xmm6, %xmm3
	addps	%xmm1, %xmm3
	movaps	%xmm5, %xmm1
	mulps	%xmm7, %xmm1
	addps	%xmm2, %xmm1
	movaps	%xmm3, -80(%rax)
	movaps	%xmm1, -64(%rax)
	movaps	%xmm4, %xmm1
	mulps	%xmm8, %xmm1
	movaps	%xmm4, %xmm2
	mulps	%xmm9, %xmm2
	addps	%xmm0, %xmm1
	addps	%xmm0, %xmm2
	movaps	%xmm5, %xmm3
	mulps	%xmm10, %xmm3
	addps	%xmm1, %xmm3
	movaps	%xmm5, %xmm1
	mulps	%xmm11, %xmm1
	addps	%xmm2, %xmm1
	movaps	%xmm3, -48(%rax)
	movaps	%xmm1, -32(%rax)
	movaps	%xmm4, %xmm1
	mulps	%xmm12, %xmm1
	addps	%xmm0, %xmm1
	movaps	%xmm5, %xmm2
	mulps	%xmm14, %xmm2
	addps	%xmm1, %xmm2
	mulps	%xmm13, %xmm4
	addps	%xmm0, %xmm4
	mulps	%xmm15, %xmm5
	addps	%xmm4, %xmm5
	movaps	%xmm2, -16(%rax)
	movaps	%xmm5, (%rax)
	incq	%rcx
	subq	$-128, %rax
	cmpq	$32, %rcx
	jne	.LBB1_5
# %bb.6:
	leaq	16(%rsp), %rdi
	movl	$256, %esi                      # imm = 0x100
	callq	hipMalloc
	leaq	8(%rsp), %rdi
	movl	$256, %esi                      # imm = 0x100
	callq	hipMalloc
	movq	%rsp, %rdi
	movl	$4096, %esi                     # imm = 0x1000
	callq	hipMalloc
	movq	(%rsp), %rdi
	xorl	%ebx, %ebx
	movl	$4096, %edx                     # imm = 0x1000
	xorl	%esi, %esi
	callq	hipMemset
	movq	16(%rsp), %rdi
	leaq	448(%rsp), %rsi
	movl	$256, %edx                      # imm = 0x100
	movl	$1, %ecx
	callq	hipMemcpy
	movq	8(%rsp), %rdi
	leaq	192(%rsp), %rsi
	movl	$256, %edx                      # imm = 0x100
	movl	$1, %ecx
	callq	hipMemcpy
	movabsq	$4294967297, %rdi               # imm = 0x100000001
	leaq	63(%rdi), %rdx
	movl	$1, %esi
	movl	$1, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	callq	__hipPushCallConfiguration
	testl	%eax, %eax
	jne	.LBB1_8
# %bb.7:
	movq	16(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdx
	movq	%rax, 88(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rdx, 72(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 704(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 712(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 720(%rsp)
	leaq	56(%rsp), %rdi
	leaq	40(%rsp), %rsi
	leaq	32(%rsp), %rdx
	leaq	24(%rsp), %rcx
	callq	__hipPopCallConfiguration
	movq	56(%rsp), %rsi
	movl	64(%rsp), %edx
	movq	40(%rsp), %rcx
	movl	48(%rsp), %r8d
	leaq	704(%rsp), %r9
	movl	$_Z6matmulPKfS0_Pf, %edi
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	40(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
.LBB1_8:
	callq	hipDeviceSynchronize
	movq	(%rsp), %rsi
	leaq	704(%rsp), %rdi
	movl	$4096, %edx                     # imm = 0x1000
	movl	$2, %ecx
	callq	hipMemcpy
	movaps	.LCPI1_0(%rip), %xmm3           # xmm3 = [NaN,NaN,NaN,NaN]
	movss	.LCPI1_1(%rip), %xmm4           # xmm4 = [1.00000005E-3,0.0E+0,0.0E+0,0.0E+0]
	xorl	%r14d, %r14d
	jmp	.LBB1_9
	.p2align	4
.LBB1_12:                               #   in Loop: Header=BB1_9 Depth=1
	incl	%ebx
.LBB1_13:                               #   in Loop: Header=BB1_9 Depth=1
	incq	%r14
	cmpq	$1024, %r14                     # imm = 0x400
	je	.LBB1_14
.LBB1_9:                                # =>This Inner Loop Header: Depth=1
	movss	704(%rsp,%r14,4), %xmm0         # xmm0 = mem[0],zero,zero,zero
	movss	4800(%rsp,%r14,4), %xmm1        # xmm1 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm2
	subss	%xmm1, %xmm2
	andps	%xmm3, %xmm2
	ucomiss	%xmm4, %xmm2
	jbe	.LBB1_13
# %bb.10:                               #   in Loop: Header=BB1_9 Depth=1
	cmpl	$9, %ebx
	jg	.LBB1_12
# %bb.11:                               #   in Loop: Header=BB1_9 Depth=1
	movl	%r14d, %esi
	shrl	$5, %esi
	movl	%r14d, %edx
	andl	$31, %edx
	cvtss2sd	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm1
	movl	$.L.str, %edi
	movb	$2, %al
	callq	printf
	movss	.LCPI1_1(%rip), %xmm4           # xmm4 = [1.00000005E-3,0.0E+0,0.0E+0,0.0E+0]
	movaps	.LCPI1_0(%rip), %xmm3           # xmm3 = [NaN,NaN,NaN,NaN]
	jmp	.LBB1_12
.LBB1_14:
	testl	%ebx, %ebx
	je	.LBB1_15
# %bb.16:
	movl	$.L.str.2, %edi
	movl	%ebx, %esi
	movl	$1024, %edx                     # imm = 0x400
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB1_17
.LBB1_15:
	movl	$.L.str.1, %edi
	movl	$1024, %esi                     # imm = 0x400
	xorl	%eax, %eax
	callq	printf
.LBB1_17:
	movq	16(%rsp), %rdi
	callq	hipFree
	movq	8(%rsp), %rdi
	callq	hipFree
	movq	(%rsp), %rdi
	callq	hipFree
	xorl	%eax, %eax
	addq	$8904, %rsp                     # imm = 0x22C8
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.p2align	4                               # -- Begin function __hip_module_ctor
	.type	__hip_module_ctor,@function
__hip_module_ctor:                      # @__hip_module_ctor
	.cfi_startproc
# %bb.0:
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	__hip_gpubin_handle_f4fe96ac2fdb5770(%rip), %rdi
	testq	%rdi, %rdi
	jne	.LBB2_2
# %bb.1:
	movl	$__hip_fatbin_wrapper, %edi
	callq	__hipRegisterFatBinary
	movq	%rax, %rdi
	movq	%rax, __hip_gpubin_handle_f4fe96ac2fdb5770(%rip)
.LBB2_2:
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rsp)
	movups	%xmm0, (%rsp)
	movl	$_Z6matmulPKfS0_Pf, %esi
	movl	$.L__unnamed_1, %edx
	movl	$.L__unnamed_1, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	__hipRegisterFunction
	movl	$__hip_module_dtor, %edi
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	jmp	atexit                          # TAILCALL
.Lfunc_end2:
	.size	__hip_module_ctor, .Lfunc_end2-__hip_module_ctor
	.cfi_endproc
                                        # -- End function
	.p2align	4                               # -- Begin function __hip_module_dtor
	.type	__hip_module_dtor,@function
__hip_module_dtor:                      # @__hip_module_dtor
	.cfi_startproc
# %bb.0:
	movq	__hip_gpubin_handle_f4fe96ac2fdb5770(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB3_2
# %bb.1:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__hipUnregisterFatBinary
	movq	$0, __hip_gpubin_handle_f4fe96ac2fdb5770(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
.LBB3_2:
	retq
.Lfunc_end3:
	.size	__hip_module_dtor, .Lfunc_end3-__hip_module_dtor
	.cfi_endproc
                                        # -- End function
	.type	_Z6matmulPKfS0_Pf,@object       # @_Z6matmulPKfS0_Pf
	.section	.rodata,"a",@progbits
	.globl	_Z6matmulPKfS0_Pf
	.p2align	3, 0x0
_Z6matmulPKfS0_Pf:
	.quad	_Z21__device_stub__matmulPKfS0_Pf
	.size	_Z6matmulPKfS0_Pf, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"MISMATCH at [%d,%d]: GPU=%.2f CPU=%.2f\n"
	.size	.L.str, 40

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"PASSED! All %d elements match.\n"
	.size	.L.str.1, 32

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"FAILED! %d/%d mismatches.\n"
	.size	.L.str.2, 27

	.type	.L__unnamed_1,@object           # @0
.L__unnamed_1:
	.asciz	"_Z6matmulPKfS0_Pf"
	.size	.L__unnamed_1, 18

	.type	__hip_fatbin_wrapper,@object    # @__hip_fatbin_wrapper
	.section	.hipFatBinSegment,"a",@progbits
	.p2align	3, 0x0
__hip_fatbin_wrapper:
	.long	1212764230                      # 0x48495046
	.long	1                               # 0x1
	.quad	__hip_fatbin_f4fe96ac2fdb5770
	.quad	0
	.size	__hip_fatbin_wrapper, 24

	.type	__hip_gpubin_handle_f4fe96ac2fdb5770,@object # @__hip_gpubin_handle_f4fe96ac2fdb5770
	.local	__hip_gpubin_handle_f4fe96ac2fdb5770
	.comm	__hip_gpubin_handle_f4fe96ac2fdb5770,8,8
	.section	.init_array,"aw",@init_array
	.p2align	3, 0x0
	.quad	__hip_module_ctor
	.type	__hip_cuid_f4fe96ac2fdb5770,@object # @__hip_cuid_f4fe96ac2fdb5770
	.bss
	.globl	__hip_cuid_f4fe96ac2fdb5770
__hip_cuid_f4fe96ac2fdb5770:
	.byte	0                               # 0x0
	.size	__hip_cuid_f4fe96ac2fdb5770, 1

	.ident	"AMD clang version 20.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-7.0.0 25314 f4087f6b428f0e6f575ebac8a8a724dab123d06e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z21__device_stub__matmulPKfS0_Pf
	.addrsig_sym __hip_module_ctor
	.addrsig_sym __hip_module_dtor
	.addrsig_sym _Z6matmulPKfS0_Pf
	.addrsig_sym __hip_fatbin_f4fe96ac2fdb5770
	.addrsig_sym __hip_fatbin_wrapper
	.addrsig_sym __hip_cuid_f4fe96ac2fdb5770

# __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu-
