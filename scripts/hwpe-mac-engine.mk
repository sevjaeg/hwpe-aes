#
# Copyright (C) 2016 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

IP=hwpe_mac_engine
IP_PATH=$(IPS_PATH)/hwpe-mac-engine
LIB_NAME=$(IP)_lib

include vcompile/build.mk

.PHONY: vcompile-$(IP) vcompile-subip-hw-mac-engine 

vcompile-$(IP): $(LIB_PATH)/_vmake

$(LIB_PATH)/_vmake : $(LIB_PATH)/hw-mac-engine.vmake 
	@touch $(LIB_PATH)/_vmake


# hw-mac-engine component
INCDIR_HW-MAC-ENGINE=+incdir+$(IP_PATH)/rtl
SRC_SVLOG_HW-MAC-ENGINE=\
	$(IP_PATH)/rtl/aes_sbox.v\
	$(IP_PATH)/rtl/aes_rcon.v\
	$(IP_PATH)/rtl/aes_key_expand_128.v\
	$(IP_PATH)/rtl/aes_cipher_top.v\
	$(IP_PATH)/rtl/word_stacker.sv\
	$(IP_PATH)/rtl/word_unstacker.sv\
	$(IP_PATH)/rtl/mac_package.sv\
	$(IP_PATH)/rtl/mac_fsm.sv\
	$(IP_PATH)/rtl/mac_ctrl.sv\
	$(IP_PATH)/rtl/mac_streamer.sv\
	$(IP_PATH)/rtl/mac_engine.sv\
	$(IP_PATH)/rtl/mac_top.sv\
	$(IP_PATH)/wrap/mac_top_wrap.sv
	# post synthesis mac_engine
	# $(IP_PATH)/rtl/mac_package.sv\
	# $(IP_PATH)/impl/out/mac_engine_synth.v \
	# $(IP_PATH)/impl/out/mac_engine_synth_wrap.sv \
	# $(IP_PATH)/impl/hdl/tcbn65gplushpbwp.v \
	# $(IP_PATH)/rtl/mac_fsm.sv\
	# $(IP_PATH)/rtl/mac_ctrl.sv\
	# $(IP_PATH)/rtl/mac_streamer.sv\
	# $(IP_PATH)/rtl/mac_top.sv\
	# $(IP_PATH)/wrap/mac_top_wrap.sv
	# post synthesis mac_top - not working
	# $(IP_PATH)/impl/out/mac_top_wrap_synth.v \
	# $(IP_PATH)/impl/out/mac_top_wrap_synth_wrap.sv \
	# $(IP_PATH)/impl/hdl/tcbn65gplushpbwp.v
	# behavioural
	# $(IP_PATH)/rtl/aes_sbox.v\
	# $(IP_PATH)/rtl/aes_rcon.v\
	# $(IP_PATH)/rtl/aes_key_expand_128.v\
	# $(IP_PATH)/rtl/aes_cipher_top.v\
	# $(IP_PATH)/rtl/word_stacker.sv\
	# $(IP_PATH)/rtl/word_unstacker.sv\
	# $(IP_PATH)/rtl/mac_package.sv\
	# $(IP_PATH)/rtl/mac_fsm.sv\
	# $(IP_PATH)/rtl/mac_ctrl.sv\
	# $(IP_PATH)/rtl/mac_streamer.sv\
	# $(IP_PATH)/rtl/mac_engine.sv\
	# $(IP_PATH)/rtl/mac_top.sv\
	# $(IP_PATH)/wrap/mac_top_wrap.sv
SRC_VHDL_HW-MAC-ENGINE=

vcompile-subip-hw-mac-engine: $(LIB_PATH)/hw-mac-engine.vmake

$(LIB_PATH)/hw-mac-engine.vmake: $(SRC_SVLOG_HW-MAC-ENGINE) $(SRC_VHDL_HW-MAC-ENGINE)
	$(call subip_echo,hw-mac-engine)
	$(SVLOG_CC) -work $(LIB_PATH)  -L hwpe_ctrl_lib -L hwpe_stream_lib -suppress 2583 -suppress 13314 $(INCDIR_HW-MAC-ENGINE) $(SRC_SVLOG_HW-MAC-ENGINE)

	@touch $(LIB_PATH)/hw-mac-engine.vmake

