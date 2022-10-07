source scripts/common.tcl
set DESIGN $::env(CADENCE_DESIGN)

read_db ${_OUTPUTS_PATH}/${DESIGN}.dat
gui_show

set_layer_preference violation -is_visible 1

read_timing_debug_report -name setup_report ${_REPORTS_PATH}/${DESIGN}/timing_setup.mtarpt
