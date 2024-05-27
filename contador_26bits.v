module contador_26bits (
    input clk,          // Clock de entrada de 50 MHz
    output [25:0] count // Saída do contador de 26 bits
);
    wire [25:0] q;
    wire [24:0] enable;

    // Primeiro flip-flop, conta diretamente o clock
    flip_flop_d ff0 (
        .clk(clk),
        .d(~q[0]),      // Toggle flip-flop
        .q(q[0])
    );

    // Segundo flip-flop, habilitado pelo primeiro
    and(enable[0], q[0], 1'b1); // Sempre habilitado
    flip_flop_d ff1 (
        .clk(enable[0]),
        .d(~q[1]),      // Toggle flip-flop
        .q(q[1])
    );

    // Terceiro flip-flop, habilitado pelo AND dos dois anteriores
    and(enable[1], q[1], enable[0]);
    flip_flop_d ff2 (
        .clk(enable[1]),
        .d(~q[2]),      // Toggle flip-flop
        .q(q[2])
    );

    // Quarto flip-flop, habilitado pelo AND dos três anteriores
    and(enable[2], q[2], enable[1]);
    flip_flop_d ff3 (
        .clk(enable[2]),
        .d(~q[3]),      // Toggle flip-flop
        .q(q[3])
    );

    // Quinto flip-flop, habilitado pelo AND dos quatro anteriores
    and(enable[3], q[3], enable[2]);
    flip_flop_d ff4 (
        .clk(enable[3]),
        .d(~q[4]),      // Toggle flip-flop
        .q(q[4])
    );

    // Sexto flip-flop, habilitado pelo AND dos cinco anteriores
    and(enable[4], q[4], enable[3]);
    flip_flop_d ff5 (
        .clk(enable[4]),
        .d(~q[5]),      // Toggle flip-flop
        .q(q[5])
    );

    // Sétimo flip-flop, habilitado pelo AND dos seis anteriores
    and(enable[5], q[5], enable[4]);
    flip_flop_d ff6 (
        .clk(enable[5]),
        .d(~q[6]),      // Toggle flip-flop
        .q(q[6])
    );

    // Oitavo flip-flop, habilitado pelo AND dos sete anteriores
    and(enable[6], q[6], enable[5]);
    flip_flop_d ff7 (
        .clk(enable[6]),
        .d(~q[7]),      // Toggle flip-flop
        .q(q[7])
    );

    // Nono flip-flop, habilitado pelo AND dos oito anteriores
    and(enable[7], q[7], enable[6]);
    flip_flop_d ff8 (
        .clk(enable[7]),
        .d(~q[8]),      // Toggle flip-flop
        .q(q[8])
    );

    // Décimo flip-flop, habilitado pelo AND dos nove anteriores
    and(enable[8], q[8], enable[7]);
    flip_flop_d ff9 (
        .clk(enable[8]),
        .d(~q[9]),      // Toggle flip-flop
        .q(q[9])
    );

    // Décimo primeiro flip-flop, habilitado pelo AND dos dez anteriores
    and(enable[9], q[9], enable[8]);
    flip_flop_d ff10 (
        .clk(enable[9]),
        .d(~q[10]),     // Toggle flip-flop
        .q(q[10])
    );

    // Décimo segundo flip-flop, habilitado pelo AND dos onze anteriores
    and(enable[10], q[10], enable[9]);
    flip_flop_d ff11 (
        .clk(enable[10]),
        .d(~q[11]),     // Toggle flip-flop
        .q(q[11])
    );

    // Décimo terceiro flip-flop, habilitado pelo AND dos doze anteriores
    and(enable[11], q[11], enable[10]);
    flip_flop_d ff12 (
        .clk(enable[11]),
        .d(~q[12]),     // Toggle flip-flop
        .q(q[12])
    );

    // Décimo quarto flip-flop, habilitado pelo AND dos treze anteriores
    and(enable[12], q[12], enable[11]);
    flip_flop_d ff13 (
        .clk(enable[12]),
        .d(~q[13]),     // Toggle flip-flop
        .q(q[13])
    );

    // Décimo quinto flip-flop, habilitado pelo AND dos quatorze anteriores
    and(enable[13], q[13], enable[12]);
    flip_flop_d ff14 (
        .clk(enable[13]),
        .d(~q[14]),     // Toggle flip-flop
        .q(q[14])
    );

    // Décimo sexto flip-flop, habilitado pelo AND dos quinze anteriores
    and(enable[14], q[14], enable[13]);
    flip_flop_d ff15 (
        .clk(enable[14]),
        .d(~q[15]),     // Toggle flip-flop
        .q(q[15])
    );

    // Décimo sétimo flip-flop, habilitado pelo AND dos dezesseis anteriores
    and(enable[15], q[15], enable[14]);
    flip_flop_d ff16 (
        .clk(enable[15]),
        .d(~q[16]),     // Toggle flip-flop
        .q(q[16])
    );

    // Décimo oitavo flip-flop, habilitado pelo AND dos dezessete anteriores
    and(enable[16], q[16], enable[15]);
    flip_flop_d ff17 (
        .clk(enable[16]),
        .d(~q[17]),     // Toggle flip-flop
        .q(q[17])
    );

    // Décimo nono flip-flop, habilitado pelo AND dos dezoito anteriores
    and(enable[17], q[17], enable[16]);
    flip_flop_d ff18 (
        .clk(enable[17]),
        .d(~q[18]),     // Toggle flip-flop
        .q(q[18])
    );

    // Vigésimo flip-flop, habilitado pelo AND dos dezenove anteriores
    and(enable[18], q[18], enable[17]);
    flip_flop_d ff19 (
        .clk(enable[18]),
        .d(~q[19]),     // Toggle flip-flop
        .q(q[19])
    );

    // Vigésimo primeiro flip-flop, habilitado pelo AND dos vinte anteriores
    and(enable[19], q[19], enable[18]);
    flip_flop_d ff20 (
        .clk(enable[19]),
        .d(~q[20]),     // Toggle flip-flop
        .q(q[20])
    );

    // Vigésimo segundo flip-flop, habilitado pelo AND dos vinte e um anteriores
    and(enable[20], q[20], enable[19]);
    flip_flop_d ff21 (
        .clk(enable[20]),
        .d(~q[21]),     // Toggle flip-flop
        .q(q[21])
    );

    // Vigésimo terceiro flip-flop, habilitado pelo AND dos vinte e dois anteriores
    and(enable[21], q[21], enable[20]);
    flip_flop_d ff22 (
        .clk(enable[21]),
        .d(~q[22]),     // Toggle flip-flop
        .q(q[22])
    );

    // Vigésimo quarto flip-flop, habilitado pelo AND dos vinte e três anteriores
    and(enable[22], q[22], enable[21]);
    flip_flop_d ff23 (
        .clk(enable[22]),
        .d(~q[23]),     // Toggle flip-flop
        .q(q[23])
    );

    // Vigésimo quinto flip-flop, habilitado pelo AND dos vinte e quatro anteriores
    and(enable[23], q[23], enable[22]);
    flip_flop_d ff24 (
        .clk(enable[23]),
        .d(~q[24]),     // Toggle flip-flop
        .q(q[24])
    );

    // Vigésimo sexto flip-flop, habilitado pelo AND dos vinte e cinco anteriores
    and(enable[24], q[24], enable[23]);
    flip_flop_d ff25 (
        .clk(enable[24]),
        .d(~q[25]),     // Toggle flip-flop
        .q(q[25])
    );

    assign count = q;
endmodule
