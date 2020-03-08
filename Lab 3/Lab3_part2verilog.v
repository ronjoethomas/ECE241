module FA_4_bit(SW,LEDR);

input [9:0] SW;
output [9:0] LEDR;

wire [2:0] W;

Full_Adder bit0(.a(SW[4]),.b(SW[0]),.cin(SW[8]),.s(LEDR[0]),.cout(W[0]));
Full_Adder bit1(.a(SW[5]),.b(SW[1]),.cin(W[0]),.s(LEDR[1]),.cout(W[1]));
Full_Adder bit2(.a(SW[6]),.b(SW[2]),.cin(W[1]),.s(LEDR[2]),.cout(W[2]));
Full_Adder bit3(.a(SW[7]),.b(SW[3]),.cin(W[2]),.s(LEDR[3]),.cout(LEDR[9]));

endmodule 



module Full_Adder(input a,b,cin,output s,cout);

assign s=a^b^cin;  //output is 1 if input has odd number of 1s.
assign cout=a&b|a&cin|b&cin;  //checking if there are atleast 2 1s to do the carry

endmodule

