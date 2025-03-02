module jkff (
    input J,      // Data input
    input K,      // Data input
    input CLK,    // Clock input
    input RESET,  // Asynchronous reset, active high
    output reg Q  // Output
);

    always @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            Q <= 1'b0;
        end else begin
            case ({J, K})
                2'b00: Q <= Q;   
                2'b01: Q <= 1'b0; 
                2'b10: Q <= 1'b1;   
                2'b11: Q <= ~Q;     
                default: Q <= Q;    
            endcase
        end
    end
endmodule
