# Supported entities: aes_cipher_top, mac_engine, mac_top_wrap
DESIGN := mac_engine

# TODO aes post-layout violation?

# TODO get rid of timingReports, left-over reports
# TODO re-check impl warnings

# TODO fix hwpe timing
# TODO energy consumption

# TODO post-layout tb mac engine
# TODO fix sdc error

# Note: mac_top_wrap does not pass post-synthesis simulation (likely due to an issue with the register file latch)

RTL_DIR := ../rtl
LOG_DIR := logs
SCRIPT_DIR := scripts
OUT_DIR := out
REPORT_DIR := reports
TMP_DIR := tmp

COMMON_SCRIPTS := \
	$(SCRIPT_DIR)/common.tcl \
	$(SCRIPT_DIR)/$(DESIGN).sdc \
	$(SCRIPT_DIR)/mmmc.tcl
HDL_SCRIPT := $(SCRIPT_DIR)/$(DESIGN)-hdl.tcl
SYN_SCRIPT := $(SCRIPT_DIR)/synthesis.tcl
PNR_SCRIPT := $(SCRIPT_DIR)/implementation.tcl

ifeq ($(DESIGN), aes_cipher_top)
SRC_FILES := \
	$(RTL_DIR)/aes_sbox.v \
	$(RTL_DIR)/aes_rcon.v \
	$(RTL_DIR)/aes_key_expand_128.v \
	$(RTL_DIR)/aes_cipher_top.v
else
ifeq ($(DESIGN), mac_top_wrap)
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
	# Note: files in hwpe-ctrl and hwpe-stream are not considered here
else
ifeq ($(DESIGN), mac_engine)
SRC_FILES := \
	$(RTL_DIR)/aes_sbox.v \
	$(RTL_DIR)/aes_rcon.v \
	$(RTL_DIR)/aes_key_expand_128.v \
	$(RTL_DIR)/aes_cipher_top.v \
	$(RTL_DIR)/byte_stacker.sv \
	$(RTL_DIR)/byte_unstacker.sv \
	$(RTL_DIR)/mac_package.sv \
	$(RTL_DIR)/mac_engine.sv
else
$(error Invalid design $(DESIGN). Use aes_cipher_top or mac_top_wrap)
endif
endif
endif

all: pnr

.synth-$(DESIGN).timestamp: $(SRC_FILES) $(COMMON_SCRIPTS) $(SYN_SCRIPT) $(HDL_SCRIPT)
	export CADENCE_DESIGN=$(DESIGN) && genus -batch -log ./$(LOG_DIR)/genus -files $(SYN_SCRIPT)
	@ # genus generates unsigned int params, however Questa demands int unsigned
	if [ -a $(OUT_DIR)/${DESIGN}_synth_wrap.sv ]; then sed -i 's/unsigned int/int unsigned/g' $(OUT_DIR)/${DESIGN}_synth_wrap.sv; fi;
	touch .synth-$(DESIGN).timestamp

.pnr-$(DESIGN).timestamp: $(COMMON_SCRIPTS) $(PNR_SCRIPT) .synth-$(DESIGN).timestamp
	export CADENCE_DESIGN=$(DESIGN) && innovus -stylus -no_gui -batch -log ./$(LOG_DIR)/innovus \
																						 -files $(PNR_SCRIPT)
	rm $(REPORT_DIR)/$(DESIGN)/*.rpt.old
	touch .pnr-$(DESIGN).timestamp

synth: logdir .synth-$(DESIGN).timestamp

synth-gui: synth
	export CADENCE_DESIGN=$(DESIGN) && genus -log ./$(LOG_DIR)/genus -f $(OUT_DIR)/$(DESIGN)/$(DESIGN).genus_setup.tcl \
																		 -f $(SCRIPT_DIR)/genus_gui.tcl

pnr: logdir .pnr-$(DESIGN).timestamp

# pnr
pnr-gui: 
	export CADENCE_DESIGN=$(DESIGN) && innovus -stylus -log ./$(LOG_DIR)/innovus -files $(SCRIPT_DIR)/innovus_gui.tcl

check-synth: synth
	lec -XL -NOGui -Color -Dofile $(OUT_DIR)/$(DESIGN)_lec_synth.do

# TODO generate
# pnr
check-pnr: $(SCRIPT_DIR)/aes_lec_pnr.do
	lec -XL -NOGui -Color -Dofile scripts/aes_lec_pnr.do

sta:
	export CADENCE_DESIGN=$(DESIGN) && tempus -stylus -log $(LOG_DIR)/tempus -files $(SCRIPT_DIR)/sta.tcl

logdir:
	mkdir -p $(LOG_DIR)

clean-tools:
	rm -rf genus.* innovus.* .cadence
	rm -f *.old
	rm -f scheduling_file.cts.*
	rm -rf .st_launch_*
	rm -f *.conn.rpt *.metalfill.rpt power.rpt
	rm -rf $(LOG_DIR) mp_data
	rm -rf genus2invs_*
	rm -rf rtl_*_db
	rm -rf timingReports checkDesign
	
clean: clean-tools	
	rm -rf fv fv*/
	rm -rf $(OUT_DIR) $(REPORT_DIR) $(TMP_DIR)
	rm -f .*.timestamp .*.tstamp
	
.PHONY: all clean clean-tools synth synth-gui pnr pnr-gui logdir
