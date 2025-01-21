`timescale 1ns / 1ps

module machine_d_tb;
    reg x;
    reg CLK;
    reg RESET;
    wire F;
    wire [2:0] S;

    machine_d uut (.x(x), .CLK(CLK), .RESET(RESET), .F(F), .S(S));

    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;
    end

    initial begin
        $dumpfile("machine_d_tb.vcd");
        $dumpvars(0, machine_d_tb);

        RESET = 1; x = 0;
        #20;

        RESET = 0;
        #30;  x = 1;
        #20;  x = 1;
        #20;  x = 0;
        #20;  x = 1;
        #20;  x = 0;
        #20;  x = 1;
        #20;  x = 0;
        #40;

        $finish;
    end
endmodule
