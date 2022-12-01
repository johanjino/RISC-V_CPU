/* verilator lint_off UNUSED */
module control_unit #(
    parameter DATA_WIDTH = 32
)(
    input   logic   [DATA_WIDTH-1:0]    instr,
    input   logic                       EQ,
    output  logic                       RegWrite,
    output  logic   [2:0]               ALUctrl,
    output  logic                       ALUsrc,
    output  logic   [1:0]               ImmSrc,
    output  logic                       PCsrc,
    output  logic                       MEMWrite,
    output  logic                       MEMsrc
);
    //RegWrite
    always_comb
        casez ({instr[6:0],instr[14:12]})
            {7'b0000011, 3'b???}:   RegWrite = 1'b1;
            {7'b0010011, 3'b???}:   RegWrite = 1'b1;
            default: RegWrite = 1'b0;
        endcase

    //ALUctrl
    always_comb
        case ({instr[6:0],instr[14:12]})
            {7'b0010011, 3'b000}:   ALUctrl = 3'b000;
            {7'b0010011, 3'b110}:   ALUctrl = 3'b011; //or
            {7'b0010011, 3'b010}:   ALUctrl = 3'b101; //slt
            {7'b0010011, 3'b111}:   ALUctrl = 3'b010; //and
            {7'b0000011, 3'b010}:   ALUctrl = 3'b000; //lw
            {7'b0100011, 3'b010}:   ALUctrl = 3'b000; //sw
            default: ALUctrl = 3'b111;
        endcase

    //ALUsrc
    always_comb
        casez ({instr[6:0],instr[14:12]})
            {7'b0010011, 3'b???}:   ALUsrc = 1'b1;
            {7'b0000011, 3'b???}:   ALUsrc = 1'b1;
            default: ALUsrc = 1'b0;
        endcase

    //ImmSrc
    always_comb
            casez ({instr[6:0],instr[14:12]})
                {7'b0000011, 3'b???}:     ImmSrc = 2'b00;
                {7'b0010011, 3'b???}:     ImmSrc = 2'b00;
                {7'b1100011, 3'b???}:     ImmSrc = 2'b10;
                default:                        ImmSrc = 2'b00;
            endcase

    //PCsrc
    always_comb
        begin
            if (({instr[6:0],instr[14:12]} == {7'b1100011,3'b000}) && EQ)
                PCsrc = 1'b1;
            else if (({instr[6:0],instr[14:12]} == {7'b1100011,3'b001}) && ~EQ)
                PCsrc = 1'b1;
            else
                PCsrc = 1'b0;
        end

    //MEMWrite
    always_comb
        case ({instr[6:0],instr[14:12]})
            {7'b0100011, 3'b010}:   MEMWrite = 1'b1;
            default:                MEMWrite = 1'b0;
        endcase

    //MEMsrc
    always_comb 
        case ({instr[6:0],instr[14:12]})
            {7'b0000011, 3'b010}:   MEMsrc = 1'b1;
            default:                MEMsrc = 1'b0;
        endcase

            

 
endmodule
