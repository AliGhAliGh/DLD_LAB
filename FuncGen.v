module FuncGen(clk, rst, ld, cnt_load, wave_sel, amp_sel, out);
input clk, rst, ld;
input[4:0] cnt_load;
input[2:0] wave_sel;
input[1:0] amp_sel;
output out;

wire wave_clk;
wire[7:0] selected, res_wave;

WaveformGenerator wg(.clk(wave_clk), .rst(rst), .sel(wave_sel), .out(selected));
FreqSel fs(.clk(clk), .rst(rst), .sw(cnt_load), .ld(ld), .co(wave_clk));
AmpSel ampsel(.wave(selected), .Sel(amp_sel), .divided_wave(res_wave));
PWM pwm(.clk(clk), .rst(rst), .inp(res_wave), .out(out));
endmodule