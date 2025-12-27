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

### Stage 2: 32-bit Pipelined Processor ✅ (Implemented)
**Location:** `Pipelined-NRS/` folder

A five-stage pipelined RISC-V processor implementation for improved instruction throughput and performance.

#### Pipeline Stages:
1. **Instruction Fetch (IF):** Fetches instruction from memory and increments PC
2. **Instruction Decode (ID):** Decodes instruction, reads registers, generates control signals
3. **Execute (EX):** Performs ALU operations and calculates branch targets
4. **Memory Access (MEM):** Handles data memory operations (loads/stores)
5. **Write Back (WB):** Writes results back to register file

#### Pipeline Registers:
- **IF/ID:** Stores PC+4 and fetched instruction
- **ID/EX:** Stores control signals, register values, and immediate data
- **EX/MEM:** Stores ALU results and memory operation data
- **MEM/WB:** Stores data for register write-back

#### Hazard Handling:
- **Data Hazards:** Resolved through forwarding and stalling
  - **Forwarding Unit:** Implements data forwarding from EX/MEM and MEM/WB stages
  - **Hazard Detection Unit:** Detects load-use hazards and inserts stalls
- **Control Hazards:** Handled through branch prediction and pipeline flushing
- **Pipeline Flush Unit:** Clears pipeline on branch mispredictions

#### Key Features:
- Five-stage pipeline with pipeline registers
- Data forwarding to reduce stalls
- Load-use hazard detection and stalling
- Branch hazard handling with flush capability
- Separate instruction and data memories
- Full RISC-V instruction set support (same as Stage 1)

#### Enhanced Components:
- **Forwarding Unit:** Implements forwarding logic for ALU operands
- **Hazard Detection Unit:** Detects data dependencies requiring stalls
- **Pipeline Flush Unit:** Handles control flow changes
- **Three-way Multiplexer:** Supports forwarding from multiple sources
- **Pipeline Registers:** IFID, IDEX, EXMEM, MEMWB modules

#### Files:
- `Final.sv` - Top-level pipelined processor
- Pipeline Registers: `IFID.sv`, `IDEX.sv`, `EXMEM.sv`, `MEMWB.sv`
- Hazard Management: `ForwardingUnit.sv`, `hazard_detection_unit.sv`, `pipeline_flush.sv`
- Enhanced ALU: `alu_64bit.sv` (extended operations)
- Supporting modules: Same as Stage 1 with pipeline modifications

#### Simulation:
- Quartus Prime project: `Pipelined.qpf`
- NativeLink simulation report: `Pipelined_nativelink_simulation.rpt`
- Multiple testbenches: `testb.sv`, `testb2.sv`, `testb3.sv`

#### Performance Improvements:
- **Throughput:** Up to 5 instructions per 5 clock cycles (ideal case)
- **IPC:** Improved instructions per clock through pipelining
- **Latency:** Same per-instruction latency but better overall throughput
- **Hazard Resolution:** Minimizes pipeline stalls through forwarding

### Stage 3: Set-Associative Cache Memory (Planned)
**Status:** Not yet implemented

Set-associative cache memory implementation for enhanced memory hierarchy performance.

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

#### Non-Pipelined Processor (Stage 1):
1. Open `Non-Pipelined/Non-Pipelined-NRS.qpf`
2. Navigate to Tools → Run Simulation Tool → RTL Simulation
3. Load `testb.sv` testbench
4. Run the simulation

#### Pipelined Processor (Stage 2):
1. Open `Pipelined-NRS/Pipelined.qpf`
2. Navigate to Tools → Run Simulation Tool → RTL Simulation
3. Load one of the testbenches (`testb.sv`, `testb2.sv`, or `testb3.sv`)
4. Run the simulation

### Synthesis and Implementation
1. Open the respective `.qpf` file
2. Run Analysis & Synthesis
3. Perform Place & Route
4. Generate programming file
5. Program the FPGA

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
├── Pipelined-NRS/
│   ├── *.sv (Pipelined processor modules)
│   ├── Pipelined.qpf (Quartus project)
│   ├── Pipelined.qsf (Quartus settings)
│   ├── simulation/ (ModelSim files)
│   ├── output_files/ (synthesis results)
│   ├── Pipelined_nativelink_simulation.rpt
│   └── Multiple testbenches (testb.sv, testb2.sv, testb3.sv)
└── Cache/ (Stage 3 - To be implemented)
```

## Contributors
Digital System Design Group Project

## License
Academic project for educational purposes.