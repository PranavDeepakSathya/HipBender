
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
	s_ashr_i32 s12, s3, 2
	s_and_b32 s3, s3, -4
	s_sub_i32 s1, s1, s3
	s_sext_i32_i8 s1, s1
	s_lshl_b32 s2, s2, 3
	s_and_b32 s2, s2, 0xfffffc00
	s_lshl_b32 s10, s1, 8
	s_add_i32 s10, s10, s2
	s_lshl_b32 s2, s0, 23
	s_lshl_b32 s0, s10, 13
	s_ashr_i32 s1, s0, 31
	s_lshl_b64 s[0:1], s[0:1], 1
	v_lshlrev_b32_e32 v1, 4, v0
	s_waitcnt lgkmcnt(0)
	s_add_u32 s0, s4, s0
	v_lshrrev_b32_e32 v142, 2, v0
	v_and_b32_e32 v1, 48, v1
	s_addc_u32 s1, s5, s1
	v_lshl_or_b32 v32, v142, 14, v1
	v_mov_b32_e32 v33, 0
	v_lshl_add_u64 v[138:139], s[0:1], 0, v[32:33]
	s_mov_b32 s11, 0x200000
	v_add_co_u32_e32 v6, vcc, s11, v138
	global_load_dwordx4 v[2:5], v32, s[0:1]
	s_nop 0
	v_addc_co_u32_e32 v7, vcc, 0, v139, vcc
	global_load_dwordx4 v[6:9], v[6:7], off
	s_lshl_b32 s0, s12, 21
	s_add_i32 s2, s0, s2
	s_ashr_i32 s3, s2, 31
	s_lshl_b64 s[0:1], s[2:3], 1
	s_add_u32 s0, s6, s0
	s_addc_u32 s1, s7, s1
	v_lshl_add_u64 v[140:141], s[0:1], 0, v[32:33]
	v_add_co_u32_e32 v14, vcc, s11, v140
	global_load_dwordx4 v[10:13], v32, s[0:1]
	s_nop 0
	v_addc_co_u32_e32 v15, vcc, 0, v141, vcc
	global_load_dwordx4 v[14:17], v[14:15], off
	v_lshrrev_b32_e32 v18, 1, v0
	v_lshlrev_b32_e32 v21, 2, v0
	v_lshlrev_b32_e32 v23, 1, v0
	v_and_b32_e32 v144, 0x80, v18
	v_lshlrev_b32_e32 v19, 3, v0
	v_and_b32_e32 v20, 48, v0
	v_and_b32_e32 v143, 0xcf, v0
	v_and_b32_e32 v22, 2, v0
	v_and_b32_e32 v21, 0xfc, v21
	v_and_b32_e32 v23, 48, v23
	v_and_or_b32 v24, v0, 15, v144
	v_lshl_or_b32 v0, v142, 6, v1
	v_xor_b32_e32 v151, 8, v21
	v_xor_b32_e32 v152, v0, v23
	v_or_b32_e32 v0, 0x2000, v0
	v_xor_b32_e32 v153, v0, v23
	v_cmp_eq_u32_e32 vcc, 0, v22
	v_lshl_or_b32 v18, v143, 6, v20
	s_mov_b32 s3, 1
	s_mov_b64 s[4:5], 0
	v_mov_b32_e32 v32, v33
	v_mov_b32_e32 v34, v33
	v_mov_b32_e32 v35, v33
	v_mov_b32_e32 v124, v33
	v_mov_b32_e32 v125, v33
	v_mov_b32_e32 v126, v33
	v_mov_b32_e32 v127, v33
	v_mov_b32_e32 v116, v33
	v_mov_b32_e32 v117, v33
	v_mov_b32_e32 v118, v33
	v_mov_b32_e32 v119, v33
	v_mov_b32_e32 v108, v33
	v_mov_b32_e32 v109, v33
	v_mov_b32_e32 v110, v33
	v_mov_b32_e32 v111, v33
	v_mov_b32_e32 v104, v33
	v_mov_b32_e32 v105, v33
	v_mov_b32_e32 v106, v33
	v_mov_b32_e32 v107, v33
	v_mov_b32_e32 v100, v33
	v_mov_b32_e32 v101, v33
	v_mov_b32_e32 v102, v33
	v_mov_b32_e32 v103, v33
	v_mov_b32_e32 v96, v33
	v_mov_b32_e32 v97, v33
	v_mov_b32_e32 v98, v33
	v_mov_b32_e32 v99, v33
	v_mov_b32_e32 v92, v33
	v_mov_b32_e32 v93, v33
	v_mov_b32_e32 v94, v33
	v_mov_b32_e32 v95, v33
	v_mov_b32_e32 v88, v33
	v_mov_b32_e32 v89, v33
	v_mov_b32_e32 v90, v33
	v_mov_b32_e32 v91, v33
	v_mov_b32_e32 v60, v33
	v_mov_b32_e32 v61, v33
	v_mov_b32_e32 v62, v33
	v_mov_b32_e32 v63, v33
	v_mov_b32_e32 v64, v33
	v_mov_b32_e32 v65, v33
	v_mov_b32_e32 v66, v33
	v_mov_b32_e32 v67, v33
	s_waitcnt vmcnt(3)
	ds_bpermute_b32 v21, v151, v2
	ds_bpermute_b32 v23, v151, v3
	ds_bpermute_b32 v0, v151, v4
	ds_bpermute_b32 v1, v151, v5
	s_waitcnt vmcnt(2)
	ds_bpermute_b32 v25, v151, v6
	ds_bpermute_b32 v26, v151, v7
	ds_bpermute_b32 v27, v151, v8
	ds_bpermute_b32 v28, v151, v9
	s_waitcnt lgkmcnt(5)
	v_cndmask_b32_e32 v0, v0, v2, vcc
	s_waitcnt lgkmcnt(4)
	v_cndmask_b32_e32 v1, v1, v3, vcc
	v_cndmask_b32_e32 v2, v4, v21, vcc
	v_cndmask_b32_e32 v3, v5, v23, vcc
	ds_write_b128 v152, v[0:3]
	s_waitcnt vmcnt(1)
	ds_bpermute_b32 v21, v151, v10
	ds_bpermute_b32 v22, v151, v11
	ds_bpermute_b32 v4, v151, v12
	ds_bpermute_b32 v5, v151, v13
	s_waitcnt lgkmcnt(8)
	v_cndmask_b32_e32 v2, v8, v25, vcc
	s_waitcnt lgkmcnt(7)
	v_cndmask_b32_e32 v3, v9, v26, vcc
	s_waitcnt vmcnt(0)
	ds_bpermute_b32 v23, v151, v14
	ds_bpermute_b32 v25, v151, v15
	ds_bpermute_b32 v8, v151, v16
	ds_bpermute_b32 v9, v151, v17
	s_waitcnt lgkmcnt(10)
	v_cndmask_b32_e32 v0, v27, v6, vcc
	s_waitcnt lgkmcnt(9)
	v_cndmask_b32_e32 v1, v28, v7, vcc
	s_waitcnt lgkmcnt(5)
	v_cndmask_b32_e32 v4, v4, v10, vcc
	s_waitcnt lgkmcnt(4)
	v_cndmask_b32_e32 v5, v5, v11, vcc
	v_cndmask_b32_e32 v6, v12, v21, vcc
	v_cndmask_b32_e32 v7, v13, v22, vcc
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v8, v8, v14, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v9, v9, v15, vcc
	v_cndmask_b32_e32 v10, v16, v23, vcc
	v_cndmask_b32_e32 v11, v17, v25, vcc
	ds_write_b128 v153, v[0:3]
	ds_write_b128 v152, v[4:7] offset:32768
	ds_write_b128 v153, v[8:11] offset:32768
	v_lshl_or_b32 v0, v24, 6, v20
	v_and_b32_e32 v1, 48, v19
	v_or_b32_e32 v2, 0x400, v0
	v_xor_b32_e32 v157, v2, v1
	v_or_b32_e32 v2, 0x800, v0
	v_xor_b32_e32 v154, v2, v1
	v_or_b32_e32 v2, 0xc00, v0
	v_xor_b32_e32 v155, v2, v1
	v_or_b32_e32 v2, 0x1000, v0
	v_xor_b32_e32 v149, v2, v1
	v_or_b32_e32 v2, 0x1400, v0
	v_xor_b32_e32 v156, v0, v1
	v_xor_b32_e32 v150, v2, v1
	v_or_b32_e32 v2, 0x1800, v0
	v_or_b32_e32 v0, 0x1c00, v0
	v_xor_b32_e32 v148, v0, v1
	v_or_b32_e32 v0, 0x400, v18
	v_xor_b32_e32 v159, v0, v1
	v_or_b32_e32 v0, 0x800, v18
	v_xor_b32_e32 v145, v0, v1
	v_or_b32_e32 v0, 0xc00, v18
	v_xor_b32_e32 v147, v2, v1
	v_xor_b32_e32 v158, v18, v1
	v_xor_b32_e32 v146, v0, v1
	v_mov_b32_e32 v68, v33
	v_mov_b32_e32 v69, v33
	v_mov_b32_e32 v70, v33
	v_mov_b32_e32 v71, v33
	v_mov_b32_e32 v72, v33
	v_mov_b32_e32 v73, v33
	v_mov_b32_e32 v74, v33
	v_mov_b32_e32 v75, v33
	v_mov_b32_e32 v76, v33
	v_mov_b32_e32 v77, v33
	v_mov_b32_e32 v78, v33
	v_mov_b32_e32 v79, v33
	v_mov_b32_e32 v84, v33
	v_mov_b32_e32 v85, v33
	v_mov_b32_e32 v86, v33
	v_mov_b32_e32 v87, v33
	v_mov_b32_e32 v80, v33
	v_mov_b32_e32 v81, v33
	v_mov_b32_e32 v82, v33
	v_mov_b32_e32 v83, v33
	v_mov_b32_e32 v56, v33
	v_mov_b32_e32 v57, v33
	v_mov_b32_e32 v58, v33
	v_mov_b32_e32 v59, v33
	v_mov_b32_e32 v36, v33
	v_mov_b32_e32 v37, v33
	v_mov_b32_e32 v38, v33
	v_mov_b32_e32 v39, v33
	v_mov_b32_e32 v40, v33
	v_mov_b32_e32 v41, v33
	v_mov_b32_e32 v42, v33
	v_mov_b32_e32 v43, v33
	v_mov_b32_e32 v44, v33
	v_mov_b32_e32 v45, v33
	v_mov_b32_e32 v46, v33
	v_mov_b32_e32 v47, v33
	v_mov_b32_e32 v48, v33
	v_mov_b32_e32 v49, v33
	v_mov_b32_e32 v50, v33
	v_mov_b32_e32 v51, v33
	v_mov_b32_e32 v52, v33
	v_mov_b32_e32 v53, v33
	v_mov_b32_e32 v54, v33
	v_mov_b32_e32 v55, v33
	v_mov_b32_e32 v20, v33
	v_mov_b32_e32 v21, v33
	v_mov_b32_e32 v22, v33
	v_mov_b32_e32 v23, v33
	v_mov_b32_e32 v16, v33
	v_mov_b32_e32 v17, v33
	v_mov_b32_e32 v18, v33
	v_mov_b32_e32 v19, v33
	v_mov_b32_e32 v12, v33
	v_mov_b32_e32 v13, v33
	v_mov_b32_e32 v14, v33
	v_mov_b32_e32 v15, v33
	v_mov_b32_e32 v8, v33
	v_mov_b32_e32 v9, v33
	v_mov_b32_e32 v10, v33
	v_mov_b32_e32 v11, v33
	v_mov_b32_e32 v4, v33
	v_mov_b32_e32 v5, v33
	v_mov_b32_e32 v6, v33
	v_mov_b32_e32 v7, v33
	v_mov_b32_e32 v0, v33
	v_mov_b32_e32 v1, v33
	v_mov_b32_e32 v2, v33
	v_mov_b32_e32 v3, v33
	v_mov_b32_e32 v28, v33
	v_mov_b32_e32 v29, v33
	v_mov_b32_e32 v30, v33
	v_mov_b32_e32 v31, v33
	v_mov_b32_e32 v24, v33
	v_mov_b32_e32 v25, v33
	v_mov_b32_e32 v26, v33
	v_mov_b32_e32 v27, v33
	v_mov_b32_e32 v120, v33
	v_mov_b32_e32 v121, v33
	v_mov_b32_e32 v122, v33
	v_mov_b32_e32 v123, v33
	v_mov_b32_e32 v112, v33
	v_mov_b32_e32 v113, v33
	v_mov_b32_e32 v114, v33
	v_mov_b32_e32 v115, v33
	s_waitcnt lgkmcnt(0)
	s_barrier
