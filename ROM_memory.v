`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 20:43:08
// Design Name: 
// Module Name: ROM_memory
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


module ROM_memory(
    input [31:0] PC,
    input reset,en,
    input [31:0]address,
 output [31:0] Instruction_Code
);
 parameter address_width=32;
 parameter memory_depth=2**10;
    reg [7:0] ROM [31:0];
  assign Instruction_Code = en?{ROM[PC+3],ROM[PC+2],ROM[PC+1],ROM[PC]}: 8'hZZ;
  // assign Instruction_Code = en ? Instruction_Code: 8'hzz;
  

always @(reset)
    begin
        if(reset == 1)
         $readmemh("hex_file.mem",ROM);
         
        end
endmodule

