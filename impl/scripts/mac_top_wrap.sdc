set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

if {$::env(PNR) == 1} {
  set SDC_DESIGN $::env(CADENCE_DESIGN)_genus
} else {
  set SDC_DESIGN $::env(CADENCE_DESIGN)
}

current_design ${SDC_DESIGN}

set_operating_conditions _nominal_

create_clock -name "clock" -period 2.2 -waveform {0.0 1.1} [get_ports clk_i]
set_clock_transition 0.068 [get_clocks clock]
set_clock_latency  0.2 [get_clocks clock]
set_clock_uncertainty 0.04 [get_clocks clock]

# neglect reset as asynchronous
set_false_path -from [get_ports {rst_ni}]
# neglect latch
set_false_path -to [get_leaf_pins *i_regfile_latch/hwpe_ctrl_regfile_latch_i/MemContentxDP*d]
set_false_path -from [get_leaf_pins *i_regfile_latch/hwpe_ctrl_regfile_latch_i/MemContentxDP*q]
# -from [get_leaf_pins *i_regfile_latch/hwpe_ctrl_regfile_latch_i/MemContentx*d]

# Create input collection without clk and rst
set data_inputs [all_inputs]
set data_inputs [remove_from_collection [all_inputs] clk_i]

# Inputs
set_driving_cell -lib_cell BUFFD8HPBWP $data_inputs
set_input_delay -clock [get_clocks clock] -network_latency_included -add_delay -min 0.01 $data_inputs
set_input_delay -clock [get_clocks clock] -network_latency_included -add_delay -max 0.1 $data_inputs

# Outputs
set_load -pin_load -min 0.001 [all_outputs]
set_load -pin_load -max 0.01 [all_outputs]
set_output_delay -clock [get_clocks clock] -network_latency_included -add_delay -min 0.01 [all_outputs]
set_output_delay -clock [get_clocks clock] -network_latency_included -add_delay -max 0.1 [all_outputs]
