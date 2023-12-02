module Counter #(parameter size) (clk, rst, cnt, out, co);
    input clk ,rst ,cnt;
    output reg[size - 1 : 0] out;
    output co;

    reg[size - 1 : 0] max = -1;

    always @(posedge clk, posedge rst) begin
        if(rst) 
            out = 0;
        else if(cnt)
            out = out + 1;
    end

    assign co = out == max;
endmodule