module display_7_segment (
    input [3:0] minutos,
    input [3:0] segundos,
    output reg [6:0] seg_a,
    output reg [6:0] seg_b,
    output reg [6:0] seg_c,
    output reg [6:0] seg_d,
    output reg [6:0] seg_e,
    output reg [6:0] seg_f,
    output reg [6:0] seg_g
);

// Tabela de 7 segmentos para os dígitos
always @* begin
    case(minutos)
        0: seg_a = 7'b0000001;
        1: seg_a = 7'b1001111;
        // Adicione os casos para os demais minutos
        default: seg_a = 7'b1111111; // Apagar o dígito se for inválido
    endcase

    case(segundos)
        0: seg_b = 7'b0000001;
        1: seg_b = 7'b1001111;
        // Adicione os casos para os demais segundos
        default: seg_b = 7'b1111111; // Apagar o dígito se for inválido
    endcase

    // Atribua '0' aos dígitos que não estão sendo usados
    // (se necessário)
    // seg_c, seg_d, seg_e, seg_f, seg_g
end

endmodule
