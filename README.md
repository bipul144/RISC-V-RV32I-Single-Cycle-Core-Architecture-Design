🚀 32-bit RISC-V (RV32I) Processor Core
A complete Verilog HDL implementation and verification environment for a 32-bit RISC-V (RV32I) processor core.
This project includes modular RTL hardware modules, instruction and data memory subsystems, custom assembly programs, and automated Xilinx Vivado simulation testbenches.
📌 Project Overview
RV32I ISA Compliance:Supports full 32-bit integer base instruction formats (R-type, I-type, S-type, B-type, U-type, and J-type).  
Modular RTL Architecture: Structured Verilog HDL design featuring isolated modules for the ALU, Register File ($32 \times 32$-bit registers), Control Unit, Instruction Memory, and Data Memory.
Algorithmic Execution: Includes a test assembly program that initializes a 6-element array, computes the maximum array value, and writes the output back to data memory.
Complete Simulation Suite: Pre-configured with Vivado waveform configurations (.wcfg), compiled machine code hex maps, and execution traces.
🏗️ Processor & Register LayoutInstruction FormatsThe core decodes standard 32-bit RISC-V instructions:
R-Type: Register-to-register arithmetic/logic operations.  
I-Type: Immediate operations and memory loads (lw).  
S-Type: Memory stores (sw).  
B-Type: Conditional branching (bge, blt).  
U/J-Type: Upper immediate loading (lui) and jump operations (jal).

Register Mapping
x0: Hardwired zero (zero)  
x10 (a0): Base memory address pointer / Function argument  
x11 (a1): Array element holder / Intermediate max value  
x12 (a2): Loop counter index (i)  
x13 (a3): Array length bound (N)
