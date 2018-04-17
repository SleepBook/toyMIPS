//this file is a 32 bits adder, which support both unsigned and 2's complentary representation.
//written to replace the packed module in lab 3_2 of computer organization course.
//this module only focus on the realization of the function, although i believe i can also realize it with more advanced layout.
//written by oar, 12/02/2014, @nctu tw.


/***********************************************
before it start, i think it's important to clarify some basic concepts, which confused me a lot at start.
the hierachy of the add operation in computer, i think, layout like this.
1 basic full_adder chain. 
		that's the basic adder composed of only chanins of full_adder, with a over flow port.
2 concept of mod sum, and the realization of sub through this idea.
		that's the representation range of a actual device is limited(thus cause overflow), however if we utilize this 
		character, we can realize sub. the supporting facts is: in a mod sum operation, sub a number is the same as add its 
		complentary if we utlize overflow.
		through this facts, we already can realize the sub op of unsigned number. but when deceting this operation, 
		i think the most subtle way i can think of is deceting the overflow bit. if it's 1, then the op is effective
		otherwise, it can't return the correct result which can be properly interpreted by the representating system.
		(i need to point out that the creteria i used above is equal to deceting that the subee should be smaller than suber.
3 representsating system of 2's complentary as an interpreter
		first, i need to state that 2's complentary is nothing but an interpreter.(i means without it, sub is still realizeabe as in 
		point 2 i stated), however, somen thing need to attention. first, the involving arrangement to represent negative numbers allow 
		sub op without limiting the suber and subee. second , the deceting of overflow now in through the relation ship of the carryout bit 
		of the higest bit and second higest bit.
*************************************************/

module full_adder(out, carryout, in1, in2,carryin);

output wire out, carryout;
input wire in1,in2,carryin;

assign out=(in1&in2&carryin)||(~in1&~in2&carryin)||(in1&~in2&~carryin)||(~in1&in2&~carryin);
assign carryout=(in1&in2&carryin)||(in1&~in2&carryin)||(in1&in2&~carryin)||(~in1&in2&carryin);

endmodule

/*******************************************************************************************
*******************************************************************************************/

module adder_32(dout, overflow,carryout,din1,din2,op0,op1,carryin);

output wire[31:0] dout;
output wire overflow, carryout;
input wire[31:0] din1,din2;
input wire op1,op0,carryin;   //op1 indicate sum/sub, op0 indicate usigned/2's complentary, because i need these information to calculate the overflow.
                               //             0 / 1                   1   /   0
