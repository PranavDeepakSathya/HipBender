
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
	s_load_dwordx4 s[4:7], s[0:1], 0x0
	s_load_dwordx2 s[8:9], s[0:1], 0x10
	s_ashr_i32 s0, s2, 31
	v_lshrrev_b32_e32 v1, 2, v0
	v_and_b32_e32 v2, 15, v0
	s_movk_i32 s11, 0xc0
	s_lshr_b32 s0, s0, 27
	v_and_or_b32 v2, v1, s11, v2
	s_add_i32 s0, s2, s0
	v_and_b32_e32 v3, 12, v1
	v_lshlrev_b32_e32 v2, 5, v2
	s_ashr_i32 s10, s0, 5
	s_and_b32 s0, s0, 0x7e0
	v_or_b32_e32 v5, v2, v3
	s_sub_i32 s0, s2, s0
	s_lshl_b32 s2, s10, 21
	v_lshlrev_b32_e32 v71, 1, v5
	v_lshlrev_b32_e32 v5, 5, v0
	s_ashr_i32 s3, s2, 31
	s_lshl_b32 s0, s0, 21
	v_and_b32_e32 v5, 0x19e0, v5
	s_ashr_i32 s1, s0, 31
	v_lshlrev_b32_e32 v4, 4, v0
	v_or_b32_e32 v6, v5, v3
	v_or_b32_e32 v3, 16, v3
	s_lshl_b64 s[2:3], s[2:3], 1
	v_and_b32_e32 v4, 48, v4
	v_or_b32_e32 v2, v2, v3
	s_waitcnt lgkmcnt(0)
	s_add_u32 s2, s4, s2
	v_mov_b32_e32 v7, 0x4000
	v_lshlrev_b32_e32 v73, 1, v2
	v_or_b32_e32 v2, v5, v3
	v_lshl_or_b32 v22, v1, 14, v4
	v_mov_b32_e32 v23, 0
	s_addc_u32 s3, s5, s3
	v_lshl_or_b32 v74, v2, 1, v7
	v_lshl_add_u64 v[2:3], s[2:3], 0, v[22:23]
	s_lshl_b64 s[2:3], s[0:1], 1
	s_add_u32 s2, s6, s2
	s_addc_u32 s3, s7, s3
	v_lshl_or_b32 v70, v1, 6, v4
	v_lshl_add_u64 v[66:67], v[2:3], 0, 64
	v_lshl_add_u64 v[2:3], s[2:3], 0, v[22:23]
	v_lshl_or_b32 v72, v6, 1, v7
	v_lshl_add_u64 v[68:69], v[2:3], 0, 64
	s_movk_i32 s1, 0xffe0
	s_mov_b64 s[2:3], 0x80
	v_mov_b32_e32 v22, v23
	v_mov_b32_e32 v24, v23
	v_mov_b32_e32 v25, v23
	v_mov_b32_e32 v2, v23
	v_mov_b32_e32 v3, v23
	v_mov_b32_e32 v4, v23
	v_mov_b32_e32 v5, v23
	v_mov_b32_e32 v10, v23
	v_mov_b32_e32 v11, v23
	v_mov_b32_e32 v12, v23
	v_mov_b32_e32 v13, v23
	v_mov_b32_e32 v6, v23
	v_mov_b32_e32 v7, v23
	v_mov_b32_e32 v8, v23
	v_mov_b32_e32 v9, v23
	v_mov_b32_e32 v50, v23
	v_mov_b32_e32 v51, v23
	v_mov_b32_e32 v52, v23
	v_mov_b32_e32 v53, v23
	v_mov_b32_e32 v14, v23
	v_mov_b32_e32 v15, v23
	v_mov_b32_e32 v16, v23
	v_mov_b32_e32 v17, v23
	v_mov_b32_e32 v54, v23
	v_mov_b32_e32 v55, v23
	v_mov_b32_e32 v56, v23
	v_mov_b32_e32 v57, v23
	v_mov_b32_e32 v30, v23
	v_mov_b32_e32 v31, v23
	v_mov_b32_e32 v32, v23
	v_mov_b32_e32 v33, v23
	v_mov_b32_e32 v18, v23
	v_mov_b32_e32 v19, v23
	v_mov_b32_e32 v20, v23
	v_mov_b32_e32 v21, v23
	v_mov_b32_e32 v34, v23
	v_mov_b32_e32 v35, v23
	v_mov_b32_e32 v36, v23
	v_mov_b32_e32 v37, v23
	v_mov_b32_e32 v58, v23
	v_mov_b32_e32 v59, v23
	v_mov_b32_e32 v60, v23
	v_mov_b32_e32 v61, v23
	v_mov_b32_e32 v38, v23
	v_mov_b32_e32 v39, v23
	v_mov_b32_e32 v40, v23
	v_mov_b32_e32 v41, v23
	v_mov_b32_e32 v26, v23
	v_mov_b32_e32 v27, v23
	v_mov_b32_e32 v28, v23
	v_mov_b32_e32 v29, v23
	v_mov_b32_e32 v42, v23
	v_mov_b32_e32 v43, v23
	v_mov_b32_e32 v44, v23
	v_mov_b32_e32 v45, v23
	v_mov_b32_e32 v62, v23
	v_mov_b32_e32 v63, v23
	v_mov_b32_e32 v64, v23
	v_mov_b32_e32 v65, v23
	v_mov_b32_e32 v46, v23
	v_mov_b32_e32 v47, v23
	v_mov_b32_e32 v48, v23
	v_mov_b32_e32 v49, v23
	v_or_b32_e32 v75, 0x4000, v70
