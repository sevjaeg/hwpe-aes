# Version:1.0 MMMC View Definition File
# Do Not Remove Above Line

create_library_set -name TSMC65G_ls_typ -timing {/kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplushpbwp_140a/tcbn65gplushpbwptc.lib}
create_library_set -name TSMC65G_ls_slow -timing {/kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplushpbwp_140a/tcbn65gplushpbwpwc.lib}
create_library_set -name TSMC65G_ls_fast -timing {/kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplushpbwp_140a/tcbn65gplushpbwpbc.lib}

create_opcond -name TSMC65G_op_slow -process 1 -voltage 0.9 -temperature 125
create_opcond -name TSMC65G_op_typ -process 1 -voltage 1.0 -temperature 25
create_opcond -name TSMC65G_op_fast -process 1 -voltage 1.1 -temperature 0

create_timing_condition -name TSMC65G_tc_slow -opcond TSMC65G_op_slow -library_sets {TSMC65G_ls_slow}
create_timing_condition -name TSMC65G_tc_typ -opcond TSMC65G_op_typ -library_sets {TSMC65G_ls_typ}
create_timing_condition -name TSMC65G_tc_fast -opcond TSMC65G_op_fast -library_sets {TSMC65G_ls_fast}

create_rc_corner -name TSMC65G_rc_worst -cap_table {/kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/techfiles/captable/cln65g+_1p06m+alrdl_rcworst_top1.captable} -pre_route_res {1.0} -pre_route_cap {1.0} -pre_route_clock_res {0.0} -pre_route_clock_cap {0.0} -post_route_res {1.0} -post_route_cap {1.0} -post_route_cross_cap {1.0} -post_route_clock_res {0.0} -post_route_clock_cap {0.0}
create_rc_corner -name TSMC65G_rc_typ -cap_table {/kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/techfiles/captable/cln65g+_1p06m+alrdl_typical_top1.captable} -pre_route_res {1.0} -pre_route_cap {1.0} -pre_route_clock_res {0.0} -pre_route_clock_cap {0.0} -post_route_res {1.0} -post_route_cap {1.0} -post_route_cross_cap {1.0} -post_route_clock_res {0.0} -post_route_clock_cap {0.0}
create_rc_corner -name TSMC65G_rc_best -cap_table {/kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/techfiles/captable/cln65g+_1p06m+alrdl_rcbest_top1.captable} -pre_route_res {1.0} -pre_route_cap {1.0} -pre_route_clock_res {0.0} -pre_route_clock_cap {0.0} -post_route_res {1.0} -post_route_cap {1.0} -post_route_cross_cap {1.0} -post_route_clock_res {0.0} -post_route_clock_cap {0.0}

create_delay_corner -name TSMC65G_dc_slow -timing_condition TSMC65G_tc_slow -rc_corner {TSMC65G_rc_worst}
create_delay_corner -name TSMC65G_dc_typ -timing_condition TSMC65G_tc_typ -rc_corner {TSMC65G_rc_typ}
create_delay_corner -name TSMC65G_dc_fast -timing_condition TSMC65G_tc_fast -rc_corner {TSMC65G_rc_best}

create_constraint_mode -name TSMC65G_cm -sdc_files {aes.sdc}

create_analysis_view -name TSMC65G_av_slow -constraint_mode {TSMC65G_cm} -delay_corner {TSMC65G_dc_slow}
create_analysis_view -name TSMC65G_av_typ -constraint_mode {TSMC65G_cm} -delay_corner {TSMC65G_dc_typ}
create_analysis_view -name TSMC65G_av_fast -constraint_mode {TSMC65G_cm} -delay_corner {TSMC65G_dc_fast}

set_analysis_view -setup {TSMC65G_av_slow TSMC65G_av_typ TSMC65G_av_fast} -hold {TSMC65G_av_slow TSMC65G_av_typ TSMC65G_av_fast}
