module fliflop_led (
	input clk1Hz,
	output reg led
);
	always @(posedge clk1Hz) begin
		led <= !led;
	end
	
endmodule 