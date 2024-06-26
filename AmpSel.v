module AmpSel(wave,Sel,divided_wave);

input[7:0]wave;
input[1:0]Sel;
output[7:0]divided_wave;

    assign divided_wave = Sel == 2'b00 ? wave:
                          Sel == 2'b01 ? wave >> 1 :
                          Sel == 2'b10 ? wave >> 2 :
                          Sel == 2'b11 ? wave >> 3 :
                          8'bx;
endmodule
