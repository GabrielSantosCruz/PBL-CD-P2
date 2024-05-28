module main (
	input clk,
	output led
);
	
	wire clk1Hz;
	contador_1hz contador (clk, count);
	fliflop_led ffled(count, led); 

endmodule 