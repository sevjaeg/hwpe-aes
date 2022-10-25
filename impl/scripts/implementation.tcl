source scripts/common.tcl
set DESIGN $::env(CADENCE_DESIGN)

if {$DESIGN != "aes_cipher_top"} {
  set DESIGN_TOP ${DESIGN}_genus
} else {
  set DESIGN_TOP ${DESIGN}
}

set_multi_cpu_usage -local_cpu 8

set DATE [clock format [clock seconds] -format "%b%d-%T"]

set_db init_netlist_files ${_OUTPUTS_PATH}/${DESIGN}_synth.v
set_db init_lef_files /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/lef/tcbn65gplushpbwp_6lmT1.lef
# includes captables and sdc
set_db init_mmmc_files scripts/mmmc.tcl

set_db init_power_nets VDD
set_db init_ground_nets VSS

set_db design_process_node 65

read_mmmc scripts/mmmc.tcl

read_physical -lef /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/lef/tcbn65gplushpbwp_6lmT1.lef
read_netlist ${_OUTPUTS_PATH}/${DESIGN}_synth.v -top ${DESIGN_TOP}

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

# time_design -pre_place -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_timing_preplace/

# yields IMPSP-9100, should be no problem
set_db place_global_ignore_scan false

place_opt_design -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_place/

check_place ${_REPORTS_PATH}/${DESIGN}/layout_place.rpt
# time_design -pre_cts -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_timing_prects/

route_special -connect corePin -nets {VDD VSS} -layer_change_range {M1(1) M6(6)} -allow_jogging 1 -allow_layer_change 1

assign_io_pins -move_fixed_pin -pins *

create_clock_tree_spec

ccopt_design -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_cts/

report_clock_trees -out_file ${_REPORTS_PATH}/${DESIGN}/layout_clock_trees.rpt
report_skew_groups -out_file ${_REPORTS_PATH}/${DESIGN}/layout_skew_groups.rpt

# time_design -post_cts -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_timing_postcts/
# time_design -post_cts -hold -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_timing_postcts_hold/

opt_design -post_cts -hold -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_postcts_opt/

set_db timing_analysis_type ocv
set_db timing_analysis_clock_propagation_mode sdc_control

set_db route_design_with_timing_driven true
set_db route_design_with_si_driven true
route_design

# time_design -post_route -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_timing_postroute/
# time_design -post_route -hold -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_timing_postroute_hold/

opt_design -post_route -setup -hold -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_postroute_opt/

if {$DESIGN == "mac_engine"} {
    # fix remaining hold time violations (all these signals have fanout 1)
    set violations [get_nets a_i_data*]
    set violations [add_to_collection $violations [get_nets a_i_valid]]
    set violations [add_to_collection $violations [get_nets b_i_data*]]
    set violations [add_to_collection $violations [get_nets b_i_valid]]
    set violations [add_to_collection $violations [get_nets {ctrl_i[start]}]]
    set violations [add_to_collection $violations [get_nets {ctrl_i[clear]}]]

    # Might cause IMPSP-2020 which leads to ERROR IMPSP-2021. However, this only leads to not placed filler cells
    # this should not be a problem
    foreach_in_collection net ${violations}  {
      eco_add_repeater -cells BUFFD2HPBWP -net [get_object_name ${net}]
    }
    # larger fanout
    eco_add_repeater -cells BUFFD8HPBWP -net {ctrl_i[enable]}
}

# fillers before eco cause spurious violations
add_fillers -base_cells {FILL16HPBWP FILL1HPBWP FILL2HPBWP FILL32HPBWP FILL4HPBWP FILL64HPBWP FILL8HPBWP} -density 0.7
check_drc -limit 1000000 -out_file ${_REPORTS_PATH}/${DESIGN}/layout_drc_prefix.rpt
add_fillers -fix_drc -base_cells {FILL16HPBWP FILL1HPBWP FILL2HPBWP FILL32HPBWP FILL4HPBWP FILL64HPBWP FILL8HPBWP} -density 0.7

check_connectivity -out_file ${_REPORTS_PATH}/${DESIGN}/layout_connectivity_eco.rpt
check_drc -limit 1000000 -out_file ${_REPORTS_PATH}/${DESIGN}/layout_drc_eco.rpt
route_eco
route_eco -fix_drc

