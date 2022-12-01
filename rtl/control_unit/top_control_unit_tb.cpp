#include "Vtop_control_unit.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv, char **env){
    int i;
    int clk;

    Verilated::commandArgs(argc, argv);
    //init top verilog instance
    Vtop_control_unit* top = new Vtop_control_unit;
    // init trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99);
    tfp->open ("top_control_unit.vcd");

    //initialize simulation inputs 
    top->PC = 0;
    top->EQ = 0;

    // run simulation for many clock cycles
    for (int i=0; i<15; i++){
        top->PC++;

        // dump variables into VCD file and toggle clock 
        tfp->dump (2*i+clk);
        top->eval ();
        //top->ImmOp = 0;
        if (Verilated::gotFinish())  exit(0);
    }
    tfp->close();
    exit(0);
}