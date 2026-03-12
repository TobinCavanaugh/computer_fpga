module program_counter (
    inout      [7:0] bit_bus,         // 8-bit bidirectional data bus
    input wire       clk,             // System clock
    input wire       Counter_Enable,  // Level-sensitive increment enable
    input wire       Counter_Out,     // Control signal to output to bus
    input wire       Counter_In,      // Control signal to load from bus
    input wire       Counter_Clear    // Synchronous reset
);

	// REWORK 

  // Initializing to 8'h00 is standard; 8'h81 if your specific architecture starts there
  reg [7:0] counter_reg = 8'h00;

  // Drive the bus only when Counter_Out is active
  assign bit_bus = (Counter_Out) ? counter_reg : 8'bz;

  reg prev = 1'b0;

  always @(posedge clk) begin
    if (Counter_Clear) begin
      // Synchronous Reset: Reset to 0 immediately on next clock edge
      counter_reg <= 8'b0;
    end else if (Counter_In) begin
      counter_reg <= bit_bus;
    end else if (prev == 0 && Counter_Enable == 1) begin
      counter_reg <= counter_reg + 1;
    end

    prev <= Counter_Enable;
  end

endmodule
