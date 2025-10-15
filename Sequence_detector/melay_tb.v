
`include "melay.v"
module tb;
  reg clk, res, valid, d_in;
  wire pattern_detect;
  integer count;

  melay_fsm dut(.clk(clk), .res(res), .valid(valid), .d_in(d_in), .pattern_detect(pattern_detect));

  always #5 clk = ~clk;

  initial begin
    clk = 0; res = 1; valid = 1; count = 0; d_in = 0;
    #10 res = 0;

    // Sequence with "110101"
    d_in = 1; #10;
    d_in = 1; #10;
    d_in = 0; #10;
    d_in = 1; #10;
    d_in = 0; #10;
    d_in = 1; #10; // <-- pattern_detect should go high here

    #50 $display("Pattern detected %0d times", count);
    $finish;
  end

  always @(posedge pattern_detect)
    count = count + 1;
endmodule

