
# __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa--gfx942
	.amdgcn_target "amdgcn-amd-amdhsa--gfx942"
	.amdhsa_code_object_version 6
	.text
	.protected	_Z6matmulPDF16bS_Pf     ; -- Begin function _Z6matmulPDF16bS_Pf
	.globl	_Z6matmulPDF16bS_Pf
	.p2align	8
	.type	_Z6matmulPDF16bS_Pf,@function
_Z6matmulPDF16bS_Pf:                    ; @_Z6matmulPDF16bS_Pf
; %bb.0:
	s_load_dwordx4 s[12:15], s[0:1], 0x0
	s_load_dwordx2 s[4:5], s[0:1], 0x10
	s_ashr_i32 s0, s2, 31
	s_lshr_b32 s0, s0, 25
	s_add_i32 s0, s2, s0
	s_and_b32 s1, s0, 0xffffff80
	s_sub_i32 s10, s2, s1
	s_lshl_b32 s2, s10, 19
	s_lshl_b32 s0, s0, 12
	s_ashr_i32 s3, s2, 31
	s_and_b32 s0, s0, 0xfff80000
	s_ashr_i32 s1, s0, 31
	s_lshl_b64 s[2:3], s[2:3], 1
	v_lshlrev_b32_e32 v1, 4, v0
	s_waitcnt lgkmcnt(0)
	s_add_u32 s6, s12, s2
	v_lshrrev_b32_e32 v24, 2, v0
	v_and_b32_e32 v1, 48, v1
	s_addc_u32 s7, s13, s3
	s_lshl_b64 s[2:3], s[0:1], 1
	v_lshl_or_b32 v2, v24, 14, v1
	s_add_u32 s8, s14, s2
	global_load_dwordx4 v[34:37], v2, s[6:7]
	s_addc_u32 s9, s15, s3
	global_load_dwordx4 v[38:41], v2, s[8:9]
	v_lshrrev_b32_e32 v17, 1, v0
	v_and_b32_e32 v20, 15, v0
	v_lshlrev_b32_e32 v21, 2, v0
	v_and_or_b32 v26, v17, 32, v20
	v_and_b32_e32 v17, 0xfc, v21
	v_xor_b32_e32 v28, 8, v17
	v_lshlrev_b32_e32 v18, 3, v0
	v_and_b32_e32 v19, 48, v0
	v_and_b32_e32 v42, 2, v0
	v_lshlrev_b32_e32 v0, 1, v0
	v_and_b32_e32 v25, 0xe0, v24
	v_and_b32_e32 v0, 48, v0
	v_or_b32_e32 v20, v25, v20
	v_lshl_or_b32 v1, v24, 6, v1
	v_and_b32_e32 v18, 48, v18
	v_lshl_or_b32 v21, v26, 6, v19
	v_xor_b32_e32 v30, v1, v0
	v_lshl_or_b32 v0, v20, 6, v19
	v_mov_b32_e32 v3, 0
	v_or_b32_e32 v1, 0x400, v21
	v_xor_b32_e32 v31, v0, v18
	v_or_b32_e32 v0, 0x400, v0
	v_cmp_eq_u32_e32 vcc, 0, v42
	v_xor_b32_e32 v27, v21, v18
	v_xor_b32_e32 v29, v1, v18
	v_xor_b32_e32 v32, v0, v18
	v_lshl_add_u64 v[0:1], s[6:7], 0, v[2:3]
	v_lshl_add_u64 v[18:19], s[8:9], 0, v[2:3]
	v_or_b32_e32 v2, 0x80, v2
	s_mov_b32 s1, 1
	s_mov_b64 s[2:3], 0
	v_mov_b32_e32 v4, v3
	v_mov_b32_e32 v5, v3
	v_mov_b32_e32 v10, v3
	v_mov_b32_e32 v11, v3
	v_mov_b32_e32 v12, v3
	v_mov_b32_e32 v13, v3
	v_mov_b32_e32 v6, v3
	v_mov_b32_e32 v7, v3
	v_mov_b32_e32 v8, v3
	v_mov_b32_e32 v9, v3
	v_mov_b32_e32 v14, v3
	v_mov_b32_e32 v15, v3
	v_mov_b32_e32 v16, v3
	v_add_u32_e32 v33, 0x2000, v30
	v_lshl_add_u64 v[20:21], s[8:9], 0, v[2:3]
	v_lshl_add_u64 v[22:23], s[6:7], 0, v[2:3]
	v_mov_b32_e32 v2, v3
	s_waitcnt vmcnt(1)
	ds_bpermute_b32 v17, v28, v34
	ds_bpermute_b32 v43, v28, v35
	ds_bpermute_b32 v44, v28, v36
	ds_bpermute_b32 v45, v28, v37
	s_waitcnt vmcnt(0)
	ds_bpermute_b32 v46, v28, v38
	ds_bpermute_b32 v47, v28, v39
	ds_bpermute_b32 v48, v28, v40
	ds_bpermute_b32 v49, v28, v41
	s_waitcnt lgkmcnt(5)
	v_cndmask_b32_e32 v34, v44, v34, vcc
	s_waitcnt lgkmcnt(4)
	v_cndmask_b32_e32 v35, v45, v35, vcc
	v_cndmask_b32_e32 v36, v36, v17, vcc
	v_cndmask_b32_e32 v37, v37, v43, vcc
	ds_write_b128 v30, v[34:37]
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v34, v48, v38, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v35, v49, v39, vcc
	v_cndmask_b32_e32 v36, v40, v46, vcc
	v_cndmask_b32_e32 v37, v41, v47, vcc
	v_mov_b32_e32 v17, v3
	ds_write_b128 v30, v[34:37] offset:8192
	s_waitcnt lgkmcnt(0)
	s_barrier
