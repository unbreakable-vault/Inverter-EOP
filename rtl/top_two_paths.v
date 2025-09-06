// Two identical 3-inverter chains driven by the same stimulus.
// OUT_A / OUT_B go to scope; OUT_XOR is optional skew visualization.
module top_two_paths_diffclk (
  input  wire sys_clk_p,   // connect in XDC
  input  wire sys_clk_n,   // connect in XDC
  output wire OUT_A,
  output wire OUT_B,
  output wire OUT_XOR
);
  wire sys_clk;

  // LVDS differential clock buffer (7-series)
  IBUFDS #(.DIFF_TERM("TRUE"), .IBUF_LOW_PWR("FALSE"))
  u_ibufds (.I(sys_clk_p), .IB(sys_clk_n), .O(sys_clk));

  reg [7:0] div = 8'd0;
  always @(posedge sys_clk) div <= div + 1'b1;
  wire stim = div[0];   // ~sys_clk/2; use div[1]/div[2] for lower frequency

  wire a_out, b_out;
  (* KEEP_HIERARCHY = "YES" *)
  inv_chain #(.STAGES(3)) u_chain_a (.din(stim), .dout(a_out));
  (* KEEP_HIERARCHY = "YES" *)
  inv_chain #(.STAGES(3)) u_chain_b (.din(stim), .dout(b_out));

  assign OUT_A   = a_out;
  assign OUT_B   = b_out;
  assign OUT_XOR = a_out ^ b_out;
endmodule
