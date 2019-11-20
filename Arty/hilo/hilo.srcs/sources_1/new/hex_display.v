`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2019 09:34:46 PM
// Design Name: 
// Module Name: hex_display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module hex_display(
  output reg [7:0] segment,
  input  [7:0] val,
  input  [3:0] state,
  input clk
);

reg [7:0] seg1;
reg [7:0] seg2;
reg [24:0] flicker = 0;

always @ (posedge clk) begin
  flicker <= flicker + 1;
  if (flicker == 0) begin;
    if (segment[7] == 1)
      segment <= seg1;
    else
      segment <= seg2;
  end;

  seg1 <= 8'b00010111;
  seg2 <= 8'b10010000;

//  case (state)
//    IDLE:
//    GUESS1:
//    GUESS2:
//    WRONGHI:
//    WRONGLO:
//    WINNER:
//    DEFAULT:
//  endcase
end;

endmodule
