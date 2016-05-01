module instMem(inst,pc,clk);
input clk;
input [31:0] pc;
output [31:0] inst;
reg [31:0] inst;

//128 element array of 32 bit instructions
reg [31:0] memdata [127:0];

initial
        begin

        memdata[0] = 32'b00000000000000010001000000100010;
        memdata[1] = 32'b00000000001000100001100000100100;
        memdata[2] = 32'b00000000010000010011000000100101;
        memdata[3] = 32'b00000001100010010101000000100000;
        memdata[4] = 32'b10001100000000010001000000100000;
        memdata[5] = 32'b10101100000000010001000000100000;
        memdata[6] = 32'b00001000000000010001000000100000;
        //memdata[7] = 32'b00000000000000010001000000100000;
        //memdata[8] = 32'b00000000000000010001000000100000;
        //memdata[9] = 32'b00000000000000010001000000100000;

        end

always @(posedge clk)
//set instruction to new pc
        begin
                inst = memdata[pc];
        end

endmodule