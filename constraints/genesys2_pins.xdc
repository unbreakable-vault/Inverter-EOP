## --- External sys_clk on JA1 (Pmod JA, pin 1) ---
set_property PACKAGE_PIN B13 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
# Optional niceties:
set_property PULLDOWN true [get_ports sys_clk]
# If you plan ~100 MHz for bring-up, this helps timing analysis only:
create_clock -name sys_clk_ext -period 10.000 [get_ports sys_clk]

## --- Outputs on JB1/JB2/JB3 (Pmod JB, pins 1,2,3) ---
set_property PACKAGE_PIN G14 [get_ports output_A]
set_property PACKAGE_PIN P15 [get_ports output_B]
set_property PACKAGE_PIN V11 [get_ports output_XOR]
set_property IOSTANDARD LVCMOS33 [get_ports {output_A output_B output_XOR}]
# Drive strength and edge rate (symmetrical on all three):
set_property DRIVE 12 [get_ports {output_A output_B output_XOR}]
set_property SLEW  FAST [get_ports {output_A output_B output_XOR}]
