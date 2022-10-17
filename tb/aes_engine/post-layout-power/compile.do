if {[file isdirectory work]} {file delete -force work};
vlib work

set a [open "input.files" r]
while {[ gets $a line] >=0} {
    vlog +define+SIM +acc -quiet -64 -work work $line
}

