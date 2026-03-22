#!/bin/bash
# ============================================================
# Hierarchical Synthesis Flow for Step 4 (Dual Core)
#
# Run order:
#   Step 1: syn_sram_w16     (SRAM - independent)
#   Step 2: syn_sram_2ports  (SRAM - independent)
#   ---- PnR SRAMs, generate .lib/.lef, convert .lib to .db ----
#   Step 3: syn_core          (Core - needs SRAM .db)
#   ---- PnR Core, generate .lib/.lef, convert .lib to .db ----
#   Step 4: syn_fullchip      (Fullchip - needs Core .db)
#   ---- PnR Fullchip ----
#
# Between each synthesis level, you must:
#   1. Run PnR (Innovus) on the synthesized netlist
#   2. Export timing .lib (WC corner) from Innovus:
#        do_extract_model -lib_name <module>_WC
#   3. Convert .lib to .db using lc_shell:
#        lc_shell> read_lib <module>_WC.lib
#        lc_shell> write_lib <module>_WC -output <module>_WC.db
#   4. Place the .db in the expected path (see run_dc.tcl)
# ============================================================

set -e

HIER_DIR=$(cd "$(dirname "$0")" && pwd)

echo "=========================================================="
echo " Hierarchical Synthesis Flow - Step 4"
echo " Started at $(date)"
echo "=========================================================="

# ---- Level 1: SRAMs (can run in parallel) ----
echo ""
echo ">>> [Level 1] Synthesizing sram_w16..."
cd "$HIER_DIR/syn_sram_w16"
dc_shell -f run_dc.tcl | tee log_syn_terminal.log
echo ">>> sram_w16 synthesis done."

echo ""
echo ">>> [Level 1] Synthesizing sram_2ports..."
cd "$HIER_DIR/syn_sram_2ports"
dc_shell -f run_dc.tcl | tee log_syn_terminal.log
echo ">>> sram_2ports synthesis done."

echo ""
echo "=========================================================="
echo " Level 1 Complete. Next steps:"
echo "   1. PnR each SRAM (pnr_sram_w16/, pnr_sram_2ports/)"
echo "   2. Export WC .lib from Innovus"
echo "   3. Convert .lib -> .db using lc_shell"
echo "   4. Then run Level 2 (syn_core)"
echo "=========================================================="
echo ""

# ---- Level 2: Core (needs SRAM .db from PnR) ----
# Uncomment after PnR of SRAMs is complete:
# echo ">>> [Level 2] Synthesizing core..."
# cd "$HIER_DIR/syn_core"
# dc_shell -f run_dc.tcl | tee log_syn_terminal.log
# echo ">>> core synthesis done."

# ---- Level 3: Fullchip (needs Core .db from PnR) ----
# Uncomment after PnR of Core is complete:
# echo ">>> [Level 3] Synthesizing fullchip..."
# cd "$HIER_DIR/syn_fullchip"
# dc_shell -f run_dc.tcl | tee log_syn_terminal.log
# echo ">>> fullchip synthesis done."

echo "=========================================================="
echo " Done at $(date)"
echo "=========================================================="
