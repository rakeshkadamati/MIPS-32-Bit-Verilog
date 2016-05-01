module instMem(inst,pc,clk);
input clk;
input [31:0] pc;
output [31:0] inst;
reg [31:0] inst;

//128 element array of 32 bit instructions
reg [31:0] memdata [127:0];

initial
        begin

        memdata[0] = 32'h20070003;
        memdata[1] = 32'h20030009;
        memdata[2] = 32'h20060006;
        memdata[3] = 32'h00672822;
        memdata[4] = 32'h10a70000;
        memdata[5] = 32'h01095024;
        memdata[6] = 32'h8c020000;
        //memdata[7] = 32'h;
        //memdata[8] = 32'h;
        //memdata[9] = 32'h;


end

always @(posedge clk)
//set instruction to new pc
        begin
                inst = memdata[pc];
        end

endmodule