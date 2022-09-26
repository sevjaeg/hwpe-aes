set log file logs/hwpe_lec.log -replace
read library /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME/digital/Front_End/verilog/tcbn65gplushpbwp_140a/tcbn65gplushpbwp.v -verilog

# TODO
read design ../rtl/aes_sbox.v ../rtl/aes_rcon.v ../rtl/aes_key_expand_128.v ../rtl/aes_cipher_top.v \
 ../rtl/byte_stacker.sv ./rtl/byte_unstacker.sv -verilog -golden
read design out/mac_top_wrapper_synth.v -verilog -revised

add pin constraints 1 ld -both

set system mode lec
add compare point -all
compare
report verification > reports/hwpe_lec.rpt
exit -f
