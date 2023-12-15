module Controller(clk, rst, sign, phase_pos, next);
input clk, rst, next;
output reg sign, phase_pos;

parameter P1 = 3'b00 , P2 = 3'b01 , P3 = 3'b10 , P4 = 3'b11;

reg[1:0] ns ,ps;

always @(posedge clk, posedge rst) begin
    if(rst) ps = P1;
    else ps = ns;
end

always @(next, ps) begin
    ns = 2'bxx;
    case (ps)
        P1: begin 
            ns = next ? P2 : P1;
            phase_pos = 0;
            sign = 0;
            end
        P2: begin 
            ns = next ? P3 : P2;
            phase_pos = 1;
            sign = 0;
            end
        P3: begin 
            ns = next ? P4 : P3;
            phase_pos = 0;
            sign = 1;
            end
        P4: begin 
            ns = next ? P1 : P4;
            phase_pos = 1;
            sign = 1;
            end
        default: ns = 2'bxx;
    endcase
end

endmodule