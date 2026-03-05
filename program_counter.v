module program_counter(
    inout [7:0] bit_bus,
    input wire clk,
    input wire Counter_Enable,
    input wire Counter_Out,
    input wire Counter_In,
    input wire Counter_Clear
);

    reg [7:0] counter_reg = 8'b00000000;

    // Continuous assignment handles the tri-state bus logic
    assign bit_bus = (Counter_Out) ? counter_reg : 8'bz;

    // Single always block handles ALL changes to counter_reg
    always @(posedge clk) begin
        if (Counter_Clear) begin
            counter_reg <= 8'b00000000;
        end 
        else if (Counter_In) begin
            // Load the value from the bus
            counter_reg <= bit_bus;
        end 
        else if (Counter_Enable) begin
            // Only increment if Enable is high on the rising edge of clk
            counter_reg <= counter_reg + 1;
        end
    end

endmodule