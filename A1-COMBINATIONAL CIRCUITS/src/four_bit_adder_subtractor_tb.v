`timescale 1ns/1ps
module four_bit_adder_subtractor_tb;
reg [3:0] A;
reg [3:0] B;
reg subtract;
wire [3:0] Result;
wire Cout;

	four_bit_adder_subtractor t (
    .A(A),
    .B(B),
    .subtract(subtract),
    .Result(Result),
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
          subtract=k;
          #10;
        end
      end
    end
  $finish;
	end

endmodule
