module ALU(opcode,funct,in1,in2,result,rw,clk);
input clk;
input [5:0] opcode, funct;
input [31:0] in1, in2;
output [31:0] result; //result of instruction
reg [31:0] result;
output rw;
reg rw;  	//0 means a read instruction, 1 means a write to register instruction

wire [31:0] sum, diff, product, sum_or;

thirtytwobitadder ADD(in1,in2,carryout,sum,1'b0);
thirtytwobitsubtractor SUBTRACT(in1,in2,carry,diff,1'b0);
AND prod(in1,in2,product);
OR orop(in1,in2,sum_or);

always @(*)
begin

        if(opcode==6'b000000)
        begin
                if(funct==6'b100000) //funct for add
                begin
                        rw=1'b0;
                        result=sum;
                        rw=1'b1;
                end
                if(funct==6'b100010) //funct for subtract
                begin
                        rw=1'b0;
                        result=diff;
                        rw=1'b1;
                end
                if(funct==6'b100100) //funct for multiply
                begin
                        rw=1'b0;
                        result=product;
                        rw=1'b1;
                end
                if(funct==6'b100101)
                begin
                        rw=1'b0;
                        result=sum_or;
                        rw=1'b1;
                end
        end

        if(opcode==6'b100011)
        begin
        rw=1'b0;
        result=sum;
        rw=1'b1;
        end

        if(opcode==6'b101011)
        begin
        rw=1'b0;
        result=sum;
        end

        if(opcode==6'b000100)
        begin
        rw=1'b0;

                if(diff==32'b00000000000000000000000000000000)
                begin
                result=diff;
                end

        end

end

endmodule
