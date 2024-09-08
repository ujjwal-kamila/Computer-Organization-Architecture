// Half Adder Module
module half_adder (
    input a,    // First input
    input b,    // Second input
    output sum, // Sum output
    output carry // Carry output
);

    // Logic for sum and carry
    assign sum = a ^ b;    // XOR gate for sum
    assign carry = a & b;  // AND gate for carry

endmodule

// Testbench for Half Adder
module tb_half_adder;

    // Testbench inputs
    reg a;
    reg b;

    // Testbench outputs
    wire sum;
    wire carry;

    // Instantiate the Half Adder
    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    // Test stimulus
    initial begin
        // Display the header for simulation output
        $monitor("Time: %0t | a = %b, b = %b | sum = %b, carry = %b", $time, a, b, sum, carry);

        // Apply test vectors
        a = 0; b = 0; #10;  // Test case 1: 0 + 0
        a = 0; b = 1; #10;  // Test case 2: 0 + 1
        a = 1; b = 0; #10;  // Test case 3: 1 + 0
        a = 1; b = 1; #10;  // Test case 4: 1 + 1

        // End simulation
        $finish;
    end

endmodule
