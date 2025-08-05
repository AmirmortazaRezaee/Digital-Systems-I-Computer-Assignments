module shifterQ3bfixed (input  [3:0] si , input rst , clk , shn, output logic [3:0] so);
	logic [0:8][3:0] blk;
	assign so = blk[8];
	
	always @(posedge clk , posedge rst) begin
		integer i;
		blk[0] = si;
		for(i=7;i>=0;i=i-1) begin
			if (rst) blk[i+1] = 4'd0;
			else 
				blk[i+1] = (shn) ? blk[i] : blk[i+1];
	
		end
	end
endmodule