# layer 7 not used
check_metal_density -layer {M1 M2 M3 M4 M5 M6} -report ${_REPORTS_PATH}/${DESIGN}/layout_metal_prefill.rpt
# check_cut_density -layer {VIA1 VIA2 VIA3 VIA4 VIA5} -out_file ${_REPORTS_PATH}/${DESIGN}_layout_via_prefill.rpt

# set_via_fill  -layer {VIA1 VIA2 VIA3 VIA4 VIA5}
set_metal_fill -layer M6 -active_spacing 1.0 -window_size 20.0 20.0 -window_step 10.0 10.0 -min_density 1 -max_density 90 -preferred_density 35
set_metal_fill -layer M5 -active_spacing 1.0 -window_size 20.0 20.0 -window_step 10.0 10.0 -min_density 1 -max_density 90 -preferred_density 35

# Via fill not working properly as via density not (correctly) in LEF file (?)
#add_via_fill -layer {VIA1 VIA2 VIA3 VIA4 VIA5} -modes all
add_metal_fill -layers {M5 M6} -timing_aware sta -slack_threshold 0.1

check_connectivity -out_file ${_REPORTS_PATH}/${DESIGN}/layout_connectivity.rpt
check_drc -limit 1000000 -out_file ${_REPORTS_PATH}/${DESIGN}/layout_drc.rpt

check_metal_density -layer {M1 M2 M3 M4 M5 M6} -report ${_REPORTS_PATH}/${DESIGN}/layout_metal.rpt
# check_cut_density -layer {VIA1 VIA2 VIA3 VIA4 VIA5} -out_file ${_REPORTS_PATH}/${DESIGN}_layout_via.rpt

report_clock_trees > $_REPORTS_PATH/${DESIGN}/layout_clock_tree.rpt
report_area -detail > $_REPORTS_PATH/${DESIGN}/layout_area.rpt
report_timing -nworst 50 -late > $_REPORTS_PATH/${DESIGN}/layout_timing_setup.rpt
report_timing -nworst 50 -early > $_REPORTS_PATH/${DESIGN}/layout_timing_hold.rpt
report_messages > $_REPORTS_PATH/${DESIGN}/layout_messages.rpt
report_messages -suppressed > $_REPORTS_PATH/${DESIGN}/layout_messages_suppressed.rpt
report_summary -out_dir $_REPORTS_PATH/${DESIGN}/summary/
report_summary -no_html -out_file $_REPORTS_PATH/${DESIGN}/layout_summary.rpt

# time_design -post_route -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_timing_final
# time_design -post_route -hold -report_dir ${_REPORTS_PATH}/${DESIGN}/layout_timing_final_hold

# timing report for debug window
report_timing -output_format gtd -max_paths 10000 -max_slack 1.0 -path_exceptions all -late > ${_REPORTS_PATH}/${DESIGN}/timing_setup.mtarpt
report_timing -output_format gtd -max_paths 10000 -max_slack 1.0 -path_exceptions all -early > ${_REPORTS_PATH}/${DESIGN}/timing_hold.mtarpt

# netlist and sdf for post-layout simulation
write_netlist ${_OUTPUTS_PATH}/${DESIGN}_layout.v
write_sdf ${_OUTPUTS_PATH}/${DESIGN}_layout.sdf -gate_level_sim_model -recompute_delaycal -target_application verilog -cell_timing nochecks -precision 5

write_do_lec -log_file ${_REPORTS_PATH}/${DESIGN}/lec_layout.log -flat -verbose \
             -golden_design ${_OUTPUTS_PATH}/${DESIGN}_synth.v \
             -revised_design ${_OUTPUTS_PATH}/${DESIGN}_layout.v \
             ../../../${_OUTPUTS_PATH}/${DESIGN}_lec_layout.do \
             -write_session ${_OUTPUTS_PATH}/${DESIGN}_layout_lec.session
# GDSII
write_stream ${_OUTPUTS_PATH}/${DESIGN}.gds -map_file scripts/gds2.map -mode all

# Write database to restore session later
write_db -rc_extract -def ${_OUTPUTS_PATH}/${DESIGN}_layout.dat

puts "============================"
puts "Implementation Finished ...."
puts "============================"
