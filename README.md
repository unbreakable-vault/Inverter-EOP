# Inverter-Skew on Genesys-2 (Kintex-7)

**Goal:** Implement two identical 3-inverter chains, drive both with the same stimulus, and measure timing skew (Δt) between their outputs on an oscilloscope. The optional third output shows `XOR(OUT_A, OUT_B)` so pulse width ≈ |Δt|.

**Board:** Digilent Genesys-2 (XC7K325T-2FFG900C).

The design implements two parallel 3-inverter chains, both fed by the same `sys_clk`. Their outputs (`OUT_A` and `OUT_B`) are compared directly, and also combined into `OUT_XOR` so that skew appears as short pulses.

![RTL schematic](pictures/inverter_skew_blocks.jpg)



## 📄 Report: Inverter Chain Output Delay Difference

We documented our FPGA experiment on measuring delay differences between two inverter chains routed to different FPGA locations.  
The full report is available here: [Inverter Delay Difference Report](docs/inverter_delay_difference_report.pdf).

### Key Highlights
- **Objective:** Measure timing skew (Δt) between outputs `OUT_A` and `OUT_B`.
- **Hardware:** Digilent Genesys-2 (Kintex-7 FPGA), Tektronix 2-Series MSO, LeCroy WavePro 254HD.
- **Method:** Two 3-stage inverter chains driven by the same input, observed on separate channels.
- **Findings:**  
  - MSO2 (200 MHz): Δt = 1.418 ns (top-left vs bottom-right) and 2.111 ns (top-left vs top-right).  
  - WavePro 254HD (2.5 GHz): Δt = 1.819 ns and 2.502 ns.

```text
OUT_A:   ____/‾‾‾‾‾‾‾‾
OUT_B:   _________/‾‾‾
Δt:         <---->
XOR:     ___/‾‾‾‾\____







The XOR pulse width equals the time difference between the two rising edges.
- **Conclusion:** Floorplanning and output placement significantly affect skew, visible even at nanosecond resolution.


