//this file contains some module on the branch path,like shift, address adder(8-bit),and the special trigate which realize beq/bne.


module sl2(out,in);//this is shift left 2-bits.

  output reg[31:0] out;  
  input wire[31:0] in;
  always@(in)
  begin
    out[31:2]=in[29:0];
    out[1:0]=2'b00;
  end
endmodule

module address_adder(out,in1,in2);//for my special design, this module also has the function of 32'bit-8bit transform.
  output wire[7:0] out;
  input wire[31:0] in2;
  input wire[7:0] in1;
  
  
  wire[31:0] ii,internalout;
  assign ii[7:0]=in1;
  assign ii[31:8]=24'd0;
  
  wire of,co;//these are useless.
  
  adder_32 inadd(.dout(internalout)
                ,.overflow(of)
                ,.carryout(co)
                ,.din1(ii)
                ,.din2(in2)
                ,.op0(1'b1)//indicate unsigned.
                ,.op1(1'b0)//indicate add.
                ,.carryin(1'b0));
  
  assign out=internalout[7:0];
endmodule