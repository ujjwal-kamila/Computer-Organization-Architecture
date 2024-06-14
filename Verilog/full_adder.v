module full_adder (a,b,c,s,cout);
  input a, b ,c;
  output s, cout;
  wire w1, w2, w3 , w4 , w5;
  // s = w1 xor c w1 = a xor b
  xor (w1,a ,b);
  xor (s,c,w1);
  //cout = w5 or w4 w5 = w2 or w3
  and (w2,a ,b);
  and (w3,a,c);
  and (w4,b ,c);
  or (w5,w2,w3);
  or (cout,w5,w4);
endmodule

module ripple_adder (a,b,cin,s,cout);
  input [3:0] a, b;
  input cin;
  output [3:0] s;
  output cout;
  wire [3:1] c;
  full_adder FA0 (a[0], b[0], cin, s[0], c[1]);
  full_adder FA1 (a[1], b[1], c[1], s[1], c[2]);
  full_adder FA2 (a[2], b[2], c[2], s[2], c[3]);
  full_adder FA3 (a[3], b[3], c[3], s[3], cout);
endmodule

module ripple_adder_test;
  reg [3:0] a, b;
  reg cin;
  wire [3:0] s;
  wire cout;
  ripple_adder G0 (a, b, cin, s, cout);

  initial begin
    a = 4'b0000;
    b = 4'b0000;
    cin = 0;
    #50 $finish;
  end

  initial begin
    $dumpfile("ripple_adder.vcd");
    $dumpvars(0, ripple_adder_test);
    $monitor($time, "a = %b, b = %b, cin = %b, s = %b, cout = %b", a, b, cin, s, cout);
    #5 a = 4'b1111;
    #5 cin = 1;
    #5 b = 4'b1111;
    #5 cin = 0;
    #5 a = 4'b1010;
  end
endmodule