`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 07:27:11 PM
// Design Name: 
// Module Name: seq_multi_tb
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


module seq_multi_tb();
    reg clk;
    reg rst;
    reg [3:0] a, b;
    wire [7:0] p;
    
    multiplier UUT(.a(a),.b(b), .clk(clk), .rst(rst),.p(p));
    always #5 clk = ~clk;
    
    initial begin
    clk = 0;
    rst = 1;
    a = 4'b0010; b = 4'b0011;
  
    #10 rst = 0;
    #20;
    rst = 1;
    a = 4'b0011; b = 4'b0100;
    #10 rst = 0;
    #20
    #10 $finish;
  end
  
endmodule
