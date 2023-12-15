module WaveformGenerator (clk, rst, sel, out);
    input clk ,rst;
	 input[2:0] sel;
    output[7 : 0] out;

	 wire[7:0] out0, out1, out2, out3, out4, out5;
	 
    WaveGen wg(.clk(clk), .rst(rst), .out(out0), .out_tri(out1), .out_rect(out2));
	 DDS dds(.clk(clk), .rst(rst), .sine(out3), .full_wave(out4), .half_wave(out5));

    assign out = sel == 3'd0 ? out0 :
						sel == 3'd1 ? out1 :
						sel == 3'd2 ? out2 :
						sel == 3'd3 ? out3 :
						sel == 3'd4 ? out4 :
						sel == 3'd5 ? out5 : 8'bx;
endmodule