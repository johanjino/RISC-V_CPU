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
    output  logic                       JALsrc,
    output  logic                       JALRsrc,
    output  logic   [3:0]               MEMWrite,
    output  logic   [2:0]               MEMRead,
    output  logic                       MEMsrc
);
    //RegWrite
    always_comb
        casez ({instr[6:0],instr[14:12]})
            {7'b0000011, 3'b???}:   RegWrite = 1'b1;
            {7'b0010011, 3'b???}:   RegWrite = 1'b1;
            {7'b1101111, 3'b???}:   RegWrite = 1'b1;

            default: RegWrite = 1'b0;
        endcase

    //ALUctrl
    always_comb
        casez ({instr[6:0],instr[14:12]})
            {7'b0010011, 3'b000}:   ALUctrl = 3'b000;
            {7'b0010011, 3'b110}:   ALUctrl = 3'b011; //or
            {7'b0010011, 3'b010}:   ALUctrl = 3'b101; //slt
            {7'b0010011, 3'b111}:   ALUctrl = 3'b010; //and
            {7'b0000011, 3'b???}:   ALUctrl = 3'b000; //lw
            {7'b0100011, 3'b???}:   ALUctrl = 3'b000; //sw
            default: ALUctrl = 3'b111;
        endcase

    //ALUsrc
    always_comb
        casez ({instr[6:0],instr[14:12]})
            {7'b0010011, 3'b???}:   ALUsrc = 1'b1;
            {7'b0000011, 3'b???}:   ALUsrc = 1'b1;
            {7'b0100011, 3'b???}:   ALUsrc = 1'b1;
            default: ALUsrc = 1'b0;
        endcase

    //ImmSrc
    always_comb
            case ({instr[6:0]})
                {7'b0000011}:   ImmSrc = 2'b00;
                {7'b0010011}:   ImmSrc = 2'b00;
                {7'b0100011}:   ImmSrc = 2'b01;
                {7'b1100011}:   ImmSrc = 2'b10;
                {7'b1101111}:   ImmSrc = 2'b11;
                default:        ImmSrc = 2'b00;
            endcase

    //PCsrc
    always_comb
        begin
            if (({instr[6:0],instr[14:12]} == {7'b1100011,3'b000}) && EQ)
                PCsrc = 1'b1;
            else if (({instr[6:0],instr[14:12]} == {7'b1100011,3'b001}) && ~EQ)
                PCsrc = 1'b1;
            else if ({instr[6:0]} == {7'b1101111})
                PCsrc = 1'b1;
            else if ({instr[6:0],instr[14:12]} == {7'b1100111,3'b000})
                PCsrc = 1'b0;
            else
                PCsrc = 1'b0;
        end

    //JALRsrc
    always_comb
        if ({instr[6:0],instr[14:12]} == {7'b1100111,3'b000})
            JALRsrc = 1'b1;
        else
            JALRsrc = 1'b0;
    
    //JALsrc
    always_comb
        if ({instr[6:0]} == {7'b1101111})
            JALsrc = 1'b1;
        else
            JALsrc = 1'b0;

    //MEMWrite
    always_comb
        case ({instr[6:0],instr[14:12]})
            {7'b0100011, 3'b010}:   MEMWrite = 4'b1111;
            {7'b0100011, 3'b000}:   MEMWrite = 4'b0001;
            {7'b0100011, 3'b100}:   MEMWrite = 4'b0001;
            default:                MEMWrite = 4'b0;
        endcase

    //MEMRead
    always_comb
        case ({instr[6:0],instr[14:12]})
            {7'b0000011, 3'b010}:   MEMRead = 3'b111;
            {7'b0000011, 3'b100}:   MEMRead = 3'b000;
            {7'b0000011, 3'b000}:   MEMRead = 3'b000;
            default:                MEMRead = 3'b111;
        endcase

    //MEMsrc
    always_comb 
        case ({instr[6:0],instr[14:12]})
            {7'b0000011, 3'b010}:   MEMsrc = 1'b1;
            {7'b0000011, 3'b100}:   MEMsrc = 1'b1;
            default:                MEMsrc = 1'b0;
        endcase

            

 
endmodule
