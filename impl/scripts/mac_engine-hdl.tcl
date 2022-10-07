set_db init_hdl_search_path {../rtl ../wrap ../../hwpe-stream/rtl ../../hwpe-ctrl/rtl ./hdl}

read_hdl aes_sbox.v aes_rcon.v aes_key_expand_128.v aes_cipher_top.v
read_hdl -sv -define SYNTHESIS=1 hwpe_ctrl_package.sv hwpe_ctrl_interfaces.sv
read_hdl -sv -define SYNTHESIS=1 hwpe_stream_package.sv hwpe_stream_interfaces.sv
read_hdl -sv byte_stacker.sv byte_unstacker.sv mac_package.sv mac_engine.sv
