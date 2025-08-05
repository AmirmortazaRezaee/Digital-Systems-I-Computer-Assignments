module DIVDP (input clk, rst, LoadM, LoadA, InitA, LoadQ, ShiftAQ, LeastSel,  
			  input[7:0] MBus, QBus, output MostOut, output[7:0] Rem, Quo);
	logic [7:0] Mreg, Areg, Qreg;
	wire [7:0] SubBus;
	wire least, most;
	
	always @(posedge clk, posedge rst) begin
		if (rst)
			Mreg <=8'b0;
		else
			if(LoadM)
				Mreg <= MBus;
	end
	
	always @(posedge clk, posedge rst) begin
		if (rst)
			Areg <= 8'b0;
		else begin
			if (InitA)
				Areg <= 8'b0;
			else begin
				if (ShiftAQ)
					Areg <= {Areg[6:0],most};
				else if (LoadA)
					Areg <=SubBus;
			end
		end
	end
	
	always @(posedge clk, posedge rst) begin
		if (rst)
			Qreg <=8'b0;
		else begin
			if (LoadQ)
				Qreg <= QBus;
			else if(ShiftAQ)
				Qreg <= {Qreg[6:0],1'b0};
			else if (LeastSel)
			Qreg[0] <= least;
		end
	end
	


	assign SubBus = Areg - Mreg;
	assign least = LeastSel;
	assign most = Qreg[7];
	assign MostOut = SubBus[7];
	assign Rem = Areg[7:0];
	assign Quo = Qreg[7:0];
	
endmodule

