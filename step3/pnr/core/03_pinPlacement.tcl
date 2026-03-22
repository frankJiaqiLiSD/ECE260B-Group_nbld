getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 1 -spreadType center -spacing 4 -pin {mem_in[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterClockwise -side Left -layer 1 -spreadType center -spacing 4 -pin {clk reset inst[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 1 -spreadType center -spacing 4 -pin {out[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterClockwise -side Bottom -layer 1 -spreadType center -spacing 4 -pin {sum_out[*]} -fixedPin true
fit
