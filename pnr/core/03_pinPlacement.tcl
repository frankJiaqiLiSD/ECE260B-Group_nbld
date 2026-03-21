getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterClockwise -side Left -layer 1 -spreadType center -spacing 4 -pin {clk reset inst[*] mem_in[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterClockwise -side Bottom -layer 1 -spreadType center -spacing 4 -pin {out[*] sum_out[*]} -fixedPin true
fit
