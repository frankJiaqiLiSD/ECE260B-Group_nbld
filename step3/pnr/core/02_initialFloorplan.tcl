# Dummy floorplan to reset canvas
floorPlan -site core -r 1 1 0 0 0 0 

# Floorplan
floorPlan -site core -r 1.5 0.50 15.0 15.0 15.0 15.0



globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose

# Power ring
addRing -spacing {2} -width {5} -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS  VDD}


# Power stripes
set coreBox [lindex [dbGet top.fPlan.coreBox] 0]
set x1 [lindex $coreBox 0]
set y1 [lindex $coreBox 1]
set x2 [lindex $coreBox 2]
set y2 [lindex $coreBox 3]
set num_sets 16
set stripe_padding [expr {($x2 - $x1) / ($num_sets + 2)}]
# setAddStripeMode -break_at {block_ring}
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M1 -max_same_layer_jog_length 0.8 -padcore_ring_bottom_layer_limit M1 -skip_via_on_pin Standardcell -stacked_via_top_layer M8 -padcore_ring_top_layer_limit M1 -block_ring_bottom_layer_limit M1 -stacked_via_bottom_layer M1 \
    -number_of_sets $num_sets -spacing 0.4 -merge_stripes_value 0.1 -direction horizontal -layer M5 -width 2 -nets {VDD VSS} \
    -area "[expr {$x1}] [expr {$y1 + $stripe_padding}] [expr {$x2}] [expr {$y2 - $stripe_padding}]"


setObjFPlanBox Instance qmem_instance 60 940 600 1080
setObjFPlanBox Instance kmem_instance 60 840 600 930
setObjFPlanBox Instance mac_array_instance 140 420 450 740
setObjFPlanBox Instance ofifo_inst 55 150 600 330
setObjFPlanBox Instance psum_mem_instance 60 30 600 110

addHaloToBlock {3 3 3 3} qmem_instance
addHaloToBlock {3 3 3 3} kmem_instance
addHaloToBlock {3 3 3 3} mac_array_instance
addHaloToBlock {3 3 3 3} ofifo_inst
addHaloToBlock {3 3 3 3} psum_mem_instance


addRing -nets {VDD VSS} -type block_rings -around each_block -layer {top M1 bottom M1 left M2 right M2} -width {top 0.5 bottom 0.5 left 0.5 right 0.5} -spacing {top 0.5 bottom 0.5 left 0.5 right 0.5} 



globalNetConnect VDD -type pgpin -pin VDD -sinst qmem_instance -verbose -override
globalNetConnect VSS -type pgpin -pin VSS -sinst qmem_instance -verbose -override        
globalNetConnect VDD -type pgpin -pin VDD -sinst kmem_instance -verbose -override
globalNetConnect VSS -type pgpin -pin VSS -sinst kmem_instance -verbose -override        
globalNetConnect VDD -type pgpin -pin VDD -sinst mac_array_instance -verbose -override
globalNetConnect VSS -type pgpin -pin VSS -sinst mac_array_instance -verbose -override        
globalNetConnect VDD -type pgpin -pin VDD -sinst ofifo_inst -verbose -override
globalNetConnect VSS -type pgpin -pin VSS -sinst ofifo_inst -verbose -override        
globalNetConnect VDD -type pgpin -pin VDD -sinst psum_mem_instance -verbose -override
globalNetConnect VSS -type pgpin -pin VSS -sinst psum_mem_instance -verbose -override        

sroute 

fit
