module shifterQ2 (input  [3:0] si , input rst , clk , shn, output logic [3:0] so);
	wire [0:8][3:0] blk;
	assign so = blk[8];
	assign blk[0] = si;
	genvar i;
	generate
		for (i=0;i<8;i=i+1) begin: procedure
			register4 rgi( blk[i] , rst, clk , shn , blk[i+1]);
		end
	endgenerate
endmodule
