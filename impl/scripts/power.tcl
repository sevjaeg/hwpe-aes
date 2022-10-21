source scripts/common.tcl
set DESIGN $::env(CADENCE_DESIGN)

set_db power_output_dir ${_REPORTS_PATH}/${DESIGN}/power

read_db ${_OUTPUTS_PATH}/${DESIGN}_layout.dat

set_db power_vector_based_multithread true
set_db power_view TSMC65G_av_typ
set_db power_dynamic_power_view TSMC65G_av_typ
set_db power_method dynamic_vectorbased
# vector_profile?
set_db power_worst_step_size 800ps
set_db power_default_frequency 625

read_activity_file -format VCD -scope test/dut/u1 -start 5.6 -end 108.0 -block {} ../tb/aes_engine/post-layout-power/wave.vcd
# report_vector_profile -steps 800ps -detailed_report true -emulate_sdf true -out_file $_REPORTS_PATH/${DESIGN}/layout_power_vcd.rpt

set_db power_method vector_profile

report_power -format detailed -nworst 50 -time_based_report -time_unit ps -out_dir ${_REPORTS_PATH}/${DESIGN}/power -report_prefix layout_power_vector
