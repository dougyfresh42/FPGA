`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2019 08:44:11 PM
// Design Name: 
// Module Name: blinky
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


module blinky(
    input CLK100MHZ,
    output led[3:0]
    );
    reg[26:0] count = 0;
    assign led[3] = count[26];
    assign led[2] = count[25];
    always @ (posedge(CLK100MHZ)) count <= count + 1;
    
    wire [3:0] ledb2;
    assign led[1] = ledb2[1];
    assign led[0] = ledb2[0];
    
    blinky2 b2(
    .clk2 (CLK100MHZ),
    .led2  (ledb2));
endmodule
