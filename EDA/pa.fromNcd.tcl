
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name EDA -dir "D:/EDA/New folder/EDA/planAhead_run_2" -part xc7a100tcsg324-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "D:/EDA/New folder/EDA/router.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/EDA/New folder/EDA} }
set_property target_constrs_file "router.ucf" [current_fileset -constrset]
add_files [list {router.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "D:/EDA/New folder/EDA/router.ncd"
if {[catch {read_twx -name results_1 -file "D:/EDA/New folder/EDA/router.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"D:/EDA/New folder/EDA/router.twx\": $eInfo"
}
