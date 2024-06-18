// D Flip-Flop Module with FSM (Finite State Machine)
module d_flipflop(
    input wire clk,    // Clock input
    input wire reset,  // Reset input
    input wire d,      // Data input
    output reg q       // Output
);

    // State encoding
    parameter IDLE = 2'b00;    // IDLE state
    parameter SET = 2'b01;     // SET state
    parameter RESET = 2'b10;   // RESET state

    reg [1:0] state, next_state; // Current state and next state registers

    // State transition on clock's positive edge or reset's positive edge
    always @(posedge clk or posedge reset)
    begin
        if (reset) // Asynchronous reset
        begin
            state <= IDLE; // Set state to IDLE
            q <= 1'b0;     // Clear output
        end
        else
            state <= next_state; // Move to next state
    end

    // Next state logic
    always @(*)
    begin
        case (state)
            IDLE: begin
                if (d)
                    next_state = SET; // Transition to SET state if data input is high
                else
                    next_state = RESET; // Transition to RESET state if data input is low
            end
            SET: begin
                next_state = IDLE; // Transition back to IDLE state
                q <= 1'b1;         // Set output to high
            end
            RESET: begin
                next_state = IDLE; // Transition back to IDLE state
                q <= 1'b0;         // Clear output
            end
            default: next_state = IDLE; // Default state transition to IDLE
        endcase
    end

endmodule

// Testbench for D Flip-Flop Module
module d_flipflop_tb;

    parameter CLK_PERIOD = 10; // Clock period for the simulation

    reg clk;    // Clock signal
    reg reset;  // Reset signal
    reg d;      // Data input signal
    wire q;     // Output signal

    // Instantiate the D flip-flop module
    d_flipflop DUT(
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation: Toggle clock every half period
    always #((CLK_PERIOD / 2)) clk <= ~clk;

    // Initial block for simulation setup
    initial begin
        $dumpfile("d_flipflop_tb.vcd"); // Dump file for waveform
        $dumpvars(0, d_flipflop_tb);    // Dump variables for all simulation instances

        reset = 1;  // Apply reset
        #20 reset = 0; // Release reset after 20 time units

        d = 0;     // Set data input to 0
        #20 d = 1; // Change data input to 1 after 20 time units
        #20 d = 0; // Change data input to 0 after 20 time units
        #20 d = 1; // Change data input to 1 after 20 time units
        #20 d = 0; // Change data input to 0 after 20 time units
        #20 $finish; // End simulation after sufficient time
    end

endmodule

// Waveform Bench for D Flip-Flop Module
module d_flipflop_wb;

    reg clk;    // Clock signal
    reg reset;  // Reset signal
    reg d;      // Data input signal
    wire q;     // Output signal

    // Instantiate the D flip-flop module
    d_flipflop DUT(
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation: Toggle clock every 5 time units
    always #5 clk <= ~clk;

    // Initial block for simulation setup
    initial begin
        reset = 1;  // Apply reset
        #20 reset = 0; // Release reset after 20 time units

        // Toggle data input 10 times with a delay of 10 time units
        repeat (10) begin
            #10 d = ~d;
        end
        #10 $finish; // End simulation after sufficient time
    end
endmodule
