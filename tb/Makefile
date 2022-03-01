all: cli

gui:
	vsim -i -do "run.do"

compile:
	vsim -c -do "do compile.do; quit"

cli:
	vsim -c -do "do run.do; quit"

clean:
	rm -f vsim.wlf
	rm -rf work
	rm -f transcript
	rm -rf wlft*
