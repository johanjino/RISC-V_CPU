module data_mem #(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (
    input  logic                             clk,
    input  logic     [2:0]                   RE,
    input  logic     [3:0]                   WE,
    input  logic     [ADDRESS_WIDTH-1:0]     A,
    input  logic     [7:0]                   WD1,
    input  logic     [7:0]                   WD2,
    input  logic     [7:0]                   WD3,
    input  logic     [7:0]                   WD4,
    output logic     [DATA_WIDTH-1:0]        RD
);

    logic   [7:0]     data_mem_register     [32'h0001FFFF:32'h00000000]; // figuring out how to load regfile with initial values

    initial begin
        $readmemh("datarom.mem", data_mem_register, 32'h00010000); // remove when merge; prove of workability
    end;
    
    logic [ADDRESS_WIDTH-1:0]   A1,A2,A3,A4;

    assign A1 = A;
    assign A2 = A+1;
    assign A3 = A+2;
    assign A4 = A+3;

    always_ff @ (posedge clk) begin
        if (WE[0] == 1'b1)
            data_mem_register [A1] <= WD1;
        if (WE[1] == 1'b1)
            data_mem_register [A2] <= WD2;
        if (WE[2] == 1'b1)
            data_mem_register [A3] <= WD3;
        if (WE[3] == 1'b1)
            data_mem_register [A4] <= WD4;
    end

    always_comb begin
        case (RE)
            3'b111:     RD = {data_mem_register[A4],data_mem_register[A3],data_mem_register[A2],data_mem_register[A1]};
            3'b000:     RD = {{24{1'b0}},data_mem_register[A1]};
            default:    RD = {data_mem_register[A4],data_mem_register[A3],data_mem_register[A2],data_mem_register[A1]};
            //other instructions can be implemented later
        endcase
    end
    
endmodule
