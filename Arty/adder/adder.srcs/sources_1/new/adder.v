`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2019 10:39:08 PM
// Design Name: 
// Module Name: adder
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


module adder(
    input [3:0] sw,
    input btn_add,
    input btn_rst,
    output [3:0] led
    );
    reg [3:0] store = 0;
    
    //always @ (negedge btn_add) store = store + sw;
    //always @ (negedge btn_rst) store = 4'b0000;
    //Can't load store in two different always blocks
    //Also if you use negedge, you have to hold down rst button to use other button.  Intended :)
    always @ (posedge btn_add or posedge btn_rst) begin
        if ( btn_rst) begin
            store <= 'b0;
        end else begin
            store <= store + sw;
        end
    end
    
    assign led = store;
endmodule
