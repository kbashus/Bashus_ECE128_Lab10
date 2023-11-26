`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 07:25:42 PM
// Design Name: 
// Module Name: seq_multi
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


module multiplier(a, b, clk, rst, p);
    input [3:0] a,b;
    input rst, clk;
    output reg [7:0] p;
    
   // output [2:0] st;
    
    parameter S0_idle = 0 , S1_multiply = 1 , S2_update_result = 2 ;
    reg [2:0] current_state, next_state;
    
    reg [7:0] partial_product;
    reg [7:0] multiplicand;
    reg [2:0] shift_count;
    reg [3:0] operand_bb;
    
    always @(posedge clk or posedge rst)
    begin
    if(rst==1)
        current_state <= S0_idle;// when reset=1, reset the CS of the FSM to "S0" CS
    else
        current_state <= next_state; // otherwise, next CS
    end
    
    // assign st <= current_state;
    
    always @ (*) begin
        case(current_state)
        S0_idle: begin
            partial_product <= 8'b0;
            shift_count <= 3'b0;
            multiplicand <= {4'b0, a};
            operand_bb <= b;
            next_state = S1_multiply;
            end
            
        S1_multiply: begin
            if((operand_bb[0]==0) && (shift_count < 4)) begin
            partial_product <= partial_product;
            shift_count <= shift_count + 1;
            multiplicand <= multiplicand << 1;
            operand_bb <= operand_bb >> 1;
            end
            else if((operand_bb[0]==1) && (shift_count <4)) begin
            partial_product <= partial_product + multiplicand;
            shift_count <= shift_count + 1;
            multiplicand <= multiplicand << 1;
            operand_bb <= operand_bb >> 1;
            end
            else begin
            next_state = S2_update_result;
            end
            end
    
        S2_update_result: begin
            if(shift_count==4) begin
            next_state = S0_idle;
            p <= partial_product;
            end
            else begin
            next_state = S1_multiply;
            end
    end
    endcase
    end
    
     
endmodule
