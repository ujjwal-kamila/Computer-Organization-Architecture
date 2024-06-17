// 16-bit Shift Register Module
module shift_reg16b(
    output reg [15:0] A, B, C, D, E, F, G, H,  // 16-bit output registers
    input wire [15:0] Din,                    // 16-bit input data
    input wire Reset, Clock                   // Reset and Clock inputs
);
    // Always block triggered on the positive edge of the Clock or the negative edge of Reset
    always @ (posedge Clock or negedge Reset)
    begin
        if (!Reset) // Asynchronous Reset
        begin
            // Reset all registers to 0
            A <= 16'd0; 
            B <= 16'd0; 
            C <= 16'd0; 
            D <= 16'd0; 
            E <= 16'd0; 
            F <= 16'd0; 
            G <= 16'd0; 
            H <= 16'd0;
        end
        else // On Clock edge
        begin
            // Shift the data through the registers
            A <= Din; 
            B <= A; 
            C <= B; 
            D <= C; 
            E <= D; 
            F <= E; 
            G <= F; 
            H <= G;
        end
    end
endmodule

// Testbench for 16-bit Shift Register
module testbench;
    reg [15:0] Din;       // 16-bit data input
    reg Clock, Reset;     // Clock and Reset signals
    wire [15:0] A, B, C, D, E, F, G, H;  // 16-bit outputs

    // Instantiate the shift register module
    shift_reg16b DUT(A, B, C, D, E, F, G, H, Din, Reset, Clock);

    initial begin
        // Initialize Clock and Reset
        Clock = 1'b0;
        Reset = 1'b1;
        
        // Monitor changes in signals and display them
        $monitor ($time, " Data_in = %h, Clock = %b, Reset = %b, A = %h, B = %h, C = %h, D = %h, E = %h, F = %h, G = %h, H = %h", Din, Clock, Reset, A, B, C, D, E, F, G, H);

        // Stimulus
        #1 Din = 16'd8;   // Apply initial data input
        #2 Reset = 1'b0;  // De-assert Reset to observe resetting of outputs
        #2 Reset = 1'b1;  // Assert Reset back to 1 to start operation
        
        // Add more test vectors as needed
        
        #34 $finish;  // End simulation after sufficient time
    end

    // Clock generation: Toggle clock every 2 time units
    always #2 Clock = ~Clock;
endmodule
