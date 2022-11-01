source scripts/common.tcl
set DESIGN $::env(CADENCE_DESIGN)

set_db power_output_dir ${_REPORTS_PATH}/${DESIGN}/power

read_db ${_OUTPUTS_PATH}/${DESIGN}_layout.dat

set_db power_vector_based_multithread true
set_db power_view TSMC65G_av_typ
set_db power_dynamic_power_view TSMC65G_av_typ
set_db power_method dynamic_vectorbased
# TODO vector_profile?

set_db power_worst_step_size 800ps
set_db power_default_frequency 625

if {$DESIGN == "mac_engine"} {
    
    read_activity_file -format VCD -scope test/dut/u1 -start 44.0 -end 27903.2 -block {} ../tb/aes_engine/post-layout-power/wave.vcd
} elseif {$DESIGN == "mac_top_wrap"} {
    read_activity_file -format VCD -scope tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/u1 -start 12158066.933 -end 12159769.045 -block {} ../sw/aes_hwpe/wave.vcd
}

# report_vector_profile -steps 800ps -detailed_report true -emulate_sdf true -out_file $_REPORTS_PATH/${DESIGN}/layout_power_vcd.rpt

set_db power_method vector_profile

report_power -format detailed -nworst 50 -time_based_report -time_unit ps -out_dir ${_REPORTS_PATH}/${DESIGN}/power -report_prefix layout_power_vector
