# Inverter-Skew on Genesys-2 (Kintex-7)

**Goal.** Implement two identical 3-inverter chains, drive both with the same stimulus, and measure timing skew (Δt) between their outputs on an oscilloscope. An optional third output shows `XOR(OUT_A, OUT_B)` so the pulse width ≈ |Δt|.  
This simple design demonstrates how placement and routing in FPGAs introduce small timing differences, which is a first step toward delay-sensing experiments used in hardware security research.

**Board.** Digilent Genesys-2 (AMD/Xilinx Kintex-7 XC7K325T-2FFG900C).

---

## Repository Layout
- `rtl/` — Verilog sources (`inv_chain.v`, `top_two_paths.v`)
- `constraints/` — Pinout and optional floorplanning (`genesys2_pins.xdc`)
- `scripts/` — Vivado TCL scripts (`create_project.tcl`, `build.tcl`)
- `doc/` — Notes, measurements
- `data/scope/` — Oscilloscope captures

---

## Build Instructions
1. **Download ZIP:** On GitHub, click the green **Code** button ▸ **Download ZIP**. Extract it.  
2. **Edit pins:** Open `constraints/genesys2_pins.xdc` and replace placeholders:
   - `sys_clk` → oscillator pin from Digilent’s Genesys-2 Master XDC.
   - `OUT_A`, `OUT_B`, `OUT_XOR` → user I/O pins (keep in the same bank).
   - Keep identical IOSTANDARD/DRIVE/SLEW for all outputs.
3. **Open Vivado TCL Console:**  
   ```tcl
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
