set design RISCV
 
set design_lib_path /home/ICer/test_RISCV/pnr/setup
open_block $design_lib_path/${design}.dlib:${design}_placement.design
copy_block -from_block ${design}.dlib:${design}_placement.design -to_block ${design}_routing
current_block ${design}_routing.design


report_qor -summary
check_design -checks pre_route_stage

global_route_opt
route_global

check_pg_drc


route_track

check_pg_drc

route_detail

check_pg_drc

check_routes


set FillerCells " */SHFILL1*"
create_stdcell_fillers -lib_cells $FillerCells

connect_pg_net -net "VDD" [get_pins -hierarchical "*/VDD*"]
connect_pg_net -net "VSS" [get_pins -hierarchical "*/VSS"]
check_pg_drc
check_routes -drc true

remove_stdcell_fillers_with_violation

check_legality



write_verilog  ./${design}_routing_Netlist.v


write_sdc -output ./${design}_routing_SDC.sdc


write_parasitics -format SPEF -output ./${design}_Routing_Spef.spef


write_def ../output/${design}_Routing_def.def




write_gds \
-view design \
-lib_cell_view frame \
-output_pin all \
-fill include \
-exclude_empty_block \
-long_names \
-keep_data_type \
../GDS/${design}_Routing_GDS.gds







save_block

