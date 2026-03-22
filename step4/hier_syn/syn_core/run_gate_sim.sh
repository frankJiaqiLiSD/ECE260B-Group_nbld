#!/bin/bash
# Gate-level simulation of core synthesis netlist
# Run from: syn_core/
#
# Key: -xminitialize 0 initializes ALL storage elements (including UDP states)
# This is the correct Xcelium flag — +xminitReg+0 only affects behavioral reg.

PDK_VERILOG="/home/linux/ieng6/ECE260B_WI26_A00/public/PDKdata/verilog/tcbn65gplus.v"
NETLISTS="../../netlists"

CORE_NETLIST="core.out.v"

# sfp_row as RTL (avoid DUPUNI with core.out.v sub-modules)
SFP_RTL="${NETLISTS}/sfp_row.v"
SFP_DEPS="${NETLISTS}/fifo_mux_2_1.v ${NETLISTS}/fifo_mux_8_1.v ${NETLISTS}/fifo_mux_16_1.v ${NETLISTS}/fifo_depth16.v ${NETLISTS}/ofifo.v"
SRAM_W16="${NETLISTS}/sram_w16.v"
SRAM_2PORTS="${NETLISTS}/sram_2ports.v"

TESTBENCH="core_syn_tb.v"

# Copy test data if not present
[ ! -f qdata.txt ] && cp ../../qdata.txt . 2>/dev/null
[ ! -f kdata.txt ] && cp ../../kdata.txt . 2>/dev/null

echo "=== Running core synthesis gate-level simulation ==="
xrun \
  +v2k \
  +xmtimescale+1ns/1ps \
  +xmoveride_timescale \
  -access +rwc \
  +notimingchecks \
  -xminitialize 0 \
  ${PDK_VERILOG} \
  ${CORE_NETLIST} \
  ${SFP_RTL} \
  ${SFP_DEPS} \
  ${SRAM_W16} \
  ${SRAM_2PORTS} \
  ${TESTBENCH} \
  -top core_syn_tb \
  -l run_core_gate.log

echo "=== Done. Check run_core_gate.log ==="
grep -E "PASS|FAIL|RESULT|SFP|Output|prd" run_core_gate.log | tail -30
