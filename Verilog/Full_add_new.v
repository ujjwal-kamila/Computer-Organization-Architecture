module full_adder (
    input a, 
    input b, 
    input cin, 
    output sum, 
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module four_bit_full_adder (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire c0, c1, c2;
    full_adder fa0(a[0], b[0], cin, sum[0], c0);
    full_adder fa1(a[1], b[1], c0, sum[1], c1);
    full_adder fa2(a[2], b[2], c1, sum[2], c2);
    full_adder fa3(a[3], b[3], c2, sum[3], cout);
endmodule

module tb_four_bit_full_adder;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    four_bit_full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("Full_adder.vcd");
        $dumpvars(0, tb_four_bit_full_adder);
        $monitor($time, " a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);
        a = 4'b1010;
        b = 4'b0110;
        cin = 1'b0;
        #5 cin = 1'b1;
        #5 $finish;
    end

endmodule