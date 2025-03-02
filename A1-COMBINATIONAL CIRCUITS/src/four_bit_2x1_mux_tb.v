`timescale 1ns/10ps
module four_bit_2x1_mux_tb;
	four_bit_2x1_mux t (
    .In_1(In_1),
    .In_0(In_0),
    .Select(Select),
    .Out(Out)
  );
    initial begin
    $dumpfile("result.vcd");
	$dumpvars;
    for (integer i = 0; i < 16; i = i + 1) begin
      for (integer j = 0; j < 16; j = j + 1) begin
        for (integer k = 0; k < 2; k = k + 1) begin
          In_0 = i;
          In_1 = j;
          Cin = k;
          #10; 
        end
      end
    end
	$finish;
  end	
endmodule
