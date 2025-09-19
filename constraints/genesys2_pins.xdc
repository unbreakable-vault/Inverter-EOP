## Input clock from JA1
set_property PACKAGE_PIN B13 [get_ports sys_clk]            ;# JA1
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PULLDOWN true [get_ports sys_clk]
create_clock -name sys_clk_ext -period 100.000 [get_ports sys_clk]  ;# 10 MHz analysis (any value is fine)

## Outputs on JB1/JB2/JB3
set_property PACKAGE_PIN G14 [get_ports output_A]           ;# JB1
set_property PACKAGE_PIN P15 [get_ports output_B]           ;# JB2
set_property PACKAGE_PIN V11 [get_ports output_XOR]         ;# JB3
set_property IOSTANDARD LVCMOS33 [get_ports {output_A output_B output_XOR}]
set_property DRIVE 12 [get_ports {output_A output_B output_XOR}]
set_property SLEW  FAST [get_ports {output_A output_B output_XOR}]
