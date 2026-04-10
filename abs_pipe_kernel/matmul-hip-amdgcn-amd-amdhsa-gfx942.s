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
	s_lshr_b32 s1, s0, 28
	s_add_i32 s1, s2, s1
	s_ashr_i32 s3, s1, 4
	s_and_b32 s1, s1, -16
	s_lshr_b32 s0, s0, 25
	s_sub_i32 s1, s2, s1
	s_add_i32 s2, s2, s0
	s_lshr_b32 s0, s3, 29
	s_add_i32 s0, s3, s0
	s_and_b32 s0, s0, 0x1f8
	s_sub_i32 s0, s3, s0
	s_bfe_i32 s3, s1, 0x80000
	s_bfe_u32 s3, s3, 0x2000d
	s_add_i32 s3, s1, s3
	s_bfe_i32 s3, s3, 0x80000
	s_sext_i32_i16 s3, s3
	s_ashr_i32 s11, s3, 2
	s_and_b32 s3, s3, -4
	s_sub_i32 s1, s1, s3
	s_sext_i32_i8 s1, s1
	s_lshl_b32 s2, s2, 3
	s_and_b32 s2, s2, 0xfffffc00
	s_lshl_b32 s10, s1, 8
	s_add_i32 s10, s10, s2
	s_lshl_b32 s0, s0, 23
	s_lshl_b32 s2, s10, 13
	s_lshl_b32 s1, s11, 21
	s_ashr_i32 s3, s2, 31
	s_add_i32 s0, s1, s0
	s_ashr_i32 s1, s0, 31
	s_lshl_b64 s[2:3], s[2:3], 1
	v_lshlrev_b32_e32 v1, 4, v0
	s_waitcnt lgkmcnt(0)
	s_add_u32 s2, s4, s2
	v_lshrrev_b32_e32 v84, 2, v0
	v_and_b32_e32 v1, 48, v1
	s_addc_u32 s3, s5, s3
	s_lshl_b64 s[4:5], s[0:1], 1
	v_lshl_or_b32 v2, v84, 14, v1
	s_add_u32 s4, s6, s4
	global_load_dwordx4 v[6:9], v2, s[2:3]
	s_addc_u32 s5, s7, s5
	global_load_dwordx4 v[10:13], v2, s[4:5]
	v_and_b32_e32 v86, 0xc0, v84
	v_lshlrev_b32_e32 v14, 3, v0
	v_and_b32_e32 v15, 48, v0
	v_and_b32_e32 v85, 0xcf, v0
	v_lshlrev_b32_e32 v16, 2, v0
	v_and_b32_e32 v17, 2, v0
	v_lshlrev_b32_e32 v18, 1, v0
	v_and_or_b32 v0, v0, 15, v86
	v_lshl_or_b32 v19, v85, 6, v15
	v_and_b32_e32 v16, 0xfc, v16
	v_and_b32_e32 v18, 48, v18
	v_and_b32_e32 v14, 48, v14
	v_lshl_or_b32 v1, v84, 6, v1
	v_lshl_or_b32 v0, v0, 6, v15
	v_mov_b32_e32 v3, 0
	v_xor_b32_e32 v93, 8, v16
	v_xor_b32_e32 v91, v19, v14
	v_or_b32_e32 v16, 0x400, v19
	v_or_b32_e32 v20, 0x800, v19
	v_or_b32_e32 v19, 0xc00, v19
	v_xor_b32_e32 v94, v1, v18
	v_xor_b32_e32 v95, v0, v14
	v_or_b32_e32 v1, 0x400, v0
	v_or_b32_e32 v15, 0x800, v0
	v_or_b32_e32 v0, 0xc00, v0
	v_xor_b32_e32 v92, v16, v14
	v_xor_b32_e32 v87, v20, v14
	v_xor_b32_e32 v88, v19, v14
	v_xor_b32_e32 v96, v1, v14
	v_xor_b32_e32 v89, v15, v14
	v_xor_b32_e32 v90, v0, v14
	v_lshl_add_u64 v[14:15], s[4:5], 0, v[2:3]
	v_lshl_add_u64 v[82:83], v[14:15], 0, 64
	v_cmp_eq_u32_e32 vcc, 0, v17
	v_lshl_add_u64 v[0:1], s[2:3], 0, v[2:3]
	s_mov_b32 s1, 1
	v_mov_b32_e32 v4, v3
	v_mov_b32_e32 v5, v3
	v_or_b32_e32 v97, 0x8000, v94
	v_lshl_add_u64 v[0:1], v[0:1], 0, 64
	v_mov_b32_e32 v2, v3
	v_mov_b32_e32 v62, v3
	v_mov_b32_e32 v63, v3
	v_mov_b32_e32 v64, v3
	v_mov_b32_e32 v65, v3
	v_mov_b32_e32 v58, v3
	v_mov_b32_e32 v59, v3
	v_mov_b32_e32 v60, v3
	v_mov_b32_e32 v61, v3
	v_mov_b32_e32 v54, v3
	v_mov_b32_e32 v55, v3
	v_mov_b32_e32 v56, v3
	v_mov_b32_e32 v57, v3
	v_mov_b32_e32 v46, v3
	v_mov_b32_e32 v47, v3
	v_mov_b32_e32 v48, v3
	v_mov_b32_e32 v49, v3
	v_mov_b32_e32 v42, v3
	v_mov_b32_e32 v43, v3
	v_mov_b32_e32 v44, v3
	v_mov_b32_e32 v45, v3
	v_mov_b32_e32 v30, v3
	v_mov_b32_e32 v31, v3
	v_mov_b32_e32 v32, v3
	v_mov_b32_e32 v33, v3
	v_mov_b32_e32 v38, v3
	v_mov_b32_e32 v39, v3
	v_mov_b32_e32 v40, v3
	v_mov_b32_e32 v41, v3
	v_mov_b32_e32 v34, v3
	v_mov_b32_e32 v35, v3
	v_mov_b32_e32 v36, v3
	v_mov_b32_e32 v37, v3
	v_mov_b32_e32 v26, v3
	v_mov_b32_e32 v27, v3
	v_mov_b32_e32 v28, v3
	v_mov_b32_e32 v29, v3
	s_waitcnt vmcnt(1)
	ds_bpermute_b32 v14, v93, v6
	ds_bpermute_b32 v15, v93, v7
	ds_bpermute_b32 v16, v93, v8
	ds_bpermute_b32 v18, v93, v9
	s_waitcnt vmcnt(0)
	ds_bpermute_b32 v19, v93, v10
	ds_bpermute_b32 v20, v93, v11
	ds_bpermute_b32 v21, v93, v12
	ds_bpermute_b32 v22, v93, v13
	s_waitcnt lgkmcnt(5)
	v_cndmask_b32_e32 v6, v16, v6, vcc
	s_waitcnt lgkmcnt(4)
	v_cndmask_b32_e32 v7, v18, v7, vcc
	v_cndmask_b32_e32 v8, v8, v14, vcc
	v_cndmask_b32_e32 v9, v9, v15, vcc
	ds_write_b128 v94, v[6:9]
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v6, v21, v10, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v7, v22, v11, vcc
	v_cndmask_b32_e32 v8, v12, v19, vcc
	v_cndmask_b32_e32 v9, v13, v20, vcc
	ds_write_b128 v94, v[6:9] offset:32768
	v_mov_b32_e32 v18, v3
	v_mov_b32_e32 v19, v3
	v_mov_b32_e32 v20, v3
	v_mov_b32_e32 v21, v3
	v_mov_b32_e32 v22, v3
	v_mov_b32_e32 v23, v3
	v_mov_b32_e32 v24, v3
	v_mov_b32_e32 v25, v3
	v_mov_b32_e32 v14, v3
	v_mov_b32_e32 v15, v3
	v_mov_b32_e32 v16, v3
	v_mov_b32_e32 v17, v3
	v_mov_b32_e32 v10, v3
	v_mov_b32_e32 v11, v3
	v_mov_b32_e32 v12, v3
	v_mov_b32_e32 v13, v3
	v_mov_b32_e32 v6, v3
	v_mov_b32_e32 v7, v3
	v_mov_b32_e32 v8, v3
	v_mov_b32_e32 v9, v3
	v_mov_b32_e32 v50, v3
	v_mov_b32_e32 v51, v3
	v_mov_b32_e32 v52, v3
	v_mov_b32_e32 v53, v3
	s_waitcnt lgkmcnt(0)
	s_barrier
