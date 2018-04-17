module DATA_MEM(dout,din,address,w,r);
  output reg[31:0] dout;
  input wire[31:0] address,din;
  input wire w,r;
  
  reg[31:0] memcore[31:0];//could it be too large to simulate?
  
  always@(*)
  begin
    if(w==1'b1)
      begin
        memcore[address]=din;
      end
    else if(r==1'b1)
      begin
        dout=memcore[address];
      end
    end
  endmodule

//tested ok.