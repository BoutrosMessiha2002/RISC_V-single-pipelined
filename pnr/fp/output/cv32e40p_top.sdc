################################################################################
#
# Design name:  RISCV_fp
#
# Created by icc2 write_sdc on Thu Aug 28 00:29:16 2025
#
################################################################################

set sdc_version 2.1
set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

################################################################################
#
# Units
# time_unit               : 1e-09
# resistance_unit         : 1000000
# capacitive_load_unit    : 1e-15
# voltage_unit            : 1
# current_unit            : 1e-06
# power_unit              : 1e-12
################################################################################


# Mode: default
# Corner: default
# Scenario: default

# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 45
create_clock -name clk -period 5 -waveform {0 2.5} [get_ports {clk}]
set_load -pin_load 4 [get_ports {dummy_out[31]}]
set_load -pin_load 4 [get_ports {dummy_out[30]}]
set_load -pin_load 4 [get_ports {dummy_out[29]}]
set_load -pin_load 4 [get_ports {dummy_out[28]}]
set_load -pin_load 4 [get_ports {dummy_out[27]}]
set_load -pin_load 4 [get_ports {dummy_out[26]}]
set_load -pin_load 4 [get_ports {dummy_out[25]}]
set_load -pin_load 4 [get_ports {dummy_out[24]}]
set_load -pin_load 4 [get_ports {dummy_out[23]}]
set_load -pin_load 4 [get_ports {dummy_out[22]}]
set_load -pin_load 4 [get_ports {dummy_out[21]}]
set_load -pin_load 4 [get_ports {dummy_out[20]}]
set_load -pin_load 4 [get_ports {dummy_out[19]}]
set_load -pin_load 4 [get_ports {dummy_out[18]}]
set_load -pin_load 4 [get_ports {dummy_out[17]}]
set_load -pin_load 4 [get_ports {dummy_out[16]}]
set_load -pin_load 4 [get_ports {dummy_out[15]}]
set_load -pin_load 4 [get_ports {dummy_out[14]}]
set_load -pin_load 4 [get_ports {dummy_out[13]}]
set_load -pin_load 4 [get_ports {dummy_out[12]}]
set_load -pin_load 4 [get_ports {dummy_out[11]}]
set_load -pin_load 4 [get_ports {dummy_out[10]}]
set_load -pin_load 4 [get_ports {dummy_out[9]}]
set_load -pin_load 4 [get_ports {dummy_out[8]}]
set_load -pin_load 4 [get_ports {dummy_out[7]}]
set_load -pin_load 4 [get_ports {dummy_out[6]}]
set_load -pin_load 4 [get_ports {dummy_out[5]}]
set_load -pin_load 4 [get_ports {dummy_out[4]}]
set_load -pin_load 4 [get_ports {dummy_out[3]}]
set_load -pin_load 4 [get_ports {dummy_out[2]}]
set_load -pin_load 4 [get_ports {dummy_out[1]}]
set_load -pin_load 4 [get_ports {dummy_out[0]}]
set_clock_uncertainty -setup 0.3 [get_clocks {clk}]
set_clock_uncertainty -hold 0.2 [get_clocks {clk}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 11
set_driving_cell -lib_cell NBUFFX4 -pin Z [get_ports {rst}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 12
set_driving_cell -lib_cell NBUFFX4 -pin Z [get_ports {test_mode}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 48
set_input_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {rst}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 49
set_input_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {test_mode}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 50
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[31]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 51
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[30]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 52
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[29]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 53
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[28]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 54
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[27]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 55
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[26]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 56
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[25]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 57
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[24]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 58
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[23]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 59
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[22]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 60
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[21]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 61
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[20]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 62
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[19]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 63
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[18]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 64
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[17]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 65
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[16]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 66
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[15]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 67
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[14]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 68
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[13]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 69
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[12]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 70
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[11]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 71
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[10]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 72
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[9]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 73
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[8]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 74
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[7]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 75
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[6]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 76
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[5]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 77
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[4]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 78
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[3]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 79
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[2]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 80
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[1]}]
# /home/ICer/test_RISCV/synthesis/output/RISCV.sdc, line 81
set_output_delay -clock [get_clocks {clk}] -max 0.05 [get_ports {dummy_out[0]}]
set_max_capacitance 3 [current_design]
