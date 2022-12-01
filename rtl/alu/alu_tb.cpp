#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Valu_top.h"

#include "vbuddy.cpp"     // include vbuddy code

int main(int argc, char **argv, char **env) {
  int i;     
  int clk;       

  Verilated::commandArgs(argc, argv);
  // init top verilog instance
  Valu_top* top = new Valu_top;
  // init trace dump
  Verilated::traceEverOn(true);
  VerilatedVcdC* tfp = new VerilatedVcdC;
  top->trace (tfp, 99);
  tfp->open ("alu_top.vcd");

  // initialize simulation inputs
  top->ImmOp = 0xFFFFFFFC; // 32-bit Immediate Operand fed from sign-extended 8-bit instr output
  top->RegWrite = 1; // 1-bit (Enable Register Write)
  top->ALUsrc = 1; // 1-bit (Multiplexer Control - 0 selects RegOp2 from RD2 register, 1 selects ImmOp. Note RD2 maps to AD2 and likewise for RD1)
  top->ALUctrl = 0; // 3-bit: 0 for ADD, 1 for SUB, 2 for AND, 3 for OR, 5 for SET LESS THAN (checker if A<B)
  top->rs1 = 9; // 32-bit source register 1. we pick address at 9 for read op
  top->rs2 = 0; // 32-bit source register 2 
  top->rd = 6; // 32-bit dest register; we overwrite address at 6
  top->data_mem_WE = 0; // for lw we don't need WE for datamem
  top->data_mem_WD = 0; // for lw we don't need WE for datamem

  // run simulation for 500 clock cycles
  for (i=0; i<500; i++) {
    // dump variables into VCD file and toggle clock
    for (clk=0; clk<2; clk++) {
      tfp->dump(2*i+clk);
      top->clk = !top->clk;
      top->eval ();
    }

    std::cout << top->a0 << std::endl;

    // either simulation finished, or 'q' is pressed
    if ((Verilated::gotFinish()) || (vbdGetkey()=='q')) 
      exit(0);                // ... exit if finish OR 'q' pressed
  }

  vbdClose();     // ++++
  tfp->close(); 
  exit(0);
}
