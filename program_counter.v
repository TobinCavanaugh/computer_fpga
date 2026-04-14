module program_counter (
    inout      [3:0] bit_bus,         // 4-bit bidirectional data bus
    input wire       clk,             // Circuit clock
    input wire       Counter_Enable,  // Control signal, should clk increment?
    input wire       Counter_Out,     // Control signal to output to bus
    input wire       Counter_In,      // Control signal to load from bus
    input wire       Counter_Clear,   // Control Signal reset/clear
	 input wire 		Counter_Reset	  // Control Signal reset/clear
);
  reg [3:0] counter_reg = 4'h00;

	always @(posedge clk or posedge Counter_Clear or posedge Counter_Reset) begin
		if (Counter_Clear || Counter_Reset) begin
			counter_reg <= 4'b0;
		end else begin
			if (Counter_In) begin
				counter_reg <= bit_bus;
			end else if (Counter_Enable) begin
            counter_reg <= counter_reg + 1;
			end
		end
   end
	 
	assign bit_bus = Counter_Out ? counter_reg : 4'bzzzz;
 
endmodule
