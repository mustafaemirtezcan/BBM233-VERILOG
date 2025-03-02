module machine_d(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);
    wire s1_next, s2_next, s3_next;
    wire s3, s2, s1;


    dff dff_s1 (
        .D(s1_next),
        .CLK(CLK),
        .RESET(RESET),
        .Q(s1)
    );

    dff dff_s2 (
        .D(s2_next),
        .CLK(CLK),
        .RESET(RESET),
        .Q(s2)
    );

    dff dff_s3 (
        .D(s3_next),
        .CLK(CLK),
        .RESET(RESET),
        .Q(s3)
    );

    assign S = {s3, s2, s1};


    assign s3_next = (~s3 & s2) | (s3 & ~s2) | (~s2 & ~s1 & x) | (s3 & ~s1 & ~x) | (s3 & s1 & x);
    assign s2_next = (~s3 & ~s2 & s1) | (s2 & ~s1 & ~x) | (s3 & ~s1) | (s3 & x);
    assign s1_next = (~s1 & ~x) | (s2 & s1 & x) | (~s3 & ~s2 & x);
  
    assign F = s3 & s2 & s1;

endmodule