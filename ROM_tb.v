`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 02:14:09 PM
// Design Name: 
// Module Name: ROM_tb
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


module ROM_tb();
    reg [2:0] ROM_addr;
    wire [3:0] ROM_data;
    
    ROM uud(ROM_addr, ROM_data);
    
    initial begin
    ROM_addr = 3'b000;
    
    #10 ROM_addr = 3'b001;
    #10 ROM_addr = 3'b010;
    #10 ROM_addr = 3'b011;
    #10 ROM_addr = 3'b100;
    #10 ROM_addr = 3'b111;
    #10 $finish;
    end
    
endmodule
