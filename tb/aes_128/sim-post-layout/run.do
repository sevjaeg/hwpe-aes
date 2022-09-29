do compile.do

vsim -sdfmax test/dut=../../../impl/out/aes_cipher_top_layout.sdf work.test -t ps
do wave.do
do sim.do
wave zoom full
