restart -f
run 11500 us

add wave -r sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/*
run -all
quit -sim

# This workaround is required as the vcd add -r command causes crashes with the mac_top_wrap module
# As the .vcd is > 1GB be patient
wlf2vcd -o ../../wave.vcd vsim.wlf
