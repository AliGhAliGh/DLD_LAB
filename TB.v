module TB();
reg rst, clk;
wire[7:0] out, out_tri, out_rect;
WaveGen all(.clk(clk), .rst(rst), .out(out), .out_tri(out_tri), .out_rect(out_rect));

always begin
    #10 clk=~clk;
end

initial begin
    rst = 1;
    clk = 0;
    #20 rst = 0;
    #10000 $stop;
end
endmodule

module DDS_TB();
reg rst, clk;
wire[7:0] sine, full, half;
DDS all(.clk(clk), .rst(rst), .sine(sine), .full_wave(full), .half_wave(half));

always begin
    #10 clk=~clk;
end

initial begin
    rst = 1;
    clk = 0;
    #20 rst = 0;
    #10000 $stop;
end
endmodule

module FuncGenTB();
reg rst, clk, ld;
reg[4:0] cnt_load;
reg[1:0] amp_sel;
reg[2:0] wave_sel;
wire out;
FuncGen all(.clk(clk), .rst(rst), .ld(ld), .cnt_load(cnt_load), .wave_sel(wave_sel), .amp_sel(amp_sel), .out(out));

always begin
    #1 clk=~clk;
end

initial begin
    rst = 1;
    clk = 0;
    ld = 1;
    amp_sel = 0;
    cnt_load = 5'b11111;
    wave_sel = 0;
    #20 rst = 0;
    #20 ld = 0;
    #100000 wave_sel = 1;
    #100000 wave_sel = 2;
    #5000 amp_sel = 2;
    #100000 wave_sel = 3;
    #100000 wave_sel = 4;
    #100000 wave_sel = 5;
    #100000 $stop;
end
endmodule