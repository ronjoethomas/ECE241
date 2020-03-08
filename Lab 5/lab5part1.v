
module counter8bit(KEY,SW,HEX0,HEX1);

input [1:0]KEY;// KEY[0] clock
input [1:0]SW;//SW1 enable, SW0 clear
output [6:0] HEX0;//
output [6:0] HEX1;

wire [14:0] w;
wire  [8:0]h;



//counter put together

tff b0(SW[1],KEY[0],SW[0],w[0]);
assign w[1]=SW[1]&w[0];

tff b1(w[1],KEY[0],SW[0],w[2]);

assign w[3]=w[1]&w[2];

tff b2(w[3],KEY[0],SW[0],w[4]);
assign w[5]=w[3]&w[4];

tff b3(w[5],KEY[0],SW[0],w[6]);
assign w[7]=w[5]&w[6];


tff b4(w[7],KEY[0],SW[0],w[8]);
assign w[9]=w[7]&w[8];


tff b5(w[9],KEY[0],SW[0],w[10]);
assign w[11]=w[9]&w[10];


tff b6(w[11],KEY[0],SW[0],w[12]);
assign w[13]=w[11]&w[12];


tff b7(w[13],KEY[0],SW[0],w[14]);

assign h[1]=w[0];
assign h[2]=w[2];
assign h[3]=w[4];
assign h[4]=w[6];

assign h[5]=w[8];
assign h[6]=w[10];
assign h[7]=w[12];
assign h[8]=w[14];
//HEXO and HEX1

HexDecoder hex0(h[4], h[3], h[2], h[1], HEX0[0], HEX0[1], HEX0[2], HEX0[3], HEX0[4], HEX0[5], HEX0[6]);

HexDecoder hex1(h[8], h[7], h[6], h[5], HEX1[0], HEX1[1], HEX1[2], HEX1[3], HEX1[4], HEX1[5], HEX1[6]);


endmodule





module tff(T,clock,clear_b,Q);

	input T;
	input clock;
	input clear_b;
	output reg Q;

	always @(posedge clock, negedge clear_b)begin
	
	if(clear_b==1'b0)
		Q<=0;
	else
		if(T==1)
		   Q<=!Q;
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

