module lab4_part3(SW, KEY, LEDR);
	input [9:0] SW;
	input [3:0] KEY;
	output [7:0] LEDR;

	full8bitrotatingReg reg1(.reset(SW[9]),.clock(KEY[0]),.parallelLoadIn(KEY[1]),
		.rotateRight(KEY[2]),
		.ASright(KEY[3]),
		.DATA_IN(SW[7:0]),
		.Q(LEDR[7:0])
	);
	
endmodule




module full8bitrotatingReg(input reset, clock, ParallelLoadIn, rotateRight, ASright,input [7:0] DATA_IN, output [7:0] Q);
	
	
	wire As;
	wire [7:0] q;
	mux2to1 As_test(.x(q[0]), .y(q[7]), .s(ASright), .m(As));

	oneBitRotatingReg b7(.left(As), .right(q[6]), .LoadLeft(rotateRight), .D(DATA_IN[7]), .loadn(ParallelLoadIn), 
				.clock(clock), .reset(reset), .Q(q[7]));

	oneBitRotatingReg b6(.left(q[7]), .right(q[5]), .LoadLeft(rotateRight), .D(DATA_IN[6]), .loadn(ParallelLoadIn), 
				.clock(clock), .reset(reset), .Q(q[6]));
				
	oneBitRotatingReg b5(.left(q[6]), .right(q[4]), .LoadLeft(rotateRight), .D(DATA_IN[5]), .loadn(ParallelLoadIn), 
				.clock(clock), .reset(reset), .Q(q[5]));
	
	oneBitRotatingReg b4(.left(q[5]), .right(q[3]), .LoadLeft(rotateRight), .D(DATA_IN[4]), .loadn(ParallelLoadIn), 
				.clock(clock), .reset(reset), .Q(q[4]));

	oneBitRotatingReg b3(.left(q[4]), .right(q[2]), .LoadLeft(rotateRight), .D(DATA_IN[3]), .loadn(ParallelLoadIn), 
				.clock(clock), .reset(reset), .Q(q[3]));

	oneBitRotatingReg b2(.left(q[3]), .right(q[1]), .LoadLeft(rotateRight), .D(DATA_IN[2]), .loadn(ParallelLoadIn), 
				.clock(clock), .reset(reset), .Q(q[2]));

	oneBitRotatingReg b1(.left(q[2]), .right(q[0]), .LoadLeft(rotateRight), .D(DATA_IN[1]), .loadn(ParallelLoadIn), 
				.clock(clock), .reset(reset), .Q(q[1]));

	oneBitRotatingReg b0(.left(q[1]), .right(q[7]), .LoadLeft(rotateRight), .D(DATA_IN[0]), .loadn(ParallelLoadIn), 
				.clock(clock), .reset(reset), .Q(q[0]));

	assign Q = q;

endmodule



//create one bit roating register using the schematic given.
module oneBitRotatingReg(input left, right, LoadLeft, D, loadn, clock, reset, output Q);
	wire W1, W2;

	mux2to1 u0(.x(right),.y(left),.s(LoadLeft),.m(W1));
	mux2to1 u1(.x(D), .y(w1), .s(loadn), .m(W2));

	register8 r1(W2, clock,reset, Q);
endmodule


module register8(D,Clock,Reset,Q);
	input [7:0] D;
	input Clock, Reset;
	output reg [7:0] Q;

	always @(posedge Clock)

	if(Reset==1'b1)
		Q<=0;
	
	else
		Q<=D;


endmodule

module mux2to1(x, y, s, m);
    input x; //select 0
    input y; //select 1
    input s; //select signal
    output m; //output
  
    //assign m = s & y | ~s & x;
    // OR
    assign m = s ? y : x;

endmodule
