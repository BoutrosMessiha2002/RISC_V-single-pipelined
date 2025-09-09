create_clock -name clk -period 5 -waveform {0 2.5} [get_ports clk]
set_clock_uncertainty -setup 0.3 [get_clocks clk]
set_clock_uncertainty -hold 0.2 [get_clocks clk]

set_dont_touch_network [get_clocks clk]

set_app_var compile_ultra_ungroup_dw false
set_app_var auto_wire_load_selection false

set_max_fanout 10 [current_design]
#set_max_transition 0.5 [current_design]
set_max_capacitance 3 [current_design]

set_input_delay -clock clk -max 0.05 [remove_from_collection [all_inputs] [get_ports {clk}]]
set_output_delay -clock clk -max 0.05  [all_outputs]

set_load 4 [all_outputs]
set_driving_cell -lib_cell NBUFFX4 -pin Z [remove_from_collection [all_inputs] [get_ports clk]]



set_dont_use [get_lib_cells */*DELLN1*]

set_dont_use [get_lib_cells */*AO22*]
set_dont_use [get_lib_cells */*AOI22*]

set_dont_use [get_lib_cells */*DELLN2X*]
set_dont_use [get_lib_cells */*DELLN2*]
set_dont_use [get_lib_cells */*DELLN*]




