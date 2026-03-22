set clock_cycle 2.5
set io_delay 0.2

set clock_port clk

create_clock -name clk -period $clock_cycle [get_ports $clock_port]

set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [all_inputs]
set_output_delay -clock [get_clocks clk] -add_delay -max $io_delay [all_outputs]

# Internal MCPs (from sfp_row pipeline)
set_multicycle_path 4 -setup \
 -from [get_cells *sfp_in_q_reg*] \
 -to   [get_cells *sum_q_reg*]

set_multicycle_path 3 -hold \
 -from [get_cells *sfp_in_q_reg*] \
 -to   [get_cells *sum_q_reg*]

set_multicycle_path 9 -setup \
 -from [get_cells *sfp_in_abs*_q_reg*] \
 -to   [get_cells *sfp_out_abs*_q_reg*]

set_multicycle_path 8 -hold \
 -from [get_cells *sfp_in_abs*_q_reg*] \
 -to   [get_cells *sfp_out_abs*_q_reg*]

set_multicycle_path 8 -setup \
 -from [get_cells *sum_2core_q_reg*] \
 -to   [get_cells *sfp_out_abs*_q_reg*]

set_multicycle_path 7 -hold \
 -from [get_cells *sum_2core_q_reg*] \
 -to   [get_cells *sfp_out_abs*_q_reg*]
