module vending_machine(
    input clk,
    input rst,
    input [1:0] in,
    output reg [1:0] change,
    output reg out
);
    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;

    reg [1:0] ps, ns;

    always @(posedge clk or posedge rst) begin 
        if (rst) begin 
            ps <= s0;  // Reset to initial state
            change <= 2'b00;
            out <= 0;
        end 
        else begin 
            ps <= ns;  // Update state
        end
    end

   
    always @(*) begin
       
        ns = ps;
        change = 2'b00;
        out = 0;

        case (ps)
            
            s0: begin
                if (in == 2'b00) begin 
                    ns = s0;
                    change = 2'b00;
                    out = 0;
                end 
                else if (in == 2'b01) begin 
                    ns = s1;
                    change = 2'b00;
                    out = 0;
                end 
                else if (in == 2'b10) begin 
                    ns = s2;
                    change = 2'b00;
                    out = 0;
                end
            end
            
           
            s1: begin
                if (in == 2'b00) begin 
                    ns = s0;
                    change = 2'b01;
                    out = 0;
                end 
                else if (in == 2'b01) begin 
                    ns = s2;
                    change = 2'b00;
                    out = 0;
                end 
                else if (in == 2'b10) begin 
                    ns = s0;
                    change = 2'b00;
                    out = 1;
                end
            end
            
          
            s2: begin
                if (in == 2'b00) begin 
                    ns = s0;
                    change = 2'b10;
                    out = 0;
                end 
                else if (in == 2'b01) begin 
                    ns = s0;
                    change = 2'b00;
                    out = 1;
                end 
                else if (in == 2'b10) begin 
                    ns = s0;
                    change = 2'b01;
                    out = 1;
                end
            end

           
            default: ns = s0;
        endcase
    end
endmodule