.LBB0_1:                                ; =>This Inner Loop Header: Depth=1
	s_add_i32 s2, s1, -1
	s_and_b32 s2, s2, 1
	s_lshl_b32 s2, s2, 14
	v_or_b32_e32 v66, s2, v95
	v_or_b32_e32 v67, s2, v96
	v_or_b32_e32 v70, s2, v89
	v_or_b32_e32 v74, s2, v90
	s_bitset1_b32 s2, 15
	v_or_b32_e32 v71, s2, v91
	v_or_b32_e32 v72, s2, v92
	ds_read_b128 v[98:101], v66
	ds_read_b128 v[66:69], v67
	ds_read_b128 v[102:105], v71
	ds_read_b128 v[106:109], v72
	ds_read_b128 v[70:73], v70
	ds_read_b128 v[74:77], v74
	v_or_b32_e32 v78, s2, v87
	v_or_b32_e32 v79, s2, v88
	ds_read_b128 v[110:113], v78
	ds_read_b128 v[78:81], v79
	s_waitcnt lgkmcnt(5)
	v_mfma_f32_16x16x16_bf16 v[62:65], v[98:99], v[102:103], v[62:65]
	s_lshl_b32 s2, s1, 14
	s_add_i32 s1, s1, 1
	s_and_b32 s2, s2, 0x4000
	v_mfma_f32_16x16x16_bf16 v[58:61], v[66:67], v[102:103], v[58:61]
	s_cmpk_eq_i32 s1, 0x100
	s_waitcnt lgkmcnt(3)
	v_mfma_f32_16x16x16_bf16 v[54:57], v[70:71], v[102:103], v[54:57]
	s_waitcnt lgkmcnt(2)
	v_mfma_f32_16x16x16_bf16 v[46:49], v[74:75], v[102:103], v[46:49]
	v_mfma_f32_16x16x16_bf16 v[42:45], v[98:99], v[106:107], v[42:45]
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_16x16x16_bf16 v[26:29], v[98:99], v[110:111], v[26:29]
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[6:9], v[98:99], v[78:79], v[6:9]
	v_mfma_f32_16x16x16_bf16 v[62:65], v[100:101], v[104:105], v[62:65]
	v_mfma_f32_16x16x16_bf16 v[58:61], v[68:69], v[104:105], v[58:61]
	v_mfma_f32_16x16x16_bf16 v[54:57], v[72:73], v[104:105], v[54:57]
	v_mfma_f32_16x16x16_bf16 v[46:49], v[76:77], v[104:105], v[46:49]
	global_load_dwordx4 v[102:105], v[0:1], off
	v_lshl_add_u64 v[0:1], v[0:1], 0, 64
	v_mfma_f32_16x16x16_bf16 v[42:45], v[100:101], v[108:109], v[42:45]
	v_mfma_f32_16x16x16_bf16 v[26:29], v[100:101], v[112:113], v[26:29]
	v_mfma_f32_16x16x16_bf16 v[6:9], v[100:101], v[80:81], v[6:9]
	global_load_dwordx4 v[98:101], v[82:83], off
	v_lshl_add_u64 v[82:83], v[82:83], 0, 64
	v_mfma_f32_16x16x16_bf16 v[30:33], v[66:67], v[106:107], v[30:33]
	v_mfma_f32_16x16x16_bf16 v[22:25], v[66:67], v[110:111], v[22:25]
	v_mfma_f32_16x16x16_bf16 v[50:53], v[66:67], v[78:79], v[50:53]
	s_waitcnt vmcnt(1)
	ds_bpermute_b32 v66, v93, v104
	v_mfma_f32_16x16x16_bf16 v[38:41], v[70:71], v[106:107], v[38:41]
	ds_bpermute_b32 v67, v93, v105
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v66, v66, v102, vcc
	v_mfma_f32_16x16x16_bf16 v[14:17], v[70:71], v[110:111], v[14:17]
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v67, v67, v103, vcc
	v_mfma_f32_16x16x16_bf16 v[18:21], v[70:71], v[78:79], v[18:21]
	s_waitcnt vmcnt(0)
	ds_bpermute_b32 v70, v93, v100
	ds_bpermute_b32 v71, v93, v101
	v_mfma_f32_16x16x16_bf16 v[34:37], v[74:75], v[106:107], v[34:37]
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v70, v70, v98, vcc
	v_mfma_f32_16x16x16_bf16 v[10:13], v[74:75], v[110:111], v[10:13]
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v71, v71, v99, vcc
	v_mfma_f32_16x16x16_bf16 v[2:5], v[74:75], v[78:79], v[2:5]
	v_or_b32_e32 v74, s2, v94
	v_add_u32_e32 v75, s2, v97
	v_mfma_f32_16x16x16_bf16 v[30:33], v[68:69], v[108:109], v[30:33]
	v_mfma_f32_16x16x16_bf16 v[22:25], v[68:69], v[112:113], v[22:25]
	v_mfma_f32_16x16x16_bf16 v[50:53], v[68:69], v[80:81], v[50:53]
	ds_bpermute_b32 v68, v93, v102
	ds_bpermute_b32 v69, v93, v103
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v68, v104, v68, vcc
	v_mfma_f32_16x16x16_bf16 v[38:41], v[72:73], v[108:109], v[38:41]
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v69, v105, v69, vcc
	v_mfma_f32_16x16x16_bf16 v[14:17], v[72:73], v[112:113], v[14:17]
	v_mfma_f32_16x16x16_bf16 v[18:21], v[72:73], v[80:81], v[18:21]
	ds_bpermute_b32 v72, v93, v98
	ds_bpermute_b32 v73, v93, v99
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v72, v100, v72, vcc
	v_mfma_f32_16x16x16_bf16 v[34:37], v[76:77], v[108:109], v[34:37]
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v73, v101, v73, vcc
	ds_write_b128 v74, v[66:69]
	ds_write_b128 v75, v[70:73]
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[10:13], v[76:77], v[112:113], v[10:13]
	s_barrier
	v_mfma_f32_16x16x16_bf16 v[2:5], v[76:77], v[80:81], v[2:5]
	s_cbranch_scc0 .LBB0_1
