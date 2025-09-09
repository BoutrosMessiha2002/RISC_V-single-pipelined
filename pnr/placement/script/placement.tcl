set design RISCV

sh rm /home/ICer/test_RISCV/pnr/setup/RISCV.dlib/RISCV_pp/design.ndm.lock
set design_lib_path /home/ICer/test_RISCV/pnr/setup
open_block $design_lib_path/${design}.dlib:${design}_pp.design
copy_block -from_block ${design}.dlib:${design}_pp.design -to_block ${design}_placement
current_block ${design}_placement.design
#start_gui

#read_def ../../../dft/output/${design}.def
check_design -checks pre_placement_stage

set_app_option  -name place.coarse.congestion_driven_max_util -value 0.5
set_app_options -name opt.common.user_instance_name_prefix -value "PLACE_"
set_app_options -name opt.common.max_fanout   -value 50 
set_app_options -name opt.tie_cell.max_fanout -value 50

get_lib_cell */NA*
get_lib_cell */IN*
get_lib_cell */IBU*
get_lib_cell */XO*

add_spare_cells -cell_name SpareCell  -lib_cell "*/NAND2X2 */INVX1"  -num_instances 8

spread_spare_cells -cells [get_cells Spare*] -random_distribution
place_eco_cells -cells [get_cells Spare*] -legalize_only

set spare_cells [get_cells Spare*]

set_attribute [get_lib_cells saed90nm_max/TIEH] dont_use false  
set_attribute [get_lib_cells saed90nm_max/TIEH] dont_touch false
set_lib_cell_purpose -include all {saed90nm_max/TIEH}

set_attribute [get_lib_cells saed90nm_max/TIEL] dont_use false  
set_attribute [get_lib_cells saed90nm_max/TIEL] dont_touch false
set_lib_cell_purpose -include all {saed90nm_max/TIEL}

add_tie_cells -objects $spare_cells \
			  -tie_low_lib_cells  saed90nm_max/TIEL \
			  -tie_high_lib_cells saed90nm_max/TIEH \
		      -legalize
set_dont_touch $spare_cells
set_fixed_objects $spare_cells

connect_pg_net -net "VDD" [get_pins -hierarchical "*/VDD*"]
connect_pg_net -net "VSS" [get_pins -hierarchical "*/VSS"]

check_pg_drc > ../report/before_placement_drc_spare.rpt
set_app_options  -name place.coarse.continue_on_missing_scandef -value true
create_placement  -effort high  \
				  -timing_driven -buffering_aware_timing_driven \
				  -congestion -congestion_effort  high   
				  
legalize_placement -incremental
check_pg_drc  > ../report/drc_legalized.rpt

connect_pg_net -net "VDD" [get_pins -hierarchical "*/VDD*"]
connect_pg_net -net "VSS" [get_pins -hierarchical "*/VSS"]
check_pg_drc > ../report/After_placement_drc.rpt

check_legality -verbose  > ../report/legality.rpt
check_routability   > ../report/routeability.rpt
report_utilization > ../report/utilization.rpt
#check_pg_drc  > ../report/drc_final.rpt
report_design > ../report/design.rpt
report_cell   > ../report/cells.rpt
report_timing > ../report/timing.rpt

write_def ../output/${design}.def
write_verilog -include {all} ../output/${design}.v
save_block ; 
