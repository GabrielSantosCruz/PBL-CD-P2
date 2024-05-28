module contador_decrementador (
    input clk,
    input rst,
    input pulso,
    output reg [3:0] minutos,
    output reg [3:0] segundos
);

// Contadores para minutos e segundos
reg [3:0] minutos_reg, segundos_reg;

// Valor máximo para minutos e segundos
localparam MAX_MINUTOS = 9;
localparam MAX_SEGUNDOS = 59;

// Lógica de contagem
always @(posedge clk or posedge rst) begin
    if (rst) begin
        minutos_reg <= MAX_MINUTOS;
        segundos_reg <= MAX_SEGUNDOS;
    end else if (pulso) begin
        if (segundos_reg == 0) begin
            segundos_reg <= MAX_SEGUNDOS;
            if (minutos_reg == 0)
                minutos_reg <= MAX_MINUTOS;
            else
                minutos_reg <= minutos_reg - 1;
        end else
            segundos_reg <= segundos_reg - 1;
    end
end

// Atribui os valores aos registradores de saída
assign minutos = minutos_reg;
assign segundos = segundos_reg;

endmodule
