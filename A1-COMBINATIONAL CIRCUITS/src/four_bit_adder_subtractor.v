module four_bit_adder_subtractor(A, B, subtract, Result, Cout);
    input [3:0] A;
    input [3:0] B;
    input subtract;
    output [3:0] Result;
    output Cout;

    wire [3:0] complement_of_B;
    two_s_complement complement(B,complement_of_B);
    wire[3:0] w1;
    four_bit_2x1_mux mux(complement_of_B,B,subtract,w1);
    four_bit_rca rca(A,w1,0,Result,Cout);

endmodule
