`timescale 1ns/1ps

module Final_tb();
    // Testbench signals
    reg clk;
    reg reset;
    reg [63:0] element1, element2, element3, element4;
    reg [63:0] element5, element6, element7, element8;
    reg stall, flush;

    // Instantiate the Final module
    Final dut (
        .clk(clk),
        .reset(reset),
        .element1(element1),
        .element2(element2),
        .element3(element3),
        .element4(element4),
        .element5(element5),
        .element6(element6),
        .element7(element7),
        .element8(element8),
        .stall(stall),
        .flush(flush)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // 10ns clock period
    end

    // Initial block for stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        stall = 0;
        flush = 0;
        
        // Initialize element inputs with some test values
        element1 = 64'd10;
        element2 = 64'd20;
        element3 = 64'd30;
        element4 = 64'd40;
        element5 = 64'd50;
        element6 = 64'd60;
        element7 = 64'd70;
        element8 = 64'd80;

        // Reset sequence
        #10 reset = 0;

        // Test different scenarios
        // Scenario 1: Normal operation
        #20 stall = 0;
        #20 flush = 0;

        // Scenario 2: Stall the pipeline
        #20 stall = 1;

        // Scenario 3: Flush the pipeline
        #20 flush = 1;
        stall = 0;

        // Run for some time
        #100 $finish;
    end

    // Optional: Waveform dumping for ModelSim/QuestaSim
    initial begin
        $dumpfile("testb2.vcd");
        $dumpvars(0, test2b);
    end

    // Optional: Monitor important signals
    initial begin
        $monitor("Time=%0t reset=%b stall=%b flush=%b", 
                 $time, reset, stall, flush);
    end
endmodule