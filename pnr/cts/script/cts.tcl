set_host_options -max_cores 8
set design_lib_path "/home/ICer/test_RISCV/pnr/setup"
open_block $design_lib_path/RISCV.dlib:RISCV_placement.design
copy_block -from_block RISCV.dlib:RISCV_placement.design -to_block RISCV_cts
current_block RISCV_cts.design

set_ignored_layers -max_routing_layer M8 -min_routing_layer M1
remove_clock_tree_options -all -target_skew -target_latency 
set_lib_cell_purpose -exclude cts [get_lib_cells -of [get_cells *]]
set_lib_cell_purpose -include cts */INVX2
set_lib_cell_purpose -include cts */INVX4
set_lib_cell_purpose -include cts */INVX8
set_clock_tree_options -target_skew 0.1 
set_clock_tree_options -target_latency 0.2 
set_input_transition -rise 0.1 [get_clocks clk]
set_input_transition -fall 0.1 [get_clocks clk]

create_routing_rule NDR -multiplier_width 1.2 -multiplier_spacing 1.2
set_clock_routing_rules -net_type root -rule NDR -max_routing_layer M7 -min_routing_layer M3
set_clock_routing_rules -net_type internal -rule NDR -max_routing_layer M7 -min_routing_layer M3
set_clock_routing_rules -net_type sink -default_rule -max_routing_layer M3 -min_routing_layer M2

set_max_transition -clock_path 0.100 [get_clocks]
report_clock_routing_rules
clock_opt -from build_clock -to build_clock
clock_opt -from route_clock -to route_clock
clock_opt -from route_clock -to final_opto

sizeof_collection [get_cells "CTS_*"]
connect_pg_net -net "VDD" [get_pins -hierarchical "*/VDD*"]
connect_pg_net -net "VSS" [get_pins -hierarchical "*/VSS"]
check_pg_drc
check_routes -drc true
save_block
report_timing -max_paths 10 > ../report/timing.rpt
