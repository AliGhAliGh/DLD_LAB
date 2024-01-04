module CombShift(frac, int, sh, out);
input[15:0] frac;
input[1:0] int;
input[1:0] sh;
output[20:0] out;

assign out = {int, frac} << sh;
endmodule