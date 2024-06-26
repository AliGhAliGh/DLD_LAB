module PWM(clk, rst, inp, out);
input clk, rst;
input[7:0] inp;
output out;

reg[7:0] counter;

always @(posedge clk, posedge rst) begin
    if(rst) counter = 1'd0;
    else counter = counter + 1'd1;
end

assign out = inp > counter;
endmodule