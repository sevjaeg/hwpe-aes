setMultiCpuUsage -localCpu 8

source aes_cipher_top.globals
init_design

setDesignMode -process 65
setDesignMode -topRoutingLayer 6
setDesignMode -bottomRoutingLayer 1

floorPlan -site core10T -r 1.0 0.7 2.5 2.5 2.5 2.5

checkDesign -all

# Power Nets

globalNetConnect VDD -type pgpin -pin VDD -instanceBasename *
globalNetConnect VDD -type tiehi -pin VDD -instanceBasename *
globalNetConnect VDD -type net -net VDD
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename *
globalNetConnect VSS -type tielo -pin VSS -instanceBasename *
globalNetConnect VSS -type net -net VSS

addRing -nets {VDD VSS} -type core_rings -follow io -layer {top M3 bottom M3 left M4 right M4} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 0.5 bottom 0.5 left 0.5 right 0.5} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

addStripe -nets {VSS VDD} -layer M4 -direction vertical -width 1.8 -spacing 0.5 -set_to_set_distance 50 -start_from left -start_offset 50 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit AP -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit AP -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None

addStripe -nets {VSS VDD} -layer M3 -direction horizontal -width 1.8 -spacing 0.5 -set_to_set_distance 50 -start_from bottom -start_offset 50 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit AP -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit AP -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None

# Pins

editPin -fixOverlap 1 -spreadDirection clockwise -edge 0 -layer 2 -spreadType side -pin {clk done ld rst {text_out[0]} {text_out[1]} {text_out[2]} {text_out[3]} {text_out[4]} {text_out[5]} {text_out[6]} {text_out[7]} {text_out[8]} {text_out[9]} {text_out[10]} {text_out[11]} {text_out[12]} {text_out[13]} {text_out[14]} {text_out[15]} {text_out[16]} {text_out[17]} {text_out[18]} {text_out[19]} {text_out[20]} {text_out[21]} {text_out[22]} {text_out[23]} {text_out[24]} {text_out[25]} {text_out[26]} {text_out[27]} {text_out[28]} {text_out[29]} {text_out[30]} {text_out[31]} {text_out[32]} {text_out[33]} {text_out[34]} {text_out[35]} {text_out[36]} {text_out[37]} {text_out[38]} {text_out[39]} {text_out[40]} {text_out[41]} {text_out[42]} {text_out[43]} {text_out[44]} {text_out[45]} {text_out[46]} {text_out[47]} {text_out[48]} {text_out[49]} {text_out[50]} {text_out[51]} {text_out[52]} {text_out[53]} {text_out[54]} {text_out[55]} {text_out[56]} {text_out[57]} {text_out[58]} {text_out[59]} {text_out[60]} {text_out[61]} {text_out[62]} {text_out[63]} {text_out[64]} {text_out[65]} {text_out[66]} {text_out[67]} {text_out[68]} {text_out[69]} {text_out[70]} {text_out[71]} {text_out[72]} {text_out[73]} {text_out[74]} {text_out[75]} {text_out[76]} {text_out[77]} {text_out[78]} {text_out[79]} {text_out[80]} {text_out[81]} {text_out[82]} {text_out[83]} {text_out[84]} {text_out[85]} {text_out[86]} {text_out[87]} {text_out[88]} {text_out[89]} {text_out[90]} {text_out[91]} {text_out[92]} {text_out[93]} {text_out[94]} {text_out[95]} {text_out[96]} {text_out[97]} {text_out[98]} {text_out[99]} {text_out[100]} {text_out[101]} {text_out[102]} {text_out[103]} {text_out[104]} {text_out[105]} {text_out[106]} {text_out[107]} {text_out[108]} {text_out[109]} {text_out[110]} {text_out[111]} {text_out[112]} {text_out[113]} {text_out[114]} {text_out[115]} {text_out[116]} {text_out[117]} {text_out[118]} {text_out[119]} {text_out[120]} {text_out[121]} {text_out[122]} {text_out[123]} {text_out[124]} {text_out[125]} {text_out[126]} {text_out[127]}}

