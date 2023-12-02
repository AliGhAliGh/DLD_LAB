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