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
    reg RESET_DUT = 0;
    
    always #10 CLK_DUT <= ~CLK_DUT;
    
    wire[7:0] sin;
    wire valid;
    
    module1 module1(
        .iCLK(CLK_DUT),
        .iENABLE(ENABLE_DUT),
        .iRESET(RESET_DUT),
        .oSIN(sin),
        .oVALID(valid)
    );
    
    initial #15000000 $finish; 
endmodule
