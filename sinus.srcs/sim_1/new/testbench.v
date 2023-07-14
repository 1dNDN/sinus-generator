`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2023 01:03:22
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg CLK_DUT = 0;
    reg ENABLE_DUT = 1;
    
    always #10 CLK_DUT <= ~CLK_DUT;
    
    wire[7:0] sin;
    
    module1 module1(
        CLK_DUT,
        ENABLE_DUT,
        sin
    );
    
    initial #15000000 $finish; 
endmodule
