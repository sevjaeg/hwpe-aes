#### Template Script for RTL->Gate-Level Flow (generated from GENUS 19.14-s108_1) 

puts "Hostname : [info hostname]"

##############################################################################
## Preset global variables and attributes
##############################################################################

set DESIGN aes_cipher_top
set GEN_EFF medium
set MAP_OPT_EFF high
set DATE [clock format [clock seconds] -format "%b%d-%T"] 
set _OUTPUTS_PATH out
set _REPORTS_PATH reports
set _LOG_PATH logs
##set ET_WORKDIR <ET work directory>

set_db init_lib_search_path /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplushpbwp_140a/
set_db script_search_path scripts

set_db init_hdl_search_path /home/sjaeger/pulpissimo/ips/hwpe-mac-engine/rtl

##Default undriven/unconnected setting is 'none'.  
##set_db / .hdl_unconnected_value 0 | 1 | x | none

set_db hdl_error_on_blackbox 1
set_db hdl_error_on_latch 1

set_db information_level 9

###############################################################
## Library setup
###############################################################

# Read either MMMC or library

read_mmmc aes_mmmc.tcl

# read_libs tcbn65gplushpbwpwc.lib
set_db lef_library /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/lef/tcbn65gplushpbwp_6lmT1.lef

## Provide either cap_table_file or the qrc_tech_file
# set_attribute cap_table_file /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/techfiles/captable/cln65g+_1p06m+alrdl_rcworst_top1.captable /
#set_attribute qrc_tech_file <file> /
##generates <signal>_reg[<bit_width>] format
#set_attribute hdl_array_naming_style %s\[%d\] /  
##

set_db lp_insert_clock_gating false

####################################################################
## Load Design
####################################################################

read_hdl aes_sbox.v
read_hdl aes_rcon.v
read_hdl aes_key_expand_128.v
read_hdl aes_cipher_top.v

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

## Uncomment to remove already existing costgroups before creating new ones.
## rm [find /designs/* -cost_group *]

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
  report_timing -group [list $cg] >> $_REPORTS_PATH/${DESIGN}_pretim.rpt
}

#### To turn off sequential merging on the design 
#### uncomment & use the following attributes.
##set_attribute optimize_merge_flops false /
##set_attribute optimize_merge_latches false /
#### For a particular instance use attribute 'optimize_merge_seqs' to turn off sequential merging.


####################################################################################################
## Synthesizing to generic 
####################################################################################################

set_db syn_generic_effort $GEN_EFF
syn_generic
puts "Runtime & Memory after 'syn_generic'"
time_info GENERIC
write_snapshot -outdir $_REPORTS_PATH -tag generic
report_dp > $_REPORTS_PATH/generic/${DESIGN}_datapath.rpt
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
report_dp > $_REPORTS_PATH/map/${DESIGN}_datapath.rpt

foreach cg [vfind / -cost_group *] {
  report_timing -group [list $cg] >> $_REPORTS_PATH/${DESIGN}_pretim.rpt
}

## ungroup -threshold <value>

#######################################################################################################
## Optimize Netlist
#######################################################################################################

## Uncomment to remove assigns & insert tiehilo cells during Incremental synthesis
##set_attribute remove_assigns true /
##set_remove_assign_options -buffer_or_inverter <libcell> -design <design|subdesign> 
##set_attribute use_tiehilo_for_const <none|duplicate|unique> /
set_db syn_opt_effort $MAP_OPT_EFF
syn_opt
write_snapshot -outdir $_REPORTS_PATH -tag syn_opt
report_summary -directory $_REPORTS_PATH

puts "Runtime & Memory after 'syn_opt'"
time_info OPT

foreach cg [vfind / -cost_group *] {
  report_timing -group [list $cg] >> $_REPORTS_PATH/${DESIGN}_pretim.rpt
}

######################################################################################################
## write backend file set (verilog, SDC, config, etc.)
######################################################################################################

report_dp > $_REPORTS_PATH/${DESIGN}_datapath_incr.rpt
report_messages > $_REPORTS_PATH/${DESIGN}_messages.rpt
report_timing > $_REPORTS_PATH/${DESIGN}_timing.rpt
report_area > $_REPORTS_PATH/${DESIGN}_area.rpt
report_gates > $_REPORTS_PATH/${DESIGN}_gates.rpt
report_power > $_REPORTS_PATH/${DESIGN}_power.rpt
write_snapshot -outdir $_REPORTS_PATH -tag final
report_summary -directory $_REPORTS_PATH
write_netlist  > ${_OUTPUTS_PATH}/${DESIGN}_synth.v
# write_sdc > ${_OUTPUTS_PATH}/${DESIGN}_m.sdc


puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"

# gui_show
