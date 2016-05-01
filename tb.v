module top;

reg [31:0] in1, in2;
reg [4:0] addr3;
reg [31:0] data3;
reg chksignal;
reg [31:0] in, address;
wire [5:0] opcode, funct;
wire [31:0] pc, inst;
wire [4:0] rs, rt, rd;
wire [15:0] addr;
wire [31:0] result, Rs, Rt, out, extendaddr, newpc;

clkGen CLK(clk);
PC pc1(pc,in,clk);
instMem IM(inst,pc,clk);
Splitter SP(inst,opcode,rs,rt,rd,funct,addr);


ALU al(opcode,funct,in1,in2,result,rw,clk);

RegisterFile RF(rw,rs,rt,Rs,Rt,addr3,data3,clk);

dataMem DM(opcode,Rt,address,clk,out);

signExtend SE(addr,extendaddr);


PC_ALU alpc(newpc,pc,extendaddr,chksignal);

always @(*)
begin

        if(opcode==6'b000000)
        begin
                if(funct==6'b100000||funct==6'b100010||funct==6'b100100||funct==6'b100101)
 	        begin
			in1=Rs;
			in2=Rt;
                        addr3=rd;
			data3=result;
			chksignal=1'b0;
			in=newpc;
		end
        end

        if(opcode==6'b100011)
        begin

	in1=Rs;
	in2=extendaddr;
	address=result;
	addr3=rt;
	data3=out;
	chksignal=1'b0;
	in=newpc;

        end

        if(opcode==6'b101011)
        begin

	in1=Rs;
	in2=extendaddr;
	address=result;
	chksignal=1'b0;
	in=newpc;

        end
        if(opcode==6'b000100)
        begin

	in1=Rs;
	in2=Rt;

                if(result==32'h00000000)
                begin

		chksignal=1'b1;
		in=newpc;

                end

        end

end

//always @(posedge clk)
//begin
//	in1 <= in1 + 1'b1;
//	in <= in + 1'b1;
//	in2 <= in2 - 1'b1;
//end

initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0, top);
  end


initial begin
	//in=6'b000000;
	//in1=32'h00000000;
	//in2=32'hFF00F0;
	$monitor("pc = %5d inst=0x%h in1 = %5d in2 = %5d result = %5d time=%5d clk = %5d",pc,inst,in1,in2,result,$time,clk);
	#10
	$finish;


	end

endmodule
