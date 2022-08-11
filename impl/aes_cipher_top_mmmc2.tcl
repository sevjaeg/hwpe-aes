# Version:1.0 MMMC View Definition File
# Do Not Remove Above Line
create_rc_corner -name TSMC65G_rc -cap_table {/kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/techfiles/captable/cln65g+_1p07m+alrdl_rcworst_top1.captable} -T {25} -preRoute_res {1.0} -preRoute_cap {1.0} -preRoute_clkres {0.0} -preRoute_clkcap {0.0} -postRoute_res {1.0} -postRoute_cap {1.0} -postRoute_xcap {1.0} -postRoute_clkres {0.0} -postRoute_clkcap {0.0}
create_library_set -name TSMC65G_ls -timing {/kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplushpbwp_140a/tcbn65gplushpbwpbc0d88.lib}
create_constraint_mode -name TSMC65G_cm -sdc_files {aes_cipher_top.sdc}
create_delay_corner -name TSMC65G_dc -library_set {TSMC65G_ls} -rc_corner {TSMC65G_rc}
create_analysis_view -name TSMC65G_av -constraint_mode {TSMC65G_cm} -delay_corner {TSMC65G_dc}
set_analysis_view -setup {TSMC65G_av} -hold {TSMC65G_av}
