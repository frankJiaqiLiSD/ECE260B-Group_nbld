getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 2 -pin {clk reset inst[*] in[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterClockwise -side Right -layer 1 -spreadType center -spacing 2 -pin {out[*] fifo_wr[*]} -fixedPin true
fit
