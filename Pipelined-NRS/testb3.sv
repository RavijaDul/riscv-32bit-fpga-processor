`timescale 1ns/1ps

module testb3();
    // Testbench signals
    reg clk, reset;
    reg stall, flush;
    
    // Output signals to observe processor state
    wire [63:0] r8, r19, r20, r21, r22;
    wire [63:0] element1, element2, element3, element4;
    wire [63:0] element5, element6, element7, element8;
    
    // Instantiate the Final module (top-level processor module)
    Final dut (
        .clk(clk),
        .reset(reset),
        .stall(stall),
        .flush(flush),
        .element1(element1),
        .element2(element2),
        .element3(element3),
        .element4(element4),
        .element5(element5),
        .element6(element6),
        .element7(element7),
        .element8(element8)
    );
    
    // Clock generation
    always begin
        #5 clk = ~clk;
    end
    
    // Test sequence with explicit scenarios
    initial begin
        // Test Case 1: Basic Reset and Initial State
        clk = 0;
        reset = 1;
        stall = 0;
        flush = 0;
        
        // Wait for a few clock cycles
        #10 reset = 0;
        
        // Observe initial states
        #20;
        $display("Initial State Check:");
        $display("R8:  %h", r8);
        $display("Mem[0]: %h", element1);
        
        // Test Case 2: Pipeline Stall Scenario
        stall = 1;
        #20;
        $display("Stall State Check:");
        $display("R8:  %h", r8);
        stall = 0;
        
        // Test Case 3: Pipeline Flush Scenario
        flush = 1;
        #20;
        $display("Flush State Check:");
        $display("R8:  %h", r8);
        flush = 0;
        
        // Run full instruction sequence
        #150;
        
        // Final State Verification
        $display("\nFinal Register States:");
        $display("R8:  %h", r8);
        $display("R19: %h", r19);
        $display("R20: %h", r20);
        $display("R21: %h", r21);
        $display("R22: %h", r22);
        
        $display("\nFinal Memory States:");
        $display("Mem[0]:  %h", element1);
        $display("Mem[8]:  %h", element2);
        $display("Mem[16]: %h", element3);
        $display("Mem[24]: %h", element4);
        $display("Mem[32]: %h", element5);
        $display("Mem[40]: %h", element6);
        $display("Mem[48]: %h", element7);
        $display("Mem[56]: %h", element8);
        
        // End simulation
        $finish;
    end
    
    // Optional: Waveform dumping
    initial begin
        $dumpfile("test3b.vcd");
        $dumpvars(0, testb3);
    end
endmodule
