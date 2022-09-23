#### Template Script for RTL->Gate-Level Flow (generated from GENUS 19.14-s108_1) 

puts "Hostname : [info hostname]"

##############################################################################
## Preset global variables and attributes
##############################################################################

include scripts/common.tcl
set DESIGN aes_cipher_top

set GEN_EFF medium
set MAP_OPT_EFF high
set DATE [clock format [clock seconds] -format "%b%d-%T"] 

set_db init_lib_search_path /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplushpbwp_140a/
set_db script_search_path {. scripts}

set_db init_hdl_search_path /home/sjaeger/pulpissimo/ips/hwpe-mac-engine/rtl

##Default undriven/unconnected setting is 'none'.  
##set_db / .hdl_unconnected_value 0 | 1 | x | none

set_db hdl_error_on_blackbox 1
set_db hdl_error_on_latch 1

set_db information_level 9

###############################################################
## Library setup
###############################################################

read_mmmc tsmc-mmmc.tcl

set_db lef_library /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/lef/tcbn65gplushpbwp_6lmT1.lef

set_db lp_insert_clock_gating false

####################################################################
## Load Design
####################################################################

read_hdl aes_sbox.v aes_rcon.v aes_key_expand_128.v aes_cipher_top.v

elaborate $DESIGN
puts "Runtime & Memory after 'read_hdl'"
time_info Elaboration

init_design

check_design -unresolved
check_design -all

check_timing_intent -verbose

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
foreach cg [vfind / -cost_group *] {
  # report_timing -group [list $cg] >> $_REPORTS_PATH/${DESIGN}_pretim.rpt
}

####################################################################################################
## Synthesizing to generic 
####################################################################################################

set_db syn_generic_effort $GEN_EFF
syn_generic
puts "Runtime & Memory after 'syn_generic'"
time_info GENERIC
write_snapshot -outdir $_REPORTS_PATH -tag generic
report_summary -directory $_REPORTS_PATH

####################################################################################################
## Synthesizing to gates
####################################################################################################

set_db syn_map_effort $MAP_OPT_EFF
syn_map
puts "Runtime & Memory after 'syn_map'"
time_info MAPPED
write_snapshot -outdir $_REPORTS_PATH -tag map
report_summary -directory $_REPORTS_PATH

foreach cg [vfind / -cost_group *] {
  report_timing -group [list $cg] >> $_REPORTS_PATH/${DESIGN}_pretim.rpt
}

#######################################################################################################
## Optimize Netlist
#######################################################################################################

## Uncomment to remove assigns & insert tiehilo cells during Incremental synthesis
##set_attribute remove_assigns true /
##set_remove_assign_options -buffer_or_inverter <libcell> -design <design|subdesign> 
##set_attribute use_tiehilo_for_const <none|duplicate|unique> /
set_db syn_opt_effort $MAP_OPT_EFF
syn_opt
write_snapshot -outdir $_REPORTS_PATH -tag final
report_summary -directory $_REPORTS_PATH

puts "Runtime & Memory after 'syn_opt'"
time_info OPT

foreach cg [vfind / -cost_group *] {
  report_timing -group [list $cg] >> $_REPORTS_PATH/${DESIGN}_pretim.rpt
}

######################################################################################################
## write backend file set (verilog, SDC, config, etc.) and reports
######################################################################################################

report_messages > $_REPORTS_PATH/${DESIGN}_messages.rpt
report_timing > $_REPORTS_PATH/${DESIGN}_timing.rpt
report_area > $_REPORTS_PATH/${DESIGN}_area.rpt
report_gates > $_REPORTS_PATH/${DESIGN}_gates.rpt
report_power > $_REPORTS_PATH/${DESIGN}_power.rpt
report_dp > $_REPORTS_PATH/${DESIGN}_datapath.rpt

write_netlist  > ${_OUTPUTS_PATH}/${DESIGN}_synth.v
write_design -innovus -base_name ${_OUTPUTS_PATH}/${DESIGN}

puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"
