module mux4b2to1(a,c,e);
	input [3:0] a;
	input c;
	output [3:0] e;
	wire [3:0] p,q;
	assign p[3] = (~c)&a[3];
	assign p[2] = (~c)&a[2];
	assign p[1] = (~c)&a[1];
	assign p[0] = (~c)&a[0];
	assign q[3] = c & (~a[3]);
	assign q[2] = c & (~a[2]);
	assign q[1] = c & (~a[1]);
	assign q[0] = c & (~a[0]);
	assign e = p|q;
endmodule
	
module fulladder1b(a,b,c_in,s,c_out);
	input a,b,c_in;
	output s,c_out;
	assign s = a^b^c_in;
	assign c_out = (a & b) | (b & c_in) | (c_in & a);
endmodule


module addsub4b(x,y,c_in2,s,c_out2);
	input [3:0] x,y;
	input c_in2;
	output [3:0] s;
	output c_out2;
	wire [3:0] c_wire;
	wire [3:0] y_m;
	mux4b2to1 g1 (y,c_in2,y_m);
	fulladder1b b0 (x[0],y_m[0],c_in2,s[0],c_wire[0]);
	fulladder1b b1 (x[1],y_m[1],c_wire[0],s[1],c_wire[1]);
	fulladder1b b2 (x[2],y_m[2],c_wire[1],s[2],c_wire[2]);
	fulladder1b b3 (x[3],y_m[3],c_wire[2],s[3],c_wire[3]);
	assign c_out2 = c_wire[3] ^ c_in2;
endmodule

module testbench(
	output reg [3:0] x,y,
	output reg c_in2,
	input wire [3:0] s,
	input wire c_out2
);	
	initial
		begin
			$monitor ($time, " x=%b, y=%b, c_in= %b, c_out2=%b, s=%b", x,y,c_in2,c_out2,s);
			x=4'b0000; y=4'b0000; c_in2=1'b0;
			#5 x=4'b1000; y=4'b1010; c_in2=1'b0;
			#5 x=4'b1001; y=4'b1011; c_in2=1'b0;
			#5 x=4'b1100; y=4'b0010; c_in2=1'b1;
			#5 x=4'b1011; y=4'b0100; c_in2=1'b1;
			#5 x=4'b0011; y=4'b1100; c_in2=1'b1;
			#5 $finish;
		end
endmodule

module workbench;
	wire [3:0] x,y;
	wire c_in2;
	wire [3:0] s;
	wire c_out2;
    
    initial begin
        $dumpfile("addsub4bit.vcd");
        $dumpvars(0,workbench);
    end    
    addsub4b DUT(x,y,c_in2,s,c_out2);
    testbench tb (x,y,c_in2,s,c_out2);
endmodule
			
