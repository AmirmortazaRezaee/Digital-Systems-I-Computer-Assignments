`timescale 1ns/1ns
module shifterQ3aTB ();
	logic [3:0] T3SI = 4'd0;
	logic T3clk = 1'b0;
	logic T3rst = 0;
	logic T3shn = 0;
	wire [3:0] T3SO;
	
	shifterQ3a CUT3 (T3SI, T3rst, T3clk, T3shn, T3SO);
	
	always #5 T3clk <= ~T3clk;
	
	initial begin
		
		#1 T3rst = 1'd1;
		#2 T3rst = 1'd0;
		#5 T3shn = 1'b1;
		#2 T3SI = $random+$random;
		#8 T3SI = 4'd0;
		#160 $stop;
	end

endmodule

