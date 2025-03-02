module machine_jk(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);
    wire JA,KA,JB,KB,JC,KC;
    wire s3,s2,s1;

    jkff jkff_s1 (
        .J(JC),
        .K(KC),
        .CLK(CLK),
        .RESET(RESET),
        .Q(s1)
    );
    jkff jkff_s2 (
        .J(JB),
        .K(KB),
        .CLK(CLK),
        .RESET(RESET),
        .Q(s2)
    );
    jkff jkff_s3 (
        .J(JA),
        .K(KA),
        .CLK(CLK),
        .RESET(RESET),
        .Q(s3)
    );

    assign JA=(~s1 & x) | (s2);
    assign KA= (s2 & ~s1 & x) | (s2 & s1 & ~x);
    assign JB=(~s3 & s1) | (s3 & ~s1) | (s1 & x);
    assign KB= (~s3 & x) | (s1 & ~x);
    assign JC= (~s3 & ~s2) | (~x);
    assign KC=(~x) | (s3 & ~s2);

    assign S = {s3, s2, s1};
    assign F = s3 & s2 & s1;

endmodule