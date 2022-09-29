source scripts/common.tcl
set DESIGN $::env(CADENCE_DESIGN)

read_db -physical_data ${_OUTPUTS_PATH}/${DESIGN}.dat

gui_show
