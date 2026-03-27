`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/01/29 11:43:59
// Design Name: 
// Module Name: my_led
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


module my_led(
                input               clk,
                input               rst_n,
                output reg[3:0]    led
    );
 reg   [25:0]   cnt_1s;
 always         @(posedge       clk     or  negedge     rst_n    )
                if(rst_n==1'b0)begin
                     led         <=      4'b0001;
                     cnt_1s     <=      26'd0;
               end else  if(cnt_1s  ==   26'd9) begin
                     led        <=  {led[2:0],led[3]}; 
                     cnt_1s     <=      26'd0; 
               end else 
                     cnt_1s    <=  cnt_1s  +   1'b1;   
endmodule
