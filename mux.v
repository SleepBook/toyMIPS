//this is the realization of 4 muxs.

module mux1(out,in1,in2,select);
  output wire[5:0] out;
  input wire select;
  input wire[5:0] in1,in2;
  
  assign out[0]=select&in2[0] | ~select&in1[0]; 
  assign out[1]=select&in2[1] | ~select&in1[1]; 
  assign out[2]=select&in2[2] | ~select&in1[2]; 
  assign out[3]=select&in2[3] | ~select&in1[3]; 
  assign out[4]=select&in2[4] | ~select&in1[4]; 
  assign out[5]=select&in2[5] | ~select&in1[5]; 
endmodule


module mux2(out,in1,in2,select);
  output wire[31:0] out;
  input wire select;
  input wire[31:0] in1,in2;
  
  assign out[0]=select&in2[0] | ~select&in1[0]; 
  assign out[1]=select&in2[1] | ~select&in1[1]; 
  assign out[2]=select&in2[2] | ~select&in1[2]; 
  assign out[3]=select&in2[3] | ~select&in1[3]; 
  assign out[4]=select&in2[4] | ~select&in1[4]; 
  assign out[5]=select&in2[5] | ~select&in1[5]; 
  assign out[6]=select&in2[6] | ~select&in1[6]; 
  assign out[7]=select&in2[7] | ~select&in1[7]; 
  assign out[8]=select&in2[8] | ~select&in1[8]; 
  assign out[9]=select&in2[9] | ~select&in1[9]; 
  assign out[10]=select&in2[10] | ~select&in1[10]; 
  assign out[11]=select&in2[11] | ~select&in1[11]; 
  assign out[12]=select&in2[12] | ~select&in1[12]; 
  assign out[13]=select&in2[13] | ~select&in1[13]; 
  assign out[14]=select&in2[14] | ~select&in1[14]; 
  assign out[15]=select&in2[15] | ~select&in1[15]; 
  assign out[16]=select&in2[16] | ~select&in1[16]; 
  assign out[17]=select&in2[17] | ~select&in1[17]; 
  assign out[18]=select&in2[18] | ~select&in1[18]; 
  assign out[19]=select&in2[19] | ~select&in1[19]; 
  assign out[20]=select&in2[20] | ~select&in1[20]; 
  assign out[21]=select&in2[21] | ~select&in1[21]; 
  assign out[22]=select&in2[22] | ~select&in1[22]; 
  assign out[23]=select&in2[23] | ~select&in1[23]; 
  assign out[24]=select&in2[24] | ~select&in1[24]; 
  assign out[25]=select&in2[25] | ~select&in1[25]; 
  assign out[26]=select&in2[26] | ~select&in1[26]; 
  assign out[27]=select&in2[27] | ~select&in1[27]; 
  assign out[28]=select&in2[28] | ~select&in1[28]; 
  assign out[29]=select&in2[29] | ~select&in1[29]; 
  assign out[30]=select&in2[30] | ~select&in1[30]; 
  assign out[31]=select&in2[31] | ~select&in1[31]; 
  
endmodule
  
  //mux3 is the same as mux2.
  

module mux4(out,in1,in2,select);
  output wire[7:0] out;
  input wire select;
  input wire[7:0] in1,in2;
  
  assign out[0]=select&in2[0] | ~select&in1[0]; 
  assign out[1]=select&in2[1] | ~select&in1[1]; 
  assign out[2]=select&in2[2] | ~select&in1[2]; 
  assign out[3]=select&in2[3] | ~select&in1[3]; 
  assign out[4]=select&in2[4] | ~select&in1[4]; 
  assign out[5]=select&in2[5] | ~select&in1[5]; 
  assign out[6]=select&in2[6] | ~select&in1[6]; 
  assign out[7]=select&in2[7] | ~select&in1[7];
  
endmodule



