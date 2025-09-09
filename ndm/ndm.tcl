set worst_case "saed90nm_max.db"
set lib_name ndm
set std_cell_path "/home/ICer/Downloads/Lib/synopsys/models"
set tf_path "/home/ICer/Downloads/Lib/process/astro/tech/astroTechFile.tf"
set lef_path "/home/ICer/Downloads/Lib/lef/saed90nmEditted.lef"


create_workspace -flow exploration -technology $tf_path $lib_name

read_db $std_cell_path/${worst_case}
read_lef $lef_path

set_app_options -list {lib.workspace.keep_all_physical_cells {true}}
set_app_options -list {lib.workspace.save_design_views {true}}
set_app_options -list {lib.workspace.save_layout_views {true}}
set_app_options -list {design.enable_lib_cell_editing {mutable}}

group_libs
process_workspaces -directory ./ndm_libs -output $lib_name
quit
