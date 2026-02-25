set top_module "mac_array"
set rtlPath "../../verilog"

# Target library
set target_library "/home/linux/ieng6/ECE260B_WI26_A00/public/PDKdata/db/tcbn65gpluswc.db"

# environment setup
source "../setup.tcl"

# read RTL
analyze -format verilog -lib WORK "mac_16in.v"
analyze -format verilog -lib WORK "mac_col.v"
analyze -format verilog -lib WORK "mac_array.v"

elaborate $top_module -lib WORK -update
current_design $top_module

# Link Design
link

# Default SDC Constraints
read_sdc "${top_module}.sdc"
propagate_constraints

current_design $top_module

# Run the synthesis and save results
source "../run.tcl"
