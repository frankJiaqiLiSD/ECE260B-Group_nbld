getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 0.8 -pin {clk reset rd wr[*] in[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterClockwise -side Right -layer 1 -spreadType center -spacing 0.8 -pin {o_full o_valid out[*]} -fixedPin true
fit
