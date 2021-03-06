//Top level module
module ece244_2to1Mux(SW,LEDR); //x y s in that order 

	input [2:0] SW;
	output [1:0] LEDR;
//creating wires used
	wire [2:0]W;

//AND gate implementation
	v74LS08 u0(.pin1(SW[0]),.pin4(SW[1]),.pin5(SW[2]),.pin2(W[0]),.pin3(W[1]),.pin6(W[2]));

//Not gate implementation
	v74LS04 u1(.pin1(SW[2]),.pin2(W[0]));

//Or gate implementation
	v74LS32 u2(.pin1(W[1]),.pin2(W[2]),.pin3(LEDR[0]));

endmodule

//module for NOT chip
module v74LS04(input pin1,pin3,pin5,pin13,pin11,pin9,output pin2,pin4,pin6,pin12,pin10,pin8);
	
//assignments of pins
	assign pin2=~pin1;
	assign pin4=~pin3;
	assign pin6=~pin5;
	assign pin12=~pin13;
	assign pin10=~pin11;
	assign pin8=~pin9;

endmodule 

//module for AND chip
module v74LS08(input pin1,pin2,pin4,pin5,pin13,pin12,pin10,pin9, output pin3,pin6,pin11,pin8);
	
//assignments of pins
	assign pin3= pin1&pin2;
	assign pin6= pin4&pin5;
	assign pin11= pin13&pin12;
	assign pin8= pin10&pin9;

endmodule 

//module for OR chip
module v74LS32(input pin1,pin2,pin4,pin5,pin13,pin12,pin10,pin9, output pin3,pin6,pin11,pin8);
	
//assignments of pins
	assign pin3= pin1|pin2;
	assign pin6= pin4|pin5;
	assign pin11= pin13|pin12;
	assign pin8= pin10|pin9;

endmodule 