.LBB0_1:                                ; =>This Inner Loop Header: Depth=1
	global_load_dwordx4 v[76:79], v[66:67], off offset:-64
	global_load_dwordx4 v[80:83], v[68:69], off offset:-64
	s_add_i32 s1, s1, 64
	s_cmpk_gt_u32 s1, 0x1fdf
	s_waitcnt vmcnt(1)
	ds_write_b128 v70, v[76:79]
	s_waitcnt vmcnt(0)
	ds_write_b128 v75, v[80:83]
	s_waitcnt lgkmcnt(0)
	s_barrier
	ds_read2st64_b64 v[76:79], v71 offset0:2 offset1:4
	ds_read2_b64 v[80:83], v72 offset1:4
	ds_read2st64_b64 v[84:87], v72 offset0:2 offset1:4
	ds_read_b64 v[88:89], v72 offset:3072
	ds_read_b64 v[90:91], v73 offset:3072
	ds_read_b64 v[92:93], v71 offset:3072
	s_waitcnt lgkmcnt(4)
	v_mfma_f32_16x16x16_bf16 v[62:65], v[76:77], v[80:81], v[62:65]
	s_waitcnt lgkmcnt(3)
	v_mfma_f32_16x16x16_bf16 v[58:61], v[76:77], v[84:85], v[58:61]
	v_mfma_f32_16x16x16_bf16 v[54:57], v[76:77], v[86:87], v[54:57]
	s_waitcnt lgkmcnt(2)
	v_mfma_f32_16x16x16_bf16 v[10:13], v[76:77], v[88:89], v[10:13]
	v_mfma_f32_16x16x16_bf16 v[42:45], v[78:79], v[80:81], v[42:45]
	v_mfma_f32_16x16x16_bf16 v[34:37], v[78:79], v[84:85], v[34:37]
	v_mfma_f32_16x16x16_bf16 v[14:17], v[78:79], v[86:87], v[14:17]
	v_mfma_f32_16x16x16_bf16 v[2:5], v[78:79], v[88:89], v[2:5]
	ds_read2_b64 v[76:79], v71 offset1:4
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[38:41], v[76:77], v[84:85], v[38:41]
	v_mfma_f32_16x16x16_bf16 v[30:33], v[76:77], v[86:87], v[30:33]
	v_mfma_f32_16x16x16_bf16 v[18:21], v[92:93], v[84:85], v[18:21]
	v_mfma_f32_16x16x16_bf16 v[50:53], v[92:93], v[86:87], v[50:53]
	ds_read2st64_b64 v[84:87], v74 offset0:2 offset1:4
	v_mfma_f32_16x16x16_bf16 v[6:9], v[76:77], v[88:89], v[6:9]
	v_mfma_f32_16x16x16_bf16 v[22:25], v[92:93], v[88:89], v[22:25]
	ds_read_b64 v[88:89], v74 offset:3072
	v_mfma_f32_16x16x16_bf16 v[46:49], v[76:77], v[80:81], v[46:49]
	v_mfma_f32_16x16x16_bf16 v[46:49], v[78:79], v[82:83], v[46:49]
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_16x16x16_bf16 v[38:41], v[78:79], v[84:85], v[38:41]
	v_mfma_f32_16x16x16_bf16 v[30:33], v[78:79], v[86:87], v[30:33]
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[6:9], v[78:79], v[88:89], v[6:9]
	ds_read2st64_b64 v[76:79], v73 offset0:2 offset1:4
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_mfma_f32_16x16x16_bf16 v[26:29], v[92:93], v[80:81], v[26:29]
	v_mfma_f32_16x16x16_bf16 v[62:65], v[76:77], v[82:83], v[62:65]
	v_mfma_f32_16x16x16_bf16 v[58:61], v[76:77], v[84:85], v[58:61]
	v_mfma_f32_16x16x16_bf16 v[54:57], v[76:77], v[86:87], v[54:57]
	v_mfma_f32_16x16x16_bf16 v[10:13], v[76:77], v[88:89], v[10:13]
	v_mfma_f32_16x16x16_bf16 v[42:45], v[78:79], v[82:83], v[42:45]
	v_mfma_f32_16x16x16_bf16 v[34:37], v[78:79], v[84:85], v[34:37]
	v_mfma_f32_16x16x16_bf16 v[14:17], v[78:79], v[86:87], v[14:17]
	v_mfma_f32_16x16x16_bf16 v[2:5], v[78:79], v[88:89], v[2:5]
	global_load_dwordx4 v[76:79], v[66:67], off
	v_lshl_add_u64 v[66:67], v[66:67], 0, s[2:3]
	v_mfma_f32_16x16x16_bf16 v[26:29], v[90:91], v[82:83], v[26:29]
	global_load_dwordx4 v[80:83], v[68:69], off
	s_waitcnt vmcnt(1)
	ds_write_b128 v70, v[76:79]
	s_waitcnt vmcnt(0)
	ds_write_b128 v75, v[80:83]
	v_mfma_f32_16x16x16_bf16 v[18:21], v[90:91], v[84:85], v[18:21]
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_mfma_f32_16x16x16_bf16 v[50:53], v[90:91], v[86:87], v[50:53]
	ds_read2st64_b64 v[76:79], v71 offset0:2 offset1:4
	ds_read2_b64 v[80:83], v72 offset1:4
	ds_read2st64_b64 v[84:87], v72 offset0:2 offset1:4
	v_lshl_add_u64 v[68:69], v[68:69], 0, s[2:3]
	v_mfma_f32_16x16x16_bf16 v[22:25], v[90:91], v[88:89], v[22:25]
	ds_read_b64 v[88:89], v72 offset:3072
	ds_read_b64 v[90:91], v73 offset:3072
	ds_read_b64 v[92:93], v71 offset:3072
	s_waitcnt lgkmcnt(4)
	v_mfma_f32_16x16x16_bf16 v[62:65], v[76:77], v[80:81], v[62:65]
	s_waitcnt lgkmcnt(3)
	v_mfma_f32_16x16x16_bf16 v[58:61], v[76:77], v[84:85], v[58:61]
	v_mfma_f32_16x16x16_bf16 v[54:57], v[76:77], v[86:87], v[54:57]
	s_waitcnt lgkmcnt(2)
	v_mfma_f32_16x16x16_bf16 v[10:13], v[76:77], v[88:89], v[10:13]
	v_mfma_f32_16x16x16_bf16 v[42:45], v[78:79], v[80:81], v[42:45]
	v_mfma_f32_16x16x16_bf16 v[34:37], v[78:79], v[84:85], v[34:37]
	v_mfma_f32_16x16x16_bf16 v[14:17], v[78:79], v[86:87], v[14:17]
	v_mfma_f32_16x16x16_bf16 v[2:5], v[78:79], v[88:89], v[2:5]
	ds_read2_b64 v[76:79], v71 offset1:4
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[38:41], v[76:77], v[84:85], v[38:41]
	v_mfma_f32_16x16x16_bf16 v[30:33], v[76:77], v[86:87], v[30:33]
	v_mfma_f32_16x16x16_bf16 v[18:21], v[92:93], v[84:85], v[18:21]
	v_mfma_f32_16x16x16_bf16 v[50:53], v[92:93], v[86:87], v[50:53]
	ds_read2st64_b64 v[84:87], v74 offset0:2 offset1:4
	v_mfma_f32_16x16x16_bf16 v[46:49], v[76:77], v[80:81], v[46:49]
	v_mfma_f32_16x16x16_bf16 v[26:29], v[92:93], v[80:81], v[26:29]
	ds_read_b64 v[80:81], v74 offset:3072
	v_mfma_f32_16x16x16_bf16 v[6:9], v[76:77], v[88:89], v[6:9]
	v_mfma_f32_16x16x16_bf16 v[46:49], v[78:79], v[82:83], v[46:49]
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_16x16x16_bf16 v[38:41], v[78:79], v[84:85], v[38:41]
	v_mfma_f32_16x16x16_bf16 v[30:33], v[78:79], v[86:87], v[30:33]
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[6:9], v[78:79], v[80:81], v[6:9]
	ds_read2st64_b64 v[76:79], v73 offset0:2 offset1:4
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_mfma_f32_16x16x16_bf16 v[22:25], v[92:93], v[88:89], v[22:25]
	v_mfma_f32_16x16x16_bf16 v[62:65], v[76:77], v[82:83], v[62:65]
	v_mfma_f32_16x16x16_bf16 v[58:61], v[76:77], v[84:85], v[58:61]
	v_mfma_f32_16x16x16_bf16 v[54:57], v[76:77], v[86:87], v[54:57]
	v_mfma_f32_16x16x16_bf16 v[10:13], v[76:77], v[80:81], v[10:13]
	v_mfma_f32_16x16x16_bf16 v[42:45], v[78:79], v[82:83], v[42:45]
	v_mfma_f32_16x16x16_bf16 v[34:37], v[78:79], v[84:85], v[34:37]
	v_mfma_f32_16x16x16_bf16 v[14:17], v[78:79], v[86:87], v[14:17]
	v_mfma_f32_16x16x16_bf16 v[2:5], v[78:79], v[80:81], v[2:5]
	v_mfma_f32_16x16x16_bf16 v[26:29], v[90:91], v[82:83], v[26:29]
	v_mfma_f32_16x16x16_bf16 v[18:21], v[90:91], v[84:85], v[18:21]
	v_mfma_f32_16x16x16_bf16 v[50:53], v[90:91], v[86:87], v[50:53]
	v_mfma_f32_16x16x16_bf16 v[22:25], v[90:91], v[80:81], v[22:25]
	s_cbranch_scc0 .LBB0_1
