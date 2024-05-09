module LED_Matrix(
    input wire clock,
    input wire rst,
    output reg [4:0] led_col,
    output wire [6:0] led_row
);

    reg [25:0] contador;
    
    assign led_row = 7'b1110111; // 0 acende a linha
    
    always @(posedge clock or posedge rst) begin
        if (rst) begin
            led_col <= 5'b10000; // Definindo o valor inicial de led_col
        end else begin
            contador <= contador + 1;
            if (contador == 50000000) begin
                contador <= 0;
                led_col <= led_col >> 1;
					 if (led_col == 5'b00001) begin
						led_col <= 5'b10000;
					 end
            end 
        end
    end
endmodule
