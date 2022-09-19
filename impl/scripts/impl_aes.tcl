set_multi_cpu_usage -local_cpu 8

set DESIGN aes_cipher_top
set DATE [clock format [clock seconds] -format "%b%d-%T"] 
set _OUTPUTS_PATH out
set _REPORTS_PATH reports
set _LOG_PATH logs

set_db init_netlist_files ${_OUTPUTS_PATH}/${DESIGN}_synth.v
set_db init_lef_files /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/lef/tcbn65gplushpbwp_6lmT1.lef
# includes captables and sdc
set_db init_mmmc_files scripts/aes_mmmc.tcl

set_db init_power_nets VDD
set_db init_ground_nets VSS

set_db design_process_node 65

read_mmmc scripts/aes_mmmc.tcl
read_physical -lef /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/lef/tcbn65gplushpbwp_6lmT1.lef
read_netlist ${_OUTPUTS_PATH}/${DESIGN}_synth.v -top aes_cipher_top

init_design

create_floorplan -site core10T -core_density_size 1.0 0.72 4.0 4.0 4.0 4.0

set_db assign_pins_edit_in_batch true
edit_pin -pin_width 0.1 -pin_depth 1.0 -fix_overlap 1 -unit micron -spread_direction clockwise -edge 0 -layer 3 -spread_type center -spacing 3 -pin {rst clk}
edit_pin -pin_width 0.1 -pin_depth 1.0 -fix_overlap 1 -spread_direction clockwise -edge 1 -layer 2 -spread_type center -spacing 0.5 -pin {{text_in*} {key*} ld}
edit_pin -pin_width 0.1 -pin_depth 1.0 -fix_overlap 1 -spread_direction clockwise -edge 3 -layer 2 -spread_type center -spacing 1 -pin {{text_out*} done}
set_db assign_pins_edit_in_batch false

connect_global_net VDD -type pg_pin -pin_base_name VDD -inst_base_name * -verbose
connect_global_net VSS -type pg_pin -pin_base_name VSS -inst_base_name * -verbose

set_db design_bottom_routing_layer M1
set_db design_top_routing_layer M6

set_db timing_analysis_type best_case_worst_case
set_db timing_analysis_clock_propagation_mode sdc_control

# add spacing if min enclosed area violation happens
add_rings -nets {VDD VSS} -type core_rings -follow io -layer {top M5 bottom M5 left M6 right M6} -width {top 1.5 bottom 1.5 left 1.5 right 1.5} -spacing {top 0.6 bottom 0.6 left 0.6 right 0.6} -offset {top 0 bottom 0 left 0 right 0} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid none
add_stripes -nets {VDD VSS} -layer M5 -direction horizontal -width 1.5 -spacing 0.6 -number_of_sets 3 -start_from bottom -start_offset 45 -stop_offset 45 -switch_layer_over_obs false -max_same_layer_jog_length 2 -pad_core_ring_top_layer_limit AP -pad_core_ring_bottom_layer_limit M1 -block_ring_top_layer_limit AP -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid none
add_stripes -nets {VDD VSS} -layer M6 -direction vertical -width 1.5 -spacing 0.6 -number_of_sets 3 -start_from left -start_offset 45 -stop_offset 45 -switch_layer_over_obs false -max_same_layer_jog_length 2 -pad_core_ring_top_layer_limit AP -pad_core_ring_bottom_layer_limit M1 -block_ring_top_layer_limit AP -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid none

route_special -connect corePin -nets {VDD VSS} -layer_change_range {M1(1) M6(6)} -allow_jogging 0 -allow_layer_change 1

# route_special -connect {block_pin pad_pin pad_ring core_pin floating_stripe} -layer_change_range { M1(1) M6(6) } -block_pin_target nearest_target -pad_pin_port_connect {all_port one_geom} -pad_pin_target nearest_target -core_pin_target first_after_row_end -floating_stripe_target {block_ring pad_ring ring stripe ring_pin block_pin followpin} -allow_jogging 0 -crossover_via_layer_range { M1(1) AP(7) } -nets { VDD VSS } -allow_layer_change 1 -block_pin use_lef -target_via_layer_range { M1(1) AP(7) }

# TODO fix IMPSP-9099
place_opt_design

check_place

create_clock_tree_spec

# TODO fix IMPCCOPT-1361
ccopt_design
opt_design -post_cts -hold

add_fillers -base_cells {FILL16HPBWP FILL1HPBWP FILL2HPBWP FILL32HPBWP FILL4HPBWP FILL64HPBWP FILL8HPBWP}
check_drc
add_fillers -fix_drc

set_db timing_analysis_type ocv
set_db timing_analysis_clock_propagation_mode sdc_control

set_db route_design_with_timing_driven true
set_db route_design_with_si_driven true
route_design

opt_design -post_route -setup -hold

check_connectivity
check_drc

# TODO fill

check_metal_density


report_timing -late > $_REPORTS_PATH/${DESIGN}_timing_layout.rpt
report_timing -early > $_REPORTS_PATH/${DESIGN}_timing_layout_hold.rpt

# TODO write_stream

# gui_show
