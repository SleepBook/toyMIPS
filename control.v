//this is the realization of the control unit, which is most complex in this circuit.
//written by oar,on 02/01/2015

module CONTROL(m1,m2,m3,m4,regw,aluop,dmemr,dmemw,opc);
  output reg m1,m2,m3,m4; /*control line for mux:
                               1:brfore regbank,switch the read or write address port
                               2:after regbank,switch reg or immediate into alu.
                               3:after dataMEM,switch the reg writeback signal(from alu or MEM)
                               4:switch pc from +4 or calculation.*/
  output reg regw;//regbank write enable
  output reg[1:0] aluop;//FOR our reduced isa, this line only need to indicate the alucontol unit whether the instru. is r-type
                        //or not, if not,for sw/lw we need to carryout add,for bne/beq,we need to slt.so 2-bits is enough.
                        //we use 00 indicate r-type. 01:sw/lw,11:beq,bne.
  output reg dmemr,dmemw;//data MEM read enable,write enable.
  
  input wire[5:0] opc;//opcode from instruction.
  
  always@(opc)
  begin
    if(opc==6'b000000)
      begin
        {m1,m2,m3,m4}=4'b1000;
        regw=1'b1;
        dmemr=1'b0;
        dmemw=1'b0;
        aluop=2'b00;
      end
    if(opc==6'b101011)//these are sw.
      begin
        {m1,m2,m3,m4}=4'b0110;
        regw=1'b0;
        dmemr=1'b0;
        dmemw=1'b1;
        aluop=2'b01;
      end
    if(opc==6'b100011)//these are lw.
      begin
        {m1,m2,m3,m4}=4'b0110;
        regw=1'b1;
        dmemr=1'b1;
        dmemw=1'b0;
        aluop=2'b01;
      end
    if(opc==6'b000101)//this is bne
     begin
       {m1,m2,m3,m4}=4'b0000;
        regw=1'b0;
        dmemr=1'b0;
        dmemw=1'b0;
        aluop=2'b11;
      end
    if(opc==6'b000100)//this is beq
     begin
       {m1,m2,m3,m4}=4'b0001;
        regw=1'b0;
        dmemr=1'b0;
        dmemw=1'b0;
        aluop=2'b11;
      end
    end
endmodule
  
module alu_control(aluc,aluop,func);
  output reg[3:0] aluc;//direct control code to alu module,reencoded.
  input wire[2:0] aluop;//signal from control.
  input wire[5:0] func;//field from instruction.
  
  always@(*)
    begin
      if(aluop==2'b00)
        begin
          case(func)
            6'b100000: aluc=4'b0000;
            6'b100010: aluc=4'b0010;
            6'b100100: aluc=4'b0100;
            6'b100101: aluc=4'b0101;
            6'b100110: aluc=4'b0110;
            6'b101010: aluc=4'b1010;
          endcase
        end
        
      else if(aluop==2'b01)
        aluc=4'b0000;
      else if(aluop==2'b11)//beq or bne
        aluc=4'b0010;//sub
      end
endmodule