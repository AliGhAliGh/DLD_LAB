module FreqSel(clk, rst, sw, ld, co);
input clk, rst, ld;
input[4:0] sw;
output reg co;

reg[8:0] counter;

always @(posedge clk, posedge rst) begin
    if(rst) counter = 0;
    else begin
        if(ld) counter = {sw, 4'b1111};
        else begin
            if(co) begin
                counter = {sw, 4'b0};
                co = 0;
            end
            else {co, counter} = counter + 1;
        end
    end
end
endmodule