.LBB0_1:                                ; =>This Inner Loop Header: Depth=1
	s_add_i32 s6, s1, -1
	s_and_b32 s6, s6, 1
	s_lshl_b32 s6, s6, 12
	v_add_u32_e32 v36, s6, v31
	ds_read_b128 v[38:41], v36
	s_or_b32 s7, s6, 0x2000
	v_or_b32_e32 v37, s7, v27
	ds_read_b128 v[42:45], v37
	v_add_u32_e32 v34, s6, v32
	ds_read_b128 v[50:53], v34
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_16x16x16_bf16 v[46:49], v[38:39], v[42:43], v[14:17]
	s_nop 2
	v_or_b32_e32 v14, s7, v29
	ds_read_b128 v[54:57], v14
	s_lshl_b32 s7, s1, 12
	v_mfma_f32_16x16x16_bf16 v[46:49], v[40:41], v[44:45], v[46:49]
	s_and_b32 s7, s7, 0x1000
	v_add_u32_e32 v35, s7, v30
	v_add_u32_e32 v62, s7, v33
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[10:13], v[38:39], v[54:55], v[10:13]
	v_mfma_f32_16x16x16_bf16 v[58:61], v[50:51], v[54:55], v[2:5]
	s_nop 2
	v_lshl_add_u64 v[4:5], v[0:1], 0, s[2:3]
	v_mfma_f32_16x16x16_bf16 v[10:13], v[40:41], v[56:57], v[10:13]
	global_load_dwordx4 v[38:41], v[4:5], off offset:64
	v_lshl_add_u64 v[2:3], v[18:19], 0, s[2:3]
	s_waitcnt vmcnt(0)
	ds_bpermute_b32 v15, v28, v40
	v_mfma_f32_16x16x16_bf16 v[6:9], v[50:51], v[42:43], v[6:9]
	ds_bpermute_b32 v16, v28, v41
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v54, v15, v38, vcc
	v_mfma_f32_16x16x16_bf16 v[6:9], v[52:53], v[44:45], v[6:9]
	ds_bpermute_b32 v15, v28, v38
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v55, v16, v39, vcc
	v_mfma_f32_16x16x16_bf16 v[42:45], v[52:53], v[56:57], v[58:61]
	global_load_dwordx4 v[50:53], v[2:3], off offset:64
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v56, v40, v15, vcc
	ds_bpermute_b32 v15, v28, v39
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v57, v41, v15, vcc
	s_waitcnt vmcnt(0)
	ds_bpermute_b32 v15, v28, v52
	ds_bpermute_b32 v16, v28, v53
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v38, v15, v50, vcc
	ds_bpermute_b32 v15, v28, v50
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v39, v16, v51, vcc
	v_add_u32_e32 v16, s7, v32
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v40, v52, v15, vcc
	ds_bpermute_b32 v15, v28, v51
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v41, v53, v15, vcc
	v_add_u32_e32 v15, s7, v31
	s_bitset1_b32 s7, 13
	v_or_b32_e32 v17, s7, v27
	ds_write_b128 v35, v[54:57]
	ds_write_b128 v62, v[38:41]
	s_waitcnt lgkmcnt(0)
	s_barrier
	ds_read_b128 v[38:41], v15
	ds_read_b128 v[50:53], v17
	ds_read_b128 v[54:57], v16
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_16x16x16_bf16 v[46:49], v[38:39], v[50:51], v[46:49]
	v_or_b32_e32 v15, s7, v29
	v_lshl_add_u64 v[16:17], v[22:23], 0, s[2:3]
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[6:9], v[54:55], v[50:51], v[6:9]
	v_mfma_f32_16x16x16_bf16 v[46:49], v[40:41], v[52:53], v[46:49]
	v_mfma_f32_16x16x16_bf16 v[6:9], v[56:57], v[52:53], v[6:9]
	ds_read_b128 v[50:53], v15
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[10:13], v[38:39], v[50:51], v[10:13]
	v_mfma_f32_16x16x16_bf16 v[42:45], v[54:55], v[50:51], v[42:45]
	v_lshl_add_u64 v[54:55], v[20:21], 0, s[2:3]
	s_add_u32 s2, s2, 0xc0
	s_addc_u32 s3, s3, 0
	v_mfma_f32_16x16x16_bf16 v[10:13], v[40:41], v[52:53], v[10:13]
	s_add_i32 s1, s1, 3
	s_cmpk_lg_i32 s2, 0x3fc0
	v_mfma_f32_16x16x16_bf16 v[38:41], v[56:57], v[52:53], v[42:45]
	s_nop 2
	global_load_dwordx4 v[42:45], v[16:17], off
	s_waitcnt vmcnt(0)
	ds_bpermute_b32 v15, v28, v44
	ds_bpermute_b32 v16, v28, v45
	ds_bpermute_b32 v17, v28, v42
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v50, v15, v42, vcc
	ds_bpermute_b32 v15, v28, v43
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v51, v16, v43, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v52, v44, v17, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v53, v45, v15, vcc
	global_load_dwordx4 v[42:45], v[54:55], off
	s_waitcnt vmcnt(0)
	ds_bpermute_b32 v15, v28, v44
	ds_bpermute_b32 v16, v28, v45
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v54, v15, v42, vcc
	ds_bpermute_b32 v15, v28, v42
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v55, v16, v43, vcc
	v_add_u32_e32 v16, s6, v33
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v56, v44, v15, vcc
	ds_bpermute_b32 v15, v28, v43
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v57, v45, v15, vcc
	v_add_u32_e32 v15, s6, v30
	ds_write_b128 v15, v[50:53]
	ds_write_b128 v16, v[54:57]
	s_waitcnt lgkmcnt(0)
	s_barrier
	ds_read_b128 v[42:45], v36
	ds_read_b128 v[50:53], v37
	ds_read_b128 v[54:57], v34
	ds_read_b128 v[58:61], v14
	s_waitcnt lgkmcnt(2)
	v_mfma_f32_16x16x16_bf16 v[46:49], v[42:43], v[50:51], v[46:49]
	v_mfma_f32_16x16x16_bf16 v[14:17], v[44:45], v[52:53], v[46:49]
	s_nop 5
	global_load_dwordx4 v[46:49], v[4:5], off offset:192
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[10:13], v[42:43], v[58:59], v[10:13]
	s_waitcnt vmcnt(0)
	ds_bpermute_b32 v34, v28, v46
	v_mfma_f32_16x16x16_bf16 v[36:39], v[54:55], v[58:59], v[38:41]
	s_nop 2
	global_load_dwordx4 v[40:43], v[2:3], off offset:192
	v_mfma_f32_16x16x16_bf16 v[6:9], v[54:55], v[50:51], v[6:9]
	s_waitcnt vmcnt(0)
	ds_bpermute_b32 v50, v28, v42
	v_mfma_f32_16x16x16_bf16 v[2:5], v[56:57], v[60:61], v[36:39]
	ds_bpermute_b32 v51, v28, v43
	s_nop 1
	ds_bpermute_b32 v39, v28, v47
	ds_bpermute_b32 v36, v28, v48
	ds_bpermute_b32 v37, v28, v49
	v_mfma_f32_16x16x16_bf16 v[10:13], v[44:45], v[60:61], v[10:13]
	ds_bpermute_b32 v44, v28, v40
	ds_bpermute_b32 v45, v28, v41
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v36, v36, v46, vcc
	v_mfma_f32_16x16x16_bf16 v[6:9], v[56:57], v[52:53], v[6:9]
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v37, v37, v47, vcc
	v_cndmask_b32_e32 v38, v48, v34, vcc
	v_cndmask_b32_e32 v39, v49, v39, vcc
	v_cndmask_b32_e32 v40, v50, v40, vcc
	v_cndmask_b32_e32 v41, v51, v41, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v42, v42, v44, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v43, v43, v45, vcc
	ds_write_b128 v35, v[36:39]
	ds_write_b128 v62, v[40:43]
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_cbranch_scc1 .LBB0_1
; %bb.2:
	ds_read_b128 v[18:21], v31 offset:4096
	ds_read_b128 v[30:33], v32 offset:4096
	ds_read_b128 v[34:37], v27 offset:12288
	ds_read_b128 v[38:41], v29 offset:12288
	v_lshlrev_b32_e32 v0, 13, v26
	v_and_b32_e32 v1, 12, v24
	s_lshl_b32 s1, s10, 6
	v_or3_b32 v0, v0, v1, v25
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[10:13], v[18:19], v[38:39], v[10:13]
	s_add_i32 s0, s1, s0
	s_ashr_i32 s1, s0, 31
	s_lshl_b64 s[0:1], s[0:1], 2
	v_mfma_f32_16x16x16_bf16 v[14:17], v[18:19], v[34:35], v[14:17]
	v_lshlrev_b32_e32 v18, 2, v0
	s_add_u32 s0, s4, s0
	s_addc_u32 s1, s5, s1
	v_mfma_f32_16x16x16_bf16 v[6:9], v[30:31], v[34:35], v[6:9]
	v_mov_b32_e32 v19, 0
	s_barrier
	v_mfma_f32_16x16x16_bf16 v[0:3], v[30:31], v[38:39], v[2:5]
	v_mfma_f32_16x16x16_bf16 v[10:13], v[20:21], v[40:41], v[10:13]
	s_nop 1
	v_or_b32_e32 v4, 0x80000, v18
	v_mfma_f32_16x16x16_bf16 v[14:17], v[20:21], v[36:37], v[14:17]
	v_lshl_add_u64 v[20:21], s[0:1], 0, v[18:19]
	s_nop 1
	global_store_dwordx4 v4, v[10:13], s[0:1]
	v_add_co_u32_e32 v4, vcc, 0x80000, v20
	v_mfma_f32_16x16x16_bf16 v[6:9], v[32:33], v[36:37], v[6:9]
	s_nop 0
	v_addc_co_u32_e32 v5, vcc, 0, v21, vcc
	global_store_dwordx4 v18, v[14:17], s[0:1]
	v_mfma_f32_16x16x16_bf16 v[0:3], v[32:33], v[40:41], v[0:3]
	s_nop 2
	global_store_dwordx4 v18, v[6:9], s[0:1] offset:64
	s_nop 2
	global_store_dwordx4 v[4:5], v[0:3], off offset:64
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z6matmulPDF16bS_Pf
		.amdhsa_group_segment_fixed_size 16384
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
		.amdhsa_next_free_vgpr 63
		.amdhsa_next_free_sgpr 16
		.amdhsa_accum_offset 64
		.amdhsa_reserve_vcc 1
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
	.size	_Z6matmulPDF16bS_Pf, .Lfunc_end0-_Z6matmulPDF16bS_Pf
                                        ; -- End function
	.set _Z6matmulPDF16bS_Pf.num_vgpr, 63
	.set _Z6matmulPDF16bS_Pf.num_agpr, 0
	.set _Z6matmulPDF16bS_Pf.numbered_sgpr, 16
	.set _Z6matmulPDF16bS_Pf.private_seg_size, 0
	.set _Z6matmulPDF16bS_Pf.uses_vcc, 1
	.set _Z6matmulPDF16bS_Pf.uses_flat_scratch, 0
	.set _Z6matmulPDF16bS_Pf.has_dyn_sized_stack, 0
	.set _Z6matmulPDF16bS_Pf.has_recursion, 0
	.set _Z6matmulPDF16bS_Pf.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 1752
