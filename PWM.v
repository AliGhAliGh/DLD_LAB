module PWM(clk, rst, inp, out);
input clk, rst;
input[7:0] inp;
output out;

reg[7:0] counter;

always @(posedge clk, posedge rst) begin
    if(rst) counter = 0;
    else counter = counter + 1;
end

assign out = counter > inp;
endmodule