; %bb.2:
	s_lshl_b32 s1, s10, 8
	s_add_i32 s0, s1, s0
	s_ashr_i32 s1, s0, 31
	v_lshlrev_b32_e32 v0, 13, v0
	s_lshl_b64 s[0:1], s[0:1], 2
	v_and_b32_e32 v1, 0xcc, v1
	v_and_b32_e32 v0, 0x19e000, v0
	s_add_u32 s0, s8, s0
	v_or_b32_e32 v66, v0, v1
	s_addc_u32 s1, s9, s1
	v_lshlrev_b32_e32 v66, 2, v66
	s_barrier
	global_store_dwordx4 v66, v[46:49], s[0:1]
	s_nop 1
	v_or_b32_e32 v46, 0x20000, v0
	v_or_b32_e32 v47, v46, v1
	v_lshlrev_b32_e32 v47, 2, v47
	global_store_dwordx4 v47, v[38:41], s[0:1]
	s_nop 1
	v_or_b32_e32 v38, 0x40000, v0
	v_or_b32_e32 v39, v38, v1
	v_lshlrev_b32_e32 v39, 2, v39
	v_or_b32_e32 v0, 0x60000, v0
	global_store_dwordx4 v39, v[30:33], s[0:1]
	s_nop 1
	v_or_b32_e32 v30, v0, v1
	v_lshlrev_b32_e32 v30, 2, v30
	global_store_dwordx4 v30, v[6:9], s[0:1]
	global_store_dwordx4 v66, v[62:65], s[0:1] offset:64
	s_nop 0
	v_or_b32_e32 v6, 16, v1
	v_or_b32_e32 v7, v46, v6
	v_lshlrev_b32_e32 v7, 2, v7
	global_store_dwordx4 v7, v[58:61], s[0:1]
	v_or_b32_e32 v7, v38, v6
	v_or_b32_e32 v6, v0, v6
	v_lshlrev_b32_e32 v7, 2, v7
	v_lshlrev_b32_e32 v6, 2, v6
	global_store_dwordx4 v7, v[54:57], s[0:1]
	global_store_dwordx4 v6, v[10:13], s[0:1]
	v_or_b32_e32 v6, 32, v1
	v_or_b32_e32 v7, v46, v6
	v_lshlrev_b32_e32 v7, 2, v7
	global_store_dwordx4 v66, v[42:45], s[0:1] offset:128
	global_store_dwordx4 v7, v[34:37], s[0:1]
	v_or_b32_e32 v7, v38, v6
	v_or_b32_e32 v6, v0, v6
	v_lshlrev_b32_e32 v7, 2, v7
	v_lshlrev_b32_e32 v6, 2, v6
	v_or_b32_e32 v1, 48, v1
	global_store_dwordx4 v7, v[14:17], s[0:1]
	global_store_dwordx4 v6, v[2:5], s[0:1]
	global_store_dwordx4 v66, v[26:29], s[0:1] offset:192
	v_or_b32_e32 v0, v0, v1
	v_or_b32_e32 v2, v46, v1
	v_lshlrev_b32_e32 v2, 2, v2
	global_store_dwordx4 v2, v[18:21], s[0:1]
	v_or_b32_e32 v2, v38, v1
	v_lshlrev_b32_e32 v2, 2, v2
	v_lshlrev_b32_e32 v0, 2, v0
	global_store_dwordx4 v2, v[50:53], s[0:1]
	global_store_dwordx4 v0, v[22:25], s[0:1]
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z6matmulPDF16bS_Pf
		.amdhsa_group_segment_fixed_size 32768
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
		.amdhsa_next_free_vgpr 94
		.amdhsa_next_free_sgpr 12
		.amdhsa_accum_offset 96
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
	.size	_Z6matmulPDF16bS_Pf, .Lfunc_end0-_Z6matmulPDF16bS_Pf
                                        ; -- End function
	.set _Z6matmulPDF16bS_Pf.num_vgpr, 94
	.set _Z6matmulPDF16bS_Pf.num_agpr, 0
	.set _Z6matmulPDF16bS_Pf.numbered_sgpr, 12
	.set _Z6matmulPDF16bS_Pf.private_seg_size, 0
	.set _Z6matmulPDF16bS_Pf.uses_vcc, 0
	.set _Z6matmulPDF16bS_Pf.uses_flat_scratch, 0
	.set _Z6matmulPDF16bS_Pf.has_dyn_sized_stack, 0
	.set _Z6matmulPDF16bS_Pf.has_recursion, 0
	.set _Z6matmulPDF16bS_Pf.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 1708
