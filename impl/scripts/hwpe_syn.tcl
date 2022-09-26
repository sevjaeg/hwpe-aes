#### Template Script for RTL->Gate-Level Flow (generated from GENUS 19.14-s108_1) 

puts "Hostname : [info hostname]"

##############################################################################
## Preset global variables and attributes
##############################################################################

include scripts/common.tcl
set DESIGN mac_top_wrap

set GEN_EFF medium
set MAP_OPT_EFF high
set DATE [clock format [clock seconds] -format "%b%d-%T"] 

set_db init_lib_search_path /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplushpbwp_140a/
set_db script_search_path {. scripts}

set_db init_hdl_search_path {../rtl ../wrap ../../hwpe-stream/rtl ../../hwpe-stream/rtl/basic ../../hwpe-stream/rtl/fifo ../../hwpe-stream/rtl/streamer ../../hwpe-stream/rtl/tcdm ../../hwpe-ctrl/rtl ./hdl}

##Default undriven/unconnected setting is 'none'.  
##set_db / .hdl_unconnected_value 0 | 1 | x | none

# design contains latches
set_db hdl_error_on_latch 0
set_db hdl_error_on_blackbox 1
set_db hdl_error_on_negedge 1

set_db hdl_track_filename_row_col true

set_db information_level 9

###############################################################
## Library setup
###############################################################

read_mmmc hwpe-mmmc.tcl

set_db lef_library /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/lef/tcbn65gplushpbwp_6lmT1.lef

set_db lp_insert_clock_gating false
set_db design_process_node 65

####################################################################
## Load Design
####################################################################

read_hdl aes_sbox.v aes_rcon.v aes_key_expand_128.v aes_cipher_top.v
read_hdl -sv cluster_clock_gating.sv
read_hdl -sv hwpe_ctrl_package.sv hwpe_ctrl_interfaces.sv hwpe_ctrl_regfile.sv hwpe_ctrl_regfile_latch.sv  hwpe_ctrl_regfile_latch_test_wrap.sv hwpe_ctrl_seq_mult.sv hwpe_ctrl_slave.sv hwpe_ctrl_uloop.sv
read_hdl -sv hwpe_stream_package.sv hwpe_stream_assign.sv hwpe_stream_buffer.sv hwpe_stream_demux_static.sv hwpe_stream_deserialize.sv hwpe_stream_fence.sv hwpe_stream_merge.sv hwpe_stream_mux_static.sv hwpe_stream_serialize.sv hwpe_stream_split.sv hwpe_stream_fifo.sv hwpe_stream_fifo_ctrl.sv hwpe_stream_fifo_earlystall.sv hwpe_stream_fifo_earlystall_sidech.sv hwpe_stream_fifo_scm.sv hwpe_stream_fifo_scm_test_wrap.sv hwpe_stream_fifo_sidech.sv hwpe_stream_interfaces.sv hwpe_stream_addressgen.sv hwpe_stream_addressgen_v2.sv hwpe_stream_addressgen_v3.sv hwpe_stream_sink.sv hwpe_stream_sink_realign.sv hwpe_stream_source.sv hwpe_stream_source_realign.sv hwpe_stream_strbgen.sv hwpe_stream_streamer_queue.sv hwpe_stream_tcdm_assign.sv hwpe_stream_tcdm_fifo.sv hwpe_stream_tcdm_fifo_load.sv hwpe_stream_tcdm_fifo_load_sidech.sv hwpe_stream_tcdm_fifo_store.sv hwpe_stream_tcdm_mux.sv hwpe_stream_tcdm_mux_static.sv hwpe_stream_tcdm_reorder.sv hwpe_stream_tcdm_reorder_static.sv
read_hdl -sv byte_stacker.sv byte_unstacker.sv mac_package.sv mac_ctrl.sv mac_fsm.sv mac_streamer.sv mac_engine.sv mac_top.sv mac_top_wrap.sv

elaborate $DESIGN
puts "Runtime & Memory after 'read_hdl'"
time_info Elaboration

set_db auto_ungroup none

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