; TotalNumSgprs: 22
; NumVgprs: 63
; NumAgprs: 0
; TotalNumVgprs: 63
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 16384 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 7
; NumSGPRsForWavesPerEU: 22
; NumVGPRsForWavesPerEU: 63
; AccumOffset: 64
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 15
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.section	.AMDGPU.gpr_maximums,"",@progbits
	.set amdgpu.max_num_vgpr, 0
	.set amdgpu.max_num_agpr, 0
	.set amdgpu.max_num_sgpr, 0
	.text
	.type	__hip_cuid_16e6a879b8b5eb1f,@object ; @__hip_cuid_16e6a879b8b5eb1f
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_16e6a879b8b5eb1f
__hip_cuid_16e6a879b8b5eb1f:
	.byte	0                               ; 0x0
	.size	__hip_cuid_16e6a879b8b5eb1f, 1

	.ident	"AMD clang version 20.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-7.0.0 25314 f4087f6b428f0e6f575ebac8a8a724dab123d06e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __hip_cuid_16e6a879b8b5eb1f
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
    .group_segment_fixed_size: 16384
    .kernarg_segment_align: 8
    .kernarg_segment_size: 24
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z6matmulPDF16bS_Pf
    .private_segment_fixed_size: 0
    .sgpr_count:     22
    .sgpr_spill_count: 0
    .symbol:         _Z6matmulPDF16bS_Pf.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     63
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
	.file	"matmul.hip"
	.text
	.globl	_Z21__device_stub__matmulPDF16bS_Pf # -- Begin function _Z21__device_stub__matmulPDF16bS_Pf
	.p2align	4
	.type	_Z21__device_stub__matmulPDF16bS_Pf,@function
