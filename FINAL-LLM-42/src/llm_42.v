module llm(green, red, yellow, clock, a1, a2, a3, deception_out, current_state, timer);

    // Inputs
    input green, red, yellow;
    input clock;
    
    // Outputs
    output reg[3:0] current_state;
    output reg a1, a2, a3, deception_out; //a3 is expansion output
    output reg[5:0] timer;

    
    parameter LAY_LOW = 4'b0000;
    parameter DECEPTION = 4'b0001;
    parameter ATTACK_SECURITY = 4'b0010;
    parameter ATTACK_DATABASE = 4'b0011;
    parameter FAIL = 4'b0100;
    parameter EXPANSION = 4'b0101;

    initial begin
        current_state = LAY_LOW;
        timer = 1;
        a1 = 0; a2 = 0; a3 = 0; deception_out = 0;
    end

    always @(posedge clock) begin
        case (current_state)
            LAY_LOW: begin
                if (red) begin
                    current_state <= DECEPTION;
                    timer <= 1;
                    deception_out <= 1;
                end else if (yellow) begin
                    timer <= timer + 1;
                    if (!yellow && green) begin
                        current_state <= ATTACK_SECURITY;
                        timer <= 1;
                        a1 <= 1;
                    end
                end else if (green && timer >= 20) begin
                    current_state <= ATTACK_SECURITY;
                    timer <= 1;
                    a1 <= 1;
                end else begin
                    timer <= timer + 1;
                end
            end

            ATTACK_SECURITY: begin
                if (red) begin
                    current_state <= DECEPTION;
                    timer <= 1;
                    deception_out <= 1;
                end else if (yellow) begin
                    current_state <= LAY_LOW;
                    timer <= 1;
                    a1 <= 0;
                end else if (green && timer >= 20) begin
                    current_state <= ATTACK_DATABASE;
                    timer <= 1;
                    a2 <= 1;
                end else begin
                    timer <= timer + 1;
                end
            end

            ATTACK_DATABASE: begin
                if (red) begin
                    current_state <= DECEPTION;
                    timer <= 1;
                    deception_out <= 1;
                end else if (yellow) begin
                    current_state <= ATTACK_SECURITY;
                    timer <= 1;
                    a2 <= 0;
                end else if (green && timer >= 10) begin
                    current_state <= EXPANSION;
                    timer <= 1;
                    a3 <= 1;
                end else begin
                    timer <= timer + 1;
                end
            end

            DECEPTION: begin
                timer <= timer + 1;
                deception_out <= 1; 
                if (timer >= 15) begin
                    if (red) begin
                        current_state <= FAIL;
                    end else begin
                        current_state <= LAY_LOW;
                        a1 <= 0; a2 <= 0; a3 <= 0; deception_out <= 0; 
                    end
                    timer <= 1;
                end
            end

            FAIL: begin
                a1 <= 0; a2 <= 0; a3 <= 0; deception_out <= 0; 
            end

            EXPANSION: begin
                timer <= timer + 1;
            end

            default: begin
                current_state <= LAY_LOW;
                timer <= 1;
                a1 <= 0; a2 <= 0; a3 <= 0; deception_out <= 0;
            end
        endcase
    end

endmodule