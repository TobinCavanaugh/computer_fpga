module program_counter(
	inout [7:0] bit_bus,
	input wire clk,
	input wire Counter_Enable,
	input wire Counter_Out,
	input wire Counter_In,
	input wire Counter_Clear
);

	reg [7:0] counter_reg = 8'b00000001;
	reg [24:0] prescaler = 25'd0;
	
	// High impedence when not counter out
	//assign bit_bus = (Counter_Out) ? counter_reg : 8'bz;
	
	assign bit_bus = counter_reg;	
	
	always @(posedge clk) begin
        if (Counter_Clear) begin
				prescaler <= 25'd0;
            counter_reg <= 8'b00000000;
        end else if (Counter_In) begin
            counter_reg <= bit_bus;    // Load from bus
        end else if (Counter_Enable) begin
				if(prescaler >= 25'd25000000) begin
					counter_reg <= counter_reg + 1;
					prescaler = 25'd0;
				end
				prescaler <= prescaler + 1;
        end
    end

endmodule