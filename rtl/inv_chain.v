(* keep_hierarchy = "yes" *)
module inv3_chain(
  input  wire din,
  output wire dout
);

  (* KEEP = "true", DONT_TOUCH = "true" *)
   wire n1, n2;

 // Each stage: NOT(I0) = INIT=2'b01
  (* DONT_TOUCH = "true" *)
  LUT1 #(.INIT(2'b01)) inv0 (.I0(din), .O(n1));
  
  (* DONT_TOUCH = "true" *)
  LUT1 #(.INIT(2'b01)) inv1 (.I0(n1),  .O(n2));
  
  (* DONT_TOUCH = "true" *)
  LUT1 #(.INIT(2'b01)) inv2 (.I0(n2),  .O(dout));
  
endmodule
