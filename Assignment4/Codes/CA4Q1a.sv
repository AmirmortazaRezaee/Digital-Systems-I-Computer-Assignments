module register4(input [3:0] PI, input rst, clk, cen, output logic [3:0] PO);

	always @(posedge clk , posedge rst) begin
		if (rst) PO <= 4'd0;
		else
			PO <= (cen) ? PI : PO;
	end
endmodule
