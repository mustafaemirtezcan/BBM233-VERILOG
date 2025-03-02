module half_adder(
    input A, B,
    output S, C
);
    wire sum;
    wire carry;
    xor o1(sum,A,B);
    and o2(carry,A,B);
    assign S=sum;
    assign C=carry;
    
endmodule
module full_adder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);
    wire w1,w2,w3;
    half_adder Had1(A,B,w1,w2);
    half_adder Had2(Cin,w1,S,w3);
    or o1(Cout,w2,w3);

endmodule