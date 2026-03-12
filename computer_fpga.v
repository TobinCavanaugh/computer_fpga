module computer_fpga 
(
	input wire clk, 				// FPGA clock
	
	// Program Counter =======
	inout [7:0] bit_bus, 		// GPIO pins for the program counter
	
	input wire Counter_Enable,
	input wire Counter_Out,		// Output of the bit_bus
	input wire Counter_In,		// Read in counter from the bit_bus
	input wire Counter_Clear,	// Clear the program counter
	input wire Computer_Reset,	// Reset the entire computer
	
	// ALU ===================
	inout [7:0] reg_bus,			// Bus for ALU
	
	input wire reg_A_in,			// Trigger for reading in A
	input wire reg_B_in,			// Trigger for reading in B
	
	input wire reg_A_out,		// Trigger for output A to bus (Only for A register)
	
	input wire reg_A_clr, 		// Clear A register
	input wire reg_B_clr, 		// Clear B register
	
	input wire regs_reset, 		// Reset A & B registers
	
	input wire alu_out, 			// Dump the result to the bus
	input wire alu_sub 			// Flag for A-B
);

reg [7:0] reg_A = 8'b0;
reg [7:0] reg_B = 8'b0;
reg [7:0] alu_result = 8'b0;

program_counter pc_inst (
	.bit_bus(bit_bus),
	.clk(clk),
   .Counter_Enable(Counter_Enable),
   .Counter_Out(Counter_Out),
   .Counter_In(~Counter_In),
   .Counter_Clear(~Counter_Clear)
);


endmodule