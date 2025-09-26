// Two identical 3-inverter chains + explicit XOR stage.
// Keeps nets and cells so the tools don't "helpfully" optimize.
(* keep_hierarchy = "yes" *)
module two_chains(
  input  wire sys_clk,      // shared stimulus
  output wire output_A,     // chain A output (exposed)
  output wire output_B,     // chain B output (exposed)
  output wire output_XOR    // XOR of A and B (exposed)
);
  // Internal nets kept to prevent absorption/merging
  (* KEEP="true", DONT_TOUCH="true" *) wire a_int, b_int, xor_int;

  // Keep hierarchy if you defined inv3_chain in its own module
  (* DONT_TOUCH="true" *) inv3_chain A (.din(sys_clk), .dout(a_int));
  (* DONT_TOUCH="true" *) inv3_chain B (.din(sys_clk), .dout(b_int));

  // Explicit XOR in a LUT2 so it cannot be repacked into nearby logic
  // LUT2 INIT=4'b0110 implements I0 ^ I1
  (* DONT_TOUCH="true" *)
  LUT2 #(.INIT(4'b0110)) u_xor (.I0(a_int), .I1(b_int), .O(xor_int));

  // Drive module outputs (you can put OBUFs here in your top if these go to pins)
  assign output_A   = a_int;                         // assign output_A   = sys_clk; //to test output and input
  assign output_B   = b_int;
  assign output_XOR = xor_int;
endmodule
