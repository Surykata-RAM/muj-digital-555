`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // První pin ui_in[0] nahrazuje clk_en
    output wire [7:0] uo_out,   // První pin uo_out[0] nahrazuje out
    input  wire [7:0] uio_in,   // Nepoužito (rezerva)
    output wire [7:0] uio_out,  // Nepoužito (rezerva)
    output wire [7:0] uio_oe,   // Nepoužito (rezerva)
    input  wire       ena,      
    input  wire       clk,      
    input  wire       rst_n     
);

    // Vnitřní dráty pro propojení hradel z vašeho obrázku
    wire w1, w2, w3, w4;

    // Přesná oprava logiky z programu Digital (přidání chybějících invertorů ~)
    assign w1 = ~(ui_in[0] & w4); // Hradlo NAND z obrázku
    assign w2 = ~w1;              // 1. invertor
    assign w3 = ~w2;              // 2. invertor
    assign w4 = ~w3;              // 3. invertor (výstup a zpětná vazba)

    // Vyvedení pulzů na výstup
    assign uo_out[0] = w4;

    // Bezpečné uzemnění zbytku pinů pro splnění pravidel webového serveru
    assign uo_out[7:1] = 7'b0000000;
    assign uio_out     = 8'b00000000;
    assign uio_oe      = 8'b00000000;

endmodule
