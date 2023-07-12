
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name alu -dir "/home/sd/Documents/alu_nova/planAhead_run_2" -part xc3s700anfgg484-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "fa.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Selecao.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top Selecao $srcset
add_files [list {fa.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s700anfgg484-5
