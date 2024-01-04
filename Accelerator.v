`timescale 1 ns/ 100 ps
module AcceleratorTB();
reg clk = 1'b0, rst, start;
wire done, wr_req;
wire[20:0] wr_data;

Wrapper test(.clk(clk), .rst(rst), .start(start), .v(5'b10000), .u(2'b01), .done(done), .wr_req(wr_req), .wr_data(wr_data));

always #5 clk = ~clk;

initial begin
    rst = 1'b1;
    #20 rst = 1'b0;
    #20 start = 1'b1;
    #10 start = 1'b0;
    while(!done) #10;
    #30;
    #10 $stop;
end

endmodule