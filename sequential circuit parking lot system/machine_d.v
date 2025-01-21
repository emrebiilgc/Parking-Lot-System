module machine_d(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);

    wire [2:0] D;

    dff dff_S0 (.D(D[0]), .CLK(CLK), .RESET(RESET), .Q(S[0]));
    dff dff_S1 (.D(D[1]), .CLK(CLK), .RESET(RESET), .Q(S[1]));
    dff dff_S2 (.D(D[2]), .CLK(CLK), .RESET(RESET), .Q(S[2]));
   
    assign D[2] = (S[2] ^ S[1]) | (~S[2] & ~S[0] & x) | (S[1] & ~S[0] & ~x) | (S[1] & S[2] & x);
    assign D[1] = (~S[2] & ~S[1] & S[0]) | (S[1] & ~S[0] & ~x) | (S[2] & ~S[0]) | (S[2] & x);
    assign D[0] = (~S[0] & ~x) | (S[1] & S[0] & x) | (~S[2] & ~S[1] & x);
    

    assign F = S[2] & S[1] & S[0];

endmodule
