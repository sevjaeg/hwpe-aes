# AES Hardware Processing Engine

## Goal

// TODO define abbreviation HWPE

## Architecture

## Results

## Prerequisites

This project is based on [PULPissmo](https://github.com/pulp-platform/pulpissimo) (as of [September 29, 2021](https://github.com/pulp-platform/pulpissimo/tree/3c9bde1b539679401d4e204716c43bf9422e026d)). Consider the repository's `README` for setup details an prerequisites. Use the PULP SDK instead of the simple runtime.

The following tools are required:

- Questa Sim for simulation (tested with version 10.7c)
- Cadence Genus for synthesis (version 19.10)
- Cadence Innovus for implementation (version 20.11)
- Cadence Voltus for power estimation (version 20.11)
- Xilinx Vivado for FPGA synthesis & PnR (version 2020.2)

The ASIC synthesis requires access to the TSMC 65nm general purpose PDK. For this project, the [Europractice version](https://europractice-ic.com/technologies/asics/tsmc/) was used.

For the FPGA demo, a Digilent Genesys2 board was used.

## Getting Started

Clone this repository into your `pulpissimo/ips` directory. Then replace the default `hwpe-mac-engine` with this HWPE:

// TODO symbolic link?, test

```
cd pulpissimo/ips
git clone https://github.com/sevjaeg/hwpe-aes
rm -rf hwpe-mac-engine
mv hwpe-aes hwpe-mac-engine
```

Now you should be ready to run some code on your enhanced PULPissimo. Use the programs in the `sw` directory to evaluate AES encryptions both in software and in the HWPE. The test vectors are taken from the [NIST Special Publication 800-38A](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38a.pdf).

### RTL Simulation

// TODO
rtl/pulpissimo/pulpissimo.sv
 parameter USE_HWPE    = 1

After [building the RTL simulation platform](https://github.com/pulp-platform/pulpissimo/tree/374e383b08bcc030659ecd1c2b3b8ac62dcac4fb#building-the-rtl-simulation-platform), use the PULP SDK to run the demo application. Navigate to `aes_sw` (AES software implementation) or `aes_hwpe` (run AES on HWPE) and call

```
make clean all run
```

to start the simulation in Questa Sim. You might want to add `gui=1` and the provided `wave.do` to look into the waveforms.

### FPGA Demo

> Due to an [issue](https://github.com/pulp-platform/pulpissimo/issues/274) with the HWPE FPGA emulation in PULPissimo, the output data are not written.

### ASIC Synthesis

Navigate into the `impl` directory. There, run `make pnr` to run the RTL to GDSII flow.

### Post-Synthesis Simulation

Engine only vs full hwpe

Copy library simulation lib to impl/hdl

ips/pulp_soc/rtl/fc/fc_hwpe.sv Line 78
comment out .ID  ( ID_WIDTH )  // post synthesis

Once you have a post-synthesis netlist for you 

Comment in the proper section of `src_files.yml`. Then, run the following in the `pulpissimo` directory:

```
make scripts
make clean build
```

vsim -c -quiet -L models_lib -L vip_lib -t ps +nowarnTRAN +nowarnTSCALE +nowarnTFMPC +TB_PATH=/home/sjaeger/pulpissimo/sim +UVM_NO_RELNOTES +ENTRY_POINT=0x1c008080 -permit_unmatched_virtual_intf +VSIM_PATH=/home/sjaeger/pulpissimo/sim work.vopt_tb -sdfmax /tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/u1=/home/sjaeger/pulpissimo/ips/hwpe-mac-engine/impl/out/mac_top_wrap_layout.sdf -gUSE_SDVT_SPI=0 -gUSE_SDVT_CPI=0 -gBAUDRATE=115200 -gENABLE_DEV_DPI=0 -gLOAD_L2=JTAG -gUSE_SDVT_I2S=0

make clean all run gui=1

Simulate->Start Simulation

Select design unit `work.vopt_tb`

in SDF tab select sdf file (`impl/out/mac_top_wrap_layout.sdf`) for entity `/tb_pulp/i_dut/soc_domain_i/pulp_soc_i/fc_subsystem_i/fc_hwpe_gen/i_fc_hwpe/i_mac_top_wrap/u1` with delay `max`.

Start with OK

```
do ../../power_sim.do
```

### Power Estimation

## Credits

This project is based on [PULPissmo](https://github.com/pulp-platform/pulpissimo) (as of [September 29, 2021](https://github.com/pulp-platform/pulpissimo/commit/3c9bde1b539679401d4e204716c43bf9422e026d)) including the PULP [Hardware MAC Engine](https://github.com/pulp-platform/hwpe-mac-engine) and the [PULP Runtime Examples](https://github.com/pulp-platform/pulp-rt-examples). The required tools were kindly provided by the [Institute of Computer Technology at TU Wien](https://www.ict.tuwien.ac.at/).


aes sw and hw


## Simulation

Simulation clk: 50 MHz

AES with 128 bit keys and data

## Software Implementation

Based on [tiny-AES-c](https://github.com/kokke/tiny-AES-c)

```
cd ~/pulpissimo/aes/aes_sw
make clean all run
size build/pulpissimo/aes_demo/aes_demo
```

### ECB

Demo program (DEMO=0, N=1) text section: 9824 bytes (ECB)

Runtime single encryption (N=1, 128 bit): 91 us

Runtime 32 encryptions (N=32): 2876 us (89.9 us/op)

### CBC

Demo program (DEMO=0, N=1) text section: 10052 bytes (CBC). Note different input data size!

Runtime measurements (DEMO=1)

Runtime 4 encryptions (N=1, 4x128 bit): 366 us (91.5 us/op)

Runtime 32 encryptions (N=8): 2869 us (89.7 us/op)

## Hardware Implementation

```
cd ~/pulpissimo/ips/hwpe-mac-engine/sw/aes_sw_hwpe
make clean all run
size build/hwme.c/pulpissimo/hwme/hwme
```

### ECB

Runtime measured with software: 0-30 us (limited timer accuracy)

From .vcd: 10 us for 32 encryptions

14 cycles (280 ns) for each further 128 bit encryption

Demo program (DEMO=0, N=1) text section: 9140 bytes (ECB), 9320 bytes (CBC). Note different input data size!

#### Improved HW (less registers)

Reduced execution time per encryption to 13 cycles (260 ns)

8332.432 ns for 32 encryptions (simulation @ 50 MHz)

### CBC

Safer operation with [cipher block chaining (CBC)](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation)

1120 ns for 4 encryptions

13 cycles (260 ns) for each further 128 bit encryption

7 cycles from start until first data word issued
4 cycles to read in data
12 cycles for aes core
1 cycle to capture output (can be avoided)
4 cycles to write out
17 cycles per each further encryption (writing out and reading in can be pipelined)
4 cycles after completion until event

-> 83 cycles per 128 bit encryption

### Resource consumption (Nexys 4DDR)

Make sure to set `USE_HWPE=1` in `rtl/xilinx_pulpissimo.v`

#### SoC Lab configuration

Entity | LUTs | Registers | BRAM Tiles
--- | --- | --- | ---
FPGA | 63400 | 126800 | 135
PULPissimo | 58626 | 45820 | 128
HWPE Top | 4901 | 3780 | 0
HWPE Ctrl | 477 | 278 | 0
HWPE Streamer | 2807 | 2147 | 0
HWPE Engine | 1619 | 1355 | 0
AES Core | 1244 | 530 | 0
Byte Stacker (each) | 25 | 131 | 0
Byte Unstacker | 104 | 164 | 0

#### After reducing registers in HWPE

Entity | LUTs | Registers | BRAM Tiles
--- | --- | --- | ---
FPGA | 63400 | 126800 | 135
PULPissimo | 58448 | 45433 | 128
HWPE Top | 4695 | 3393 | 0
HWPE Ctrl | 474 | 278 | 0
HWPE Streamer | 2804 | 2147 | 0
HWPE Engine | 1420 | 968 | 0
AES Core | 1244 | 530 | 0
Byte Stacker (each) | 25 | 131 | 0
Byte Unstacker | 104 | 164 | 0

#### CBC

Entity | LUTs | Registers | BRAM Tiles
--- | --- | --- | ---
FPGA | 63400 | 126800 | 135
PULPissimo | 58505 | 45562 | 128
HWPE Top | 4819 | 3522 | 0
HWPE Ctrl | 474 | 278 | 0
HWPE Streamer | 2804 | 2147 | 0
HWPE Engine | 1549 | 1097 | 0
AES Core | 1244 | 530 | 0
Byte Stacker (each) | 25 | 131 | 0
Byte Unstacker | 104 | 164 | 0

### Resource consumption (Genesys 2)

Make sure to set `USE_HWPE=1` in `rtl/xilinx_pulpissimo.v`

#### CBC

Entity | LUTs | Registers | BRAM Tiles
--- | --- | --- | ---
FPGA | 203800 | 407600 | 445
PULPissimo | 59574 | 45562 | 144
HWPE Top | 4834 | 3522 | 0
HWPE Ctrl | 474 | 278 | 0
HWPE Streamer | 2804 | 2147 | 0
HWPE Engine | 1552 | 1097 | 0
AES Core | 1247 | 530 | 0
Byte Stacker (each) | 25 | 131 | 0
Byte Unstacker | 104 | 164 | 0

## FPGA Demo (Genesys 2)

`fpga/pulpsissimo-genesys2/rtl/xilinx_pulpissimo.v`

```
localparam USE_HWPE  = 1;
```

Synthesise with `make genesys2` in `pulpissimo_local` (not on server!), flash `.bit` with Vivado GUI

Start an OpenOCD session (setup s. PULPissimo README)

```
$OPENOCD/bin/openocd -f ~/pulpissimo_local/fpga/pulpissimo-genesys2/openocd-genesys2.cfg
```

Compile the software and start a `gdb` session

```
cd pulpissimo
source pulp-sdk/configs/pulpissimo.sh
source pulp-sdk/configs/fpgas/pulpissimo/genesys2.sh
cd /ips/hwpe-mac-engine/sw/aes_sw_hwpe/
make clean all
$PULP_RISCV_GCC_TOOLCHAIN/bin/riscv32-unknown-elf-gdb build/aes_demo.c/pulpissimo/hwme_aes/hwme_aes 
```

Run the code in `gdb`

```
target remote localhost:3333
file build/hwme.c/pulpissimo/hwme/hwme
load
continue
```

Connect the UART connector (J15) to get serial output. Set the Baud rate to 230400.

### Post-Synthesis Simulation



### Power consumption

@typ corner, 625 MHz
single 128 bit encryption avg 13.9 mW→ 467 pJ/encryption
pipeline (4x128 bit)  avg 15.6 mW   → 449 pJ/encryption
pipeline (1024x128 bit)  avg 15.627 mW   → 425.2 pJ/encryption  (only small gain as only writing out and reading into stacker can be interleaved)
