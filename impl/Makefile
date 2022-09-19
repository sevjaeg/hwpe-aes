all: pnr

# TODO dependencies (scripts!)

.synth.timestamp: logdir scripts/synth_aes.tcl scripts/aes.sdc
	genus -log ./logs/genus -batch -files scripts/synth_aes.tcl
	touch .synth.timestamp

.pnr.timestamp: logdir scripts/impl_aes.tcl
	innovus -stylus -no_gui -log ./logs/innovus -files scripts/impl_aes.tcl
	touch .pnr.timestamp

synth: .synth.timestamp

pnr: .pnr.timestamp

check-synth: .synth.timestamp
	lec -XL -NOGui -Color -Dofile scripts/aes_lec.do

logdir:
	mkdir -p logs

clean:
	rm -rf genus.* innovus.* .cadence
	rm -rf fv logs out reports mp_data
	rm -rf timingReports checkDesign
	rm -rf genus2invs_*
	rm -f .*.timestamp .*.tstamp

.PHONY: all clean synth pnr logdir check-synth
