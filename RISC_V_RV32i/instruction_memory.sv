`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2026 11:23:40 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory#(
	parameter ADDR_WIDTH = 7,                      // Address bits (2^7 = 128 depth)
	parameter DATA_WIDTH = 8                       // Data width per memory cell
)(
  input  logic             imem_req,               // Read enable
  input  logic [31:0]      imem_addr,              // Byte address (word-aligned)
  output logic [31:0]      imem_data               // Output instruction
);

  // --------------------------------------------------------
  // Memory Declaration (ROM)
  // --------------------------------------------------------
  logic [DATA_WIDTH-1:0] mem [0:(2**ADDR_WIDTH)-1];

  initial begin
        // Initialize unused memory locations to 0
        for (int i = 112; i < (2**ADDR_WIDTH); i++) begin
            mem[i] = 8'h00;
        end
        // PC 0x00: 0x00000537 -> lui x10, 0x0
        mem[0]  = 8'h37; mem[1]  = 8'h05; mem[2]  = 8'h00; mem[3]  = 8'h00;

        // PC 0x04: 0x00050513 -> addi x10, x10, 0
        mem[4]  = 8'h13; mem[5]  = 8'h05; mem[6]  = 8'h05; mem[7]  = 8'h00;

        // PC 0x08: 0x00800593 -> addi x11, x0, 8
        mem[8]  = 8'h93; mem[9]  = 8'h05; mem[10] = 8'h80; mem[11] = 8'h00;

        // PC 0x0C: 0x00b52023 -> sw x11, 0(x10)
        mem[12] = 8'h23; mem[13] = 8'h20; mem[14] = 8'hb5; mem[15] = 8'h00;

        // PC 0x10: 0xfeb00593 -> addi x11, x0, -21
        mem[16] = 8'h93; mem[17] = 8'h05; mem[18] = 8'hb0; mem[19] = 8'hfe;

        // PC 0x14: 0x00b52223 -> sw x11, 4(x10)
        mem[20] = 8'h23; mem[21] = 8'h22; mem[22] = 8'hb5; mem[23] = 8'h00;

        // PC 0x18: 0x00f00593 -> addi x11, x0, 15
        mem[24] = 8'h93; mem[25] = 8'h05; mem[26] = 8'hf0; mem[27] = 8'h00;

        // PC 0x1C: 0x00b52423 -> sw x11, 8(x10)
        mem[28] = 8'h23; mem[29] = 8'h24; mem[30] = 8'hb5; mem[31] = 8'h00;

        // PC 0x20: 0xffd00593 -> addi x11, x0, -3
        mem[32] = 8'h93; mem[33] = 8'h05; mem[34] = 8'hd0; mem[35] = 8'hff;

        // PC 0x24: 0x00b52623 -> sw x11, 12(x10)
        mem[36] = 8'h23; mem[37] = 8'h26; mem[38] = 8'hb5; mem[39] = 8'h00;

        // PC 0x28: 0x02a00593 -> addi x11, x0, 42
        mem[40] = 8'h93; mem[41] = 8'h05; mem[42] = 8'ha0; mem[43] = 8'h02;

        // PC 0x2C: 0x00b52823 -> sw x11, 16(x10)
        mem[44] = 8'h23; mem[45] = 8'h28; mem[46] = 8'hb5; mem[47] = 8'h00;

        // PC 0x30: 0x01100593 -> addi x11, x0, 17
        mem[48] = 8'h93; mem[49] = 8'h05; mem[50] = 8'h10; mem[51] = 8'h01;

        // PC 0x34: 0x00b52a23 -> sw x11, 20(x10)
        mem[52] = 8'h23; mem[53] = 8'h2a; mem[54] = 8'hb5; mem[55] = 8'h00;

        // PC 0x38: 0x00052583 -> lw x11, 0(x10)
        mem[56] = 8'h83; mem[57] = 8'h25; mem[58] = 8'h05; mem[59] = 8'h00;

        // PC 0x3C: 0x00100613 -> addi x12, x0, 1
        mem[60] = 8'h13; mem[61] = 8'h06; mem[62] = 8'h10; mem[63] = 8'h00;

        // PC 0x40: 0x00600693 -> addi x13, x0, 6
        mem[64] = 8'h93; mem[65] = 8'h06; mem[66] = 8'h60; mem[67] = 8'h00;

        // PC 0x44: 0x02d65263 -> bge x12, x13, 36 (offset +36)
        mem[68] = 8'h63; mem[69] = 8'h52; mem[70] = 8'hd6; mem[71] = 8'h02;

        // PC 0x48: 0x00261793 -> slli x15, x12, 2
        mem[72] = 8'h93; mem[73] = 8'h17; mem[74] = 8'h26; mem[75] = 8'h00;

        // PC 0x4C: 0x00f50833 -> add x16, x10, x15
        mem[76] = 8'h33; mem[77] = 8'h08; mem[78] = 8'hf5; mem[79] = 8'h00;

        // PC 0x50: 0x00082703 -> lw x14, 0(x16)
        mem[80] = 8'h03; mem[81] = 8'h27; mem[82] = 8'h08; mem[83] = 8'h00;

        // PC 0x54: 0x00e5c463 -> blt x11, x14, 8 (offset +8)
        mem[84] = 8'h63; mem[85] = 8'hc4; mem[86] = 8'he5; mem[87] = 8'h00;

        // PC 0x58: 0x0080006f -> jal x0, 8 (offset +8)
        mem[88] = 8'h6f; mem[89] = 8'h00; mem[90] = 8'h80; mem[91] = 8'h00;

        // PC 0x5C: 0x000705b3 -> add x11, x14, x0
        mem[92] = 8'hb3; mem[93] = 8'h05; mem[94] = 8'h07; mem[95] = 8'h00;

        // PC 0x60: 0x00160613 -> addi x12, x12, 1
        mem[96] = 8'h13; mem[97] = 8'h06; mem[98] = 8'h16; mem[99] = 8'h00;

        // PC 0x64: 0xfe1ff06f -> jal x0, -32 (loop back to PC 0x44)
        mem[100] = 8'h6f; mem[101] = 8'hf0; mem[102] = 8'h1f; mem[103] = 8'hfe;

        // PC 0x68: 0x00b52c23 -> sw x11, 24(x10)
        mem[104] = 8'h23; mem[105] = 8'h2c; mem[106] = 8'hb5; mem[107] = 8'h00;

        // PC 0x6C: 0x00000013 -> NOP (addi x0, x0, 0)
        mem[108] = 8'h13; mem[109] = 8'h00; mem[110] = 8'h00; mem[111] = 8'h00;

    end

    // Use lower bits for local array indexing
    wire [ADDR_WIDTH-1:0] base_addr = imem_addr[ADDR_WIDTH-1:0];

    always_comb begin
        if (imem_req && (base_addr + 3 < (2**ADDR_WIDTH))) begin
            // Little-endian assembly of 32-bit instruction
            imem_data = {
                mem[base_addr + 3],
                mem[base_addr + 2],
                mem[base_addr + 1],
                mem[base_addr]
            };
        end else begin
            imem_data = 32'd0;
        end
    end


endmodule
