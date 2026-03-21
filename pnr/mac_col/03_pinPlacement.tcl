getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterClockwise -side Left -layer 1 -spreadType center -spacing 4 -pin {clk reset i_inst[*] q_in[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 1 -spreadType center -spacing 4 -pin {o_inst[*] q_out[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 1 -spreadType center -spacing 2 -pin {out[*] fifo_wr} -fixedPin true
fit
