/*************************************************************
this module is written to realize the function of instruction memory.
written by oar, on 01/02/2015.
**************************************************************/

module IM(insout,wr,wd,address);
  output reg[31:0] insout;
  input wire wr;//when wr is 0 ,represent read,otherwise,write enabled;
  input wire[7:0] address;
  input wire[31:0] wd;
  
  reg[31:0] regbank[7:0];//this form is to allocate an storage matrix
  
  always@(*)
  begin
    if(wr==1'b1)
      begin
        regbank[address]=wd;
      end
    else
      begin
        insout=regbank[address];
      end
    end
  endmodule
  
//tested ok.
  
  
