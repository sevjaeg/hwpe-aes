# Supported entities: 
# mac_top_wrap (full HWPE)
# mac_engine (HWPE datapath)
# aes_cipher_top (aes engine)
DESIGN := mac_top_wrap

TECHLIB_DIR := /kits/tsmc/65nm/GP_stclib/10-track/tcbn65gplushpbwp-set/tcbn65gplushpbwp_140a_FE/TSMCHOME

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
	$(RTL_DIR)/word_stacker.sv \
	$(RTL_DIR)/word_unstacker.sv \
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
	$(RTL_DIR)/word_stacker.sv \
	$(RTL_DIR)/word_unstacker.sv \
	$(RTL_DIR)/mac_package.sv \
	$(RTL_DIR)/mac_engine.sv
else
$(error Invalid design $(DESIGN). Use aes_cipher_top, mac_engine, or mac_top_wrap)
endif
endif
endif

all: pnr

.synth-$(DESIGN).timestamp: $(SRC_FILES) $(COMMON_SCRIPTS) $(SYN_SCRIPT) $(HDL_SCRIPT)
	export CADENCE_DESIGN=$(DESIGN) && export TECHLIB_DIR=$(TECHLIB_DIR) && export PNR=0 && genus -batch -log ./$(LOG_DIR)/$(DESIGN)_genus -files $(SYN_SCRIPT)
	@ # genus generates unsigned int params, however Questa demands int unsigned
	if [ -a $(OUT_DIR)/${DESIGN}_synth_wrap.sv ]; then sed -i 's/unsigned int/int unsigned/g' $(OUT_DIR)/${DESIGN}_synth_wrap.sv; fi;
	touch .synth-$(DESIGN).timestamp

.pnr-$(DESIGN).timestamp: $(COMMON_SCRIPTS) $(PNR_SCRIPT) .synth-$(DESIGN).timestamp
	export CADENCE_DESIGN=$(DESIGN) && export TECHLIB_DIR=$(TECHLIB_DIR) && export PNR=1 && innovus -stylus -no_gui -batch -log ./$(LOG_DIR)/$(DESIGN)_innovus \
																						 -files $(PNR_SCRIPT)
	rm -f $(REPORT_DIR)/$(DESIGN)/*.rpt.old
	rm -f $(DESIGN)_metallfill.rpt
	touch .pnr-$(DESIGN).timestamp

synth: logdir .synth-$(DESIGN).timestamp

synth-gui: synth
	export CADENCE_DESIGN=$(DESIGN) && genus -log ./$(LOG_DIR)/$(DESIGN)_genus_gui \
											  -f $(OUT_DIR)/$(DESIGN)_synth.dat/$(DESIGN).genus_setup.tcl \
											  -f $(SCRIPT_DIR)/genus_gui.tcl

pnr: logdir .pnr-$(DESIGN).timestamp

pnr-gui:
	export CADENCE_DESIGN=$(DESIGN) && innovus -stylus -log ./$(LOG_DIR)/$(DESIGN)_innovus_gui -files $(SCRIPT_DIR)/innovus_gui.tcl

check-synth: synth
	lec -XL -NOGui -Color -Dofile $(OUT_DIR)/$(DESIGN)_lec_synth.do

check-pnr: pnr
	lec -XL -NOGui -Color -Dofile $(OUT_DIR)/$(DESIGN)_lec_layout.do

# just for testing purposes
sta:
	export CADENCE_DESIGN=$(DESIGN) && tempus -stylus -log $(LOG_DIR)/$(DESIGN)_tempus -files $(SCRIPT_DIR)/sta.tcl

power:
	@echo ""
	@echo "-------------------------------------------------------------------------------------"
	@echo "| Power estimation is only meaningful for DESIGN=aes_engine or mac_top_wrap         |"
	@echo "| Make sure you ran 'make cli' in tb/mac_engine/post-layout-power or the PULPissimo |"
	@echo "| post-layout simulation (s. README.md) to have an up-to-date .vcd file and set the |"
	@echo "| respective start and end times in scripts/power.tcl                               |"
	@echo "-------------------------------------------------------------------------------------"
	@echo
	
	export CADENCE_DESIGN=$(DESIGN) && voltus -stylus -no_gui -batch -log $(LOG_DIR)/$(DESIGN)_voltus \
	                                          -files $(SCRIPT_DIR)/power.tcl

logdir:
	mkdir -p $(LOG_DIR)

clean-tools:
	rm -rf genus.* innovus.* .cadence
	rm -f *.old
	rm -f scheduling_file.cts.*
	rm -rf .st_launch_*
	rm -f *.conn.rpt *.metalfill.rpt power.rpt *.geom.rpt
	rm -rf $(LOG_DIR) mp_data
	rm -rf genus2invs_*
	rm -rf rtl_*_db
	rm -rf timingReports checkDesign
	rm -rf .timing_file*
	rm -f voltus_power_missing_netnames.rpt
	rm -f .powerAnalysis.pinfo
	
clean: clean-tools	
	rm -rf fv fv*/
	rm -rf $(OUT_DIR) $(REPORT_DIR) $(TMP_DIR)
	rm -f .*.timestamp .*.tstamp

.PHONY: all clean clean-tools synth synth-gui pnr pnr-gui logdir check-synth check-pnr power sta
