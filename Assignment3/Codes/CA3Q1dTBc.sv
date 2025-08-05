`timescale 1ns/1ns
module Q1dTBc ();
	logic [15:0] MM = 16'b0;
	logic [15:0] NN = 16'b0;
	logic CC = 1'b0;
	logic [2:0] OO =3'b111;
	wire [15:0] FF;
	wire ZZ , NG;
	myALUsynth CUT2( MM , NN , CC , OO , FF , ZZ , NG);
	initial begin
		repeat(200000) begin 
			#500 OO=$random;
					MM=$random;
					NN=$random;
					CC=$random;
		end
		#500 $stop;
	end
endmodule


