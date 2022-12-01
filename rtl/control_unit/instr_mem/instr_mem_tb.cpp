#include "Vinstr_mem.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv, char **env){
    int i;
    int clk;

    Verilated::commandArgs(argc, argv);
    //init top verilog instance
    Vinstr_mem* top = new Vinstr_mem;
    // init trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99);
    tfp->open ("instr_mem.vcd");

    //initialize simulation inputs 
    top->PC = 0;

    // run simulation for many clock cycles
    for (int i=0; i<10; i++){
        top->PC = i;
        // dump variables into VCD file and toggle clock 
        tfp->dump (2*i+clk);
        top->eval ();
        if (Verilated::gotFinish())  exit(0);
    }
    tfp->close();
    exit(0);
}