set offset 1
set width 1.5
set spacing 1
set horiz_top M9
set vert_top M8

set mesh2_horiz_top M7
set mesh2_vert_top M6
set mesh_width 5
set mesh_pitch 7
set mesh_offset 1
set design RISCV
sh rm /home/ICer/test_RISCV/pnr/setup/RISV.dlib/RISCV_fp/design.ndm.lock
set design_lib_path /home/ICer/test_RISCV/pnr/setup
open_block $design_lib_path/${design}.dlib:${design}_fp.design
copy_block -from_block ${design}.dlib:${design}_fp.design -to_block ${design}_pp
current_block ${design}_pp.design

remove_ignored_layers -all -max_routing_layer -min_routing_layer
report_ignored_layers

create_net -power VDD
create_net -ground VSS

connect_pg_net -net VDD [get_pins -hierarchical *\VDD]
connect_pg_net -net VSS [get_pins -hierarchical *\VSS]

set_app_option -name plan.pgroute.auto_connect_pg_net -value true

create_pg_region ring_region -core -expand_by_edge \
"{{side:1} {offset:$offset}} {{side:2} {offset:$offset}} {{side:3} {offset:$offset}} {{side:4} {offset:$offset}}"

create_pg_ring_pattern ring_pattern -horizontal_layer $horiz_top -vertical_layer $vert_top  -horizontal_spacing $spacing -vertical_spacing $spacing \
-horizontal_width $width -vertical_width $width

set_pg_strategy ring_strategy -pg_regions {ring_region} -pattern {{name:ring_pattern} {nets: "VSS VDD"}}

compile_pg -strategies ring_strategy


check_pg_drc
check_pg_connectivity

create_pg_mesh_pattern mesh1  -layers {{{vertical_layer: M8} {width:2} {spacing:interleaving} {pitch:40} {offset:1} {trim:true}} \
{{horizontal_layer: M9} {width:2} {spacing:interleaving} {pitch:40} {offset:1} {trim: true}}}


set_pg_strategy mesh_strat1 -core -pattern {{pattern: mesh1} {nets: "VSS VDD"}} -extension {stop:outermost_ring}
compile_pg -strategies mesh_strat1
check_pg_drc

#create_pg_mesh_pattern mesh2  -layers {{{vertical_layer: M6} {width:2} {spacing:interleaving} {pitch:40} {offset:1} {trim:true}} \
#{{horizontal_layer: M7} {width:2} {spacing:interleaving} {pitch:40} {offset:1} {trim: true}}}
#set_pg_strategy mesh_strat2 -core -pattern {{pattern: mesh2} {nets: "VSS VDD"}} -extension {stop:outermost_ring}
#compile_pg -strategies mesh_strat2
#check_pg_drc

create_pg_std_cell_conn_pattern std_cell_rail -layers M1 -rail_width 0.16
set_pg_strategy rails_M1 -core -pattern {{name: std_cell_rail} {nets: "VDD VSS"} }

compile_pg -strategies rails_M1


check_pg_drc
check_pg_connectivity
check_pg_missing_vias


check_pg_drc  > ../report/pg_drc.rpt
check_pg_connectivity > ../report/pg_connectivity.rpt
analyze_power_plan -report_track_utilization_only > ../report/track_utilization.rpt
report_utilization > ../report/utilization.rpt
report_qor > ../report/qor.rpt  ; #optional
report_timing > ../report/timing.rpt ; #optional 

# ================================================ #
# =================== End_Step =================== #
# ================================================ #
write_def ../output/cv32e40p_top.def
write_verilog -include {all} ../output/cv32e40p_top.v
write_sdc -output ../output/cv32e40p_top.sdc 
save_block ;





