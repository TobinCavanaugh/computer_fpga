module computer_fpga 
(
	inout [7:0] bit_bus, 
	input wire clk, 
	//input wire Counter_Enable,
	input wire Counter_Out,
	input wire Counter_In,
	input wire Counter_Clear,
	input wire Computer_Reset
);

reg Counter_Enable = 1'b1;

program_counter pc_inst (
	.bit_bus(bit_bus),
	.clk(clk),
   .Counter_Enable(Counter_Enable),
   .Counter_Out(~Counter_Out),
   .Counter_In(~Counter_In),
   .Counter_Clear(~Counter_Clear)
);

endmodule