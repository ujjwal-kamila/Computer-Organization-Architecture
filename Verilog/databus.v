module multidropbus(output reg [15:0] A,B,C,D,
                    input wire Clock, Reset,A_en,B_en,C_en,D_en,
                    input wire [15:0] data_bus);
      always @ (posedge Clock or negedge Reset)
        begin
           if (!Reset)
             begin
                A<= 16'd0; 
             end
           else
             if (A_en)
               A <= data_bus;
        end
      always @ (posedge Clock or negedge Reset)
        begin
           if (!Reset)
             begin
                B <= 16'd0; 
             end
           else
             if (B_en)
               B <= data_bus;
        end
      always @ (posedge Clock or negedge Reset)
        begin
           if (!Reset)
             begin
                C <= 16'd0; 
             end
           else
             if (C_en)
               C <= data_bus;
        end
        
     always @ (posedge Clock or negedge Reset)
        begin
           if (!Reset)
             begin
                D <= 16'd0; 
             end
           else
             if (D_en)
               D <= data_bus;
        end
        
endmodule     

module testbench;
    reg [15:0] databus;
    reg Clock, Reset,A_en,B_en,C_en,D_en;
    wire [15:0] A,B,C,D;
    multidropbus DUT(A,B,C,D,Clock, Reset,A_en,B_en,C_en,D_en,databus);

    initial begin
        Clock = 1'b0;
        Reset = 1'b1;
        
         

        $monitor ($time, " Databus_in = %h, Clock = %b, Reset = %b, A_en = %b, B_en = %b, C_en = %b, D_en = %b, A = %h, B = %h, C = %h, D = %h", databus, Clock, Reset,A_en,B_en,C_en,D_en, A, B, C, D);
         databus = 16'd8;
         A_en = 1'b0;
         B_en = 1'b0;
         C_en = 1'b0;
         D_en = 1'b0;
        
        #10 A_en = 1'b1;B_en = 1'b0;C_en = 1'b0;D_en = 1'b0;
        #10 A_en = 1'b0;B_en = 1'b1;C_en = 1'b0;D_en = 1'b0;
        #10 A_en = 1'b0;B_en = 1'b0;C_en = 1'b1;D_en = 1'b0;
        #10 A_en = 1'b0;B_en = 1'b0;C_en = 1'b0;D_en = 1'b1;
        
       
        
        #10 $finish;
    end

   
    always #5 Clock = ~Clock;

endmodule