.LBB0_1:                                ; =>This Inner Loop Header: Depth=1
	s_add_i32 s0, s3, -1
	s_and_b32 s0, s0, 1
	s_lshl_b32 s0, s0, 14
	v_or_b32_e32 v128, s0, v156
	v_or_b32_e32 v129, s0, v157
	v_or_b32_e32 v130, s0, v154
	v_or_b32_e32 v131, s0, v155
	v_or_b32_e32 v132, s0, v149
	v_or_b32_e32 v133, s0, v150
	v_or_b32_e32 v134, s0, v147
	v_or_b32_e32 v135, s0, v148
	s_bitset1_b32 s0, 15
	ds_read_b128 v[160:163], v128
	ds_read_b128 v[164:167], v129
	v_or_b32_e32 v128, s0, v158
	v_or_b32_e32 v129, s0, v159
	ds_read_b128 v[168:171], v128
	ds_read_b128 v[172:175], v129
	ds_read_b128 v[176:179], v130
	ds_read_b128 v[184:187], v131
	s_waitcnt lgkmcnt(3)
	v_mfma_f32_16x16x16_bf16 v[180:183], v[164:165], v[168:169], v[124:127]
	ds_read_b128 v[188:191], v132
	ds_read_b128 v[192:195], v133
	s_nop 0
	ds_read_b128 v[126:129], v134
	ds_read_b128 v[130:133], v135
	v_or_b32_e32 v124, s0, v145
	v_or_b32_e32 v125, s0, v146
	ds_read_b128 v[196:199], v124
	ds_read_b128 v[134:137], v125
	v_mfma_f32_16x16x16_bf16 v[32:35], v[160:161], v[168:169], v[32:35]
	s_waitcnt lgkmcnt(7)
	v_mfma_f32_16x16x16_bf16 v[116:119], v[176:177], v[168:169], v[116:119]
	s_waitcnt lgkmcnt(6)
	v_mfma_f32_16x16x16_bf16 v[108:111], v[184:185], v[168:169], v[108:111]
	s_waitcnt lgkmcnt(5)
	v_mfma_f32_16x16x16_bf16 v[104:107], v[188:189], v[168:169], v[104:107]
	s_waitcnt lgkmcnt(4)
	v_mfma_f32_16x16x16_bf16 v[100:103], v[192:193], v[168:169], v[100:103]
	s_waitcnt lgkmcnt(3)
	v_mfma_f32_16x16x16_bf16 v[96:99], v[126:127], v[168:169], v[96:99]
	s_waitcnt lgkmcnt(2)
	v_mfma_f32_16x16x16_bf16 v[92:95], v[130:131], v[168:169], v[92:95]
	v_mfma_f32_16x16x16_bf16 v[88:91], v[160:161], v[172:173], v[88:91]
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_16x16x16_bf16 v[56:59], v[160:161], v[196:197], v[56:59]
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[12:15], v[160:161], v[134:135], v[12:15]
	v_mfma_f32_16x16x16_bf16 v[80:83], v[130:131], v[172:173], v[80:83]
	v_mfma_f32_16x16x16_bf16 v[16:19], v[130:131], v[196:197], v[16:19]
	v_mfma_f32_16x16x16_bf16 v[112:115], v[130:131], v[134:135], v[112:115]
	v_lshl_add_u64 v[130:131], v[138:139], 0, s[4:5]
	v_mfma_f32_16x16x16_bf16 v[60:63], v[164:165], v[172:173], v[60:63]
	v_mfma_f32_16x16x16_bf16 v[64:67], v[176:177], v[172:173], v[64:67]
	v_mfma_f32_16x16x16_bf16 v[68:71], v[184:185], v[172:173], v[68:71]
	v_mfma_f32_16x16x16_bf16 v[72:75], v[188:189], v[172:173], v[72:75]
	v_mfma_f32_16x16x16_bf16 v[76:79], v[192:193], v[172:173], v[76:79]
	v_mfma_f32_16x16x16_bf16 v[84:87], v[126:127], v[172:173], v[84:87]
	v_mfma_f32_16x16x16_bf16 v[36:39], v[164:165], v[196:197], v[36:39]
	v_mfma_f32_16x16x16_bf16 v[20:23], v[126:127], v[196:197], v[20:23]
	v_mfma_f32_16x16x16_bf16 v[8:11], v[164:165], v[134:135], v[8:11]
	v_mfma_f32_16x16x16_bf16 v[120:123], v[126:127], v[134:135], v[120:123]
	v_mfma_f32_16x16x16_bf16 v[32:35], v[162:163], v[170:171], v[32:35]
	v_mfma_f32_16x16x16_bf16 v[124:127], v[166:167], v[170:171], v[180:183]
	v_mfma_f32_16x16x16_bf16 v[116:119], v[178:179], v[170:171], v[116:119]
	v_mfma_f32_16x16x16_bf16 v[108:111], v[186:187], v[170:171], v[108:111]
	v_mfma_f32_16x16x16_bf16 v[104:107], v[190:191], v[170:171], v[104:107]
	v_mfma_f32_16x16x16_bf16 v[100:103], v[194:195], v[170:171], v[100:103]
	v_mfma_f32_16x16x16_bf16 v[96:99], v[128:129], v[170:171], v[96:99]
	v_mfma_f32_16x16x16_bf16 v[92:95], v[132:133], v[170:171], v[92:95]
	global_load_dwordx4 v[168:171], v[130:131], off offset:64
	v_add_co_u32_e64 v130, s[0:1], s11, v130
	v_mfma_f32_16x16x16_bf16 v[4:7], v[176:177], v[134:135], v[4:7]
	s_nop 0
	v_addc_co_u32_e64 v131, s[0:1], 0, v131, s[0:1]
	v_mfma_f32_16x16x16_bf16 v[0:3], v[184:185], v[134:135], v[0:3]
	v_mfma_f32_16x16x16_bf16 v[28:31], v[188:189], v[134:135], v[28:31]
	v_mfma_f32_16x16x16_bf16 v[24:27], v[192:193], v[134:135], v[24:27]
	v_lshl_add_u64 v[134:135], v[140:141], 0, s[4:5]
	v_mfma_f32_16x16x16_bf16 v[88:91], v[162:163], v[174:175], v[88:91]
	v_mfma_f32_16x16x16_bf16 v[56:59], v[162:163], v[198:199], v[56:59]
	v_mfma_f32_16x16x16_bf16 v[12:15], v[162:163], v[136:137], v[12:15]
	global_load_dwordx4 v[160:163], v[134:135], off offset:64
	v_add_co_u32_e64 v134, s[0:1], s11, v134
	v_mfma_f32_16x16x16_bf16 v[60:63], v[166:167], v[174:175], v[60:63]
	s_nop 0
	v_addc_co_u32_e64 v135, s[0:1], 0, v135, s[0:1]
	s_lshl_b32 s0, s3, 14
	v_mfma_f32_16x16x16_bf16 v[64:67], v[178:179], v[174:175], v[64:67]
	s_and_b32 s0, s0, 0x4000
	v_mfma_f32_16x16x16_bf16 v[68:71], v[186:187], v[174:175], v[68:71]
	v_mfma_f32_16x16x16_bf16 v[72:75], v[190:191], v[174:175], v[72:75]
	v_mfma_f32_16x16x16_bf16 v[76:79], v[194:195], v[174:175], v[76:79]
	v_mfma_f32_16x16x16_bf16 v[84:87], v[128:129], v[174:175], v[84:87]
	v_mfma_f32_16x16x16_bf16 v[80:83], v[132:133], v[174:175], v[80:83]
	global_load_dwordx4 v[172:175], v[134:135], off offset:64
	s_waitcnt vmcnt(1)
	ds_bpermute_b32 v134, v151, v160
	v_mfma_f32_16x16x16_bf16 v[36:39], v[166:167], v[198:199], v[36:39]
	ds_bpermute_b32 v135, v151, v161
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v134, v162, v134, vcc
	v_mfma_f32_16x16x16_bf16 v[8:11], v[166:167], v[136:137], v[8:11]
	global_load_dwordx4 v[164:167], v[130:131], off offset:64
	ds_bpermute_b32 v130, v151, v168
	ds_bpermute_b32 v131, v151, v169
	v_mfma_f32_16x16x16_bf16 v[40:43], v[176:177], v[196:197], v[40:43]
	v_or_b32_e32 v176, s0, v152
	v_or_b32_e32 v177, s0, v153
	s_bitset1_b32 s0, 15
	v_mfma_f32_16x16x16_bf16 v[44:47], v[184:185], v[196:197], v[44:47]
	s_add_u32 s4, s4, 64
	s_addc_u32 s5, s5, 0
	s_add_i32 s3, s3, 1
	v_mfma_f32_16x16x16_bf16 v[48:51], v[188:189], v[196:197], v[48:51]
	s_cmpk_lg_i32 s4, 0x3fc0
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v130, v170, v130, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v131, v171, v131, vcc
	v_mfma_f32_16x16x16_bf16 v[52:55], v[192:193], v[196:197], v[52:55]
	v_cndmask_b32_e32 v135, v163, v135, vcc
	s_waitcnt vmcnt(1)
	ds_bpermute_b32 v182, v151, v172
	v_mfma_f32_16x16x16_bf16 v[20:23], v[128:129], v[198:199], v[20:23]
	ds_bpermute_b32 v183, v151, v173
	ds_bpermute_b32 v184, v151, v174
	ds_bpermute_b32 v185, v151, v175
	v_mfma_f32_16x16x16_bf16 v[120:123], v[128:129], v[136:137], v[120:123]
	ds_bpermute_b32 v128, v151, v170
	ds_bpermute_b32 v129, v151, v171
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v128, v128, v168, vcc
	v_mfma_f32_16x16x16_bf16 v[16:19], v[132:133], v[198:199], v[16:19]
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v129, v129, v169, vcc
	s_waitcnt vmcnt(0)
	ds_bpermute_b32 v180, v151, v166
	v_mfma_f32_16x16x16_bf16 v[4:7], v[178:179], v[136:137], v[4:7]
	ds_bpermute_b32 v181, v151, v167
	v_mfma_f32_16x16x16_bf16 v[0:3], v[186:187], v[136:137], v[0:3]
	v_mfma_f32_16x16x16_bf16 v[28:31], v[190:191], v[136:137], v[28:31]
	v_mfma_f32_16x16x16_bf16 v[24:27], v[194:195], v[136:137], v[24:27]
	v_mfma_f32_16x16x16_bf16 v[112:115], v[132:133], v[136:137], v[112:115]
	ds_bpermute_b32 v132, v151, v162
	ds_bpermute_b32 v133, v151, v163
	ds_bpermute_b32 v136, v151, v164
	ds_bpermute_b32 v137, v151, v165
	v_mfma_f32_16x16x16_bf16 v[40:43], v[178:179], v[198:199], v[40:43]
	v_or_b32_e32 v178, s0, v152
	v_or_b32_e32 v179, s0, v153
	s_waitcnt lgkmcnt(3)
	v_cndmask_b32_e32 v132, v132, v160, vcc
	v_mfma_f32_16x16x16_bf16 v[44:47], v[186:187], v[198:199], v[44:47]
	s_waitcnt lgkmcnt(2)
	v_cndmask_b32_e32 v133, v133, v161, vcc
	v_cndmask_b32_e32 v160, v180, v164, vcc
	v_cndmask_b32_e32 v161, v181, v165, vcc
	v_mfma_f32_16x16x16_bf16 v[48:51], v[190:191], v[198:199], v[48:51]
	s_waitcnt lgkmcnt(1)
	v_cndmask_b32_e32 v162, v166, v136, vcc
	s_waitcnt lgkmcnt(0)
	v_cndmask_b32_e32 v163, v167, v137, vcc
	v_cndmask_b32_e32 v164, v184, v172, vcc
	v_mfma_f32_16x16x16_bf16 v[52:55], v[194:195], v[198:199], v[52:55]
	v_cndmask_b32_e32 v165, v185, v173, vcc
	v_cndmask_b32_e32 v166, v174, v182, vcc
	v_cndmask_b32_e32 v167, v175, v183, vcc
	ds_write_b128 v176, v[128:131]
	ds_write_b128 v178, v[132:135]
	ds_write_b128 v177, v[160:163]
	ds_write_b128 v179, v[164:167]
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_cbranch_scc1 .LBB0_1
; %bb.2:
	ds_read_b128 v[128:131], v156 offset:16384
	ds_read_b128 v[132:135], v157 offset:16384
	ds_read_b128 v[136:139], v158 offset:49152
	ds_read_b128 v[156:159], v159 offset:49152
	ds_read_b128 v[160:163], v154 offset:16384
	ds_read_b128 v[152:155], v155 offset:16384
	ds_read_b128 v[164:167], v149 offset:16384
	ds_read_b128 v[168:171], v150 offset:16384
	ds_read_b128 v[172:175], v147 offset:16384
	ds_read_b128 v[148:151], v148 offset:16384
	s_waitcnt lgkmcnt(7)
	v_mfma_f32_16x16x16_bf16 v[32:35], v[128:129], v[136:137], v[32:35]
	s_add_i32 s0, s10, s2
	s_ashr_i32 s1, s0, 31
	v_lshlrev_b32_e32 v140, 13, v143
	v_mfma_f32_16x16x16_bf16 v[124:127], v[132:133], v[136:137], v[124:127]
	v_and_b32_e32 v141, 12, v142
	s_lshl_b64 s[0:1], s[0:1], 2
	v_or3_b32 v140, v141, v140, v144
	s_waitcnt lgkmcnt(5)
	v_mfma_f32_16x16x16_bf16 v[116:119], v[160:161], v[136:137], v[116:119]
	s_add_u32 s0, s8, s0
	s_addc_u32 s1, s9, s1
	s_mov_b32 s2, 0x80000
	s_waitcnt lgkmcnt(4)
	v_mfma_f32_16x16x16_bf16 v[108:111], v[152:153], v[136:137], v[108:111]
	s_waitcnt lgkmcnt(3)
	v_mfma_f32_16x16x16_bf16 v[104:107], v[164:165], v[136:137], v[104:107]
	s_waitcnt lgkmcnt(2)
	v_mfma_f32_16x16x16_bf16 v[100:103], v[168:169], v[136:137], v[100:103]
	s_waitcnt lgkmcnt(1)
	v_mfma_f32_16x16x16_bf16 v[96:99], v[172:173], v[136:137], v[96:99]
	s_waitcnt lgkmcnt(0)
	v_mfma_f32_16x16x16_bf16 v[92:95], v[148:149], v[136:137], v[92:95]
	v_mfma_f32_16x16x16_bf16 v[88:91], v[128:129], v[156:157], v[88:91]
	v_mfma_f32_16x16x16_bf16 v[60:63], v[132:133], v[156:157], v[60:63]
	v_mfma_f32_16x16x16_bf16 v[64:67], v[160:161], v[156:157], v[64:67]
	v_mfma_f32_16x16x16_bf16 v[68:71], v[152:153], v[156:157], v[68:71]
	v_mfma_f32_16x16x16_bf16 v[72:75], v[164:165], v[156:157], v[72:75]
	v_mfma_f32_16x16x16_bf16 v[76:79], v[168:169], v[156:157], v[76:79]
	v_mfma_f32_16x16x16_bf16 v[84:87], v[172:173], v[156:157], v[84:87]
	v_mfma_f32_16x16x16_bf16 v[80:83], v[148:149], v[156:157], v[80:83]
	v_mfma_f32_16x16x16_bf16 v[32:35], v[130:131], v[138:139], v[32:35]
	v_mfma_f32_16x16x16_bf16 v[124:127], v[134:135], v[138:139], v[124:127]
	v_mfma_f32_16x16x16_bf16 v[116:119], v[162:163], v[138:139], v[116:119]
	v_mfma_f32_16x16x16_bf16 v[108:111], v[154:155], v[138:139], v[108:111]
	v_mfma_f32_16x16x16_bf16 v[104:107], v[166:167], v[138:139], v[104:107]
	v_mfma_f32_16x16x16_bf16 v[100:103], v[170:171], v[138:139], v[100:103]
	v_mfma_f32_16x16x16_bf16 v[96:99], v[174:175], v[138:139], v[96:99]
	v_mfma_f32_16x16x16_bf16 v[92:95], v[150:151], v[138:139], v[92:95]
	v_mfma_f32_16x16x16_bf16 v[88:91], v[130:131], v[158:159], v[88:91]
	v_mfma_f32_16x16x16_bf16 v[60:63], v[134:135], v[158:159], v[60:63]
	v_mfma_f32_16x16x16_bf16 v[64:67], v[162:163], v[158:159], v[64:67]
	v_mfma_f32_16x16x16_bf16 v[68:71], v[154:155], v[158:159], v[68:71]
	v_mfma_f32_16x16x16_bf16 v[72:75], v[166:167], v[158:159], v[72:75]
	v_mfma_f32_16x16x16_bf16 v[76:79], v[170:171], v[158:159], v[76:79]
	v_mfma_f32_16x16x16_bf16 v[84:87], v[174:175], v[158:159], v[84:87]
	v_mfma_f32_16x16x16_bf16 v[80:83], v[150:151], v[158:159], v[80:83]
	ds_read_b128 v[136:139], v145 offset:49152
	ds_read_b128 v[156:159], v146 offset:49152
	s_waitcnt lgkmcnt(0)
	s_barrier
	v_mfma_f32_16x16x16_bf16 v[56:59], v[128:129], v[136:137], v[56:59]
	v_mfma_f32_16x16x16_bf16 v[36:39], v[132:133], v[136:137], v[36:39]
	v_mfma_f32_16x16x16_bf16 v[40:43], v[160:161], v[136:137], v[40:43]
	v_mfma_f32_16x16x16_bf16 v[44:47], v[152:153], v[136:137], v[44:47]
	v_mfma_f32_16x16x16_bf16 v[48:51], v[164:165], v[136:137], v[48:51]
	v_mfma_f32_16x16x16_bf16 v[52:55], v[168:169], v[136:137], v[52:55]
	v_mfma_f32_16x16x16_bf16 v[20:23], v[172:173], v[136:137], v[20:23]
	v_mfma_f32_16x16x16_bf16 v[16:19], v[148:149], v[136:137], v[16:19]
	v_lshlrev_b32_e32 v136, 2, v140
	v_mov_b32_e32 v137, 0
	global_store_dwordx4 v136, v[32:35], s[0:1]
	global_store_dwordx4 v136, v[124:127], s[0:1] offset:64
	v_mfma_f32_16x16x16_bf16 v[12:15], v[128:129], v[156:157], v[12:15]
	v_or_b32_e32 v32, 0x80000, v136
	global_store_dwordx4 v136, v[116:119], s[0:1] offset:128
	global_store_dwordx4 v136, v[108:111], s[0:1] offset:192
	global_store_dwordx4 v136, v[104:107], s[0:1] offset:256
	global_store_dwordx4 v136, v[100:103], s[0:1] offset:320
	global_store_dwordx4 v136, v[96:99], s[0:1] offset:384
	global_store_dwordx4 v136, v[92:95], s[0:1] offset:448
	v_mfma_f32_16x16x16_bf16 v[56:59], v[130:131], v[138:139], v[56:59]
	global_store_dwordx4 v32, v[88:91], s[0:1]
	v_mfma_f32_16x16x16_bf16 v[36:39], v[134:135], v[138:139], v[36:39]
	v_mfma_f32_16x16x16_bf16 v[40:43], v[162:163], v[138:139], v[40:43]
	v_mfma_f32_16x16x16_bf16 v[44:47], v[154:155], v[138:139], v[44:47]
	v_mfma_f32_16x16x16_bf16 v[48:51], v[166:167], v[138:139], v[48:51]
	v_mfma_f32_16x16x16_bf16 v[52:55], v[170:171], v[138:139], v[52:55]
	v_mfma_f32_16x16x16_bf16 v[20:23], v[174:175], v[138:139], v[20:23]
	v_mfma_f32_16x16x16_bf16 v[16:19], v[150:151], v[138:139], v[16:19]
	v_lshl_add_u64 v[138:139], s[0:1], 0, v[136:137]
	v_add_co_u32_e32 v32, vcc, s2, v138
	v_mfma_f32_16x16x16_bf16 v[8:11], v[132:133], v[156:157], v[8:11]
	s_nop 0
	v_addc_co_u32_e32 v33, vcc, 0, v139, vcc
	global_store_dwordx4 v[32:33], v[60:63], off offset:64
	global_store_dwordx4 v[32:33], v[64:67], off offset:128
	global_store_dwordx4 v[32:33], v[68:71], off offset:192
	v_mfma_f32_16x16x16_bf16 v[4:7], v[160:161], v[156:157], v[4:7]
	global_store_dwordx4 v[32:33], v[72:75], off offset:256
	global_store_dwordx4 v[32:33], v[76:79], off offset:320
	global_store_dwordx4 v[32:33], v[84:87], off offset:384
	global_store_dwordx4 v[32:33], v[80:83], off offset:448
	s_mov_b32 s2, 0x100000
	v_mfma_f32_16x16x16_bf16 v[12:15], v[130:131], v[158:159], v[12:15]
	v_or_b32_e32 v32, 0x100000, v136
	global_store_dwordx4 v32, v[56:59], s[0:1]
	v_add_co_u32_e32 v32, vcc, s2, v138
	v_mfma_f32_16x16x16_bf16 v[0:3], v[152:153], v[156:157], v[0:3]
	s_nop 0
	v_addc_co_u32_e32 v33, vcc, 0, v139, vcc
	global_store_dwordx4 v[32:33], v[36:39], off offset:64
	global_store_dwordx4 v[32:33], v[40:43], off offset:128
	v_mfma_f32_16x16x16_bf16 v[8:11], v[134:135], v[158:159], v[8:11]
	global_store_dwordx4 v[32:33], v[44:47], off offset:192
	global_store_dwordx4 v[32:33], v[48:51], off offset:256
	global_store_dwordx4 v[32:33], v[52:55], off offset:320
	global_store_dwordx4 v[32:33], v[20:23], off offset:384
	global_store_dwordx4 v[32:33], v[16:19], off offset:448
	v_mfma_f32_16x16x16_bf16 v[4:7], v[162:163], v[158:159], v[4:7]
	v_or_b32_e32 v20, 0x180000, v136
	global_store_dwordx4 v20, v[12:15], s[0:1]
	v_add_co_u32_e32 v20, vcc, 0x180000, v138
	v_mfma_f32_16x16x16_bf16 v[0:3], v[154:155], v[158:159], v[0:3]
	s_nop 0
	v_addc_co_u32_e32 v21, vcc, 0, v139, vcc
	global_store_dwordx4 v[20:21], v[8:11], off offset:64
	global_store_dwordx4 v[20:21], v[4:7], off offset:128
	s_nop 2
	global_store_dwordx4 v[20:21], v[0:3], off offset:192
	v_mfma_f32_16x16x16_bf16 v[28:31], v[164:165], v[156:157], v[28:31]
	s_nop 0
	v_mfma_f32_16x16x16_bf16 v[0:3], v[148:149], v[156:157], v[112:115]
	v_mfma_f32_16x16x16_bf16 v[24:27], v[168:169], v[156:157], v[24:27]
	v_mfma_f32_16x16x16_bf16 v[12:15], v[172:173], v[156:157], v[120:123]
	v_mfma_f32_16x16x16_bf16 v[28:31], v[166:167], v[158:159], v[28:31]
	v_mfma_f32_16x16x16_bf16 v[0:3], v[150:151], v[158:159], v[0:3]
	v_mfma_f32_16x16x16_bf16 v[16:19], v[170:171], v[158:159], v[24:27]
	v_mfma_f32_16x16x16_bf16 v[12:15], v[174:175], v[158:159], v[12:15]
	s_nop 3
	global_store_dwordx4 v[20:21], v[28:31], off offset:256
	s_nop 0
	global_store_dwordx4 v[20:21], v[16:19], off offset:320
	global_store_dwordx4 v[20:21], v[12:15], off offset:384
	global_store_dwordx4 v[20:21], v[0:3], off offset:448
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
		.amdhsa_next_free_vgpr 200
		.amdhsa_next_free_sgpr 96
		.amdhsa_accum_offset 200
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
	.set _Z6matmulPDF16bS_Pf.num_vgpr, 200
	.set _Z6matmulPDF16bS_Pf.num_agpr, 0
	.set _Z6matmulPDF16bS_Pf.numbered_sgpr, 13
	.set _Z6matmulPDF16bS_Pf.private_seg_size, 0
	.set _Z6matmulPDF16bS_Pf.uses_vcc, 1
	.set _Z6matmulPDF16bS_Pf.uses_flat_scratch, 0
	.set _Z6matmulPDF16bS_Pf.has_dyn_sized_stack, 0
	.set _Z6matmulPDF16bS_Pf.has_recursion, 0
	.set _Z6matmulPDF16bS_Pf.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 3520
