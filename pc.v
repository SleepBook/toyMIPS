/*for practical consideration, the pc only suppport 8bit address*/

module PC(out,in,clk,en,rst);
  output reg[7:0] out;
  input wire[7:0] in;
  input wire clk,en,rst;
  
  
  always@(posedge clk)
  begin
    if(rst==1'b1) out=8'd0;
    else if(en==1)
      begin
        out=in;
    end
  end
endmodule

//test done!