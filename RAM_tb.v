`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 02:14:09 PM
// Design Name: 
// Module Name: RAM_tb
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


module RAM_tb();
    reg i_clk, i_write_en, i_rst;
    reg [7:0] i_write_data;
    reg [2:0] i_addr;
    wire [7:0] o_read_data;
    
    RAM uut(i_clk, i_write_data, i_addr, i_write_en, i_rst, o_read_data);
    
    always #5 i_clk = ~i_clk;
    
    initial begin
    i_clk = 0;
    i_rst = 1;
    i_write_en = 0;
    i_addr = 3'b000;
    i_write_data = 8'b10101010;

    // Reset the memory
    #10 i_rst = 0;

    // Write data to address 1
    #10 i_write_en = 1;
    #10 i_addr = 3'b001;
    #10 i_write_data = 8'b11001100;

    // Read data from address 0
    #10 i_write_en = 0;
    #10 i_addr = 3'b000;

    // Finish the simulation
    #10 $finish;
  end
    
    
endmodule
