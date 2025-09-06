# Vivado 2020.2+ recommended
set proj_name inverter_skew
set proj_dir  [file normalize "../vivado/${proj_name}"]
set part_name xc7k325tffg900-2   ;# Genesys-2

file mkdir $proj_dir
create_project $proj_name $proj_dir -part $part_name -force

add_files ../rtl/inv_chain.v
add_files ../rtl/top_two_paths.v
read_xdc   ../constraints/genesys2_pins.xdc

set_property top top_two_paths [current_fileset]
# keep hierarchy so the two chains remain separable for floorplanning
set_property STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY none [get_runs synth_1]
save_project_as $proj_name $proj_dir
