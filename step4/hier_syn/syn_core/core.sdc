set clock_cycle 2.5
set io_delay 0.2

set clock_port clk

create_clock -name clk -period $clock_cycle [get_ports $clock_port]

set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [all_inputs]
set_output_delay -clock [get_clocks clk] -add_delay -max $io_delay [all_outputs]

# sfp_row is a black box — its internal MCPs are handled in sfp_row's own SDC.
# No cross-boundary MCPs needed since sfp_row ↔ psum_mem timing is
# constrained at PnR stage via the .lib model.
