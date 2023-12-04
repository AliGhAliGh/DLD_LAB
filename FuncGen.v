module FuncGen(clk, rst, ld, cnt_load, wave_sel, amp_sel, out);
input clk, rst, ld;
input[4:0] cnt_load;
input[2:0] wave_sel;
input[1:0] amp_sel;
output out;

wire wave_clk;
wire sine, half, full, out_1_x, out_tri, out_rect;

WaveGen wg(.clk(wave_clk), .rst(rst), .out(out_1_x), .out_tri(out_tri), .out_rect(out_rect));
FreqSel fs(.clk(clk), .rst(rst), .sw(cnt_load), .ld(ld), .co(wave_clk));
DDS dds(.clk(wave_clk), .rst(rst), .sine(sine), .full_wave(full), .half_wave(half));
endmodule