source scripts/common.tcl
set DESIGN $::env(CADENCE_DESIGN)

set_db power_output_dir ${_REPORTS_PATH}/${DESIGN}/power

read_db ${_OUTPUTS_PATH}/${DESIGN}_layout.dat

set_db power_vector_based_multithread true
set_db power_view TSMC65G_av_typ
set_db power_dynamic_power_view TSMC65G_av_typ
set_db power_method dynamic_vectorbased

if {$DESIGN == "mac_engine"} {
    set_db power_worst_step_size 800ps
    set_db power_default_frequency 625

    ## Pipelined operation (1024 encryptions) - only select one
    read_activity_file -format VCD -scope test/dut/u1 -start 44.0 -end 27903.2 -block {} ../tb/aes_engine/post-layout-power/wave.vcd
    
    ## Single encryption - only select one
    # read_activity_file -format VCD -scope test/dut/u1 -start 5.6 -end 39.2 -block {} ../tb/aes_engine/post-layout-power/wave.vcd
} elseif {$DESIGN == "mac_top_wrap"} {
    # Note that the RTL simulation is running at 50 MHz
    set_db power_worst_step_size 10ns
    set_db power_default_frequency 50
    read_activity_file -format VCD -scope tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/u1 -start 11567537.471 -end 11569457.655  -block {} ../sw/aes_hwpe/wave.vcd
}

set_db power_method vector_profile

report_power -format detailed -nworst 50 -time_based_report -time_unit ps -out_dir ${_REPORTS_PATH}/${DESIGN}/power -report_prefix layout_power_vector