/*wire[30:0] co;// co is used to link the internal carry.

wire tp_ov;     // a temp wire to calculate overflow in 2's
xor(tp_ov,carryout, co[30]);

assign overflow=((op0&~op1&carryout)||(op0&op1&~carryout)||(~op0&tp_ov));

full_adder p0(.carryin(carryin)
             ,.in1(din1[0])
			 ,.in2(din2[0])
			 ,.out(dout[0])
			 ,.carryout(co[0]));

full_adder p1(.carryin(co[0])
             ,.in1(din1[1])
			 ,.in2(din2[1])
			 ,.out(dout[1])
			 ,.carryout(co[1]));
			
full_adder p2(.carryin(co[1])
             ,.in1(din1[2])
			 ,.in2(din2[2])
			 ,.out(dout[2])
			 ,.carryout(co[2]));


full_adder p3(.carryin(co[2])
             ,.in1(din1[3])
			 ,.in2(din2[3])
			 ,.out(dout[3])
			 ,.carryout(co[3]));

 
full_adder p4(.carryin(co[3])
             ,.in1(din1[4])
			 ,.in2(din2[4])
			 ,.out(dout[4])
			 ,.carryout(co[4])
			 );
			 
full_adder p5(.carryin(co[4])
             ,.in1(din1[5])
			 ,.in2(din2[5])
			 ,.out(dout[5])
			 ,.carryout(co[5]));

full_adder p6(.carryin(co[5])
             ,.in1(din1[6])
			 ,.in2(din2[6])
			 ,.out(dout[6])
			 ,.carryout(co[6]));
full_adder p7(.carryin(co[6])
             ,.in1(din1[7])
			 ,.in2(din2[7])
			 ,.out(dout[7])
			 ,.carryout(co[7]));
full_adder p8(.carryin(co[7])
             ,.in1(din1[8])
			 ,.in2(din2[8])
			 ,.out(dout[8])
			 ,.carryout(co[8]));
full_adder p9(.carryin(co[8])
             ,.in1(din1[9])
			 ,.in2(din2[9])
			 ,.out(dout[9])
			 ,.carryout(co[9]));			 

full_adder p10(.carryin(co[9])
             ,.in1(din1[10])
			 ,.in2(din2[10])
			 ,.out(dout[10])
			 ,.carryout(co[10]));

full_adder p11(.carryin(co[10])
             ,.in1(din1[11])
			 ,.in2(din2[11])
			 ,.out(dout[11])
			 ,.carryout(co[11]));
			
full_adder p12(.carryin(co[11])
             ,.in1(din1[12])
			 ,.in2(din2[12])
			 ,.out(dout[12])
			 ,.carryout(co[12]));


full_adder p13(.carryin(co[12])
             ,.in1(din1[13])
			 ,.in2(din2[13])
			 ,.out(dout[13])
			 ,.carryout(co[13]));

 
full_adder p14(.carryin(co[13])
             ,.in1(din1[14])
			 ,.in2(din2[14])
			 ,.out(dout[14])
			 ,.carryout(co[14])
			 );
			 
full_adder p15(.carryin(co[14])
             ,.in1(din1[15])
			 ,.in2(din2[15])
			 ,.out(dout[15])
			 ,.carryout(co[15]));

full_adder p16(.carryin(co[15])
             ,.in1(din1[16])
			 ,.in2(din2[16])
			 ,.out(dout[16])
			 ,.carryout(co[16]));
full_adder p17(.carryin(co[16])
             ,.in1(din1[17])
			 ,.in2(din2[17])
			 ,.out(dout[17])
			 ,.carryout(co[17]));
full_adder p18(.carryin(co[17])
             ,.in1(din1[18])
			 ,.in2(din2[18])
			 ,.out(dout[18])
			 ,.carryout(co[18]));
full_adder p19(.carryin(co[18])
             ,.in1(din1[19])
			 ,.in2(din2[19])
			 ,.out(dout[19])
			 ,.carryout(co[19]));			 
			 
full_adder p20(.carryin(co[19])
             ,.in1(din1[20])
			 ,.in2(din2[20])
			 ,.out(dout[20])
			 ,.carryout(co[20]));

full_adder p21(.carryin(co[20])
             ,.in1(din1[21])
			 ,.in2(din2[21])
			 ,.out(dout[21])
			 ,.carryout(co[21]));
			
full_adder p22(.carryin(co[21])
             ,.in1(din1[22])
			 ,.in2(din2[22])
			 ,.out(dout[22])
			 ,.carryout(co[22]));


full_adder p23(.carryin(co[22])
             ,.in1(din1[23])
			 ,.in2(din2[23])
			 ,.out(dout[23])
			 ,.carryout(co[23]));

 
full_adder p24(.carryin(co[23])
             ,.in1(din1[24])
			 ,.in2(din2[24])
			 ,.out(dout[24])
			 ,.carryout(co[24])
			 );
			 
full_adder p25(.carryin(co[24])
             ,.in1(din1[25])
			 ,.in2(din2[25])
			 ,.out(dout[25])
			 ,.carryout(co[25]));

full_adder p26(.carryin(co[25])
             ,.in1(din1[26])
			 ,.in2(din2[26])
			 ,.out(dout[26])
			 ,.carryout(co[26]));
full_adder p27(.carryin(co[26])
             ,.in1(din1[27])
			 ,.in2(din2[27])
			 ,.out(dout[27])
			 ,.carryout(co[27]));
full_adder p28(.carryin(co[27])
             ,.in1(din1[28])
			 ,.in2(din2[28])
			 ,.out(dout[28])
			 ,.carryout(co[28]));
full_adder p29(.carryin(co[28])
             ,.in1(din1[29])
			 ,.in2(din2[29])
			 ,.out(dout[29])
			 ,.carryout(co[29]));			 
			 
full_adder p30(.carryin(co[29])
             ,.in1(din1[30])
			 ,.in2(din2[30])
			 ,.out(dout[30])
			 ,.carryout(co[30]));

full_adder p31(.carryin(co[30])
             ,.in1(din1[31])
			 ,.in2(din2[31])
			 ,.out(dout[31])
			 ,.carryout(carryout)
			 );
			

*/			
endmodule
