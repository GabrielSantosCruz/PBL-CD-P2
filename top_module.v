module top_module (
    input clk_50MHz,    // Clock de entrada de 50 MHz
    output led          // Saída para o LED
);

    wire [25:0] count;
    wire clk_1Hz;

    // Instanciação do contador de 26 bits
    contador_26bits contador (
        .clk(clk_50MHz),
        .count(count)
    );

    // O bit mais significativo do contador é o clock de 1 Hz
    assign clk_1Hz = count[25];

    // Instanciação do flip-flop para controlar o LED
    flipflop_led led_ff (
        .clk_1s(clk_1Hz),
        .led(led)
    );
endmodule
