onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -position insertpoint -group TOP sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/*
add wave -position insertpoint -group ENGINE sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/i_engine/*
add wave -position insertpoint -group ENGINE/U1 sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/i_engine/u1/*
add wave -position insertpoint -group ENGINE/U1/AES sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/i_engine/u1/i_aes/*
add wave -position insertpoint -group ENGINE/U1/STACK_WORD sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/i_engine/u1/stack_word/*
add wave -position insertpoint -group ENGINE/U1/STACK_KEY sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/i_engine/u1/stack_key/*
add wave -position insertpoint -group ENGINE/U1/UNSTACK sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/i_engine/u1/unstack/*
add wave -position insertpoint -group A_I sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/a/*
add wave -position insertpoint -group B_I sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/b/*
add wave -position insertpoint -group D_O  sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/d/*
add wave -position insertpoint -group CTRL sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/i_ctrl/*
add wave -position insertpoint -group CTRL/FSM sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/i_ctrl/i_fsm/*
add wave -position insertpoint -group CTRL/SLAVE sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/i_ctrl/i_slave/*
add wave -position insertpoint -group CTRL/ULOOP sim:/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/i_mac_top/i_ctrl/i_uloop/*
update
