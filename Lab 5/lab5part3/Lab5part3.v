module part3(SW, KEY, LEDR, CLOCK_50);
       input [2:0] SW;
       input CLOCK_50;
       input [1:0] KEY;
       output [0:0] LEDR;
       reg [2:0] Sel;
       reg reset, shift;
       wire [12:0] morseCode,Q;
       wire[25:0] counter;
       wire enable;
       always@(*)

       begin

               reset= KEY[0];

               shift = KEY[1];

               Sel = SW;

       end

       mux8to1 m0(Sel, morseCode);
       rateDivider r(CLOCK_50, enable, counter);
		 module subcircuit(input mc, mux0, shift, enable, reset, clock, output reg Q);
       wire D;
       mux2to1 m(mc, mux0, shift, D);
       always@(posedge clock)
       begin
              if (reset == 1'b1)
                      Q<=0;
              else if (enable == 1'b1)
                      Q<=D;
       end

endmodule 

       subcircuit s12(morseCode[12], 1'b0, shift, enable, reset, CLOCK_50, Q[12]);

       subcircuit s11(morseCode[11], Q[12], shift, enable, reset, CLOCK_50, Q[11]);

       subcircuit s10(morseCode[10], Q[11], shift, enable, reset, CLOCK_50, Q[10]);

       subcircuit s9(morseCode[9], Q[10], shift, enable, reset, CLOCK_50, Q[9]);

       subcircuit s8(morseCode[8], Q[9], shift, enable, reset, CLOCK_50, Q[8]);

       subcircuit s7(morseCode[7], Q[8], shift, enable, reset, CLOCK_50, Q[7]);

       subcircuit s6(morseCode[6], Q[7], shift, enable, reset, CLOCK_50, Q[6]);

       subcircuit s5(morseCode[5], Q[6], shift, enable, reset, CLOCK_50, Q[5]);

       subcircuit s4(morseCode[4], Q[5], shift, enable, reset, CLOCK_50, Q[4]);

       subcircuit s3(morseCode[3], Q[4], shift, enable, reset, CLOCK_50, Q[3]);

       subcircuit s2(morseCode[2], Q[3], shift, enable, reset, CLOCK_50, Q[2]);

       subcircuit s1(morseCode[1], Q[2], shift, enable, reset, CLOCK_50, Q[1]);

       subcircuit s0(morseCode[0], Q[1], shift, enable, reset, CLOCK_50, Q[0]);

 

       assign LEDR[0] = Q[0];

      

endmodule

 

module mux8to1(input [2:0] Sel, output reg [12:0] morseCode);
       always @(*)
              case(Sel[2:0])
                      3'b000: morseCode= 13'b10101; //s
                      3'b001: morseCode= 13'b111; //t
                      3'b010: morseCode= 13'b1110101; //u
                      3'b011: morseCode= 13'b111010101; //v
                      3'b100: morseCode= 13'b111011101; //w
                      3'b101: morseCode= 13'b11101010111; //x
                      3'b110: morseCode= 13'b1110111010111; //y
                      3'b111: morseCode= 13'b10101110111; //z

                      default: morseCode=13'b0;

              endcase

endmodule

 

module rateDivider(input clock, output reg enable, output reg [25:0] counter);
       always@(posedge clock)
              if (counter === 26'bx)
                      counter <= 0;
              else if (counter == 0);
				  
              else if (counter == 'd24999999)
              begin
                      enable= 1'b1;

                      counter <= 26'b0;
              end

              else

              begin

                      enable = 1'b0;

                      counter <= counter + 1 ;

              end                                                                    

endmodule


module mux2to1(input a,b, pick, output out);
       assign out = pick ? b: a;   

endmodule

 

module subcircuit(input mc, mux0, shift, enable, reset, clock, output reg Q);
       wire D;
       mux2to1 m(mc, mux0, shift, D);
       always@(posedge clock)
       begin
              if (reset == 1'b1)
                      Q<=0;
              else if (enable == 1'b1)
                      Q<=D;
       end

endmodule 


