module flipflop_d (
	input wire clk,
	output reg q
);
	
	always @(posedge clk) begin
		q <= !q;
	end

endmodule 