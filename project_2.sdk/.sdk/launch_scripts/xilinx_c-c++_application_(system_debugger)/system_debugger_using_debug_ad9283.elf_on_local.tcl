connect -url tcp:127.0.0.1:3121
source C:/Programming/samplecode/FPGA/ExpansionModules/AD9283ADCExpansionModule/project_2/project_2.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB 13724327082d01"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Platform Cable USB 13724327082d01" && level==0} -index 1
fpga -file C:/Programming/samplecode/FPGA/ExpansionModules/AD9283ADCExpansionModule/project_2/project_2.sdk/design_1_wrapper_hw_platform_0/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB 13724327082d01"} -index 0
loadhw -hw C:/Programming/samplecode/FPGA/ExpansionModules/AD9283ADCExpansionModule/project_2/project_2.sdk/design_1_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB 13724327082d01"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB 13724327082d01"} -index 0
dow C:/Programming/samplecode/FPGA/ExpansionModules/AD9283ADCExpansionModule/project_2/project_2.sdk/ad9283/Debug/ad9283.elf
configparams force-mem-access 0
bpadd -addr &main
