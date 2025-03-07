`timescale 1ns/10ps
module two_s_complement_tb;
   reg [3:0] In;
   wire [3:0] Out;

   two_s_complement t (
        .In(In),
        .Out(Out)
    );
   initial begin
	$dumpfile("result.vcd");
	$dumpvars;
   In[3] = 0; In[2] = 0; In[1] = 0; In[0] = 0; #10;
   In[3] = 0; In[2] = 0; In[1] = 0; In[0] = 1; #10;
   In[3] = 0; In[2] = 0; In[1] = 1; In[0] = 0; #10;
   In[3] = 0; In[2] = 0; In[1] = 1; In[0] = 1; #10;
   In[3] = 0; In[2] = 1; In[1] = 0; In[0] = 0; #10;
   In[3] = 0; In[2] = 1; In[1] = 0; In[0] = 1; #10;
   In[3] = 0; In[2] = 1; In[1] = 1; In[0] = 0; #10;
   In[3] = 0; In[2] = 1; In[1] = 1; In[0] = 1; #10;
   In[3] = 1; In[2] = 0; In[1] = 0; In[0] = 0; #10;
   In[3] = 1; In[2] = 0; In[1] = 0; In[0] = 1; #10;
   In[3] = 1; In[2] = 0; In[1] = 1; In[0] = 0; #10;
   In[3] = 1; In[2] = 0; In[1] = 1; In[0] = 1; #10;
   In[3] = 1; In[2] = 1; In[1] = 0; In[0] = 0; #10;
   In[3] = 1; In[2] = 1; In[1] = 0; In[0] = 1; #10;
   In[3] = 1; In[2] = 1; In[1] = 1; In[0] = 0; #10;
   In[3] = 1; In[2] = 1; In[1] = 1; In[0] = 1; #10;
   $finish;
	end

endmodule 
