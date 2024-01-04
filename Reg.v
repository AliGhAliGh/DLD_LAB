module Reg(clk, rst, ld, data, out);
input clk, rst, ld;
input[1:0] data;
output reg[1:0] out;

always @(posedge clk, posedge rst) begin
    if(rst) out = 2'b0;
    else if(ld) out = data;
end
endmodule