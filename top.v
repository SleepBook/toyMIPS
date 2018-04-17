/*******************************************************************
this small project is  realize a simpllified 32bit Mips cpu,with supporting 
funcions of R-type instructions(add,addi,sub,subi,and,or),slt,conditional branch.
written by oar,01/02/2015,happy new year!
*******************************************************************/
module top(clk,instru_w,instru_en,address,rst);//data_w,data_en
  input wire clk,instru_en,rst;
  input wire[31:0]  address,instru_w;
  
  wire[7:0] pco,pci;
  wire[7:0] inaddress;//transform the 32-bit address for the 8 bit one,used for instruction mem.
  wire[31:0] instru;
  
  PC pc(.out(pco)
      ,.in(pci)
      ,.clk(clk)
      ,.en(1'b1)
      ,.rst(rst));
  
  
  add4 a4(.adi(pco)
         ,.ado(pcoo));
  
  mux4 init(.out(inaddress)
           ,.in1(pco)
           ,.in2(address)
           ,.select(instru_en));
  
//
  IM im(.insout(instru)
       ,.wr(instru_en)
       ,.wd(instru_w)
       ,.address(inaddress));
  
  wire[4:0] swch1;
  wire[31:0] rgb_ro1,rgb_ro2,swch3;
  
  mux1 m1(.out(swch1)
         ,.in1(instru[20:16])
         ,.in2(instru[15:11])
         ,.select(con_regi));
  
  wire con_regw;    
  regbank rgb(.dout1(rgb_ro1)
             ,.dout2(rgb_ro2)
             ,.rport1(instru[25:21])
             ,.rport2(instru[20:16])
             ,.wport(swch1)
             ,.din(swch3)
             ,.wen(con_regw)
             ,.rst(rst));
  
  wire con_rego,con_dmemo,pc_mux,dmemr,dmemw;
  wire[5:0] aluop;           
  CONTROL control(.m1(con_regi)
                 ,.m2(con_rego)
                 ,.m3(con_dmemo)
                 ,.m4(pc_mux)
                 ,.regw(con_regw)
                 ,.aluop(aluop)
                 ,.dmemr(dmemr)
                 ,.dmemw(dmemw)
                 ,.opc(instru[31:26]));
  
  wire[31:0] immed;               
  SE se(.out(immed)
       ,.in(instru[15:0]));

  wire[31:0] swch2;
  mux2 m2(.out(swch2)
         ,.in1(rgb_ro2)
         ,.in2(immed)
         ,.select(con_rego));
  
  wire[3:0] aluc;
  wire[31:0] aluo;
  wire cp,useless1,useless2;       
  fu_alu alu(  .a(rgb_ro1), //this fucking unit has some problem.
                .b(swch2),
                .op(aluc),
                .result(aluo),
                .carryout(useless1),
                .zero(cp),
                .overflow(useless2));


  alu_control aluco(.aluc(aluc)
                   ,.aluop(aluop)
                   ,.func(instru[5:0]));
  
  wire[32:0] dmout;                 
  DATA_MEM dmem(.dout(dmout)
               ,.din(rgb_ro2)
               ,.address(aluo)
               ,.w(dmemw)
               ,.r(dmemr));
               
  mux2 m3(.out(swch3)
         ,.in1(dmout)
         ,.in2(aluo)//pay attention to the link here!!!
         ,.select(con_dmemo));

  wire[31:0] jack;
  sl2 sl(.out(jack)
        ,.in(immmed));


  address_adder ad(.out(patho)
                  ,.in1(pcoo)
                  ,.in2(jack));
                  
                  
  wire con_mux4;
  //assign con_mux4=~xor(pc_mux,cp); attention!,this syntax is wrong
  xor(con_mux4,pc_mux,cp);
  mux4 m4(.out(pci)
         ,.in1(pcoo)
         ,.in2(patho)
         ,.select(con_mux4));



endmodule