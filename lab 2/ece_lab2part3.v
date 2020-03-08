`timescale 1ns / 1ns // `timescale time_unit/time_precision


//top level module
module HexDisplay(SW,HEX0);
	
	input [3:0] SW;
	output [6:0] HEX0;

	HexDecoder u0(
	.a(SW[0]),
	.b(SW[1]),
	.c(SW[2]),
	.d(SW[3]),
	.s0(HEX0[0]),
	.s1(HEX0[1]),
	.s2(HEX0[2]),
	.s3(HEX0[3]),
	.s4(HEX0[4]),
	.s5(HEX0[5]),
	.s6(HEX0[6]));

endmodule


//hexdecoder being impletemented.

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


