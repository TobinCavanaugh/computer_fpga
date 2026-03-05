module cpu_alu(
	input wire clk, 				// FPGA clock

	inout [7:0] reg_bus,			// Bus for ALU
	
	input wire reg_A_in,			// Trigger for reading in A
	input wire reg_B_in,			// Trigger for reading in B
	
	input wire reg_A_out,		// Trigger for output A to bus (Only for A register)
	
	input wire reg_A_clr, 		// Clear A register
	input wire reg_B_clr, 		// Clear B register
	
	input wire regs_reset, 		// Reset A & B registers
	
	input wire alu_out, 			// Dump the result to the bus
	input wire alu_sub, 			// Flag for A-B
	
	output reg [7:0] reg_A,
	output reg [7:0] reg_B,
	output wire [7:0] alu_result
);

always @(posedge clk or posedge regs_reset) begin
//	if (regs_reset) begin
//      reg_A <= 8'b0;
//      reg_B <= 8'b0;
//	end
//	else if (reg_A_clr) begin
//		if 
//	end
end

endmodule