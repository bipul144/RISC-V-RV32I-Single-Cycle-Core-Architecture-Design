----------------------------------------------------------------
🚀 32-bit RISC-V (RV32I) Processor Core
----------------------------------------------------------------

A complete Verilog HDL implementation and verification environment
for a 32-bit RISC-V (RV32I) processor core.

This repository contains a complete single-cycle RISC-V 32I
processor, designed and implemented in SystemVerilog.

This project includes modular RTL hardware modules, instruction and
data memory subsystems, custom assembly programs, and automated
Xilinx Vivado simulation testbenches.

----------------------------------------------------------------
📌 PROJECT OVERVIEW
----------------------------------------------------------------
- RV32I ISA Compliance: Supports the full 32-bit integer base
  instruction formats (R-type, I-type, S-type, B-type, U-type,
  and J-type).
- Modular RTL Architecture: Structured Verilog HDL design with
  isolated modules for the ALU, Register File (32 x 32-bit
  registers), Control Unit, Instruction Memory, and Data Memory.
- Algorithmic Execution: Includes a test assembly program that
  initializes a 6-element array, computes the maximum array value,
  and writes the output back to data memory.
- Complete Simulation Suite: Pre-configured with Vivado waveform
  configurations (.wcfg), compiled machine code hex maps, and
  execution traces.

----------------------------------------------------------------
🏗️ PROCESSOR & REGISTER LAYOUT
----------------------------------------------------------------

Instruction Formats
The core decodes standard 32-bit RISC-V instructions:
  - R-Type: Register-to-register arithmetic/logic operations.
  - I-Type: Immediate operations and memory loads (lw).
  - S-Type: Memory stores (sw).
  - B-Type: Conditional branching (bge, blt).
  - U/J-Type: Upper immediate loading (lui) and jump operations
    (jal).

Register Mapping
  - x0        : Hardwired zero (zero)
  - x10 (a0)  : Base memory address pointer / Function argument
  - x11 (a1)  : Array element holder / Intermediate max value
  - x12 (a2)  : Loop counter index (i)
  - x13 (a3)  : Array length bound (N)

----------------------------------------------------------------
📊 PROJECT GOALS
----------------------------------------------------------------
- Understand the RISC-V 32I ISA at the bit level.
- Translate instruction formats into real hardware.
- Design a clean, modular CPU datapath.
- Run real assembly programs on a custom processor.
- Demonstrate how software and hardware connect end-to-end.

----------------------------------------------------------------
📂 WHAT THIS PROCESSOR SUPPORTS
----------------------------------------------------------------
ISA: RISC-V RV32I

Instruction Types:
  - R-type
  - I-type (Arithmetic, Load, JALR)
  - S-type
  - B-type
  - U-type (LUI, AUIPC)
  - J-type (JAL)

Execution Model: Single-cycle

Memory:
  - Byte-addressable instruction memory
  - Byte-addressable data memory

Simulation: ModelSim / Questa

----------------------------------------------------------------
📂 ARCHITECTURE OVERVIEW
----------------------------------------------------------------
The processor is built from clearly separated, reusable blocks:
  - Instruction Memory
  - Fetch
  - Decode
  - Register File
  - ALU
  - Data Memory
  - Branch Control
  - Control Unit
  - Top-Level Integration

All shared definitions (opcodes, ALU operations, memory sizes,
control signals) are centralized in a SystemVerilog package,
keeping the design clean, readable, and scalable.

----------------------------------------------------------------
⚙️ PROGRAMS EXECUTED ON THIS PROCESSOR
----------------------------------------------------------------
The processor successfully runs the following programs end-to-end:

1. Maximum Value Finder
   Iterates through an array and stores the maximum value.

2. Fibonacci Sequence Generator
   Computes Fibonacci numbers iteratively and stores them in
   memory.
