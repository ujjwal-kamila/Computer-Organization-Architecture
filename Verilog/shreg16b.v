module shift_reg16b(output reg [15:0] A,B,C,D,E,F,G,H,
                    input wire [15:0] Din,
                    input wire Reset, Clock);
   always @ (posedge Clock or negedge Reset)
     begin
        if (!Reset)
          begin
            A <= 16'd0; B <= 16'd0; C <= 16'd0; D <= 16'd0; E <= 16'd0; F <= 16'd0; G <= 16'd0; H <= 16'd0;
            end
        else
          begin
            A <= Din; B <= A; C <= B; D <= C; E <= D; F <= E; G <= F; H <= G;
            end
      end
endmodule 

module testbench;
    reg [15:0] Din;
    reg Clock, Reset;
    wire [15:0] A,B,C,D,E,F,G,H;
    shift_reg16b DUT(A,B,C,D,E,F,G,H, Din, Reset, Clock);

    initial begin
        Clock = 1'b0;
        Reset = 1'b1;
        
         

        $monitor ($time, " Data_in = %h, Clock = %b, Reset = %b, A = %h, B = %h, C = %h, D = %h, E = %h, F = %h, G = %h, H = %h", Din, Clock, Reset, A, B, C, D, E, F, G, H);

        
        #1 Din = 16'd8;
        
        
       
        
        #34 $finish;
    end

   
    always #2 Clock = ~Clock;

endmodule
