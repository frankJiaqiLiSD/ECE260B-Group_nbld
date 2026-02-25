# Floorplan
floorPlan -site core -r 1 0.70 10.0 10.0 10.0 10.0
#createPlaceBlockage -box [list x1 y2 x2 y2]

globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose

# Power ring
addRing -spacing {top 1 bottom 1 left 1 right 1} -width {top 2 bottom 2 left 2 right 2}  -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS  VDD}


# Power stripes
setAddStripeMode -break_at {block_ring}
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M1 -max_same_layer_jog_length 0.8 -padcore_ring_bottom_layer_limit M1 -skip_via_on_pin Standardcell -stacked_via_top_layer M8 -padcore_ring_top_layer_limit M1 -block_ring_bottom_layer_limit M1 -stacked_via_bottom_layer M1 \
    -number_of_sets 5 -spacing 0.4 -merge_stripes_value 0.1 -direction horizontal -layer M3 -width 1 -area {} -nets {VDD VSS}

#################################################

#addStripe -nets {VDD VSS} -layer M4 -direction vertical -width 1.8 -spacing 1.8 -number_of_sets 5 -start_from left -start 80 -stop 180 



#setObjFPlanBox Instance add_instance1 25 75.4675 52.9745 99.8675
#setObjFPlanBox Instance add_instance0 25 25.831 52.971 52.231 

#addHaloToBlock {3 3 3 3} add_instance0
#addHaloToBlock {3 3 3 3} add_instance1

#addRing -nets {VDD VSS} -type block_rings -around each_block -layer {top M1 bottom M1 left M2 right M2} -width {top 0.5 bottom 0.5 left 0.5 right 0.5} -spacing {top 0.5 bottom 0.5 left 0.5 right 0.5} 

#globalNetConnect VDD -type pgpin -pin VDD -sinst add_instance0 -verbose -override
#globalNetConnect VSS -type pgpin -pin VSS -sinst add_instance1 -verbose -override        

sroute 

fit
