all: pnr

.synth.timestamp: logdir synth_aes.tcl aes_cipher_top.sdc
	genus -legacy_ui  -log ./logs/genus -batch -files synth_aes.tcl
	touch .synth.timestamp

.pnr.timestamp: logdir .synth.timestamp impl_aes.tcl aes_cipher_top_mmmc.tcl aes_cipher_top.globals ccopt_aes.spec 
	innovus -log ./logs/innovus -files impl_aes.tcl
	touch .pnr.timestamp

synth: .synth.timestamp

pnr: .pnr.timestamp

logdir:
	mkdir -p logs

clean:
	rm -f genus.*
	rm -f innovus.*
	rm -f *.tstamp
	rm -rf fv logs out reports
	rm -rf timingReports checkDesign
	rm -f .*.timestamp

.PHONY: all clean synth pnr logdir
