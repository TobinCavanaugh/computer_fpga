module cpu_alu(
    input wire clk,                 // FPGA clock
    inout [7:0] reg_bus,            // Bus for ALU
    
    input wire reg_A_in,            // Trigger for reading in A
    input wire reg_B_in,            // Trigger for reading in B
    
    input wire reg_A_out,           // Trigger for output A to bus
    
    input wire reg_A_clr,           // Clear A register
    input wire reg_B_clr,           // Clear B register
    
    input wire regs_reset,          // Reset A & B registers
    
    input wire alu_out,             // Dump the result to the bus
    input wire alu_sub,             // Flag for A-B
    
    output reg [7:0] reg_A,
    output reg [7:0] reg_B,
    output wire [7:0] alu_result
);

    assign alu_result = alu_sub ? (reg_A - reg_B) : (reg_A + reg_B);

	// Tri state:
	// High-impedence if nothing is enabled
	// output alu_result if alu_out is enabled
	// output reg_a if reg_A_out
    assign reg_bus = alu_out   ? alu_result :
                     reg_A_out ? reg_A      : 
                     8'bz;

    always @(posedge clk or posedge regs_reset) begin
        if (regs_reset) begin
            reg_A <= 8'h00;
            reg_B <= 8'h00;
        end else begin
            // Register A update logic
            if (reg_A_clr) 
                reg_A <= 8'h00;
            else if (reg_A_in) 
                reg_A <= reg_bus;

            // Register B update logic
            if (reg_B_clr) 
                reg_B <= 8'h00;
            else if (reg_B_in) 
                reg_B <= reg_bus;
        end
    end

endmodule