lappend search_path "/home/ICer/Downloads/Lib/synopsys/models"
lappend search_path "/home/ICer/test_RISCV/synthesis/output"
set_host_options -max_cores 6
set worst_case "saed90nm_max.db"
set_app_var target_library [list $worst_case]
set_app_var link_library  "* $target_library"
sh rm -rf work
sh mkdir -p work
define_design_lib work -path ./work
remove_design -all

set design RISCV


set_svf ${design}.svf

read_ddc ${design}.ddc
read_sdc ${design}.sdc
link
current_design





set chain_num 5

set_scan_configuration -chain_count $chain_num -clock_mixing no_mix -style multiplexed_flip_flop
set_dft_signal -view existing_dft -type ScanClock -port scan_clk -timing {45 55}
set_dft_signal -view existing_dft -type Reset -port scan_rst -active 0
set_dft_signal -view existing_dft -type TestMode -port test_mode -active 1

create_port scan_en -direction in
set_dft_signal -view spec -type ScanEnable -port [get_ports scan_en] -active 1

for {set i 1} {$i<6} {incr i 1} {
create_port scan_in_$i -direction in
set_dft_signal -view spec -type ScanDataIn -port scan_in_$i

create_port scan_out_$i -direction out
set_dft_signal -view spec -type ScanDataOut -port scan_out_$i
}

create_test_protocol
set_dft_insertion_configuration -preserve_design_name true -synthesis_optimization none
  
source ../cons/cons.tcl
set_fix_multiple_port_nets -all -buffer_constants

link 
compile -scan -map_effort medium

dft_drc -verbose
preview_dft -show all

insert_dft
dft_drc
check_design

report_timing -max_paths 20 > ../reports/dft_timing.rpt
set_case_analysis 0 [get_ports test_mode]
report_timing -max_paths 20 > ../reports/dft_timing_fun.rpt
dft_drc -coverage_estimate > ../reports/rpt_dft.drc_coverage
dft_drc > ../reports/drc.rpt
report_area > ../reports/dft_area.rpt
report_qor > ../reports/dft_qor.rpt
report_constraint -all_violators  > ../reports/dft_violations.rpt
report_scan_path -chain all > ../reports/scan_chains.rpt
report_dft_signal -view existing_dft  > ../reports/dft_existing_dft.rpt
report_dft_signal -view spec > ../reports/dft_spec.rpt

set verilogout_no_tri	 true
set verilogout_equation  false
write -format ddc  -hierarchy -output ../output/${design}.ddc
write -format verilog  -hierarchy -output ../output/${design}.v
write_test_model -output ../output/${design}.ctl
write_sdc ../output/${design}.sdc 
# ---- SPF_File (STIL Protcol File) ---- # 
write_test_protocol -out ../output/${design}.spf
# ---- SDF_File (Standard Delay Format) ---- # 
write_sdf  ../output/${design}.sdf
# ---- def_File (reorder scan chains placment step) ---- #
write_scan_def -output ../output/${design}.def
set_svf -off
gui_start
