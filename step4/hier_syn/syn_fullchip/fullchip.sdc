set clock_cycle 2.5
set io_delay 0.2

set clock_port_a clk0
set clock_port_b clk1

create_clock -name clk0 -period $clock_cycle [get_ports $clock_port_a]
create_clock -name clk1 -period $clock_cycle [get_ports $clock_port_b]

set_clock_groups -asynchronous -group [get_clocks clk0] -group [get_clocks clk1]

#core a clock domain inputs
set_input_delay -clock [get_clocks clk0] -add_delay -max $io_delay [get_ports {mem_in0 inst0 reset0}]
#core b clock domain inputs
set_input_delay -clock [get_clocks clk1] -add_delay -max $io_delay [get_ports {mem_in1 inst1 reset1}]

#core a clock domain outputs
set_output_delay -clock [get_clocks clk0] -add_delay -max $io_delay [get_ports {out0}]
#core b clock domain outputs
set_output_delay -clock [get_clocks clk1] -add_delay -max $io_delay [get_ports {out1}]

# Submodule MCPs (Propagated for core_instance0 and core_instance1)
set_multicycle_path 4 -setup \
 -from [get_cells -hierarchical *sfp_in_q_reg*] \
 -to   [get_cells -hierarchical *sum_q_reg*]

set_multicycle_path 3 -hold \
 -from [get_cells -hierarchical *sfp_in_q_reg*] \
 -to   [get_cells -hierarchical *sum_q_reg*]

set_multicycle_path 9 -setup \
 -from [get_cells -hierarchical *sfp_in_abs*_q_reg*] \
 -to   [get_cells -hierarchical *sfp_out_abs*_q_reg*]

set_multicycle_path 8 -hold \
 -from [get_cells -hierarchical *sfp_in_abs*_q_reg*] \
 -to   [get_cells -hierarchical *sfp_out_abs*_q_reg*]

set_multicycle_path 8 -setup \
 -from [get_cells -hierarchical *sum_2core_q_reg*] \
 -to   [get_cells -hierarchical *sfp_out_abs*_q_reg*]

set_multicycle_path 7 -hold \
 -from [get_cells -hierarchical *sum_2core_q_reg*] \
 -to   [get_cells -hierarchical *sfp_out_abs*_q_reg*]

# SFP to PSUM_MEM Interface MCPs
set_multicycle_path 5 -setup \
 -from [get_cells -hierarchical *sfp_wr_reg*] \
 -to   [get_cells -hierarchical *psum_mem_instance*]

set_multicycle_path 4 -hold \
 -from [get_cells -hierarchical *sfp_wr_reg*] \
 -to   [get_cells -hierarchical *psum_mem_instance*]

set_multicycle_path 5 -setup \
 -from [get_cells -hierarchical *sfp_out_abs*_q_reg*] \
 -to   [get_cells -hierarchical *psum_mem_instance*]

set_multicycle_path 4 -hold \
 -from [get_cells -hierarchical *sfp_out_abs*_q_reg*] \
 -to   [get_cells -hierarchical *psum_mem_instance*]
