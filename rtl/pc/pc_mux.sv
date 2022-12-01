module pc_mux #(
    parameter WIDTH = 32
)(
    input logic PCsrc,
    input logic [WIDTH-1:0] pc ,
    input logic [WIDTH-1:0] ImmOp,
    output logic [WIDTH-1:0] next_PC
);

    assign next_PC = PCsrc ? pc + ImmOp : pc + 32'd4;

endmodule
