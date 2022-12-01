module topPC #(
    parameter   WIDTH = 32
)(
    // interface signals
    input   logic                       clk,        // clock
    input   logic                       rst,        // reset        
    input   logic [WIDTH-1:0]           ImmOp,     
    input   logic                       PCsrc,
    //output logic [WIDTH-1:0]            pc_out (debugging purposes)
    
);

logic [WIDTH-1:0]   next_PC, pc;    // interconnect wire

pc_mux pc_mux(
    .clk (clk),
    .PCsrc (PCsrc),
    .ImmOp (ImmOp),
    .next_PC (next_PC),
    .pc (pc)
);

pcReg pcReg(
    .clk (clk),
    .rst (rst),
    .next_PC (next_PC),
    .pc (pc)
    //.another_pc(pc_out) (for debugging purposes)
);

endmodule
