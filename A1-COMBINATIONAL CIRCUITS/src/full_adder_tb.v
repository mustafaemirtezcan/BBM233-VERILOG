`timescale 1 ns/10 ps
module full_adder_tb;

reg A, B, Cin;
wire S, Cout;

full_adder t(
	.A(A),
	.B(B),
	.Cin(Cin),
	.S(S),
    .Cout(Cout)
	);
    initial begin
    $dumpfile("result.vcd");
	$dumpvars;
	A=0;B=0;Cin=0;#10;
    A=0;B=0;Cin=1;#10;
    A=0;B=1;Cin=0;#10;
    A=0;B=1;Cin=1;#10;
    A=1;B=0;Cin=0;#10;
    A=1;B=0;Cin=1;#10;
    A=1;B=1;Cin=0;#10;
    A=1;B=1;Cin=1;#10;
    $finish;
	end

endmodule