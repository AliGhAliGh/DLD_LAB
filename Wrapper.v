module Wrapper(clk, rst, start, v, u, done, wr_req, wr_data);
input clk, rst, start;
input[4:0] v;
input[1:0] u;
output done, wr_req;
output[20:0] wr_data;

wire ldx, ldu, shl, eng_start, eng_done;
wire[15:0] shreg_out, frac;
wire[1:0] int, ureg_out;

Controller controller(.clk(clk), .rst(rst), .wr_req(wr_req), .ldx(ldx), .ldu(ldu), .shl(shl), .eng_start(eng_start), .done(done), .eng_done(eng_done), .start(start));
ShiftReg sh_reg(.clk(clk), .rst(rst), .ld(ldx), .sh(shl), .data({3'b0, v, 8'b0}), .out(shreg_out));
Reg u_reg(.clk(clk), .rst(rst), .ld(ldu), .data(u), .out(ureg_out));
exponential exp(.clk(clk), .rst(rst), .start(eng_start), ._x(shreg_out), .done(eng_done), .intpart(int), .fracpart(frac));
CombShift comb_shift(.frac(frac), .int(int), .sh(ureg_out), .out(wr_data));
endmodule