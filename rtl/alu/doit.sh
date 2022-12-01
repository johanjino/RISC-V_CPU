#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f alu_top.vcd

# run Verilator to translate Verilog into C++, including C++ Testbench
verilator -Wall -Wno-fatal --cc --trace alu_top.sv --exe alu_tb.cpp

# build CPP project via make automatically generaated
make -j -C obj_dir/ -f Valu_top.mk Valu_top

# run exe sim
obj_dir/Valu_top