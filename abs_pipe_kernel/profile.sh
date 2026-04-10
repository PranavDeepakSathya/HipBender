#!/bin/bash
hipcc --offload-arch=gfx942 -O3 -c matmul.hip -o matmul.o 2>/dev/null
hipcc --offload-arch=gfx942 -O3 -c bench.hip -o bench.o 2>/dev/null
hipcc --offload-arch=gfx942 -O3 bench.o matmul.o -o bench 2>/dev/null

# Re-profile with omniperf (collects everything including cache)
rm -rf workloads/matmul_mi300
omniperf profile -n matmul_mi300 -- ./bench 2>/dev/null 1>/dev/null

# Also collect stall counters via rocprof (omniperf has them but CLI is broken)
cat > /tmp/c1.txt << 'EOF'
pmc: SQ_LDS_BANK_CONFLICT SQ_LDS_ADDR_CONFLICT SQ_INSTS_LDS SQ_WAVES SQ_INSTS_MFMA SQ_VALU_MFMA_BUSY_CYCLES SQ_WAVE_CYCLES SQ_WAIT_INST_ANY
range: 3 8
EOF
cat > /tmp/c2.txt << 'EOF'
pmc: SQ_ACTIVE_INST_VMEM SQ_ACTIVE_INST_LDS SQ_ACTIVE_INST_VALU SQ_ACTIVE_INST_SCA SQ_INST_CYCLES_VMEM_RD SQ_INST_CYCLES_VMEM_WR SQ_INST_CYCLES_SMEM SQ_BUSY_CYCLES
range: 3 8
EOF
cat > /tmp/c3.txt << 'EOF'
pmc: SQ_LEVEL_WAVES SQ_CYCLES SQ_BUSY_CU_CYCLES SQ_INSTS_VMEM_WR SQ_INSTS_VMEM_RD SQ_INSTS_SALU SQ_INSTS_VALU SQ_INSTS
range: 3 8
EOF
cat > /tmp/c4.txt << 'EOF'
pmc: SQ_WAVES_EQ_64 SQ_WAVES_LT_64 SQ_ACTIVE_INST_ANY SQ_THREAD_CYCLES_VALU SQ_INSTS_VALU_MFMA_BF16 SQ_INSTS_VALU_MFMA_F16 SQ_INSTS_VALU_MFMA_MOPS_BF16 SQ_INSTS_VALU_MFMA_MOPS_F16
range: 3 8
EOF

for i in 1 2 3 4; do
  rocprof --timestamp on -i /tmp/c${i}.txt -o /tmp/prof${i}.csv ./bench 2>/dev/null 1>/dev/null
done

python3 << 'PYEOF'
import csv, glob

# Read omniperf pmc_perf.csv (has all the _sum cache counters)
omni = {}
pmc = "workloads/matmul_mi300/MI300/pmc_perf.csv"
try:
    with open(pmc) as f:
        for row in csv.DictReader(f):
            if 'matmul' in row.get('KernelName',''):
                omni = dict(row)
                break
except: pass

# Read rocprof passes
rp = {}
for i in range(1,5):
    try:
        with open(f'/tmp/prof{i}.csv') as f:
            for row in csv.DictReader(f):
                if 'matmul' in row.get('KernelName',''):
                    rp.update(row)
                    break
    except: pass

def g(k):
    v = rp.get(k, omni.get(k, '0'))
    try: return int(float(v))
    except: return 0

w=g('SQ_WAVES'); wc=g('SQ_WAVE_CYCLES'); cyc=g('SQ_CYCLES')
dur=(int(rp.get('EndNs',0))-int(rp.get('BeginNs',0)))/1e6
tflops=2*8192**3/(dur/1e3)/1e12 if dur>0 else 0

bc=g('SQ_LDS_BANK_CONFLICT'); ac=g('SQ_LDS_ADDR_CONFLICT')
lds=g('SQ_INSTS_LDS'); mfma=g('SQ_INSTS_MFMA')
mfma_cy=g('SQ_VALU_MFMA_BUSY_CYCLES')

wait=g('SQ_WAIT_INST_ANY'); act_any=g('SQ_ACTIVE_INST_ANY')
act_vmem=g('SQ_ACTIVE_INST_VMEM'); act_lds=g('SQ_ACTIVE_INST_LDS')
act_valu=g('SQ_ACTIVE_INST_VALU'); act_sca=g('SQ_ACTIVE_INST_SCA')

vmem_rd=g('SQ_INST_CYCLES_VMEM_RD'); vmem_wr=g('SQ_INST_CYCLES_VMEM_WR')
smem=g('SQ_INST_CYCLES_SMEM')

insts=g('SQ_INSTS'); i_valu=g('SQ_INSTS_VALU'); i_salu=g('SQ_INSTS_SALU')
i_vmem_rd=g('SQ_INSTS_VMEM_RD'); i_vmem_wr=g('SQ_INSTS_VMEM_WR')