; TotalNumSgprs: 19
; NumVgprs: 200
; NumAgprs: 0
; TotalNumVgprs: 200
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 65536 bytes/workgroup (compile time only)
; SGPRBlocks: 12
; VGPRBlocks: 24
; NumSGPRsForWavesPerEU: 102
; NumVGPRsForWavesPerEU: 200
; AccumOffset: 200
; Occupancy: 2
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 49
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.section	.AMDGPU.gpr_maximums,"",@progbits
	.set amdgpu.max_num_vgpr, 0
	.set amdgpu.max_num_agpr, 0
	.set amdgpu.max_num_sgpr, 0
	.text
	.type	__hip_cuid_3587aef0593f1fcd,@object ; @__hip_cuid_3587aef0593f1fcd
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_3587aef0593f1fcd
__hip_cuid_3587aef0593f1fcd:
	.byte	0                               ; 0x0
	.size	__hip_cuid_3587aef0593f1fcd, 1

	.ident	"AMD clang version 20.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-7.0.0 25314 f4087f6b428f0e6f575ebac8a8a724dab123d06e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __hip_cuid_3587aef0593f1fcd
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
    .max_flat_workgroup_size: 512
    .name:           _Z6matmulPDF16bS_Pf
    .private_segment_fixed_size: 0
    .sgpr_count:     19
    .sgpr_spill_count: 0
    .symbol:         _Z6matmulPDF16bS_Pf.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     200
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
	movabsq	$4294967808, %rdx               # imm = 0x100000200
	leaq	512(%rdx), %rdi
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
	movq	__hip_gpubin_handle_3587aef0593f1fcd(%rip), %rdi
	testq	%rdi, %rdi
	jne	.LBB2_2
