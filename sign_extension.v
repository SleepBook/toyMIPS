module SE(out,in);//this module is to realize the function of sign extension.
  output reg[31:0] out;
  input wire[15:0] in;
  
  always@(in)
  begin
    if(in[15]==1'b1)
      begin
        out[31:16]=16'b1111111111111111;
        out[15:0]=in[15:0];
      end
    else
      begin
        out[31:16]=16'b0;
        out[15:0]=in[15:0];
      end
    end
endmodule

