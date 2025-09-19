`timescale 1ps/1ps

module two_chains_tb;
  // 100 MHz clock: 10 ns period
  reg sys_clk = 0;
  always #5000 sys_clk = ~sys_clk; // 5000 ps = 5 ns -> 10 ns period

  // DUT I/O
  wire output_A, output_B, output_XOR;

  // Instantiate your DUT
  two_chains dut (
    .sys_clk    (sys_clk),
    .output_A   (output_A),
    .output_B   (output_B),
    .output_XOR (output_XOR)
  );

  // ==========
  // Connectivity expectations:
  // - In pure RTL sim: output_A == output_B, so output_XOR == 1'b0
  // ==========

  // -------- Optional: skew emulation for visualization in TB --------
  // Make a delayed copy of B by 50 ps and recompute XOR in the TB.
  // This lets you *see* narrow XOR pulses in the waveform.
  wire output_B_skewed;
  assign #(50) output_B_skewed = output_B;  // 50 ps artificial skew
  wire xor_tb = output_A ^ output_B_skewed; // TB-only XOR for viewing
  // ------------------------------------------------------------------

  initial begin
    // VCD/FSDB dumping for wave viewer
    $dumpfile("two_chains_tb.vcd");
    $dumpvars(0, two_chains_tb);

    // Simple textual monitor
    $display("  time(ps)  A  B  XOR  XOR_TB(skewed)");
    $monitor("%9t  %b  %b   %b       %b",
              $time, output_A, output_B, output_XOR, xor_tb);

    // Run long enough to see several edges
    #(200_000); // 200 ns
    $finish;
  end
endmodule
