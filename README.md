# Inverter-Skew on Genesys-2 (Kintex-7)

**Goal:** Implement two identical 3-inverter chains, drive both with the same stimulus, and measure timing skew (Δt) between their outputs on an oscilloscope. The optional third output shows `XOR(OUT_A, OUT_B)` so pulse width ≈ |Δt|.

**Board:** Digilent Genesys-2 (XC7K325T-2FFG900C).

The design implements two parallel 3-inverter chains, both fed by the same `sys_clk`. Their outputs (`OUT_A` and `OUT_B`) are compared directly, and also combined into `OUT_XOR` so that skew appears as short pulses.

![RTL schematic](inverter_skew.jpg)

## Build (after downloading this repo as ZIP)
- Install Vivado (2021.1 or newer is fine).
- Open Vivado TCL Console and run:

**Open Vivado TCL Console and Run:**  
   ```tcl
   cd <path-to-repo>/scripts
   source create_project.tcl
   source build.tcl
```

- Program the FPGA from **Hardware Manager**.

## Pins
Edit `constraints/genesys2_pins.xdc`:
- Map `sys_clk` to the on-board oscillator pin from the **Genesys-2 Master XDC**.
- Choose two pins in the **same I/O bank** for `OUT_A` / `OUT_B` (and one for `OUT_XOR`).
- Keep identical `IOSTANDARD/DRIVE/SLEW`.

## Measure
- Probe `OUT_A` and `OUT_B` with identical 10× probes (short ground springs). (10× probes: These are standard oscilloscope probes set to attenuate the signal by a factor of 10. This reduces loading on the circuit and increases measurement bandwidth.)
- Trigger on `OUT_A`; measure Δt at 50% crossings. (50% crossing means measure the point where each signal’s voltage is halfway between its low and high levels (midpoint of the logic swing)) (Δt is the time difference (skew) between the two signals)
- `OUT_XOR` (optional) shows a narrow pulse whose width tracks |Δt|.

```text
OUT_A:   ____/‾‾‾‾‾‾‾‾
OUT_B:   _________/‾‾‾
Δt:         <---->
XOR:     ___/‾‾‾‾\____
```
Here, the XOR pulse width equals the time difference between the two rising edges.
