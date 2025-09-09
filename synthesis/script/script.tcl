set_host_options -max_cores 6
lappend search_path "/home/ICer/Downloads/Lib/synopsys/models"
set worst_case "saed90nm_max.db"

set_app_var target_library [list $worst_case]
set_app_var link_library "* $target_library "


sh rm -rf work
sh mkdir -p work
define_design_lib work -path ./work

set design RISCV
set compile_top_all_paths true
set_svf ${design}.svf
analyze -format verilog -lib work ../rtl/${design}.v
elaborate -lib work $design
current_design
check_design
set_app_var  auto_wire_load_selection false

source ../cons/cons.tcl
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs
link
#start_gui
compile -map_effort high -incremental
compile -top

report_timing -max_paths 20 > ../reports/timing_report.rpt
report_area > ../reports/area_report.rpt
report_power > ../reports/power_report.rpt

write_sdc ../output/${design}.sdc
write_sdf ../output/${design}.sdf

write -hierarchy -format verilog -output ../output/${design}.v 
write -f ddc -hierarchy -output ../output/${design}.ddc   

start_gui



