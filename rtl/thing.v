`timescale 1ns/1ps

module thing (
    input clk,
    input reset,
    output reg done,
    output reg [7:0] letter
);

localparam int STRING = 12;
reg [3:0] i;
wire [7:0] foo [0:STRING];

assign foo[0]  = 8'h48; // 'H'
assign foo[1]  = 8'h65; // 'e'
assign foo[2]  = 8'h6C; // 'l'
assign foo[3]  = 8'h6C; // 'l'
assign foo[4]  = 8'h6F; // 'o'
assign foo[5]  = 8'h2C; // ','
assign foo[6]  = 8'h20; // ' '
assign foo[7]  = 8'h57; // 'W'
assign foo[8]  = 8'h6F; // 'o'
assign foo[9]  = 8'h72; // 'r'
assign foo[10] = 8'h6C; // 'l'
assign foo[11] = 8'h64; // 'd'
assign foo[12] = 8'h21; // '!'

initial begin
    i = 0;
end

always @ (posedge clk or posedge reset) begin
    if (reset) begin
        i <= 0;
        letter <= 8'h00;
    end else if (i <= STRING) begin
        letter <= foo[i];
        i <= i + 1;
    end else if (letter == 8'h21) begin
        done = 1;
    end
end

endmodule
