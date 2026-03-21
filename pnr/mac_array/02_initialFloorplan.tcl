# Dummy floorplan to reset canvas
floorPlan -site core -r 1 1 0 0 0 0 

# Floorplan
floorPlan -site core -r 1 0.70 10.0 10.0 10.0 10.0
#createPlaceBlockage -box [list x1 y2 x2 y2]

globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose

# Power ring
addRing -spacing {top 1 bottom 1 left 1 right 1} -width {top 2 bottom 2 left 2 right 2}  -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS  VDD}


# Power stripes
set coreBox [lindex [dbGet top.fPlan.coreBox] 0]
set x1 [lindex $coreBox 0]
set y1 [lindex $coreBox 1]
set x2 [lindex $coreBox 2]
set y2 [lindex $coreBox 3]
set num_sets 8
set stripe_padding [expr {($x2 - $x1) / ($num_sets + 2)}]
setAddStripeMode -break_at {block_ring}
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M1 -max_same_layer_jog_length 0.8 -padcore_ring_bottom_layer_limit M1 -skip_via_on_pin Standardcell -stacked_via_top_layer M8 -padcore_ring_top_layer_limit M1 -block_ring_bottom_layer_limit M1 -stacked_via_bottom_layer M1 \
    -number_of_sets $num_sets -spacing 0.4 -merge_stripes_value 0.1 -direction vertical -layer M4 -width 1 -nets {VDD VSS} \
    -area "[expr {$x1 + $stripe_padding}] $y1 [expr {$x2 - $stripe_padding}] $y2"
#################################################

setObjFPlanBox Instance col_idx_0__mac_col_inst 25 70 80 630
setObjFPlanBox Instance col_idx_1__mac_col_inst 110 70 160 630
setObjFPlanBox Instance col_idx_2__mac_col_inst 195 70 240 630
setObjFPlanBox Instance col_idx_3__mac_col_inst 280 70 320 630
setObjFPlanBox Instance col_idx_4__mac_col_inst 365 70 400 630
setObjFPlanBox Instance col_idx_5__mac_col_inst 450 70 480 630
setObjFPlanBox Instance col_idx_6__mac_col_inst 535 70 560 630
setObjFPlanBox Instance col_idx_7__mac_col_inst 620 70 640 630

addHaloToBlock {3 3 3 3} col_idx_0__mac_col_inst
addHaloToBlock {3 3 3 3} col_idx_1__mac_col_inst
addHaloToBlock {3 3 3 3} col_idx_2__mac_col_inst
addHaloToBlock {3 3 3 3} col_idx_3__mac_col_inst
addHaloToBlock {3 3 3 3} col_idx_4__mac_col_inst
addHaloToBlock {3 3 3 3} col_idx_5__mac_col_inst
addHaloToBlock {3 3 3 3} col_idx_6__mac_col_inst
addHaloToBlock {3 3 3 3} col_idx_7__mac_col_inst

addRing -nets {VDD VSS} -type block_rings -around each_block -layer {top M1 bottom M1 left M2 right M2} -width {top 0.5 bottom 0.5 left 0.5 right 0.5} -spacing {top 0.5 bottom 0.5 left 0.5 right 0.5} 

globalNetConnect VDD -type pgpin -pin VDD -sinst col_idx_0__mac_col_inst -verbose -override
globalNetConnect VDD -type pgpin -pin VDD -sinst col_idx_1__mac_col_inst -verbose -override
globalNetConnect VDD -type pgpin -pin VDD -sinst col_idx_2__mac_col_inst -verbose -override
globalNetConnect VDD -type pgpin -pin VDD -sinst col_idx_3__mac_col_inst -verbose -override
globalNetConnect VDD -type pgpin -pin VDD -sinst col_idx_4__mac_col_inst -verbose -override
globalNetConnect VDD -type pgpin -pin VDD -sinst col_idx_5__mac_col_inst -verbose -override
globalNetConnect VDD -type pgpin -pin VDD -sinst col_idx_6__mac_col_inst -verbose -override
globalNetConnect VDD -type pgpin -pin VDD -sinst col_idx_7__mac_col_inst -verbose -override

globalNetConnect VSS -type pgpin -pin VSS -sinst col_idx_0__mac_col_inst -verbose -override        
globalNetConnect VSS -type pgpin -pin VSS -sinst col_idx_1__mac_col_inst -verbose -override        
globalNetConnect VSS -type pgpin -pin VSS -sinst col_idx_2__mac_col_inst -verbose -override        
globalNetConnect VSS -type pgpin -pin VSS -sinst col_idx_3__mac_col_inst -verbose -override        
globalNetConnect VSS -type pgpin -pin VSS -sinst col_idx_4__mac_col_inst -verbose -override        
globalNetConnect VSS -type pgpin -pin VSS -sinst col_idx_5__mac_col_inst -verbose -override        
globalNetConnect VSS -type pgpin -pin VSS -sinst col_idx_6__mac_col_inst -verbose -override        
globalNetConnect VSS -type pgpin -pin VSS -sinst col_idx_7__mac_col_inst -verbose -override        

sroute 

fit
