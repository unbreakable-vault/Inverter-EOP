# Inverter-Skew on Genesys-2 (Kintex-7)

**Goal.** Implement two identical 3-inverter chains, drive both with the same stimulus, and measure timing skew (Δt) between their outputs on an oscilloscope. Optional third output shows `XOR(OUT_A, OUT_B)` so pulse width ≈ |Δt|.

**Board.** Digilent Genesys-2 (XC7K325T-2FFG900C).

## Build (after downloading this repo as ZIP)
- Install Vivado (2020.2 or newer is fine).
- Open Vivado TCL Console and run:
