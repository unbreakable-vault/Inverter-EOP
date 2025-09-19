module two_chains(
  input  wire sys_clk,        // test stimulus inside FPGA
  output wire output_A,      //  chain outputs (internal nets)
  output wire output_B,     //  chain outputs (internal nets)
  output wire output_XOR   //  chain outputs (internal nets)
);

 // Keep instances separate; prevents merging or resource sharing.
   (* DONT_TOUCH="true" *) inv3_chain A (.din(sys_clk), .dout(output_A));
   (* DONT_TOUCH="true" *)  inv3_chain B (.din(sys_clk), .dout(output_B));
   (* DONT_TOUCH="true" *) assign output_XOR = output_B ^ output_A ;
  
endmodule