# %bb.1:
	movl	$__hip_fatbin_wrapper, %edi
	callq	__hipRegisterFatBinary
	movq	%rax, %rdi
	movq	%rax, __hip_gpubin_handle_3587aef0593f1fcd(%rip)
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
	movq	__hip_gpubin_handle_3587aef0593f1fcd(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB3_2
# %bb.1:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__hipUnregisterFatBinary
	movq	$0, __hip_gpubin_handle_3587aef0593f1fcd(%rip)
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
	.quad	__hip_fatbin_3587aef0593f1fcd
	.quad	0
	.size	__hip_fatbin_wrapper, 24

	.type	__hip_gpubin_handle_3587aef0593f1fcd,@object # @__hip_gpubin_handle_3587aef0593f1fcd
	.local	__hip_gpubin_handle_3587aef0593f1fcd
	.comm	__hip_gpubin_handle_3587aef0593f1fcd,8,8
	.section	.init_array,"aw",@init_array
	.p2align	3, 0x0
	.quad	__hip_module_ctor
	.type	__hip_cuid_3587aef0593f1fcd,@object # @__hip_cuid_3587aef0593f1fcd
	.bss
	.globl	__hip_cuid_3587aef0593f1fcd
__hip_cuid_3587aef0593f1fcd:
	.byte	0                               # 0x0
	.size	__hip_cuid_3587aef0593f1fcd, 1

	.ident	"AMD clang version 20.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-7.0.0 25314 f4087f6b428f0e6f575ebac8a8a724dab123d06e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z21__device_stub__matmulPDF16bS_Pf
	.addrsig_sym __hip_module_ctor
	.addrsig_sym __hip_module_dtor
	.addrsig_sym _Z6matmulPDF16bS_Pf
	.addrsig_sym __hip_fatbin_3587aef0593f1fcd
	.addrsig_sym __hip_fatbin_wrapper
	.addrsig_sym __hip_cuid_3587aef0593f1fcd

# __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu-
