# AES Hardware Processing Engine

Project for 384.178 SoC Design Lab (2021W) and 384.180 SoC Advanced (2022S)

## Credits

This project is based on [PULPissmo](https://github.com/pulp-platform/pulpissimo) (as of [September 29, 2021](https://github.com/pulp-platform/pulpissimo/commit/3c9bde1b539679401d4e204716c43bf9422e026d)) including the PULP [Hardware MAC Engine](https://github.com/pulp-platform/hwpe-mac-engine) and the [PULP Runtime Examples](https://github.com/pulp-platform/pulp-rt-examples). The required tools were kindly provided by the [Institute of Computer Technology at TU Wien](https://www.ict.tuwien.ac.at/).

aes sw and hw

## Goal

- open source
- low power
- security

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
$PULP_RISCV_GCC_TOOLCHAIN/bin/riscv32-unknown-elf-gdb build/hwme.c/pulpissimo/hwme/hwme
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

```
cp ips/hwpe-mac-engine/scripts/hwpe-mac-engine.mk sim/vcompile/ips/hwpe-mac-engine.mk 
make clean build
```

Note that this has to be redone after running `make scripts`

## Notes

- AES core only yields 487 LUTs, 402 regs but also 5 BRAM tiles
- Any chance to reduce streamer size?

