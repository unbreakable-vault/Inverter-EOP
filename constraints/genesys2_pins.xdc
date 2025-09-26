## --- Input from JB1 (Pmod JB, pin 1) ---
set_property PACKAGE_PIN V29 [get_ports sys_clk]         ;# JB0
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PULLDOWN true [get_ports sys_clk]
create_clock -name sys_clk_ext -period 40.000 [get_ports sys_clk]  ;# 25 MHz example

## --- Outputs to JA1 / JA3 / JA7 (Pmod JA) ---
set_property PACKAGE_PIN U27 [get_ports output_A]        ;# JA0
set_property PACKAGE_PIN T26 [get_ports output_B]        ;# JA2
set_property PACKAGE_PIN T22 [get_ports output_XOR]      ;# JA4
set_property IOSTANDARD LVCMOS33 [get_ports {output_A output_B output_XOR}]
set_property DRIVE 12 [get_ports {output_A output_B output_XOR}]
set_property SLEW  FAST [get_ports {output_A output_B output_XOR}]


set_property BEL A6LUT [get_cells A/inv0]
set_property LOC SLICE_X0Y349 [get_cells A/inv0]
set_property BEL B6LUT [get_cells A/inv1]
set_property LOC SLICE_X0Y349 [get_cells A/inv1]
set_property BEL C6LUT [get_cells A/inv2]
set_property LOC SLICE_X0Y349 [get_cells A/inv2]
set_property BEL D6LUT [get_cells B/inv2]
set_property LOC SLICE_X153Y0 [get_cells B/inv2]
set_property BEL C6LUT [get_cells B/inv0]
set_property LOC SLICE_X153Y0 [get_cells B/inv0]
set_property BEL B6LUT [get_cells B/inv1]
set_property LOC SLICE_X153Y0 [get_cells B/inv1]
set_property BEL A6LUT [get_cells u_xor]
set_property LOC SLICE_X79Y150 [get_cells u_xor]
set_property LOCK_PINS {I0:A6} [get_cells A/inv2]
set_property LOCK_PINS {I0:A6} [get_cells A/inv1]
set_property LOCK_PINS {I0:A6} [get_cells A/inv0]
set_property LOCK_PINS {I0:A5 I1:A6} [get_cells u_xor]
set_property LOCK_PINS {I0:A6} [get_cells B/inv2]
set_property LOCK_PINS {I0:A6} [get_cells B/inv0]
set_property LOCK_PINS {I0:A6} [get_cells B/inv1]


