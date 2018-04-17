//this small module is used to realize pc+4 on the path

module add4(adi,ado);
  input[7:0] adi;
  output reg[7:0] ado;
  
  always@(*)
  begin
    ado=adi+4;
  end
endmodule
  
//tested ok.