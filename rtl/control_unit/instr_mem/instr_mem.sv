module instr_mem #(
    parameter  ADDRESS_WIDTH = 8,
                DATA_WIDTH = 32
)(
    input logic [ADDRESS_WIDTH-1:0] pc,
    output logic [DATA_WIDTH-1:0]   instr
);

    logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0];
    
    initial begin
        $readmemh("test_instructions.mem", rom_array);
    end;

    always_comb begin
        // async output
        instr = rom_array[pc];
    end

endmodule
