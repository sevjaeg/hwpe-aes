# Version:1.0 MMMC View Definition File
# Do Not Remove Above Line
create_library_set -name TSMC65G_ls -timing {/kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplushpbwp_140a/tcbn65gplushpbwpbc0d88.lib}
create_constraint_mode -name TSMC65G_cm -sdc_files {aes_cipher_top.sdc}
create_delay_corner -name TSMC65G_dc -library_set {TSMC65G_ls}
create_analysis_view -name TSMC65G_av -constraint_mode {TSMC65G_cm} -delay_corner {TSMC65G_dc}
set_analysis_view -setup {TSMC65G_av} -hold {TSMC65G_av}