; TotalNumSgprs: 18
; NumVgprs: 94
; NumAgprs: 0
; TotalNumVgprs: 94
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 32768 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 11
; NumSGPRsForWavesPerEU: 18
; NumVGPRsForWavesPerEU: 94
; AccumOffset: 96
; Occupancy: 5
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 23
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.section	.AMDGPU.gpr_maximums,"",@progbits
	.set amdgpu.max_num_vgpr, 0
	.set amdgpu.max_num_agpr, 0
	.set amdgpu.max_num_sgpr, 0
	.text
	.type	__hip_cuid_4c15a25077e749da,@object ; @__hip_cuid_4c15a25077e749da
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_4c15a25077e749da
__hip_cuid_4c15a25077e749da:
	.byte	0                               ; 0x0
	.size	__hip_cuid_4c15a25077e749da, 1

	.ident	"AMD clang version 20.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-7.0.0 25314 f4087f6b428f0e6f575ebac8a8a724dab123d06e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __hip_cuid_4c15a25077e749da
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
    .group_segment_fixed_size: 32768
    .kernarg_segment_align: 8
    .kernarg_segment_size: 24
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z6matmulPDF16bS_Pf
    .private_segment_fixed_size: 0
    .sgpr_count:     18
    .sgpr_spill_count: 0
    .symbol:         _Z6matmulPDF16bS_Pf.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     94
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
	movabsq	$4294968320, %rdi               # imm = 0x100000400
	movl	$1, %esi
	movq	%rdi, %rdx
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
	movq	__hip_gpubin_handle_4c15a25077e749da(%rip), %rdi
	testq	%rdi, %rdi
	jne	.LBB2_2
