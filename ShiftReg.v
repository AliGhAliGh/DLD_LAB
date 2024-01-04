module ShiftReg(clk, rst, ld, sh, data, out);
input clk, rst, ld, sh;
input[15:0] data;
output reg[15:0] out;

always @(posedge clk, posedge rst) begin
    if(rst) out = 16'b0;
    else if(ld) out = data;
    else if(sh) out = {out[14:0], 1'b0};
end
endmodule