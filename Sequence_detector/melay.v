// Mealy FSM to detect "110101"
module melay_fsm(
  input  clk, res, valid, d_in,
  output reg pattern_detect
);
  // State encoding
  parameter SR      = 7'b0000001,
            S1      = 7'b0000010,
            S11     = 7'b0000100,
            S110    = 7'b0001000,
            S1101   = 7'b0010000,
            S11010  = 7'b0100000;

  reg [6:0] state, next_state;

  // Sequential block
  always @(posedge clk or posedge res) begin
    if (res)
      state <= SR;
    else
      state <= next_state;
  end

  // Combinational block
  always @(*) begin
    pattern_detect = 0;
    next_state = state;

    case (state)
      SR: begin
        if (valid && d_in) next_state = S1;
        else next_state = SR;
      end

      S1: begin
        if (valid && d_in) next_state = S11;
        else if (valid && !d_in) next_state = SR;
      end

      S11: begin
        if (valid && !d_in) next_state = S110;
        else if (valid && d_in) next_state = S11;
      end

      S110: begin
        if (valid && d_in) next_state = S1101;
        else next_state = SR;
      end

      S1101: begin
        if (valid && !d_in) next_state = S11010;
        else if (valid && d_in) next_state = S11;
      end

      S11010: begin
        if (valid && d_in) begin
          pattern_detect = 1; // Mealy output
          next_state = S1;    // overlap support
        end else next_state = SR;
      end

      default: next_state = SR;
    endcase
  end
endmodule

