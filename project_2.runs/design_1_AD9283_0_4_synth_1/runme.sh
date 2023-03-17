#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=A:/Work/XX/SDK/2019.1/bin;A:/Work/XX/Vivado/2019.1/ids_lite/ISE/bin/nt64;A:/Work/XX/Vivado/2019.1/ids_lite/ISE/lib/nt64:A:/Work/XX/Vivado/2019.1/bin
else
  PATH=A:/Work/XX/SDK/2019.1/bin;A:/Work/XX/Vivado/2019.1/ids_lite/ISE/bin/nt64;A:/Work/XX/Vivado/2019.1/ids_lite/ISE/lib/nt64:A:/Work/XX/Vivado/2019.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='C:/Programming/samplecode/FPGA/ExpansionModules/AD9283ADCExpansionModule/project_2/project_2.runs/design_1_AD9283_0_4_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log design_1_AD9283_0_4.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source design_1_AD9283_0_4.tcl
