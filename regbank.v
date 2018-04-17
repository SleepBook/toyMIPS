//this module is the regbank in the cpu.
//written by oar,on 01/02/2015

module regbank(dout1,dout2,rport1,rport2,wport,din,wen,rst);
  output reg[31:0] dout1,dout2;
  input wire[4:0] rport1,rport2,wport;
  input wire[31:0] din;
  input wire wen,rst;//indicate write enable,and rst used for initialize the regbank.
  
  reg[31:0] regcore[31:0];
  
      

  always@(*)
  begin
    if(rst==1'b1)// i played a trick here, because at start i don;t support addi like insrtus., so how to start the cpu become a question
    begin        // i try to solve this problem by change the initial action.
      regcore[0]=32'd0;
      regcore[1]=32'd1;
      regcore[2]=32'd2;
      regcore[3]=32'd3;
      regcore[4]=32'd4;
      regcore[5]=32'd5;
      regcore[6]=32'd6;
      regcore[7]=32'd7;
      regcore[8]=32'd8;
      regcore[9]=32'd9;
      regcore[10]=32'd0;
      regcore[11]=32'd0;
      regcore[12]=32'd0;
      regcore[13]=32'd0;
      regcore[14]=32'd0;
      regcore[15]=32'd0;
      regcore[16]=32'd0;
      regcore[17]=32'd0;
      regcore[18]=32'd0;
      regcore[19]=32'd0;
      regcore[20]=32'd0;
      regcore[21]=32'd0;
      regcore[22]=32'd0;
      regcore[23]=32'd0;
      regcore[24]=32'd0;
      regcore[25]=32'd0;
      regcore[26]=32'd0;
      regcore[27]=32'd0;
      regcore[28]=32'd0;
      regcore[29]=32'd0;
      regcore[30]=32'd0;
      regcore[31]=32'd0;
    end
  else
    begin
    dout1=regcore[rport1];
    dout2=regcore[rport2];
    if(wen==1)
      begin
        regcore[wport]=din;
      end
    end
  end
    
   
endmodule  

//tested ok!(include read and then write in one cycle)
