`timescale 1ns/1ns
module shifterQ2TB ();
	logic [3:0] T2SI = 4'd0;
	logic T2clk = 1'b0;
	logic T2rst = 0;
	logic T2shn = 0;
	wire [3:0] T2SO;
	
	shifterQ2 CUT2 (T2SI, T2rst, T2clk, T2shn, T2SO);
	
	always #5 T2clk <= ~T2clk;
	
	initial begin
		#1 T2rst = 1'd1;
		#2 T2rst = 1'd0;
		#4 T2shn = 1'b1;
		#2 T2SI = $random+$random;
		#8 T2SI = 4'd0;
		#160 $stop;
	end

endmodule
