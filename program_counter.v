module program_counter (
    inout      [7:0] bit_bus,         // 8-bit bidirectional data bus
    input wire       clk,             // System clock
    input wire       Counter_Enable,  // Level-sensitive increment enable
    input wire       Counter_Out,     // Control signal to output to bus
    input wire       Counter_In,      // Control signal to load from bus
    input wire       Counter_Clear,   // 
	 input wire 		Counter_Reset	  //
);

	// REWORK 

  reg [7:0] counter_reg = 8'h00;

  // Drive the bus only when Counter_Out is active
  // assign bit_bus = (Counter_Out) ? counter_reg : 8'bz;

  //reg prev = 1'b0;

  always @(posedge clk or posedge Counter_Clear or posedge Counter_Reset) begin
    if (Counter_Clear || Counter_Reset) begin
      counter_reg <= 8'b0;
    end else if (Counter_In) begin
      counter_reg <= bit_bus;
		
    //end else if (prev == 0 && Counter_Enable == 1) begin
	 end else if (Counter_Enable) begin
      counter_reg <= counter_reg + 1;
    end

    //prev <= Counter_Enable;
  end
  
	assign bit_bus = Counter_Out ? counter_reg : 8'bz;
 
endmodule