lvl=g('SQ_LEVEL_WAVES'); occ=lvl/cyc if cyc else 0

arch_vgpr=g('arch_vgpr'); accum_vgpr=g('accum_vgpr')
sgpr_v=g('sgpr'); lds_alloc=g('lds')

w64=g('SQ_WAVES_EQ_64'); wlt64=g('SQ_WAVES_LT_64')

mfma_bf16=g('SQ_INSTS_VALU_MFMA_BF16'); mfma_f16=g('SQ_INSTS_VALU_MFMA_F16')
mfma_mops_bf16=g('SQ_INSTS_VALU_MFMA_MOPS_BF16'); mfma_mops_f16=g('SQ_INSTS_VALU_MFMA_MOPS_F16')


# =========================
# CACHE / MEMORY (FIXED)
# =========================

# ---- L1 / TCP ----
tcp_rd = g('TCP_TCC_READ_REQ_sum')
tcp_wr = g('TCP_TCC_WRITE_REQ_sum')
tcp_acc = tcp_rd + tcp_wr

tcp_pend = g('TCP_PENDING_STALL_CYCLES_sum')
tcp_cache_acc = g('TCP_TOTAL_CACHE_ACCESSES_sum')  # may be 0 on MI300
tcp_rd_tag = g('TCP_READ_TAGCONFLICT_STALL_CYCLES_sum')
tcp_wr_tag = g('TCP_WRITE_TAGCONFLICT_STALL_CYCLES_sum')

# ---- L2 / TCC ----
tcc_hit = g('TCC_HIT_sum')
tcc_miss = g('TCC_MISS_sum')
tcc_rd = g('TCC_READ_sum')
tcc_wr = g('TCC_WRITE_sum')
tcc_req = g('TCC_REQ_sum')

tcc_busy = g('TCC_BUSY_sum')
tcc_tag_stall = g('TCC_TAG_STALL_sum')
tcc_bubble = g('TCC_BUBBLE_sum')

tcc_writeback = g('TCC_WRITEBACK_sum')
tcc_wr_stall = g('TCC_EA0_WRREQ_STALL_sum')
tcc_too_many_wr = g('TCC_TOO_MANY_EA_WRREQS_STALL_sum')

# ---- DRAM / HBM (CRITICAL) ----
hbm_rd_req = g('TCC_EA0_RDREQ_DRAM_sum')
hbm_wr_req = g('TCC_EA0_WRREQ_DRAM_sum')

# transaction breakdown
hbm_rd_32b = g('TCC_EA0_RDREQ_32B_sum')
hbm_wr_64b = g('TCC_EA0_WRREQ_64B_sum')

# =========================
# DERIVED METRICS
# =========================

# hit rates
tcc_total = tcc_hit + tcc_miss
l2_hr = tcc_hit / tcc_total * 100 if tcc_total else 0

tlb_hit = g('TCP_UTCL1_TRANSLATION_HIT_sum')
tlb_miss = g('TCP_UTCL1_TRANSLATION_MISS_sum')
tlb_total = tlb_hit + tlb_miss
tlb_hr = tlb_hit / tlb_total * 100 if tlb_total else 0

# ---- BYTES (what you asked for) ----
# assume 64B transactions unless finer granularity is used

hbm_rd_bytes = hbm_rd_req * 64
hbm_wr_bytes = hbm_wr_req * 64

l2_rd_bytes = tcc_rd * 64
l2_wr_bytes = tcc_wr * 64

l1_rd_bytes = tcp_rd * 64
l1_wr_bytes = tcp_wr * 64

# ---- BANDWIDTH ----
hbm_rd_bw = hbm_rd_bytes / (dur/1e3) / 1e9 if dur>0 else 0
hbm_wr_bw = hbm_wr_bytes / (dur/1e3) / 1e9 if dur>0 else 0

tcp_tcc_rd = tcp_rd
tcp_tcc_wr = tcp_wr
hbm_rd = hbm_rd_req
hbm_wr = hbm_wr_req
hbm_rd_dram = hbm_rd_req
hbm_wr_dram = hbm_wr_req

# ---- pipeline slack ----
idle_cy = wc - mfma_cy - act_valu - act_lds - act_sca - wait if wc else 0

