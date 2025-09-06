# Inverter-Skew on Genesys-2 (Kintex-7)

**Goal.** Implement two identical 3-inverter chains, drive both with the same stimulus, and measure timing skew (Δt) between their outputs on an oscilloscope. Optional third output shows `XOR(OUT_A, OUT_B)` so pulse width ≈ |Δt|.

**Board.** Digilent Genesys-2 (XC7K325T-2FFG900C).

## Build (after downloading this repo as ZIP)
- Install Vivado (2020.2 or newer is fine).
- Open Vivado TCL Console and run:

   cd <path-to-repo>/scripts
   source create_project.tcl
   source build.tcl
- Program the FPGA from **Hardware Manager**.

## Pins
Edit `constraints/genesys2_pins.xdc`:
- Map `sys_clk` to the on-board oscillator pin from the **Genesys-2 Master XDC**.
- Choose two pins in the **same I/O bank** for `OUT_A` / `OUT_B` (and one for `OUT_XOR`).
- Keep identical `IOSTANDARD/DRIVE/SLEW`.

## Measure
- Probe `OUT_A` and `OUT_B` with identical 10× probes (short ground springs).
- Trigger on `OUT_A`; measure Δt at 50% crossings.
- `OUT_XOR` (optional) shows a narrow pulse whose width tracks |Δt|.
