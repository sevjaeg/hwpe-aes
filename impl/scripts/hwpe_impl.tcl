source scripts/common.tcl
set DESIGN mac_top_wrap

set_multi_cpu_usage -local_cpu 8

set DATE [clock format [clock seconds] -format "%b%d-%T"] 

set_db init_netlist_files ${_OUTPUTS_PATH}/${DESIGN}_synth.v
set_db init_lef_files /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/lef/tcbn65gplushpbwp_6lmT1.lef
# includes captables and sdc
set_db init_mmmc_files scripts/$DESIGN-mmmc.tcl

set_db init_power_nets VDD
set_db init_ground_nets VSS

set_db design_process_node 65

read_mmmc scripts/$DESIGN-mmmc.tcl
read_physical -lef /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/lef/tcbn65gplushpbwp_6lmT1.lef
read_netlist ${_OUTPUTS_PATH}/${DESIGN}_synth.v -top mac_top_wrap

init_design

create_floorplan -site core10T -core_density_size 1.0 0.75 5.2 5.2 5.2 5.2

set_db place_global_place_io_pins true

set_db design_bottom_routing_layer M1
set_db design_top_routing_layer M6

set_db timing_analysis_type best_case_worst_case
set_db timing_analysis_clock_propagation_mode sdc_control

connect_global_net VDD -type pg_pin -pin_base_name VDD -inst_base_name * -verbose
connect_global_net VSS -type pg_pin -pin_base_name VSS -inst_base_name * -verbose

set_pin_constraint -spacing 4 -layer {M2 M3 M4} -pin *

# add spacing if min enclosed area violation happens
add_rings -nets {VSS VDD} -type core_rings -follow io -layer {top M5 bottom M5 left M6 right M6} -width {top 2.0 bottom 2.0 left 2.0 right 2.0} -spacing {top 1.0 bottom 1.0 left 1.0 right 1.0} -offset {top 0 bottom 0 left 0 right 0} -center 0 -threshold 0  -jog_distance 0 -snap_wire_center_to_grid none
add_stripes -nets {VDD VSS} -layer M5 -direction horizontal -width 2.0 -spacing 1.0 -number_of_sets 4 -start_from bottom -start_offset 50 -stop_offset 50 -switch_layer_over_obs false -max_same_layer_jog_length 2 -pad_core_ring_top_layer_limit AP -pad_core_ring_bottom_layer_limit M1 -block_ring_top_layer_limit AP -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid none
add_stripes -nets {VDD VSS} -layer M6 -direction vertical -width 2.0 -spacing 1.0 -number_of_sets 4 -start_from left -start_offset 50 -stop_offset 50 -switch_layer_over_obs false -max_same_layer_jog_length 2 -pad_core_ring_top_layer_limit AP -pad_core_ring_bottom_layer_limit M1 -block_ring_top_layer_limit AP -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid none

time_design -pre_place -report_dir ${_REPORTS_PATH}/${DESIGN}_layout_timing_preplace

# yields IMPSP-9100, should be no problem
set_db place_global_ignore_scan false

place_opt_design

check_place ${_REPORTS_PATH}/${DESIGN}_layout_place.rpt
time_design -pre_cts -report_dir ${_REPORTS_PATH}/${DESIGN}_layout_timing_prects

route_special -connect corePin -nets {VDD VSS} -layer_change_range {M1(1) M6(6)} -allow_jogging 1 -allow_layer_change 1

assign_io_pins -move_fixed_pin -pins *

create_clock_tree_spec

ccopt_design

report_clock_trees -out_file ${_REPORTS_PATH}/${DESIGN}_layout_clock_trees.rpt
report_skew_groups -out_file ${_REPORTS_PATH}/${DESIGN}_layout_skew_groups.rpt

time_design -post_cts -report_dir ${_REPORTS_PATH}/${DESIGN}_layout_timing_postcts
time_design -post_cts -hold -report_dir ${_REPORTS_PATH}/${DESIGN}_layout_timing_postcts_hold

opt_design -post_cts -hold

add_fillers -base_cells {FILL16HPBWP FILL1HPBWP FILL2HPBWP FILL32HPBWP FILL4HPBWP FILL64HPBWP FILL8HPBWP} -density 0.7
check_drc -out_file ${_REPORTS_PATH}/${DESIGN}_layout_drc_prefix.rpt
add_fillers -fix_drc -base_cells {FILL16HPBWP FILL1HPBWP FILL2HPBWP FILL32HPBWP FILL4HPBWP FILL64HPBWP FILL8HPBWP} -density 0.7

set_db timing_analysis_type ocv
set_db timing_analysis_clock_propagation_mode sdc_control

set_db route_design_with_timing_driven true
set_db route_design_with_si_driven true
route_design

time_design -post_route -report_dir ${_REPORTS_PATH}/${DESIGN}_layout_timing_postroute
time_design -post_route -hold -report_dir ${_REPORTS_PATH}/${DESIGN}_layout_timing_postroute_hold

opt_design -post_route -setup -hold

# layer 7 not used
check_metal_density -layer {M1 M2 M3 M4 M5 M6} -report ${_REPORTS_PATH}/${DESIGN}_layout_metal_prefill.rpt
# check_cut_density -layer {VIA1 VIA2 VIA3 VIA4 VIA5} -out_file ${_REPORTS_PATH}/${DESIGN}_layout_via_prefill.rpt

set_via_fill  -layer {VIA1 VIA2 VIA3 VIA4 VIA5}
set_metal_fill -layer M6 -active_spacing 1.0 -window_size 20.0 20.0 -window_step 10.0 10.0 -min_density 1 -max_density 90 -preferred_density 35
set_metal_fill -layer M5 -active_spacing 1.0 -window_size 20.0 20.0 -window_step 10.0 10.0 -min_density 1 -max_density 90 -preferred_density 35

# Via fill not working properly
# Via density not in LEF file?
#add_via_fill -layer {VIA1 VIA2 VIA3 VIA4 VIA5} -modes all
add_metal_fill -layers {M5 M6} -timing_aware sta

check_connectivity -out_file ${_REPORTS_PATH}/${DESIGN}_layout_connectivity.rpt
check_drc -out_file ${_REPORTS_PATH}/${DESIGN}_layout_drc.rpt

check_metal_density -layer {M1 M2 M3 M4 M5 M6} -report ${_REPORTS_PATH}/${DESIGN}_layout_metal.rpt
# check_cut_density -layer {VIA1 VIA2 VIA3 VIA4 VIA5} -out_file ${_REPORTS_PATH}/${DESIGN}_layout_via.rpt

report_clock_trees > $_REPORTS_PATH/${DESIGN}_layout_clock_tree.rpt
report_area > $_REPORTS_PATH/${DESIGN}_layout_area.rpt
report_timing -late > $_REPORTS_PATH/${DESIGN}_layout_timing_setup.rpt
report_timing -early > $_REPORTS_PATH/${DESIGN}_layout_timing_hold.rpt
report_summary -out_dir $_REPORTS_PATH/${DESIGN}
report_summary -no_html -out_file $_REPORTS_PATH/${DESIGN}_layout_summary.rpt
report_power > $_REPORTS_PATH/${DESIGN}_layout_power.rpt
report_messages > $_REPORTS_PATH/${DESIGN}_layout_messages.rpt

time_design -post_route -report_dir ${_REPORTS_PATH}/${DESIGN}_layout_timing_final
time_design -post_route -hold -report_dir ${_REPORTS_PATH}/${DESIGN}_layout_timing_final_hold

# timing report for debug window
report_timing -output_format gtd -max_paths 10000 -max_slack 1.0 -path_exceptions all -late > ${_REPORTS_PATH}/${DESIGN}_timing_setup.mtarpt
report_timing -output_format gtd -max_paths 10000 -max_slack 1.0 -path_exceptions all -early > ${_REPORTS_PATH}/${DESIGN}_timing_hold.mtarpt

# netlist and sdf for post-layout simulation
write_netlist ${_OUTPUTS_PATH}/${DESIGN}_layout.v
write_sdf ${_OUTPUTS_PATH}/${DESIGN}_layout.sdf -gate_level_sim_model -recompute_delaycal

# Write database to restore session later
write_db -rc_extract -def ${_OUTPUTS_PATH}/${DESIGN}.dat

# GDSII
write_stream ${_OUTPUTS_PATH}/${DESIGN}.gds -map_file scripts/gds2.map -mode all