_Z21__device_stub__matmulPDF16bS_Pf:    # @_Z21__device_stub__matmulPDF16bS_Pf
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
	movl	$_Z6matmulPDF16bS_Pf, %edi
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel
	addq	$120, %rsp
	.cfi_adjust_cfa_offset -120
	retq
.Lfunc_end0:
	.size	_Z21__device_stub__matmulPDF16bS_Pf, .Lfunc_end0-_Z21__device_stub__matmulPDF16bS_Pf
	.cfi_endproc
                                        # -- End function
	.globl	launch_matmul                   # -- Begin function launch_matmul
	.p2align	4
	.type	launch_matmul,@function
launch_matmul:                          # @launch_matmul
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$112, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movq	%rdi, %r15
	movabsq	$4294967552, %rdx               # imm = 0x100000100
	leaq	16128(%rdx), %rdi
	movl	$1, %esi
	movl	$1, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	callq	__hipPushCallConfiguration
	testl	%eax, %eax
	jne	.LBB1_2
# %bb.1:
	movq	%r15, 72(%rsp)
	movq	%r14, 64(%rsp)
	movq	%rbx, 56(%rsp)
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
	movl	$_Z6matmulPDF16bS_Pf, %edi
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
.LBB1_2:
	addq	$112, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	launch_matmul, .Lfunc_end1-launch_matmul
	.cfi_endproc
                                        # -- End function
	.p2align	4                               # -- Begin function __hip_module_ctor
	.type	__hip_module_ctor,@function
