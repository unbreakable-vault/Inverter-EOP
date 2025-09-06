// Two identical 3-inverter chains driven by the same stimulus.
// OUT_A / OUT_B go to scope; OUT_XOR is optional skew visualization.
`timescale 1ns/1ps
module top_two_paths (
  input  wire sys_clk,   // board oscillator (constrained in XDC)
  output wire OUT_A,
  output wire OUT_B,
  output wire OUT_XOR
);
  // simple clock divider -> square-wave stimulus
  reg [7:0] div = 8'd0;
  always @(posedge sys_clk) begin
    div <= div + 1'b1;
  end
  wire stim = div[0]; // ~sys_clk/2; choose a higher bit for lower freq

  wire a_out, b_out;

  (* KEEP_HIERARCHY = "YES" *)
  inv_chain #(.STAGES(3)) u_chain_a (.din(stim), .dout(a_out));

  (* KEEP_HIERARCHY = "YES" *)
  inv_chain #(.STAGES(3)) u_chain_b (.din(stim), .dout(b_out));

  assign OUT_A  = a_out;
  assign OUT_B  = b_out;
  assign OUT_XOR = a_out ^ b_out;
endmodule
