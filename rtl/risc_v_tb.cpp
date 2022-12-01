#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vrisc_v.h"


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

  for (int i=0; i<100; i++){       
      for (clk=0; clk<2; clk++){
          tfp->dump (2*i+clk);
          top->clk = !top->clk;
          top->eval ();
      }

      top->rst = 0;

      

      
      if (Verilated::gotFinish())
      exit(0);
  }

  tfp->close();
  exit(0);
}