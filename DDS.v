module DDS(clk, rst, sine, full_wave, half_wave);
input clk, rst;
output[7:0] sine, full_wave, half_wave;

wire[8:0] out;
wire[5:0] addr, out_2, res_addr;
wire sign, phase_pos, next, mag_sel;
wire[7:0] out_rom, mag;

// (*romstyle = "M9K"*)(*ram_init_file = "Sine.mif"*) reg[7:0] rom[0:63];
reg[7:0] rom[0:63];
initial 
$readmemb("sine.mem", rom);

Controller c(.clk(clk), .rst(rst), .sign(sign), .phase_pos(phase_pos), .next(next));
Counter dp(.clk(clk), .rst(rst), .cnt(1'b1), .out(addr), .co(next));

assign out_2 = (~addr) + 1'b1;
assign res_addr = phase_pos ? out_2 : addr;
assign out_rom = rom[res_addr];
assign mag_sel = ~(|addr) & phase_pos;
assign mag = mag_sel ? 8'b11111111 : out_rom;
assign out = {sign, (sign ? (((~mag) + 1'b1) + 9'b100000000) : mag)};
assign sine = out[8:1] << 1'b1;
assign full_wave = (sign ? -out[8:1] + 7'b1111111 : out[8:1]) << 1'b1;
assign half_wave = (sign ? 7'b1000000 : out[8:1]) << 1'b1;
endmodule