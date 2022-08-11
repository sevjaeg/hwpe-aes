.PHONY: clean synth pnr

# TODO dependencies

clean:
	rm -f genus.*
	rm -f *.tstamp
	rm -rf fv logs out reports
	rm -rf timingReports checkDesign

synth:
	genus -legacy_ui -f synth_aes.tcl

pnr:
	# TODO innovus script
	echo "pnr"
