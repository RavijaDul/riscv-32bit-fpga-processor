# RISC-V 32-bit FPGA Processor

## Project Overview

This project implements a complete 32-bit RISC-V processor on FPGA with three progressive stages, focusing on system performance evaluation through proposal, report, demonstration, and viva.

## Project Stages

### Stage 1: 32-bit Non-Pipelined Processor (Single Cycle)
**Location:** `Non-Pipelined/` folder

A single-cycle RISC-V processor implementation that executes one instruction per clock cycle. The processor includes all essential components for basic RISC-V instruction execution.

#### Architecture Components:
- **Program Counter (PC):** Manages instruction fetch address
- **Instruction Memory:** Stores program instructions
- **Instruction Parser:** Decodes RISC-V instruction format
- **Control Unit:** Generates control signals based on opcode
- **Register File:** 32 general-purpose registers (x0-x31)
- **ALU (Arithmetic Logic Unit):** Performs arithmetic and logical operations
- **ALU Control:** Determines ALU operation based on funct3 and funct7 fields
- **Data Memory:** Handles load/store operations
- **Branching Unit:** Manages conditional branch instructions
- **Immediate Data Extractor:** Extracts immediate values from instructions

#### Supported Instruction Types:
- **R-type:** Register-to-register operations (ADD, SUB, AND, OR, XOR, etc.)
- **I-type:** Immediate operations (ADDI, ANDI, ORI, etc.) and loads (LW)
- **S-type:** Store operations (SW)
- **B-type:** Branch operations (BEQ, BNE, BLT, etc.)

#### Key Features:
- Single-cycle execution (one instruction per clock cycle)
- Full 32-bit data path
- Harvard architecture (separate instruction and data memories)
- Synchronous reset functionality
- Test element inputs for data memory initialization

#### Files:
- `Final.sv` - Top-level processor module
- `program_counter.sv` - PC management
- `instruction_memory.sv` - Instruction storage
- `instruction_parser.sv` - Instruction decoding
- `control_unit.sv` - Control signal generation
- `registerFile.sv` - Register file implementation
- `alu_32bit.sv` - ALU operations
- `alu_control.sv` - ALU control logic
- `data_memory.sv` - Data memory operations
- `branching_unit.sv` - Branch condition evaluation
- `imm_data_extractor.sv` - Immediate value extraction
- Supporting modules: `adder.sv`, `2_1mux.sv`

#### Simulation:
- Quartus Prime project: `Non-Pipelined-NRS.qpf`
- NativeLink simulation report: `Non-Pipelined-NRS_nativelink_simulation.rpt`
- Testbench: `testb.sv`

### Stage 2: 32-bit Pipelined Processor (In Progress)
**Location:** `Pipelined/` folder (to be implemented)

Five-stage pipelined RISC-V processor for improved performance:
- Instruction Fetch (IF)
- Instruction Decode (ID)
- Execute (EX)
- Memory Access (MEM)
- Write Back (WB)

### Stage 3: Set-Associative Cache Memory (Planned)
Advanced memory hierarchy with cache implementation for further performance optimization.

## FPGA Implementation
- **Target Device:** Cyclone IV FPGA family
- **Development Tool:** Intel Quartus Prime 17.1
- **Simulation Tool:** ModelSim-Altera
- **Language:** SystemVerilog

## Performance Evaluation
The project emphasizes "systems performance" evaluation through:
- Timing analysis
- Resource utilization
- Instruction throughput
- Power consumption
- Memory access patterns

## Getting Started

### Prerequisites
- Intel Quartus Prime 17.1 or later
- ModelSim-Altera (included with Quartus)
- Basic understanding of RISC-V ISA

### Running Simulations
1. Open the Quartus project file (`.qpf`)
2. Navigate to Tools → Run Simulation Tool → RTL Simulation
3. Load the testbench file
4. Run the simulation

## Project Structure
```
riscv-32bit-fpga-processor/
├── README.md
├── Non-Pipelined/
│   ├── *.sv (SystemVerilog modules)
│   ├── *.qpf (Quartus project)
│   ├── *.qsf (Quartus settings)
│   ├── simulation/ (ModelSim files)
│   ├── output_files/ (synthesis results)
│   └── *.rpt (reports)
└── Pipelined/
    └── (Stage 2 implementation)
```

## Contributors
Digital System Design Group Project

## License
Academic project for educational purposes.