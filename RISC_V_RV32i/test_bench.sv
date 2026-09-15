`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2026 11:40:46 PM
// Design Name: 
// Module Name: test_bench
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
module test_bench();
  logic clk;
  logic reset_n;
  integer cycle_count = 0;  // Counter to track the number of clock cycles

  // Clock generation
  always #5 clk = ~clk;  // Clock with a period of 10 time units

  // Instantiate the yarp_top module
  top #(.RESET_PC(32'h0)) dut (
    .clk(clk),
    .reset_n(reset_n)
  );

  // Clock cycle counter to terminate simulation after 400 clock cycles
  always @(posedge clk) begin
    cycle_count <= cycle_count + 1;
    if (cycle_count == 200) begin
      $finish;
    end
  end

  // Testbench initialization
  initial begin
    // Initialize signals
    clk = 0;           // Start clock at 0
    reset_n = 0;       // Active-low reset initially asserted
    
    // Apply reset sequence
    #10 reset_n = 1;   // Deassert reset after 10 time units
  end

 // Run simulation for 2000 time units and finish
 // #50000 $finish;



endmodule