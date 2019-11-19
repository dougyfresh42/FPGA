`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2019 09:34:25 PM
// Design Name: 
// Module Name: hilo_main
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


module hilo_main(
  output [3:0] led,
  output [7:0] segment,
  input CLK100MHZ
);

reg [7:0] guess;
reg [3:0] state;

assign led = 'b1001;

hex_display displayer(segment, guess, state, CLK100MHZ);
//assign segment = 'b10101010;

endmodule
