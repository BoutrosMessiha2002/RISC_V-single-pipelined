# ##############################################################################
# 		--------------------- Clock Definations --------------------- 		   #
# ##############################################################################

# --- Budget Clock (Timing Definations)
create_clock -name scan_clk -period 400 -waveform {0 200}   [get_ports scan_clk]	;  # use it in test mode  (shift, capture )
# --- Clock uncertainty Berfore CTS  uncertainty = Jitter + Source Latency  + Network Latency
# --- Prevent Tool do any thing on network 
set_dont_touch_network [get_clocks {scan_clk}]

# ##############################################################################
# 		--------------------- Optimization --------------------- 			   #
# ##############################################################################

# Test clock paths timing 
set_case_analysis 1 test_mode ; # Enable test mode
set_clock_groups -physically_exclusive -group {scan_clk} -group {fun_clk}

#set_max_transition 1.5 -data_path [get_clocks fun_clk]
set_max_fanout 2 [current_design]
#set_max_capacitance 2.5 [current_design]

set_dont_use [get_lib_cells */*DELLN1*]

set_dont_use [get_lib_cells */*AO22*]
set_dont_use [get_lib_cells */*AOI22*]

set_dont_use [get_lib_cells */*DELLN2X*]
set_dont_use [get_lib_cells */*DELLN2*]
set_dont_use [get_lib_cells */*DELLN*]
