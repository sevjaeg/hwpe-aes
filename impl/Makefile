DESIGN := aes_cipher_top

RTL_DIR := ../rtl
LOG_DIR := logs
SCRIPT_DIR := scripts
OUT_DIR := out

SRC_FILES := \
	$(RTL_DIR)/aes_sbox.v \
    $(RTL_DIR)/aes_rcon.v \
    $(RTL_DIR)/aes_key_expand_128.v \
    $(RTL_DIR)/aes_cipher_top.v \
    $(RTL_DIR)/byte_stacker.sv \
    $(RTL_DIR)/byte_unstacker.sv \
    $(RTL_DIR)/mac_package.sv \
    $(RTL_DIR)/mac_fsm.sv \
    $(RTL_DIR)/mac_ctrl.sv \
    $(RTL_DIR)/mac_streamer.sv \
    $(RTL_DIR)/mac_engine.sv \
    $(RTL_DIR)/mac_top.sv

COMMON_SCRIPTS := \
	$(SCRIPT_DIR)/common.tcl \
	$(SCRIPT_DIR)/aes.sdc \
	$(SCRIPT_DIR)/aes_mmmc.tcl

SYN_SCRIPT := $(SCRIPT_DIR)/aes_syn.tcl
PNR_SCRIPT := $(SCRIPT_DIR)/aes_impl.tcl

all: pnr

.synth.timestamp: $(SRC_FILES) $(COMMON_SCRIPTS) $(SYN_SCRIPT)
	genus -batch -log ./$(LOG_DIR)/genus -files $(SYN_SCRIPT)
	touch .synth.timestamp

.pnr.timestamp: $(COMMON_SCRIPTS) $(PNR_SCRIPT) .synth.timestamp
	innovus -stylus -no_gui -batch -log ./$(LOG_DIR)/innovus -files $(PNR_SCRIPT)
	touch .pnr.timestamp

synth: logdir .synth.timestamp

synth-gui: synth
	genus -log ./$(LOG_DIR)/genus -f $(OUT_DIR)/$(DESIGN).genus_setup.tcl -f $(SCRIPT_DIR)/gui_show.tcl

pnr: logdir .pnr.timestamp

pnr-gui: pnr
	innovus -stylus -log ./$(LOG_DIR)/innovus -files $(SCRIPT_DIR)/innovus_gui.tcl

check-synth: .synth.timestamp $(SCRIPT_DIR)/aes_lec.do
	lec -XL -NOGui -Color -Dofile scripts/aes_lec.do

logdir:
	mkdir -p $(LOG_DIR)

clean:
	rm -rf genus.* innovus.* .cadence
	rm -rf fv $(LOG_DIR) out reports mp_data
	rm -rf timingReports checkDesign
	rm -rf genus2invs_*
	rm -f .*.timestamp .*.tstamp
	rm -f *.rpt *.rpt.old
	rm -f *.metalfill.rpt *.metalfill.rpt.old
	rm -f viafill.density.rpt viafill.density.rpt.old

.PHONY: all clean synth synth-gui pnr pnr-gui check-synth logdir
