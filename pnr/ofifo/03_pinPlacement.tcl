getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
set pin_spacing 1.4
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 1 -spreadType center -spacing $pin_spacing -pin {in[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing $pin_spacing -pin {clk reset rd wr[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterClockwise -side Bottom -layer 1 -spreadType center -spacing $pin_spacing -pin {out[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 1 -spreadType center -spacing $pin_spacing -pin {o_valid} -fixedPin true
fit
