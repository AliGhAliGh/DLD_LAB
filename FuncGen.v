module FuncGen(clk, rst, ld, cnt_load, wave_sel, amp_sel, out);
input clk, rst, ld;
input[4:0] cnt_load;
input[2:0] wave_sel;
input[1:0] amp_sel;
output out;

wire wave_clk;
wire[7:0] sine, half, full, out_1_x, out_tri, out_rect, selected, res_wave;

assign selected = wave_sel == 0 ? out_1_x :
                  wave_sel == 1 ? out_tri :
                  wave_sel == 2 ? out_rect :
                  wave_sel == 3 ? sine :
                  wave_sel == 4 ? full :
                  wave_sel == 5 ? half : 8'bx;

WaveGen wg(.clk(wave_clk), .rst(rst), .out(out_1_x), .out_tri(out_tri), .out_rect(out_rect));
FreqSel fs(.clk(clk), .rst(rst), .sw(cnt_load), .ld(ld), .co(wave_clk));
DDS dds(.clk(wave_clk), .rst(rst), .sine(sine), .full_wave(full), .half_wave(half));
AmpSel ampsel(.wave(selected), .Sel(amp_sel), .divided_wave(res_wave));
PWM pwm(.clk(clk), .rst(rst), .inp(res_wave), .out(out));
endmodule