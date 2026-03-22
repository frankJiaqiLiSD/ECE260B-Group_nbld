#!/bin/bash
# Gate-level simulation of sfp_row synthesis netlist (pre-PnR verification)
# Run from: syn_sfp_row/

PDK_VERILOG="/home/linux/ieng6/ECE260B_WI26_A00/public/PDKdata/verilog/tcbn65gplus.v"
SYN_NETLIST="sfp_row.out.v"
TESTBENCH="sfp_row_syn_tb.v"

echo "=== Running synthesis gate-level simulation ==="
xrun \
  +v2k \
  -timescale 1ns/1ps \
  -access +rwc \
  +notimingchecks \
  ${PDK_VERILOG} \
  ${SYN_NETLIST} \
  ${TESTBENCH} \
  -top sfp_row_syn_tb \
  -l run_syn_gate.log

echo "=== Done. Check run_syn_gate.log for results ==="
grep -E "PASS|FAIL|WARN|ERROR|ALL TESTS" run_syn_gate.log
