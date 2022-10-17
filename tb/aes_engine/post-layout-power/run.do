do compile.do

vsim -sdfmax test/dut/u1=../../../impl/out/mac_engine_layout.sdf work.test -t ps
do wave.do
do vcd.do
do sim.do

wave zoom full
