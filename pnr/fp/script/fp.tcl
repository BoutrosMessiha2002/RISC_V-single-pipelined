
set design RISCV
sh rm /home/ICer/test_RISCV/pnr/setup/RISCV.dlib/RISCV_setup/design.ndm.lock

 
set design_lib_path /home/ICer/test_RISCV/pnr/setup
open_block $design_lib_path/${design}.dlib:${design}_setup.design
copy_block -from_block ${design}.dlib:${design}_setup.design -to_block ${design}_fp
current_block ${design}_fp.design
#start_gui

set_attribute [get_layers {M1 M3 M5 M7 M9}] routing_direction horizontal
set_attribute [get_layers {M2 M4 M6 M8}] routing_direction vertical

set_attribute [get_layers {M1}] track_offset 0.03
set_attribute [get_layers {M2}] track_offset 0.03

set_ignored_layers -max_routing_layer [get_layers {M8}]
set_ignored_layers -max_routing_layer [get_layers {M9}]

set Name_unit [get_site_defs]
set_attribute [get_site_defs $Name_unit] is_default true
set_attribute [get_site_defs  $Name_unit] symmetry {Y}

initialize_floorplan -core_utilization 0.5 -shape R -orientation N -core_offset {10} -side_ratio {1 1} -flip_first_row false

place_pins -ports [get_ports *]


save_block 

report_ports [all_inputs] > ../report/input_port.rpt
report_ports [all_outputs] > ../report/output_port.rpt
report_cell  > ../report/cells.rpt
report_nets  > ../report/nets.rpt
report_qor   > ../report/qor.rpt
report_utilization > ../report/utilization.rpt
get_placement_blockages > ../report/Blockage.rpt

# ================================================ #
# =================== End_Step =================== #
# ================================================ #
write_def ../output/cv32e40p_top.def
write_verilog -include {all} ../output/cv32e40p_top.v
write_sdc -output ../output/cv32e40p_top.sdc

# =================== End_Step =================== #
save_block 

