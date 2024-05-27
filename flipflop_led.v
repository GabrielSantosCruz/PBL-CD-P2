module flipflop_led (
    input clk_1s,        // Clock de 1 Hz
    output reg led       // Saída para o LED
);

    always @(posedge clk_1s) begin
        led <= ~led;
    end
endmodule
