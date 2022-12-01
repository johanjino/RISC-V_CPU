`include "instr_mem/instr_mem.sv"
`include "control_unit/control_unit.sv"
`include "sign_extend/sign_extend.sv"

module top_control_unit #(
        parameter  ADDRESS_WIDTH = 8,
                DATA_WIDTH = 32
)(
    input   logic   [ADDRESS_WIDTH-1:0] PC,
    input   logic                       EQ,
    output  logic                       RegWrite,
    output  logic   [2:0]               ALUctrl,
    output  logic                       ALUsrc,
    output  logic                       PCsrc,
    output  logic   [4:0]               rs1,
    output  logic   [4:0]               rs2,
    output  logic   [4:0]               rd,
    output  logic   [DATA_WIDTH-1:0]    ImmOp
);

    wire    [DATA_WIDTH-1:0]    instr;
    wire    [11:0]              ImmSrc;


    assign rs1  = instr[19:15];
    assign rs2  = instr[24:20];
    assign rd   = instr[11:7];


    instr_mem #(ADDRESS_WIDTH, DATA_WIDTH) my_instr_mem(
        .PC (PC),      
        .instr (instr)   
        );

    control_unit #(DATA_WIDTH) my_control_unit(
        .instr (instr),
        .EQ (EQ),
        .RegWrite (RegWrite),
        .ALUctrl (ALUctrl),
        .ALUsrc (ALUsrc),
        .ImmSrc (ImmSrc),
        .PCsrc (PCsrc)
        );

    sign_extend #(DATA_WIDTH, 12) my_sign_extend(
        .instr (instr),
        .ImmSrc (ImmSrc),    
        .ImmOp (ImmOp)
    );


endmodule
