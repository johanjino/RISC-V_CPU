#include "Vcontrol_unit.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv, char **env){
    int i;
    int clk;

    Verilated::commandArgs(argc, argv);
    //init top verilog instance
    Vcontrol_unit* top = new Vcontrol_unit;
    // init trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99);
    tfp->open ("control_unit.vcd");

    //initialize simulation inputs 
    top->instr = 0xfe0318e3;
    top->EQ = 0;

    // run simulation for many clock cycles
    for (int i=0; i<15; i++){
        if (i==1){
            top->instr = 0x0ff00313;
        }
        else if (i==3){
            top->instr = 0x00000513;
        }
        else if (i==5){
            top->instr = 0xfe659ce3;
        }
        else if (i==7){
            top->instr = 0x00058513;
        }
        else if (i==9){
            top->instr = 0x00158593;
        }
        else if (i==11){
            top->instr = 0xfe659ce3;
            top->EQ = 1;
        }
        


        // dump variables into VCD file and toggle clock 
        tfp->dump (2*i+clk);
        top->eval ();
        //top->ImmOp = 0;
        if (Verilated::gotFinish())  exit(0);
    }
    tfp->close();
    exit(0);
}