module Counter (clk, rst, cnt, out, co);
    input clk ,rst ,cnt;
    output reg[5 : 0] out;
    output co;

    always @(posedge clk, posedge rst) begin
        if(rst) 
            out = 1'd0;
        else if(cnt)
            out = out + 1'd1;
    end

    assign co = out == 6'b111111;
endmodule

