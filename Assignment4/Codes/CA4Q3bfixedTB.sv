`timescale 1ns/1ns
module shifterQ3bfixedTB ();
	logic [3:0] T5SI = 4'd0;
	logic T5clk = 1'b0;
	logic T5rst = 0;
	logic T5shn = 0;
	wire [3:0] T5SO;
	
	shifterQ3bfixed CUT5 (T5SI, T5rst, T5clk, T5shn, T5SO);
	
	always #5 T5clk <= ~T5clk;
	
	initial begin
		
		#1 T5rst = 1'd1;
		#2 T5rst = 1'd0;
		#5 T5shn = 1'b1;
		#2 T5SI = $random+$random;
		#8 T5SI = 4'd0;
		#160 $stop;
	end

endmodule

