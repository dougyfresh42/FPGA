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


module blinky2(
    input clk2,
    output wire [3:0] led2
    );
    reg[26:0] count = 0;
    assign led2[1] = count[24];
    assign led2[0] = count[23];
    always @ (posedge(clk2)) count <= count + 1;
endmodule
