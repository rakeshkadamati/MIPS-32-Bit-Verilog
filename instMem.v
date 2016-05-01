module instMem(inst,pc,clk);
input [31:0] pc;
input clk;
output [31:0] inst;
reg [31:0] inst;


reg [31:0] memdata [127:0];

initial
        begin
        memdata[0] = 32'h8c070003; //first test
        memdata[1] = 32'h8c030009;
        memdata[2] = 32'h8c060006;
        memdata[3] = 32'h00672822;
        memdata[4] = 32'h10a70000;
        memdata[5] = 32'h01095024;
        memdata[6] = 32'h8c020000;
	  

 /*       memdata[0] = 32'h8c030003; //second test
        memdata[1] = 32'h8c070007;
        memdata[2] = 32'h8c080008;
        memdata[3] = 32'h00e30820;
        memdata[4] = 32'h01012820;
        memdata[5] = 32'h8c09ffff;
        memdata[5] = 32'h00291022;
        memdata[5] = 32'hac62000c;*/
        

        end

always @(posedge clk)
        begin
                inst = memdata[pc];
        end

endmodule