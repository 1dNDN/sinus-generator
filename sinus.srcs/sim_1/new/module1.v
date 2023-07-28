`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 20:39:23
// Design Name: 
// Module Name: module1
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


module module1(iCLK, iENABLE, iRESET, oSIN, oVALID);
    
    input wire iCLK;
    input wire iENABLE;
    input wire iRESET;
    output reg[7:0] oSIN = 0;
    output reg oVALID = 1;
    
    reg wea = 0;
    reg[9:0] addra = 10'h01;
    wire[7:0] douta;
    
    reg[15:0] timeToReset = 0;
    
    always @(posedge iCLK) 
    begin
        if( iENABLE == 1 ) 
        begin
            if(iRESET == 1)
            begin
                timeToReset = 0;
                addra = 10'h01;
                oSIN = 0;
            end        
            else if(timeToReset < 1)
            begin
                addra = addra + 1;
                timeToReset = timeToReset + 1;
                oSIN = 0;
            end
            else if(timeToReset < 961)
            begin
                timeToReset = timeToReset + 1;
                addra = addra + 1;
                oSIN = douta;
            end
            else if (timeToReset < 9600)
            begin
                timeToReset = timeToReset + 1;
                oSIN = 0;
            end
            else
            begin
                timeToReset = 0;
                addra = 10'h01;
                oSIN = 0;
            end
        end
    end
    
    blk_mem_gen_0 bram (
    .clka(iCLK),    // input wire clka
    .wea(wea),      // input wire [0 : 0] wea
    .addra(addra),  // input wire [9 : 0] addra
    .douta(douta)  // output wire [7 : 0] douta
    );

endmodule
