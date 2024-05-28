module contador_1hz(
	input clk,
	output count
);
	
	wire [23:0] d;
	
	flipflop_d ff0 (clk, d[0]);
	flipflop_d ff1 (d[0], d[1]);
	flipflop_d ff2 (d[1], d[2]);
	flipflop_d ff3 (d[2], d[3]);
	flipflop_d ff4 (d[3], d[4]);
	flipflop_d ff5 (d[4], d[5]);
	flipflop_d ff6 (d[5], d[6]);
	flipflop_d ff7 (d[6], d[7]);
	flipflop_d ff8 (d[7], d[8]);
	flipflop_d ff9 (d[8], d[9]);
	flipflop_d ff10 (d[9], d[10]);
	flipflop_d ff11 (d[10], d[11]);
	flipflop_d ff12 (d[11], d[12]);
	flipflop_d ff13 (d[12], d[13]);
	flipflop_d ff14 (d[13], d[14]);
	flipflop_d ff15 (d[14], d[15]);
	flipflop_d ff16 (d[15], d[16]);
	flipflop_d ff17 (d[16], d[17]);
	flipflop_d ff18 (d[17], d[18]);
	flipflop_d ff19 (d[18], d[19]);
	flipflop_d ff20 (d[19], d[20]);
	flipflop_d ff21 (d[20], d[21]);
	flipflop_d ff22 (d[21], d[22]);
	flipflop_d ff23 (d[22], d[23]);
	flipflop_d ff24 (d[23], count);
	//flipflop_d ff26 (d[25], count);
	
endmodule 