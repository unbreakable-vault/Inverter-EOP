## === CLOCK (replace with actual oscillator pin from Master XDC) ===
set_property PACKAGE_PIN <FILL_SYSCLK_PIN> [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33           [get_ports sys_clk]
create_clock -name sys_clk -period 10.000  [get_ports sys_clk] ;# 100 MHz example

## === OUTPUTS (choose pins in the same bank; update LOCs) ===
set_property PACKAGE_PIN <FILL_OUTA_PIN>   [get_ports OUT_A]
set_property PACKAGE_PIN <FILL_OUTB_PIN>   [get_ports OUT_B]
set_property PACKAGE_PIN <FILL_OUTXOR_PIN> [get_ports OUT_XOR]
set_property IOSTANDARD LVCMOS33           [get_ports {OUT_A OUT_B OUT_XOR}]
set_property DRIVE 8                       [get_ports {OUT_A OUT_B OUT_XOR}]
set_property SLEW FAST                     [get_ports {OUT_A OUT_B OUT_XOR}]

## === Preserve chains ===
set_property DONT_TOUCH true [get_cells -hier *u_chain_a*]
set_property DONT_TOUCH true [get_cells -hier *u_chain_b*]

