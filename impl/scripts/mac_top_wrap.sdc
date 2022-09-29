set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

current_design mac_top_wrap

set_operating_conditions _nominal_

create_clock -name "clock" -period 2.4 -waveform {0.0 1.2} [get_ports clk_i]
set_clock_transition 0.055 [get_clocks clock]
set_clock_latency  0.07 [get_clocks clock]
set_clock_uncertainty 0.02 [get_clocks clock]

set_false_path -from [get_ports {rst_ni}]

# Create input collection without clk and rst
set data_inputs [all_inputs]
set data_inputs [remove_from_collection [all_inputs] clk_i]
# neglect reset as asynchronous
# set data_inputs [remove_from_collection $data_inputs rst_ni]

# Inputs
set_driving_cell -lib_cell BUFFD8HPBWP $data_inputs
set_input_delay -clock [get_clocks clock] -network_latency_included -add_delay -min 0.01 $data_inputs
set_input_delay -clock [get_clocks clock] -network_latency_included -add_delay -max 0.1 $data_inputs

# Outputs
set_load -pin_load -min 0.001 [all_outputs]
set_load -pin_load -max 0.01 [all_outputs]
set_output_delay -clock [get_clocks clock] -network_latency_included -add_delay -min 0.01 [all_outputs]
set_output_delay -clock [get_clocks clock] -network_latency_included -add_delay -max 0.1 [all_outputs]