; %bb.2:
	ds_read_b128 v[70:73], v95 offset:16384
	ds_read_b128 v[66:69], v96 offset:16384
	ds_read_b128 v[74:77], v91 offset:49152
	ds_read_b128 v[78:81], v92 offset:49152
	s_add_i32 s0, s10, s0
	s_ashr_i32 s1, s0, 31
	v_lshlrev_b32_e32 v0, 13, v85
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_16x16x16_bf16 v[58:61], v[66:67], v[74:75], v[58:61]
	v_and_b32_e32 v1, 12, v84
	s_lshl_b64 s[0:1], s[0:1], 2
	v_or3_b32 v0, v1, v0, v86
	v_mfma_f32_16x16x16_bf16 v[92:95], v[68:69], v[76:77], v[58:61]
	ds_read_b128 v[96:99], v89 offset:16384
	s_nop 1
	ds_read_b128 v[58:61], v90 offset:16384
	s_add_u32 s0, s8, s0
	s_addc_u32 s1, s9, s1
	v_mfma_f32_16x16x16_bf16 v[62:65], v[70:71], v[74:75], v[62:65]
	v_lshlrev_b32_e32 v0, 2, v0
	v_mov_b32_e32 v1, 0
	v_lshl_add_u64 v[82:83], s[0:1], 0, v[0:1]
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_16x16x16_bf16 v[54:57], v[96:97], v[74:75], v[54:57]
	s_mov_b32 s2, 0x80000
	v_or_b32_e32 v1, 0x80000, v0
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[46:49], v[58:59], v[74:75], v[46:49]
	v_mfma_f32_16x16x16_bf16 v[42:45], v[70:71], v[78:79], v[42:45]
	v_mfma_f32_16x16x16_bf16 v[30:33], v[66:67], v[78:79], v[30:33]
	v_mfma_f32_16x16x16_bf16 v[38:41], v[96:97], v[78:79], v[38:41]
	v_mfma_f32_16x16x16_bf16 v[34:37], v[58:59], v[78:79], v[34:37]
	v_mfma_f32_16x16x16_bf16 v[62:65], v[72:73], v[76:77], v[62:65]
	v_mfma_f32_16x16x16_bf16 v[54:57], v[98:99], v[76:77], v[54:57]
	v_mfma_f32_16x16x16_bf16 v[46:49], v[60:61], v[76:77], v[46:49]
	v_mfma_f32_16x16x16_bf16 v[42:45], v[72:73], v[80:81], v[42:45]
	v_mfma_f32_16x16x16_bf16 v[30:33], v[68:69], v[80:81], v[30:33]
	v_mfma_f32_16x16x16_bf16 v[38:41], v[98:99], v[80:81], v[38:41]
	v_mfma_f32_16x16x16_bf16 v[34:37], v[60:61], v[80:81], v[34:37]
	ds_read_b128 v[74:77], v87 offset:49152
	ds_read_b128 v[78:81], v88 offset:49152
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_mfma_f32_16x16x16_bf16 v[26:29], v[70:71], v[74:75], v[26:29]
	global_store_dwordx4 v0, v[62:65], s[0:1]
	global_store_dwordx4 v0, v[92:95], s[0:1] offset:64
	global_store_dwordx4 v0, v[54:57], s[0:1] offset:128
	global_store_dwordx4 v1, v[42:45], s[0:1]
	v_mfma_f32_16x16x16_bf16 v[22:25], v[66:67], v[74:75], v[22:25]
	global_store_dwordx4 v0, v[46:49], s[0:1] offset:192
	v_add_co_u32_e32 v42, vcc, s2, v82
	v_mfma_f32_16x16x16_bf16 v[14:17], v[96:97], v[74:75], v[14:17]
	s_nop 0
	v_addc_co_u32_e32 v43, vcc, 0, v83, vcc
	global_store_dwordx4 v[42:43], v[30:33], off offset:64
	v_mfma_f32_16x16x16_bf16 v[6:9], v[70:71], v[78:79], v[6:9]
	global_store_dwordx4 v[42:43], v[38:41], off offset:128
	global_store_dwordx4 v[42:43], v[34:37], off offset:192
	v_or_b32_e32 v1, 0x100000, v0
	v_or_b32_e32 v0, 0x180000, v0
	v_mfma_f32_16x16x16_bf16 v[10:13], v[58:59], v[74:75], v[10:13]
	v_add_co_u32_e32 v34, vcc, 0x100000, v82
	v_mfma_f32_16x16x16_bf16 v[26:29], v[72:73], v[76:77], v[26:29]
	s_nop 0
	v_addc_co_u32_e32 v35, vcc, 0, v83, vcc
	v_mfma_f32_16x16x16_bf16 v[22:25], v[68:69], v[76:77], v[22:25]
	v_mfma_f32_16x16x16_bf16 v[14:17], v[98:99], v[76:77], v[14:17]
	s_nop 2
	global_store_dwordx4 v1, v[26:29], s[0:1]
	s_nop 1
	global_store_dwordx4 v[34:35], v[22:25], off offset:64
	v_mfma_f32_16x16x16_bf16 v[6:9], v[72:73], v[80:81], v[6:9]
	v_mfma_f32_16x16x16_bf16 v[10:13], v[60:61], v[76:77], v[10:13]
	global_store_dwordx4 v[34:35], v[14:17], off offset:128
	s_nop 5
	global_store_dwordx4 v[34:35], v[10:13], off offset:192
	v_mfma_f32_16x16x16_bf16 v[30:33], v[66:67], v[78:79], v[50:53]
	global_store_dwordx4 v0, v[6:9], s[0:1]
	v_mfma_f32_16x16x16_bf16 v[0:3], v[58:59], v[78:79], v[2:5]
	s_nop 0
	v_add_co_u32_e32 v6, vcc, 0x180000, v82
	v_mfma_f32_16x16x16_bf16 v[18:21], v[96:97], v[78:79], v[18:21]
	s_nop 0
	v_addc_co_u32_e32 v7, vcc, 0, v83, vcc
	v_mfma_f32_16x16x16_bf16 v[26:29], v[68:69], v[80:81], v[30:33]
	v_mfma_f32_16x16x16_bf16 v[0:3], v[60:61], v[80:81], v[0:3]
	v_mfma_f32_16x16x16_bf16 v[10:13], v[98:99], v[80:81], v[18:21]
	s_nop 4
	global_store_dwordx4 v[6:7], v[26:29], off offset:64
	s_nop 0
	global_store_dwordx4 v[6:7], v[10:13], off offset:128
	global_store_dwordx4 v[6:7], v[0:3], off offset:192
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z6matmulPDF16bS_Pf
		.amdhsa_group_segment_fixed_size 65536
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
		.amdhsa_next_free_vgpr 114
		.amdhsa_next_free_sgpr 96
		.amdhsa_accum_offset 116
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
	.set _Z6matmulPDF16bS_Pf.num_vgpr, 114
	.set _Z6matmulPDF16bS_Pf.num_agpr, 0
	.set _Z6matmulPDF16bS_Pf.numbered_sgpr, 12
	.set _Z6matmulPDF16bS_Pf.private_seg_size, 0
	.set _Z6matmulPDF16bS_Pf.uses_vcc, 1
	.set _Z6matmulPDF16bS_Pf.uses_flat_scratch, 0
	.set _Z6matmulPDF16bS_Pf.has_dyn_sized_stack, 0
	.set _Z6matmulPDF16bS_Pf.has_recursion, 0
	.set _Z6matmulPDF16bS_Pf.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 2084
; TotalNumSgprs: 18
; NumVgprs: 114
; NumAgprs: 0
; TotalNumVgprs: 114
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 65536 bytes/workgroup (compile time only)
; SGPRBlocks: 12
; VGPRBlocks: 14
; NumSGPRsForWavesPerEU: 102
; NumVGPRsForWavesPerEU: 114
; AccumOffset: 116
; Occupancy: 4
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 28
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.section	.AMDGPU.gpr_maximums,"",@progbits
	.set amdgpu.max_num_vgpr, 0
	.set amdgpu.max_num_agpr, 0
	.set amdgpu.max_num_sgpr, 0
	.text
	.type	__hip_cuid_a07108289d32dd29,@object ; @__hip_cuid_a07108289d32dd29
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_a07108289d32dd29
__hip_cuid_a07108289d32dd29:
	.byte	0                               ; 0x0
	.size	__hip_cuid_a07108289d32dd29, 1

	.ident	"AMD clang version 20.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-7.0.0 25314 f4087f6b428f0e6f575ebac8a8a724dab123d06e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __hip_cuid_a07108289d32dd29
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
    .group_segment_fixed_size: 65536
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
    .vgpr_count:     114
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx942
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata
