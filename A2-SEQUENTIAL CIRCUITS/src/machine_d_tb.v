`timescale 1ns / 1ps

module test_machine_d_tb;
    reg x;
    reg CLK;
    reg RESET;
    wire F;
    wire [2:0] S;


    machine_d t (
        .x(x),
        .CLK(CLK),
        .RESET(RESET),
        .F(F),
        .S(S)
    );

  
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end


    initial begin
     
        RESET = 1; x = 0;
        #20 RESET = 0; 

       
        #30 x = 1;    
        #40 x = 0;   
        #50 x = 1;    
        #30 x = 0;    
        #40 x = 1;    

        
        #100 $finish;
    end


    initial begin
        $dumpfile("result.vcd");
        $dumpvars;
    end

endmodule