//this module is part of the lab3 of Computerorganization.
//realize of caomapre two number in 2's complentary
//written by oar, 12/02/2014

module slt(result,in1,in2);

output wire result;
input wire[31:0] in1,in2;

wire[31:0] in2_m;
assign in2_m=~in2+32'd1;
wire[31:0] temp;
wire overflow,carryout;

adder_32   test(.dout(temp)
							,.overflow(overflow)
							,.carryout(carryout)
							,.din1(in1)
							,.din2(in2_m)
							,.op0(1'b0)
							,.op1(1'b1)
							,.carryin(1'b0)
							);

							
assign result=(in1[31]&~in2[31])||(temp[31]&~overflow);

endmodule