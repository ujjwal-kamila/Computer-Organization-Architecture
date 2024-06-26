module rom_64x8 (
    input  wire clk,
    input  wire [5:0] addr,
    output reg [7:0] dout
);

reg [7:0] rom_memory [63:0];

integer i;
initial begin
    for (i = 0; i < 64; i = i + 1) begin
        rom_memory[i] = i;
    end
end

always @(posedge clk) begin
    dout <= rom_memory[addr];
end
endmodule

module rom_64x8_tb;

    reg clk;
    reg [5:0] addr;
    wire [7:0] dout; 

    rom_64x8 rom_inst (
    .clk(clk),
    .addr(addr),
    .dout(dout)
    );

    always #5 clk = ~clk;
    integer i;
    initial begin
        clk = 0;
        addr = 0; 
        for (i = 0; i < 64; i = i + 1) begin
            addr = i;
            #10;
            $display("At Time :%0t  Address is : %h,  Data is : %h",$time-10, addr, dout);
        end
        $finish; 
    end
endmodule
