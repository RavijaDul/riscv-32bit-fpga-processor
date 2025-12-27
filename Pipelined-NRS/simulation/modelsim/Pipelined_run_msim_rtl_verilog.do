transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/ThreebyOneMux.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/reg_file.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/program_counter.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/pipeline_flush.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/MEMWB.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/instruction_parser.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/instruction_memory.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/imm_data_extractor.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/IFID.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/IDEX.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/hazard_detection_unit.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/ForwardingUnit.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/EXMEM.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/data_memory.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/control_unit.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/branching_unit.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/alu_control.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/alu_64bit.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/adder.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/2_1mux.sv}
vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/Final.sv}

vlog -sv -work work +incdir+C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4 {C:/Users/UserUser.DESKTOP-VSEAMRA/Videos/DSD_Group_Final_Backup/Pipelined-NRS/4/testb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testb

add wave *
view structure
view signals
run -all
