`timescale 1ns/1ns
module shifterQ3bTB ();
	logic [3:0] T4SI = 4'd0;
	logic T4clk = 1'b0;
	logic T4rst = 0;
	logic T4shn = 0;
	wire [3:0] T4SO;
	
	shifterQ3b CUT4 (T4SI, T4rst, T4clk, T4shn, T4SO);
	
	always #5 T4clk <= ~T4clk;
	
	initial begin
		
		#1 T4rst = 1'd1;
		#2 T4rst = 1'd0;
		#5 T4shn = 1'b1;
		#2 T4SI = $random+$random;
		#8 T4SI = 4'd0;
		#160 $stop;
	end

endmodule
