getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterClockwise -side Left -layer 1 -spreadType center -spacing 4 -pin {CLK CEN WEN A[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection counterClockwise -side Bottom -layer 1 -spreadType center -spacing 4 -pin {D[*]} -fixedPin true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 1 -spreadType center -spacing 4 -pin {Q[*]} -fixedPin true
fit
