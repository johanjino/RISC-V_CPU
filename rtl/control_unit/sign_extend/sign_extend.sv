/* verilator lint_off UNUSED */
module sign_extend #(
    parameter   DATA_WIDTH = 32
)(
    input   logic [DATA_WIDTH-1:0]  instr,
    input   logic [1:0]   ImmSrc,    
    output  logic [DATA_WIDTH-1:0]  ImmOp
);

    always_comb 
            case (ImmSrc)
                2'b00 :     ImmOp = {{20{instr[31]}}, instr[31:20]};
                2'b01 :     ImmOp = {{20{instr[31]}}, instr[31:25], instr[11:7]};
                2'b10 :     ImmOp = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
                default:    ImmOp = {{20{instr[31]}}, instr[31:20]};
            endcase

endmodule
