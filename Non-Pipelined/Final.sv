module Final(
  input clk,
  input reset,
  input wire[31:0] element1,
  input wire[31:0] element2,
  input wire[31:0] element3,
  input wire[31:0] element4,
  input wire[31:0] element5,
  input wire[31:0] element6,
  input wire[31:0] element7,
  input wire[31:0] element8);
  
  // CU wires
  wire branch;
  wire memread;
  wire memtoreg;
  wire memwrite;
  wire ALUsrc;
  wire regwrite;
  wire [1:0] ALUop;
  
  //regfile
  wire [31:0] readdata1, readdata2;
  wire [31:0] r8, r19, r20, r21, r22;
  wire [31:0] write_data;
  
   //PC wires
  wire [31:0] pc_in;
  wire [31:0] pc_out;
  
  // adders
  wire [31:0] adderout1;
  wire [31:0] adderout2;
  
  // inst mem wire
  wire [31:0] instruction;
  
  //Parser
  wire [6:0] opcode;
  wire [4:0] rd, rs1, rs2;
  wire [2:0] funct3;
  wire [6:0] funct7;
  
  // Immediate Data Extractor
  wire [31:0] imm_data;
  
  //mux wires
  wire[31:0]  alu_32_b;   
  
   // ALU 32
  wire [31:0] AluResult;
  
  // ALU Control
  wire [3:0] operation;
  
  // Data Memory
  wire [31:0] readdata;
  
  // Branch
  wire addermuxselect;
  wire branch_final;
  
  wire [3:0] funct3_temp;
  assign funct3_temp = {instruction[30], instruction[14:12]};
  
  program_counter pc 
  (
    .PC_in(pc_in),
    .clk(clk),
    .reset(reset),
    .PC_out(pc_out)
  );
  
  instruction_memory im
  (
    .inst_address(pc_out),
    .instruction(instruction)
  );
  
  
  adder adder1
  (
    .p(pc_out),
    .q(32'd4),
    .out(adderout1)
  );
  
  
  Parser ip
  (
    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)
  );
  
  CU cu
  (
    .opcode(opcode),
    .branch(branch),
    .memread(memread),
    .memtoreg(memtoreg),
    .memwrite(memwrite),
    .aluSrc(ALUsrc),
    .regwrite(regwrite),
    .Aluop(ALUop)
  );
  
  data_extractor immextr
  (
    .instruction(instruction),
    .imm_data(imm_data)
  );
  
  
  registerFile regfile 
  (
    .clk(clk),
    .reset(reset),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .writedata(write_data),
    .reg_write(regwrite),
    .readdata1(readdata1),
    .readdata2(readdata2),
    .r8(r8),
    .r19(r19),
    .r20(r20),
    .r21(r21),
    .r22(r22)
  );
  
  adder adder2
  (
    .p(pc_out),
    .q(imm_data << 1),
    .out(adderout2)
  );
  
  twox1Mux mux1
  (
    .A(readdata2),.B(imm_data),.SEL(ALUsrc),.Y(alu_32_b)
  );
  
  Alu32 alu
  (
    .a(readdata1),
    .b(alu_32_b),
    .ALuop(operation),
    .Result(AluResult),
    .zero(zero)
  );
  
   alu_control ac
  (
    .Aluop(ALUop),
    .funct(funct3_temp),
    .operation(operation)
  );
    
  data_memory datamem
  (
    .write_data(readdata2),
    .address(AluResult),
    .memorywrite(memwrite),
    .clk(clk),
    .memoryread(memread),
    .read_data(readdata),
    .element1(element1),
    .element2(element2),
    .element3(element3),
    .element4(element4),
    .element5(element5),
    .element6(element6),
    .element7(element7),
    .element8(element8)
  );
  
  
  twox1Mux mux2
  (
    .A(adderout1),.B(adderout2),.SEL(branch & addermuxselect),.Y(pc_in)
  );

  
   twox1Mux mux3
  (
    .A(AluResult),.B(readdata),.SEL(memtoreg),.Y(write_data)
  );
  
  
  branching_unit branc
  (
    .funct3(funct3_temp[2:0]),.readData1(readdata1),.b(alu_32_b),.addermuxselect(addermuxselect)
  );

        
endmodule 