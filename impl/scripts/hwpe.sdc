set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

current_design mac_top_wrap

set_operating_conditions _nominal_

create_clock -name "clock" -period 3.0 -waveform {0.0 1.5} [get_ports clk_i]
set_clock_transition 0.1 [get_clocks clock]
set_clock_latency  0.15 [get_clocks clock]
set_clock_uncertainty 0.05 [get_clocks clock]

# Create input collection without clk
set inputs [all_inputs]
set inputs [remove_from_collection [all_inputs] clk_i]

# Inputs
set_driving_cell -lib_cell BUFFD8HPBWP [all_inputs]
set_input_delay -clock [get_clocks clock] -network_latency_included -add_delay -min 0.01 [all_inputs]
set_input_delay -clock [get_clocks clock] -network_latency_included -add_delay -max 0.1 [all_inputs]

# Outputs
set_load -pin_load -min 0.001 [all_outputs]
set_load -pin_load -max 0.01 [all_outputs]
set_output_delay -clock [get_clocks clock] -network_latency_included -add_delay -min 0.01 [all_outputs]
set_output_delay -clock [get_clocks clock] -network_latency_included -add_delay -max 0.1 [all_outputs]