editPin -fixOverlap 1 -spreadDirection clockwise -edge 2 -layer 2 -spreadType side -pin {{key[0]} {key[1]} {key[2]} {key[3]} {key[4]} {key[5]} {key[6]} {key[7]} {key[8]} {key[9]} {key[10]} {key[11]} {key[12]} {key[13]} {key[14]} {key[15]} {key[16]} {key[17]} {key[18]} {key[19]} {key[20]} {key[21]} {key[22]} {key[23]} {key[24]} {key[25]} {key[26]} {key[27]} {key[28]} {key[29]} {key[30]} {key[31]} {key[32]} {key[33]} {key[34]} {key[35]} {key[36]} {key[37]} {key[38]} {key[39]} {key[40]} {key[41]} {key[42]} {key[43]} {key[44]} {key[45]} {key[46]} {key[47]} {key[48]} {key[49]} {key[50]} {key[51]} {key[52]} {key[53]} {key[54]} {key[55]} {key[56]} {key[57]} {key[58]} {key[59]} {key[60]} {key[61]} {key[62]} {key[63]} {key[64]} {key[65]} {key[66]} {key[67]} {key[68]} {key[69]} {key[70]} {key[71]} {key[72]} {key[73]} {key[74]} {key[75]} {key[76]} {key[77]} {key[78]} {key[79]} {key[80]} {key[81]} {key[82]} {key[83]} {key[84]} {key[85]} {key[86]} {key[87]} {key[88]} {key[89]} {key[90]} {key[91]} {key[92]} {key[93]} {key[94]} {key[95]} {key[96]} {key[97]} {key[98]} {key[99]} {key[100]} {key[101]} {key[102]} {key[103]} {key[104]} {key[105]} {key[106]} {key[107]} {key[108]} {key[109]} {key[110]} {key[111]} {key[112]} {key[113]} {key[114]} {key[115]} {key[116]} {key[117]} {key[118]} {key[119]} {key[120]} {key[121]} {key[122]} {key[123]} {key[124]} {key[125]} {key[126]} {key[127]} {text_in[0]} {text_in[1]} {text_in[2]} {text_in[3]} {text_in[4]} {text_in[5]} {text_in[6]} {text_in[7]} {text_in[8]} {text_in[9]} {text_in[10]} {text_in[11]} {text_in[12]} {text_in[13]} {text_in[14]} {text_in[15]} {text_in[16]} {text_in[17]} {text_in[18]} {text_in[19]} {text_in[20]} {text_in[21]} {text_in[22]} {text_in[23]} {text_in[24]} {text_in[25]} {text_in[26]} {text_in[27]} {text_in[28]} {text_in[29]} {text_in[30]} {text_in[31]} {text_in[32]} {text_in[33]} {text_in[34]} {text_in[35]} {text_in[36]} {text_in[37]} {text_in[38]} {text_in[39]} {text_in[40]} {text_in[41]} {text_in[42]} {text_in[43]} {text_in[44]} {text_in[45]} {text_in[46]} {text_in[47]} {text_in[48]} {text_in[49]} {text_in[50]} {text_in[51]} {text_in[52]} {text_in[53]} {text_in[54]} {text_in[55]} {text_in[56]} {text_in[57]} {text_in[58]} {text_in[59]} {text_in[60]} {text_in[61]} {text_in[62]} {text_in[63]} {text_in[64]} {text_in[65]} {text_in[66]} {text_in[67]} {text_in[68]} {text_in[69]} {text_in[70]} {text_in[71]} {text_in[72]} {text_in[73]} {text_in[74]} {text_in[75]} {text_in[76]} {text_in[77]} {text_in[78]} {text_in[79]} {text_in[80]} {text_in[81]} {text_in[82]} {text_in[83]} {text_in[84]} {text_in[85]} {text_in[86]} {text_in[87]} {text_in[88]} {text_in[89]} {text_in[90]} {text_in[91]} {text_in[92]} {text_in[93]} {text_in[94]} {text_in[95]} {text_in[96]} {text_in[97]} {text_in[98]} {text_in[99]} {text_in[100]} {text_in[101]} {text_in[102]} {text_in[103]} {text_in[104]} {text_in[105]} {text_in[106]} {text_in[107]} {text_in[108]} {text_in[109]} {text_in[110]} {text_in[111]} {text_in[112]} {text_in[113]} {text_in[114]} {text_in[115]} {text_in[116]} {text_in[117]} {text_in[118]} {text_in[119]} {text_in[120]} {text_in[121]} {text_in[122]} {text_in[123]} {text_in[124]} {text_in[125]} {text_in[126]} {text_in[127]}}

# Placement

place_opt_design
optDesign -preCTS

# Clock Tree Synthesis

source ccopt_aes.spec
ccopt_design

timeDesign -postCTS
timeDesign -postCTS –hold
optDesign -postCTS -hold

# Routing

sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) M6(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) M6(6) } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) M6(6) }

setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign -globalDetail

verifyConnectivity
verifyGeometry


