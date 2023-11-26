`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 01:45:30 PM
// Design Name: 
// Module Name: RAM
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


module RAM(i_clk, i_write_data, i_addr, i_write_en, i_rst, o_read_data);
    parameter DATA_W = 8;
    parameter SIZE = 8;
    parameter ADDR_W = 3;
    
    input i_clk, i_rst, i_write_en;
    input [ADDR_W-1:0] i_addr;
    input [DATA_W-1:0] i_write_data;
    output reg [DATA_W-1:0] o_read_data;
    
    reg [DATA_W-1:0] mem[0:SIZE-1];//8 words, each has 8 bits integer i;//this is the loop iterator, not synthesizable
    integer i; //this is the loop iterator, not synthesizable
    
    always @ (posedge i_clk) begin 
    if(i_rst) begin //reset every bits to zero
     for(i = 0; i < SIZE; i=i+1) begin //this loop replaces multiple lines of "<=" 
        mem[i] <= 0; //but has the same parallel semantic
     end
    end
    else begin 
        if(i_write_en) //write to the location indicated by input address 
        mem[i_addr] <= i_write_data;
        else //read from the word indicated by the input address
        o_read_data <= mem[i_addr];
      end
    end
    
endmodule
