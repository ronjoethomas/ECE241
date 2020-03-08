

//top level module
module lab5part2(CLOCK_50, reset,SW,HEX0);
input [1:0]SW;
input reset;
output [6:0]HEX0;
input CLOCK_50;


wire [26:0]wire5;
wire [26:0]w1;
wire w2;//counter r
wire w3;//enable wire
wire [3:0]w4;//hex wire

selectClockSpeed s0(SW,w1);

counterRate  s1(CLOCK_50,w1,w2,wire5);

mux2to1 s3(0,1,w2,w3);

mainCounter s4(CLOCK_50,reset,w4,w3);

HexDecoder hex0(w4[3], w4[2], w4[1], w4[0], HEX0[0], HEX0[1], HEX0[2], HEX0[3], HEX0[4], HEX0[5], HEX0[6]);

endmodule


module mainCounter(clock,clear,Q,enable);

input clock;
input clear;
output reg [3:0]Q;
output enable;

always @(posedge clock)

	if(clear==1'b0)
		Q<=0;
	else
		Q<=Q+1;


endmodule

//change speed
module counterRate(clock,clockSpeed1,enable,q);
	input clock;
	input [26:0]clockSpeed1;
	output reg enable;
	output reg [26:0] qa;
	always @(clockSpeed1)	
		begin		
			q<=clockSpeed1 -1;
		end
	always @(posedge clock) // triggered every time clock rises
		begin
		if (q == 27'b000000000000000000000000000)   
		  begin
			enable<=1;
			q<=clockSpeed1-1;
			end
		else
			begin
			q <= q - 1; //  q decriment
			enable<=1;
			end
		end
endmodule

module selectClockSpeed(SW,clockSpeed);
	input [1:0] SW;
	output reg [26:0]clockSpeed;

	always @(*)
		begin
		case (SW)
   2'b00 : clockSpeed = 27'b000000000000000000000000000;//0
   2'b01 : clockSpeed = 27'b001011111010111100001000000;//2 Hz 25 million in binary
   2'b10 : clockSpeed = 27'b010111110101111000010000000;//1 Hz 50 million in binary
   2'b11 : clockSpeed = 27'b101111101011110000100000000;//0.5 Hz 100 million in binary
  default: clockSpeed = 27'b000000000000000000000000000;
  endcase
 end

endmodule
//hexdecoder being impletemented.NOTE: a represents bit 3 not 0.
module HexDecoder(input a, b,c,d, output s0,s1,s2,s3,s4,s5,s6);
	assign s0=
	~((a|b|c|~d)
	  &(a|~b|c|d)
	  &(~a|b|~c|~d)
	  &(~a|~b|c|~d));	

	assign s1=
	~((a|~b|c|~d)
	  &(a|~b|~c|d)
	  &(~a|b|~c|~d)
	  &(~a|~b|c|d)
          &(~a|~b|~c|d)
          &(~a|~b|~c|~d));

	assign s2=~((a|b|~c|d)
	  &(~a|~b|c|d)
	  &(~a|~b|~c|d)
	  &(~a|~b|~c|~d));

	assign s3=~((a|b|c|~d)
	  &(a|~b|c|d)
	  &(a|~b|~c|~d)
	  &(~a|b|c|~d)
	  &(~a|b|~c|d)
	  &(~a|~b|~c|~d));

	assign s4=~((a|b|c|~d)
	  &(a|b|~c|~d)
	  &(a|~b|c|d)
	  &(a|~b|c|~d)
	  &(a|~b|~c|~d)
	  &(~a|b|c|~d));

	assign s5=~((a|b|c|~d)
	  &(a|b|~c|d)
	  &(a|b|~c|~d)
	  &(a|~b|~c|~d)
     &(~a|~b|c|~d));

	assign s6=~((a|b|c|d)
	  &(a|b|c|~d)
	  &(a|~b|~c|~d)
	  &(~a|~b|c|d));

endmodule

//mux module
module mux2to1(x, y, s, m);
    input x; //select 0
    input y; //select 1
    input s; //select signal
    output m; //output
  
    //assign m = s & y | ~s & x;
    // OR
    assign m = s ? y : x;

endmodule

