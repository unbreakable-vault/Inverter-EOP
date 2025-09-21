## ================================
## External I/O pin assignments
## ================================

## Input clock from JA1 (Pmod JA pin 1)
set_property PACKAGE_PIN B13 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PULLDOWN true [get_ports sys_clk]
# NOTE: 100.000 ns = 10 MHz for STA only; adjust if you want STA to match your generator
create_clock -period 100.000 -name sys_clk_ext [get_ports sys_clk]

## Outputs on JB1/JB2/JB3 (Pmod JB pins 1/2/3)
set_property PACKAGE_PIN G14 [get_ports output_A]         ;# JB1
set_property PACKAGE_PIN P15 [get_ports output_B]         ;# JB2
set_property PACKAGE_PIN V11 [get_ports output_XOR]       ;# JB3

set_property IOSTANDARD LVCMOS33 [get_ports {output_A output_B output_XOR}]
set_property DRIVE 12 [get_ports {output_A output_B output_XOR}]
set_property SLEW  FAST [get_ports {output_A output_B output_XOR}]

## ================================
## Floorplanning
## ================================
create_pblock pblock_A
add_cells_to_pblock [get_pblocks pblock_A] [get_cells -quiet [list A]]
resize_pblock [get_pblocks pblock_A] -add {SLICE_X0Y340:SLICE_X15Y349}
set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_A]

create_pblock pblock_B
add_cells_to_pblock [get_pblocks pblock_B] [get_cells -quiet [list B]]
resize_pblock [get_pblocks pblock_B] -add {SLICE_X138Y0:SLICE_X153Y20}
set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_B]

create_pblock pblock_XOR
add_cells_to_pblock [get_pblocks pblock_XOR] [get_cells -quiet [list u_xor]]
resize_pblock [get_pblocks pblock_XOR] -add {SLICE_X70Y168:SLICE_X83Y180}
set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_XOR]

## Explicit BEL/LOC locks (as provided)
set_property BEL D6LUT [get_cells A/inv1]
set_property LOC SLICE_X0Y349 [get_cells A/inv1]

set_property BEL C6LUT [get_cells A/inv2]
set_property LOC SLICE_X0Y349 [get_cells A/inv2]

set_property BEL A6LUT [get_cells B/inv1]
set_property LOC SLICE_X153Y0 [get_cells B/inv1]

set_property BEL B6LUT [get_cells B/inv2]
set_property LOC SLICE_X153Y0 [get_cells B/inv2]

set_property BEL B6LUT [get_cells A/inv0]
set_property LOC SLICE_X0Y349 [get_cells A/inv0]

set_property BEL C6LUT [get_cells B/inv0]
set_property LOC SLICE_X153Y0 [get_cells B/inv0]

set_property BEL A6LUT [get_cells u_xor]
set_property LOC SLICE_X76Y174 [get_cells u_xor]
