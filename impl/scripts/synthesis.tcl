puts "Host : [info hostname]"

##############################################################################
## Preset global variables and attributes
##############################################################################

include scripts/common.tcl
set DESIGN $::env(CADENCE_DESIGN)

set GEN_EFF medium
set MAP_OPT_EFF high
set DATE [clock format [clock seconds] -format "%b%d-%T"] 

set_db init_lib_search_path /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn65gplushpbwp_140a/
set_db script_search_path {. scripts}

set_db hdl_unconnected_value none

if {$DESIGN == "mac_top_wrap"} {
  # mac_top_wrap contains latches
  set_db hdl_error_on_latch 0
} else {
   set_db hdl_error_on_latch 1
}

set_db hdl_error_on_blackbox 1
set_db hdl_error_on_negedge 1

set_db information_level 9

suppress_messages {LBR-9 LBR-76 LBR-101 LBR-162 LBR-415 LBR-511 PHYS-12}

set_db hdl_track_filename_row_col true
set_db hdl_sv_module_wrapper true
# introduces slight area overhead, but keeps hierarchy
set_db auto_ungroup none

set_db lp_insert_clock_gating false
set_db design_process_node 65

###############################################################
## Library setup
###############################################################

read_mmmc mmmc.tcl

set_db lef_library /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/lef/tcbn65gplushpbwp_6lmT1.lef

####################################################################
## Load Design
####################################################################

include ${DESIGN}-hdl.tcl

elaborate $DESIGN
puts "Runtime & Memory after 'read_hdl'"
time_info Elaboration

init_design

check_design -all > $_REPORTS_PATH/${DESIGN}/check.rpt
check_timing_intent -verbose > $_REPORTS_PATH/${DESIGN}/check_timing.rpt

###################################################################################
## Define cost groups (clock-clock, clock-output, input-clock, input-output)
###################################################################################

if {[llength [all_registers]] > 0} { 
  define_cost_group -name I2C -design $DESIGN
  define_cost_group -name C2O -design $DESIGN
  define_cost_group -name C2C -design $DESIGN
  path_group -from [all_registers] -to [all_registers] -group C2C -name C2C -view TSMC65G_av_slow
  path_group -from [all_registers] -to [all_outputs] -group C2O -name C2O -view TSMC65G_av_slow
  path_group -from [all_inputs]  -to [all_registers] -group I2C -name I2C -view TSMC65G_av_slow
}

define_cost_group -name I2O -design $DESIGN
path_group -from [all_inputs]  -to [all_outputs] -group I2O -name I2O -view TSMC65G_av_slow

# foreach cg [vfind / -cost_group *] {
#   report_timing -group [list $cg] >> $_REPORTS_PATH/${DESIGN}/timing_pretim.rpt
# }

####################################################################################################
## Synthesizing to generic 
####################################################################################################

set_db syn_generic_effort $GEN_EFF
syn_generic
puts "Runtime & Memory after 'syn_generic'"
time_info GENERIC

write_snapshot -outdir $_REPORTS_PATH/${DESIGN} -tag 1_generic

####################################################################################################
## Synthesizing to gates
####################################################################################################

set_db syn_map_effort $MAP_OPT_EFF
syn_map
puts "Runtime & Memory after 'syn_map'"
time_info MAPPED

write_snapshot -outdir $_REPORTS_PATH/${DESIGN} -tag 2_map

# foreach cg [vfind / -cost_group *] {
#   report_timing -group [list $cg] >> $_REPORTS_PATH/${DESIGN}/timing_pretim.rpt
# }

#######################################################################################################
## Optimize netlist
#######################################################################################################

## Uncomment to remove assigns & insert tiehilo cells during Incremental synthesis
##set_attribute remove_assigns true
##set_remove_assign_options -buffer_or_inverter <libcell> -design <design|subdesign> 
##set_attribute use_tiehilo_for_const <none|duplicate|unique>

set_db syn_opt_effort $MAP_OPT_EFF
syn_opt

write_snapshot -outdir $_REPORTS_PATH/${DESIGN} -tag 3_final

puts "Runtime & Memory after 'syn_opt'"
time_info OPT

# foreach cg [vfind / -cost_group *] {
#   report_timing -group [list $cg] >> $_REPORTS_PATH/${DESIGN}/timing_pretim.rpt
# }

######################################################################################################
## write backend file set (verilog, config, etc.) and reports
######################################################################################################

write_design -innovus -base_name ${_OUTPUTS_PATH}/${DESIGN}/${DESIGN}

check_timing_intent -verbose > $_REPORTS_PATH/${DESIGN}/check_timing_final.rpt
report_timing -nworst 10 > $_REPORTS_PATH/${DESIGN}/timing.rpt
report_timing -unconstrained -nworst 10 > $_REPORTS_PATH/${DESIGN}/timing_unconstrained.rpt
report_area -detail > $_REPORTS_PATH/${DESIGN}/area.rpt
report_gates > $_REPORTS_PATH/${DESIGN}/gates.rpt
report_power > $_REPORTS_PATH/${DESIGN}/power.rpt
report_qor   > $_REPORTS_PATH/${DESIGN}/qor.rpt
report_dp    > $_REPORTS_PATH/${DESIGN}/datapath.rpt
report_summary -directory $_REPORTS_PATH/${DESIGN}/
report_messages -all > $_REPORTS_PATH/${DESIGN}/messages.rpt
report_messages -all -include_suppressed > $_REPORTS_PATH/${DESIGN}/messages_suppressed.rpt

if {$DESIGN != "aes_cipher_top"} {
  write_sv_wrapper -continue_on_error -module_name ${DESIGN}_genus -rename_module $DESIGN \
                   > ${_OUTPUTS_PATH}/${DESIGN}_synth_wrap.sv
  set DESIGN_LEC ${DESIGN}_genus
} else {
  set DESIGN_LEC ${DESIGN}
}
write_netlist  > ${_OUTPUTS_PATH}/${DESIGN}_synth.v

write_do_lec -logfile ../$_REPORTS_PATH/${DESIGN}/lec_synth.log \
             -sim_lib /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Front_End/verilog/tcbn65gplushpbwp_140a/tcbn65gplushpbwp.v \
             -golden_design rtl \
             -revised_design ${_OUTPUTS_PATH}/${DESIGN}_synth.v \
             -top ${DESIGN_LEC} -tmp_dir tmp/ \
             > ${_OUTPUTS_PATH}/${DESIGN}_lec_synth.do

puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"