__hip_module_ctor:                      # @__hip_module_ctor
	.cfi_startproc
# %bb.0:
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	__hip_gpubin_handle_16e6a879b8b5eb1f(%rip), %rdi
	testq	%rdi, %rdi
	jne	.LBB2_2
# %bb.1:
	movl	$__hip_fatbin_wrapper, %edi
	callq	__hipRegisterFatBinary
	movq	%rax, %rdi
	movq	%rax, __hip_gpubin_handle_16e6a879b8b5eb1f(%rip)
.LBB2_2:
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rsp)
	movups	%xmm0, (%rsp)
	movl	$_Z6matmulPDF16bS_Pf, %esi
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
	movq	__hip_gpubin_handle_16e6a879b8b5eb1f(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB3_2
# %bb.1:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__hipUnregisterFatBinary
	movq	$0, __hip_gpubin_handle_16e6a879b8b5eb1f(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
.LBB3_2:
	retq
.Lfunc_end3:
	.size	__hip_module_dtor, .Lfunc_end3-__hip_module_dtor
	.cfi_endproc
                                        # -- End function
	.type	_Z6matmulPDF16bS_Pf,@object     # @_Z6matmulPDF16bS_Pf
	.section	.rodata,"a",@progbits
	.globl	_Z6matmulPDF16bS_Pf
	.p2align	3, 0x0
_Z6matmulPDF16bS_Pf:
	.quad	_Z21__device_stub__matmulPDF16bS_Pf
	.size	_Z6matmulPDF16bS_Pf, 8

	.type	.L__unnamed_1,@object           # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"_Z6matmulPDF16bS_Pf"
	.size	.L__unnamed_1, 20

	.type	__hip_fatbin_wrapper,@object    # @__hip_fatbin_wrapper
	.section	.hipFatBinSegment,"a",@progbits
	.p2align	3, 0x0
__hip_fatbin_wrapper:
	.long	1212764230                      # 0x48495046
	.long	1                               # 0x1
	.quad	__hip_fatbin_16e6a879b8b5eb1f
	.quad	0
	.size	__hip_fatbin_wrapper, 24

	.type	__hip_gpubin_handle_16e6a879b8b5eb1f,@object # @__hip_gpubin_handle_16e6a879b8b5eb1f
	.local	__hip_gpubin_handle_16e6a879b8b5eb1f
	.comm	__hip_gpubin_handle_16e6a879b8b5eb1f,8,8
	.section	.init_array,"aw",@init_array
	.p2align	3, 0x0
	.quad	__hip_module_ctor
	.type	__hip_cuid_16e6a879b8b5eb1f,@object # @__hip_cuid_16e6a879b8b5eb1f
	.bss
	.globl	__hip_cuid_16e6a879b8b5eb1f
__hip_cuid_16e6a879b8b5eb1f:
	.byte	0                               # 0x0
	.size	__hip_cuid_16e6a879b8b5eb1f, 1

	.ident	"AMD clang version 20.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-7.0.0 25314 f4087f6b428f0e6f575ebac8a8a724dab123d06e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z21__device_stub__matmulPDF16bS_Pf
	.addrsig_sym __hip_module_ctor
	.addrsig_sym __hip_module_dtor
	.addrsig_sym _Z6matmulPDF16bS_Pf
	.addrsig_sym __hip_fatbin_16e6a879b8b5eb1f
	.addrsig_sym __hip_fatbin_wrapper
	.addrsig_sym __hip_cuid_16e6a879b8b5eb1f

# __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu-
