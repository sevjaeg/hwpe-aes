set_db init_hdl_search_path {../rtl ../wrap ../../hwpe-stream/rtl ../../hwpe-stream/rtl/basic ../../hwpe-stream/rtl/fifo \
                             ../../hwpe-stream/rtl/streamer ../../hwpe-stream/rtl/tcdm ../../hwpe-ctrl/rtl ./hdl}

read_hdl aes_sbox.v aes_rcon.v aes_key_expand_128.v aes_cipher_top.v
read_hdl -sv cluster_clock_gating.sv
read_hdl -sv -define SYNTHESIS=1 hwpe_ctrl_package.sv hwpe_ctrl_interfaces.sv hwpe_ctrl_regfile.sv hwpe_ctrl_regfile_latch.sv \
             hwpe_ctrl_regfile_latch_test_wrap.sv hwpe_ctrl_seq_mult.sv hwpe_ctrl_slave.sv hwpe_ctrl_uloop.sv
read_hdl -sv -define SYNTHESIS=1 hwpe_stream_package.sv hwpe_stream_assign.sv hwpe_stream_buffer.sv hwpe_stream_demux_static.sv \
             hwpe_stream_deserialize.sv hwpe_stream_fence.sv hwpe_stream_merge.sv hwpe_stream_mux_static.sv \
             hwpe_stream_serialize.sv hwpe_stream_split.sv hwpe_stream_fifo.sv hwpe_stream_fifo_ctrl.sv \
             hwpe_stream_fifo_earlystall.sv hwpe_stream_fifo_earlystall_sidech.sv hwpe_stream_fifo_scm.sv \
             hwpe_stream_fifo_scm_test_wrap.sv hwpe_stream_fifo_sidech.sv hwpe_stream_interfaces.sv hwpe_stream_addressgen.sv \
             hwpe_stream_addressgen_v2.sv hwpe_stream_addressgen_v3.sv hwpe_stream_sink.sv hwpe_stream_sink_realign.sv \
             hwpe_stream_source.sv hwpe_stream_source_realign.sv hwpe_stream_strbgen.sv hwpe_stream_streamer_queue.sv \
             hwpe_stream_tcdm_assign.sv hwpe_stream_tcdm_fifo.sv hwpe_stream_tcdm_fifo_load.sv \
             hwpe_stream_tcdm_fifo_load_sidech.sv hwpe_stream_tcdm_fifo_store.sv hwpe_stream_tcdm_mux.sv \
             hwpe_stream_tcdm_mux_static.sv hwpe_stream_tcdm_reorder.sv hwpe_stream_tcdm_reorder_static.sv
read_hdl -sv byte_stacker.sv byte_unstacker.sv mac_package.sv mac_ctrl.sv mac_fsm.sv mac_streamer.sv mac_engine.sv mac_top.sv
read_hdl -sv mac_top_wrap.sv
