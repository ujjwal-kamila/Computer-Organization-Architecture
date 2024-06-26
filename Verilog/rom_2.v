module rom_64x8 (
    input [5:0] address, 
    output reg [7:0] data 
);
    
    reg [7:0] rom [0:63];
    initial begin
        rom[0] = 8'h00;
        rom[1] = 8'h01;
        rom[2] = 8'h02;
        rom[3] = 8'h03;
        rom[4] = 8'h04;
        rom[5] = 8'h05;
        rom[6] = 8'h06;
        rom[7] = 8'h07;
        rom[8] = 8'h08;
        rom[9] = 8'h09;
        rom[10] = 8'h0A;
        rom[11] = 8'h0B;
        rom[12] = 8'h0C;
        rom[13] = 8'h0D;
        rom[14] = 8'h0E;
        rom[15] = 8'h0F;
        rom[16] = 8'h10;
        rom[17] = 8'h11;
        rom[18] = 8'h12;
        rom[19] = 8'h13;
        rom[20] = 8'h14;
        rom[21] = 8'h15;
        rom[22] = 8'h16;
        rom[23] = 8'h17;
        rom[24] = 8'h18;
        rom[25] = 8'h19;
        rom[26] = 8'h1A;
        rom[27] = 8'h1B;
        rom[28] = 8'h1C;
        rom[29] = 8'h1D;
        rom[30] = 8'h1E;
        rom[31] = 8'h1F;
        rom[32] = 8'h20;
        rom[33] = 8'h21;
        rom[34] = 8'h22;
        rom[35] = 8'h23;
        rom[36] = 8'h24;
        rom[37] = 8'h25;
        rom[38] = 8'h26;
        rom[39] = 8'h27;
        rom[40] = 8'h28;
        rom[41] = 8'h29;
        rom[42] = 8'h2A;
        rom[43] = 8'h2B;
        rom[44] = 8'h2C;
        rom[45] = 8'h2D;
        rom[46] = 8'h2E;
        rom[47] = 8'h2F;
        rom[48] = 8'h30;
        rom[49] = 8'h31;
        rom[50] = 8'h32;
        rom[51] = 8'h33;
        rom[52] = 8'h34;
        rom[53] = 8'h35;
        rom[54] = 8'h36;
        rom[55] = 8'h37;
        rom[56] = 8'h38;
        rom[57] = 8'h39;
        rom[58] = 8'h3A;
        rom[59] = 8'h3B;
        rom[60] = 8'h3C;
        rom[61] = 8'h3D;
        rom[62] = 8'h3E;
        rom[63] = 8'h3F;
    end

    always @(*) begin
        data = rom[address];
    end
endmodule


//TestBench 

module tb_rom_64x8;
    reg [5:0] address;
    wire [7:0] data;
    rom_64x8 uut (
        .address(address), 
        .data(data)
    );

    initial begin
        address = 0;
        $monitor("At time %0t, address = %h, data = %h", $time, address, data);
        
        #10 address = 6'h00;
        #10 address = 6'h01;
        #10 address = 6'h02;
        #10 address = 6'h03;
        #10 address = 6'h04;
        #10 address = 6'h05;
        #10 address = 6'h06;
        #10 address = 6'h07;
        #10 address = 6'h08;
        #10 address = 6'h09;
        #10 address = 6'h0A;
        #10 address = 6'h0B;
        #10 address = 6'h0C;
        #10 address = 6'h0D;
        #10 address = 6'h0E;
        #10 address = 6'h0F;
        #10 address = 6'h10;
        #10 address = 6'h11;
        #10 address = 6'h12;
        #10 address = 6'h13;
        #10 address = 6'h14;
        #10 address = 6'h15;
        #10 address = 6'h16;
        #10 address = 6'h17;
        #10 address = 6'h18;
        #10 address = 6'h19;
        #10 address = 6'h1A;
        #10 address = 6'h1B;
        #10 address = 6'h1C;
        #10 address = 6'h1D;
        #10 address = 6'h1E;
        #10 address = 6'h1F;
        #10 address = 6'h20;
        #10 address = 6'h21;
        #10 address = 6'h22;
        #10 address = 6'h23;
        #10 address = 6'h24;
        #10 address = 6'h25;
        #10 address = 6'h26;
        #10 address = 6'h27;
        #10 address = 6'h28;
        #10 address = 6'h29;
        #10 address = 6'h2A;
        #10 address = 6'h2B;
        #10 address = 6'h2C;
        #10 address = 6'h2D;
        #10 address = 6'h2E;
        #10 address = 6'h2F;
        #10 address = 6'h30;
        #10 address = 6'h31;
        #10 address = 6'h32;
        #10 address = 6'h33;
        #10 address = 6'h34;
        #10 address = 6'h35;
        #10 address = 6'h36;
        #10 address = 6'h37;
        #10 address = 6'h38;
        #10 address = 6'h39;
        #10 address = 6'h3A;
        #10 address = 6'h3B;
        #10 address = 6'h3C;
        #10 address = 6'h3D;
        #10 address = 6'h3E;
        #10 address = 6'h3F;
        #10 $finish;
    end

endmodule