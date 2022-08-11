setMultiCpuUsage -localCpu 8

source aes_cipher_top.globals
init_design

setDesignMode -process 65
checkDesign -all

floorPlan -site core10T -r 1.0 0.75 2.0 2.0 2.0 2.0

globalNetConnect VDD -type pgpin -pin VDD -instanceBasename *
globalNetConnect VDD -type tiehi -pin VDD -instanceBasename *
globalNetConnect VDD -type net -net VDD
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename *
globalNetConnect VSS -type tielo -pin VSS -instanceBasename *
globalNetConnect VSS -type net -net VSS

addRing -nets {VDD VSS} -type core_rings -follow io -layer {top M3 bottom M3 left M4 right M4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 0.5 bottom 0.5 left 0.5 right 0.5} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

addStripe -nets {VSS VDD} -layer M4 -direction vertical -width 1.8 -spacing 0.5 -set_to_set_distance 50 -start_from left -start_offset 50 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit AP -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit AP -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None

addStripe -nets {VSS VDD} -layer M3 -direction horizontal -width 1.8 -spacing 0.5 -set_to_set_distance 50 -start_from bottom -start_offset 50 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit AP -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit AP -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None

setDesignMode -topRoutingLayer 4
setDesignMode -bottomRoutingLayer 1

place_opt_design
optDesign -preCTS

source ccopt_aes.spec
ccopt_design


