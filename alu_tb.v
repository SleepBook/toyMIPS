`timescale 10ns/100ps

module testbench;

reg[31:0] in1,in2;
reg[3:0] op;
reg[1:0] mc;

wire[31:0] out;
wire co,zero,overflow,mch;

fu_alu   test(  .a(in1),
                .b(in2),
                .op(op),
                .move_cond(mc),
                .result(out),
                .carryout(co),
                .zero(zero),
                .overflow(overflow),
                .move_check(mch)
                );
				
				
initial 
begin
mc=2'b00;


#2 //test add;
in1=32'd55;
in2=32'd24;
op=4'b0000; //expect79
#2
in1=32'b01111111111111111111111111111111;
in2=32'b00000000001000000000000000000100;//expect overflow;

#2 //test addu;
op=4'b0001;
#2
in2=32'b11111111111111111111111111111111;//expect overflow;
#2 //test sub
op=4'b0010;
#2 
op=4'b0011;
in2=32'b00000000001000000000000000000100;//expect overflow.
#2
in2=32'b11111111111111111111111111111111;//non-overflow.

//end of the arethemic operation,begin logic ones.
#5
in1=32'd1;
in2=32'd0;
op=4'b0100;
#2
op=4'b0101;
//end of logic,begin slt test
#5
op=4'b1010;
in1=32'd10;
in2=32'd23;
#1
in1=32'd44;
#1
in2=32'b10010000000000000000000000000000;
#1
in1=32'b10010000000000000000000000000000;
in2=32'd23;
end
endmodule
