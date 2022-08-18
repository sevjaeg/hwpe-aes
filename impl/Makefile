all: pnr

.synth.timestamp: logdir scripts/synth_aes.tcl scripts/aes.sdc
	genus -log ./logs/genus -batch -files scripts/synth_aes.tcl
	touch .synth.timestamp

.pnr.timestamp: logdir .synth.timestamp impl_aes.tcl aes_cipher_top_mmmc.tcl aes_cipher_top.globals ccopt_aes.spec 
	innovus -log ./logs/innovus -files impl_aes.tcl
	touch .pnr.timestamp

synth: .synth.timestamp

pnr: .pnr.timestamp

logdir:
	mkdir -p logs

clean:
	rm -rf genus.* innovus.* .cadence
	rm -rf fv logs out reports mp_data
	rm -rf timingReports checkDesign
	rm -rf genus2invs_*
	rm -f .*.timestamp .*.tstamp

.PHONY: all clean synth pnr logdir
