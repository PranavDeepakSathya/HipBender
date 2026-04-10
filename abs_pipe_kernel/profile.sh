#!/bin/bash
hipcc --offload-arch=gfx942 -O3 -c matmul.hip -o matmul.o 2>/dev/null
hipcc --offload-arch=gfx942 -O3 -c bench.hip -o bench.o 2>/dev/null
hipcc --offload-arch=gfx942 -O3 bench.o matmul.o -o bench 2>/dev/null

cat > /tmp/c1.txt << 'EOF'
pmc: SQ_LDS_BANK_CONFLICT SQ_LDS_ADDR_CONFLICT SQ_INSTS_LDS SQ_WAVES SQ_INSTS_MFMA SQ_VALU_MFMA_BUSY_CYCLES SQ_WAVE_CYCLES SQ_WAIT_INST_ANY
range: 3 8
EOF

cat > /tmp/c2.txt << 'EOF'
pmc: SQ_ACTIVE_INST_VMEM SQ_ACTIVE_INST_LDS SQ_ACTIVE_INST_VALU SQ_ACTIVE_INST_SCA SQ_INST_CYCLES_VMEM_RD SQ_INST_CYCLES_VMEM_WR SQ_INST_CYCLES_SMEM SQ_BUSY_CYCLES
range: 3 8
EOF

rocprof --timestamp on -i /tmp/c1.txt -o /tmp/prof1.csv ./bench 2>/dev/null 1>/dev/null
rocprof --timestamp on -i /tmp/c2.txt -o /tmp/prof2.csv ./bench 2>/dev/null 1>/dev/null

python3 -c "
import csv

def read(path):
    with open(path) as f:
        for row in csv.DictReader(f):
            if 'matmul' in row['KernelName']: return row
    return {}

r1=read('/tmp/prof1.csv'); r2=read('/tmp/prof2.csv')

def g(k): return int(r1.get(k, r2.get(k, 0)))

w=g('SQ_WAVES'); wc=g('SQ_WAVE_CYCLES')
dur=(int(r1['EndNs'])-int(r1['BeginNs']))/1e6
tflops=2*8192**3/(dur/1e3)/1e12
bc=g('SQ_LDS_BANK_CONFLICT'); ac=g('SQ_LDS_ADDR_CONFLICT')
lds=g('SQ_INSTS_LDS'); mfma=g('SQ_INSTS_MFMA')
mfma_cy=g('SQ_VALU_MFMA_BUSY_CYCLES')
wait=g('SQ_WAIT_INST_ANY')
act_vmem=g('SQ_ACTIVE_INST_VMEM'); act_lds=g('SQ_ACTIVE_INST_LDS')
act_valu=g('SQ_ACTIVE_INST_VALU'); act_sca=g('SQ_ACTIVE_INST_SCA')
vmem_rd=g('SQ_INST_CYCLES_VMEM_RD'); vmem_wr=g('SQ_INST_CYCLES_VMEM_WR')
smem=g('SQ_INST_CYCLES_SMEM'); busy=g('SQ_BUSY_CYCLES')

print(f'''
╔══════════════════════════════════════════════╗
║          MATMUL PROFILE REPORT               ║
╠══════════════════════════════════════════════╣
║  Duration            {dur:>10.3f} ms             ║
║  TFLOPS              {tflops:>10.1f}                ║
╠══════════════════════════════════════════════╣
║  LDS HEALTH                                  ║
║  Bank conflicts      {bc:>14,}        ║
║  Addr conflicts      {ac:>14,}        ║
║  LDS instructions    {lds:>14,}        ║
║  Conflicts/wave      {bc//w if w else 0:>14,}        ║
║  Conflicts/LDS op    {bc/lds if lds else 0:>14.1f}        ║
╠══════════════════════════════════════════════╣
║  COMPUTE                                     ║
║  MFMA instructions   {mfma:>14,}        ║
║  MFMA busy cycles    {mfma_cy:>14,}        ║
║  Wave cycles         {wc:>14,}        ║
║  MFMA utilization    {mfma_cy/wc*100 if wc else 0:>13.1f}%        ║
╠══════════════════════════════════════════════╣
║  STALL BREAKDOWN                             ║
║  Wait any cycles     {wait:>14,}        ║
║  Active VMEM cy      {act_vmem:>14,}        ║
║  Active LDS cy       {act_lds:>14,}        ║
║  Active VALU cy      {act_valu:>14,}        ║
║  Active SCALAR cy    {act_sca:>14,}        ║
╠══════════════════════════════════════════════╣
║  MEMORY STALLS                               ║
║  VMEM read stall     {vmem_rd:>14,}        ║
║  VMEM write stall    {vmem_wr:>14,}        ║
║  SMEM stall          {smem:>14,}        ║
╚══════════════════════════════════════════════╝''')
"
