module signExtend(in,out); //16 bit shift
input [15:0] in;
output [31:0] out;

	assign out[31:16] = 1'b0;
	assign out[15:0] = in[15:0];

endmodule
