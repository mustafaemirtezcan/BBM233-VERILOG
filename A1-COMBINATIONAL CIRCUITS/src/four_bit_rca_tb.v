`timescale 1 ns/10 ps
module four_bit_rca_tb;
reg [3:0] A;
reg [3:0] B;
reg Cin;
wire [3:0] S;
wire Cout;

four_bit_rca t (
  .A(A),
  .B(B),
  .Cin(Cin),
  .S(S),
  .Cout(Cout)
  );
  initial begin
	$dumpfile("result.vcd");
	$dumpvars;
  for (integer i = 0; i < 16; i = i + 1) begin
      for (integer j = 0; j < 16; j = j + 1) begin
        for (integer k = 0; k < 2; k = k + 1) begin
          A = i;
          B = j;
          Cin = k;
          #10;
        end
      end
    end
  $finish;
	end
endmodule