# %bb.1:
	movl	$__hip_fatbin_wrapper, %edi
	callq	__hipRegisterFatBinary
	movq	%rax, %rdi
	movq	%rax, __hip_gpubin_handle_4c15a25077e749da(%rip)
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
	movq	__hip_gpubin_handle_4c15a25077e749da(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB3_2
# %bb.1:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__hipUnregisterFatBinary
	movq	$0, __hip_gpubin_handle_4c15a25077e749da(%rip)
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
	.quad	__hip_fatbin_4c15a25077e749da
	.quad	0
	.size	__hip_fatbin_wrapper, 24

	.type	__hip_gpubin_handle_4c15a25077e749da,@object # @__hip_gpubin_handle_4c15a25077e749da
	.local	__hip_gpubin_handle_4c15a25077e749da
	.comm	__hip_gpubin_handle_4c15a25077e749da,8,8
	.section	.init_array,"aw",@init_array
	.p2align	3, 0x0
	.quad	__hip_module_ctor
	.type	__hip_cuid_4c15a25077e749da,@object # @__hip_cuid_4c15a25077e749da
	.bss
	.globl	__hip_cuid_4c15a25077e749da
__hip_cuid_4c15a25077e749da:
	.byte	0                               # 0x0
	.size	__hip_cuid_4c15a25077e749da, 1

	.ident	"AMD clang version 20.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-7.0.0 25314 f4087f6b428f0e6f575ebac8a8a724dab123d06e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z21__device_stub__matmulPDF16bS_Pf
	.addrsig_sym __hip_module_ctor
	.addrsig_sym __hip_module_dtor
	.addrsig_sym _Z6matmulPDF16bS_Pf
	.addrsig_sym __hip_fatbin_4c15a25077e749da
	.addrsig_sym __hip_fatbin_wrapper
	.addrsig_sym __hip_cuid_4c15a25077e749da

# __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu-
