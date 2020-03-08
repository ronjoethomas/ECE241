module main(SW, KEY, HEX0, HEX2, HEX4, HEX5);
	input [9:0]SW;
	input [3:0]KEY;
	output [6:0]HEX0;
	output [6:0]HEX2;
	output [6:0]HEX4;
	output [6:0]HEX5;
	
	wire [3:0]w1;
	
	ram32x4 mem1 (.data(SW[3:0]), .address(SW[8:4]), .wren(SW[9]), .clock(KEY[0]), .q(w1));
	
	HexDecoder hex4(SW[7], SW[6], SW[5], SW[4], HEX4[0], HEX4[1], HEX4[2], HEX4[3], HEX4[4], HEX4[5], HEX4[6]);
	HexDecoder hex5(0, 0, 0, SW[8], HEX5[0], HEX5[1], HEX5[2], HEX5[3], HEX5[4], HEX5[5], HEX5[6]);
	
	HexDecoder hex2(SW[3], SW[2], SW[1], SW[0], HEX2[0], HEX2[1], HEX2[2], HEX2[3], HEX2[4], HEX2[5], HEX2[6]);
	HexDecoder hex0(w1[3], w1[2], w1[1], w1[0], HEX0[0], HEX0[1], HEX0[2], HEX0[3], HEX0[4], HEX0[5], HEX0[6]);
	
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

