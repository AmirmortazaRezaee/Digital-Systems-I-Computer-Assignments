`timescale 1ns/1ns
module Reg4TB ();
	logic [3:0] T1PI = 4'd0;
	logic T1clk = 1'b0;
	logic T1rst = 0;
	logic T1cen = 0;
	wire [3:0] T1PO;
	
	register4 CUT1 (T1PI, T1rst, T1clk, T1cen, T1PO);
	
	always #10 T1clk <= ~T1clk;
	
	initial begin
		#7 T1PI = $random;
		#5 T1cen = 1'b1;
		#5 T1PI = $random;
		#15 T1cen = 1'b0;
		#7 T1cen = 1'b1;
		#9 T1PI = $random;
		#5 T1rst = 1'b1;
		#12 T1PI = $random;
		#5 T1cen = 1'b0;
		#9 T1cen = 1'b1;
		#14 T1rst = 1'b0;
		#100 $stop;
	end

endmodule
