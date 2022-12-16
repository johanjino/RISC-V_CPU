#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vrisc_v.h"

// #include "vbuddy.cpp" //VBuddy - to use the VBuddy functions

int main(int argc, char **argv, char **env) {
  int i; 
  int clk;   

  Verilated::commandArgs(argc, argv);
  
  Vrisc_v* top = new Vrisc_v;

  Verilated::traceEverOn(true);
  VerilatedVcdC* tfp = new VerilatedVcdC;
  top->trace (tfp, 99);
  tfp->open ("risc_v.vcd");
 
  top->clk = 1;
  top->rst = 1;

  // vbdOpen(); //VBuddy - initiating the VBuddy connection

  for (int i=0; i<500000; i++){       
      for (clk=0; clk<2; clk++){
          tfp->dump (2*i+clk);
          top->clk = !top->clk;
          top->eval ();
      }

      top->rst = 0;

      // vbdSetMode(1);        //VBuddy - setting up a delay loop, so that the CPU only goes to the next
      // while (vbdFlag()!=1){ //         clock cycle whenever the vbdFlag is pressed HIGH. This allows us
      // }                     //         to see the step-by-step changes on the VBuddy due to the a0 outputs

      // vbdBar(top->a0 & 0xFF); //VBuddy - displaying the outputs on the neopixel strip

      if (Verilated::gotFinish())
      exit(0);
  }

  // vbdClose(); //VBuddy - closing the VBuddy connection

  tfp->close();
  exit(0);
}