print(f'''
╔═══════════════════════════════════════════════════════════╗
║               MATMUL FULL PROFILE REPORT                  ║
╠═══════════════════════════════════════════════════════════╣
║  TIMING & THROUGHPUT                                      ║
║    Duration                {dur:>10.3f} ms                   ║
║    TFLOPS                  {tflops:>10.1f}                      ║
║    Peak % (1307 TF)        {tflops/1307*100:>9.1f}%                      ║
╠═══════════════════════════════════════════════════════════╣
║  REGISTERS & RESOURCES                                    ║
║    Arch VGPR               {arch_vgpr:>10}                      ║
║    Accum VGPR              {accum_vgpr:>10}                      ║
║    SGPR                    {sgpr_v:>10}                      ║
║    LDS/workgroup           {lds_alloc:>10} bytes                ║
║    Occupancy (waves/CU)    {occ:>10.2f}                      ║
╠═══════════════════════════════════════════════════════════╣
║  WAVE HEALTH                                              ║
║    Total waves             {w:>14,}                ║
║    Full waves (64 lanes)   {w64:>14,}                ║
║    Partial (<64)           {wlt64:>14,}                ║
╠═══════════════════════════════════════════════════════════╣
║  LDS HEALTH                                               ║
║    Bank conflicts          {bc:>14,}                ║
║    Addr conflicts          {ac:>14,}                ║
║    LDS instructions        {lds:>14,}                ║
║    Conflicts/wave          {bc//w if w else 0:>14,}                ║
║    Conflicts/LDS op        {bc/lds if lds else 0:>14.1f}                ║
╠═══════════════════════════════════════════════════════════╣
║  INSTRUCTION MIX                                          ║
║    Total                   {insts:>14,}                ║
║    VALU                    {i_valu:>14,}                ║
║    SALU                    {i_salu:>14,}                ║
║    MFMA total              {mfma:>14,}                ║
║    MFMA bf16               {mfma_bf16:>14,}                ║
║    MFMA f16                {mfma_f16:>14,}                ║
║    VMEM read               {i_vmem_rd:>14,}                ║
║    VMEM write              {i_vmem_wr:>14,}                ║
║    LDS                     {lds:>14,}                ║
╠═══════════════════════════════════════════════════════════╣
║  COMPUTE PIPELINE                                         ║
║    Wave cycles             {wc:>14,}                ║
║    MFMA busy cycles        {mfma_cy:>14,}                ║
║    MFMA utilization        {mfma_cy/wc*100 if wc else 0:>13.1f}%                ║
╠═══════════════════════════════════════════════════════════╣
║  STALL BREAKDOWN (cycles)                                 ║
║    Wait any                {wait:>14,}                ║
║    Active any              {act_any:>14,}                ║
║    Active VMEM             {act_vmem:>14,}                ║
║    Active LDS              {act_lds:>14,}                ║
║    Active VALU             {act_valu:>14,}                ║
║    Active SCALAR           {act_sca:>14,}                ║
║    VMEM read stall         {vmem_rd:>14,}                ║
║    VMEM write stall        {vmem_wr:>14,}                ║
║    SMEM stall              {smem:>14,}                ║
╠═══════════════════════════════════════════════════════════╣
║  L1 VECTOR CACHE (TCP)                                    ║
║    Total accesses          {tcp_acc:>14,}                ║
║    Reads                   {tcp_rd:>14,}                ║
║    Writes                  {tcp_wr:>14,}                ║
║    Cache accesses          {tcp_cache_acc:>14,}                ║
║    Pending stall cy        {tcp_pend:>14,}                ║
║    Read tag conflict cy    {tcp_rd_tag:>14,}                ║
║    Write tag conflict cy   {tcp_wr_tag:>14,}                ║
║    L1->L2 read reqs        {tcp_tcc_rd:>14,}                ║
║    L1->L2 write reqs       {tcp_tcc_wr:>14,}                ║
║    TLB hits                {tlb_hit:>14,}                ║
║    TLB misses              {tlb_miss:>14,}                ║
║    TLB hit rate            {tlb_hr:>13.1f}%                ║
╠═══════════════════════════════════════════════════════════╣
║  L2 CACHE (TCC)                                           ║
║    Requests                {tcc_req:>14,}                ║
║    Hits                    {tcc_hit:>14,}                ║
║    Misses                  {tcc_miss:>14,}                ║
║    Hit rate                {l2_hr:>13.1f}%                ║
║    Reads                   {tcc_rd:>14,}                ║
║    Writes                  {tcc_wr:>14,}                ║
║    Writebacks              {tcc_writeback:>14,}                ║
║    Busy cycles             {tcc_busy:>14,}                ║
║    Tag stall cycles        {tcc_tag_stall:>14,}                ║
║    Bubble cycles           {tcc_bubble:>14,}                ║
║    Write req stall         {tcc_wr_stall:>14,}                ║
║    Too many WR stall       {tcc_too_many_wr:>14,}                ║
╠═══════════════════════════════════════════════════════════╣
║  HBM / DRAM                                               ║
║    Read requests           {hbm_rd:>14,}                ║
║    Write requests          {hbm_wr:>14,}                ║
║    Read reqs (DRAM)        {hbm_rd_dram:>14,}                ║
║    Write reqs (DRAM)       {hbm_wr_dram:>14,}                ║
║    Read 32B reqs           {hbm_rd_32b:>14,}                ║
║    Write 64B reqs          {hbm_wr_64b:>14,}                ║
║    Read BW (est.)          {hbm_rd_bw:>10.1f} GB/s              ║
║    Write BW (est.)         {hbm_wr_bw:>10.1f} GB/s              ║
╚═══════════════════════════════════════════════════════════╝''')
PYEOF
