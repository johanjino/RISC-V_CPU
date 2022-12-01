module data_mem #(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (
    input  logic                             clk,
    input  logic                             WE,
    input  logic     [ADDRESS_WIDTH-1:0]     A,
    input  logic     [DATA_WIDTH-1:0]        WD,
    output logic     [DATA_WIDTH-1:0]        RD
);

    logic   [DATA_WIDTH-1:0]     data_mem_register     [2**ADDRESS_WIDTH-1:0]; // figuring out how to load regfile with initial values

    initial begin
        $readmemh("datarom.mem", data_mem_register); // remove when merge; prove of workability
    end;

    always_ff @ (posedge clk) begin
        if (WE == 1'b1) // if WRITE Enable, feed WD into A Register
            data_mem_register [A] <= WD;
    end

    assign RD = data_mem_register [A]; // RD1 outputs the A Register value

endmodule
