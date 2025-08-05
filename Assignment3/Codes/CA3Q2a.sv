module   myALUopt(input signed [15:0] inM , inN , input inC , input [2:0] opc ,
			 output logic [15:0] outF , output logic zer , neg);
	
	logic [15:0] M1 , M5 , M3 , M4, M6 , M7 , F1;
	logic M2 , G1 , G2;
	assign M1 = ({opc[1],opc[0]} == 2'd0) ? inN:
				({opc[1],opc[0]} == 2'd1) ? (inN>>>1):
				({opc[1],opc[0]} == 2'd2) ? (~inN):
				(inM<<<1);
				
	assign M2 = ({opc[1],opc[0]} == 2'd0) ? inC:
				({opc[1],opc[0]} == 2'd1) ? 1'b0:
				({opc[1],opc[0]} == 2'd2) ? 1'b1:
				1'b0;
				
	assign F1 = M1 + inM + M2;
	
	assign M3 = (F1[15]==1'b1) ? inN : inM;
	
	assign M4 = (inN[15]==1'b1) ? inM : inN;
	
	assign G1 = ((inM[15] & ~inN[15]) | (~inM[15] & inN[15]));
	
	assign M5 = (G1==1'b1) ? M4 : M3;
	
	assign G2 = ~((~opc[0]) & opc[1]);
	
	assign M6 = (G2==1'b1) ? F1 : M5;
	assign M7 = ({opc[1],opc[0]} == 2'd0) ? (inM&inN):
				({opc[1],opc[0]} == 2'd1) ? (inM|inN):
				({opc[1],opc[0]} == 2'd2) ? ~inM : 16'bz;
				
	assign outF = (opc[2]) ? M7 : M6;
	assign zer = ~|outF ;
	assign neg = outF[15];
endmodule
