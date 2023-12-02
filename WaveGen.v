module WaveGen(clk, rst, out, out_tri, out_rect);
input clk, rst;
output reg[7:0] out, out_tri, out_rect;

wire[7:0] _x;

Counter #(8) x_counter(.clk(clk), .rst(rst), .cnt(1), .out(_x));

always @(posedge clk, posedge rst) begin
    if(rst) out = 0;
    else out = 255 / (255 - _x);
end

always @(posedge clk, posedge rst) begin
    if(rst) out_tri = 0;
    else out_tri = _x <= 127 ? _x * 2 : 511 - 2 * _x;
end

always @(posedge clk, posedge rst) begin
    if(rst) out_rect = 0;
    else out_rect = _x <= 127 ? 255 : 0;
end
endmodule