module Controller(clk, rst, wr_req, ldx, ldu, shl, eng_start, done, eng_done, start);
input clk, rst, eng_done, start;
output wr_req, ldx, ldu, shl, eng_start, done;

reg[2:0] ps, ns;
reg[1:0] count;
wire cnt;

parameter IDLE = 3'b000, WAIT = 3'b001, START = 3'b010, CALC = 3'b011, WRITE = 3'b100, DONE = 3'b101;

always @(posedge clk, posedge rst) begin
    if(rst) ps = IDLE;
    else ps = ns;
end

always @(*) begin
    ns = 3'b0;
    case (ps)
        IDLE: ns = start ? WAIT : IDLE; 
        WAIT: ns = start ? WAIT : START; 
        START: ns = CALC; 
        CALC: ns = eng_done ? WRITE : CALC; 
        WRITE: ns = count < 2'b11 ? START : DONE; 
        DONE: ns = IDLE; 
        default: ns = IDLE;
    endcase
end

always @(posedge clk, posedge rst) begin
    if(rst) count = 2'b0;
    else if(cnt) count = count + 1;
end

assign ldu = ps == WAIT;
assign ldx = ps == WAIT;
assign wr_req = ps == WRITE;
assign shl = ps == WRITE;
assign eng_start = ps == START;
assign done = ps == DONE;
assign cnt = ps == WRITE;
endmodule