module program_counter (
    inout [7:0] bit_bus,
    input wire clk,           
    input wire Counter_Enable,
    input wire Counter_Out,
    input wire Counter_In,
    input wire Counter_Clear
);

    reg [7:0] counter_reg = 8'h81;
    reg [19:0] debounce_timer = 0; // Enough for ~20ms debounce
    reg clean_enable = 0;
    reg enable_prev = 0;

    // 1. Tri-state Bus (Always active)
    assign bit_bus = (Counter_Out) ? counter_reg : 8'bz;

    // 2. Debouncing Logic
    // This ignores rapid flickers and only changes 'clean_enable' 
    // when the button has been steady for a while.
    always @(posedge clk) begin
        if (Counter_Enable !== clean_enable) begin
            debounce_timer <= debounce_timer + 1;
            if (debounce_timer >= 1_000_000) begin // ~20ms at 50MHz
                clean_enable <= Counter_Enable;
                debounce_timer <= 0;
            end
        end else begin
            debounce_timer <= 0;
        end
    end

    // 3. Counter Logic (Runs at full clock speed for responsiveness)
    always @(posedge clk) begin
        enable_prev <= clean_enable;

        if (Counter_Clear) begin
            counter_reg <= 8'b0;
        end else if (Counter_In) begin
            counter_reg <= bit_bus; // Load from bus
        end else if (clean_enable && !enable_prev) begin 
            // Trigger exactly ONCE per debounced button press
            counter_reg <= counter_reg + 1;
        end
    end

endmodule