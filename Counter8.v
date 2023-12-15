module Counter8 (clk, rst, cnt, out);
    input clk ,rst ,cnt;
    output reg[7 : 0] out;

    always @(posedge clk, posedge rst) begin
        if(rst) 
            out = 1'd0;
        else if(cnt)
            out = out + 1'd1;
    end
endmodule

