module Splitter(inst,opcode,rs,rt,rd,funct,addr); //divides instruction into opcode, registers, address, and function
input [31:0] inst;
output [5:0] opcode,funct;
output [4:0] rs, rt, rd;
output [15:0] addr; //can also be immediate for addi
reg [4:0] rs, rt, rd;
reg [5:0] funct;
reg [15:0] addr;

assign opcode = inst[31:26]; //used for testing opcode value

always @(inst)
begin
  
	if(inst[31:26]==6'b000000) //if opcode is 0, divide instruction into rs,rt,rd, and function code
	begin
	rs = inst[25:21];//opcode already assigned to 0
	rt = inst[20:16];
	rd = inst[15:11];
	funct = inst[5:0];
	end
	else //if opcode is not 0, divide instruction into rs,rt, and addr
	begin
	rs = inst[25:21]; //opcode already assigned from inst[31:26]
	rt = inst[20:16];
	addr = inst[15:0];
	end

end

endmodule


