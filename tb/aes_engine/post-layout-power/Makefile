all: cli

gui:
	vsim -i -gSIM=1 -do "run.do"

compile:
	vsim -c -do "do compile.do; quit"

cli:
	vsim -c -gSIM=1 -do "do run.do; quit" 

clean:
	rm -f vsim.wlf
	rm -rf work
	rm -f transcript
	rm -f *.vcd
	rm -rf wlft* *.vstf
