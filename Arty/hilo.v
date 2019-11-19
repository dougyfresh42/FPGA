// Inputs
// 4 switches
// 1 "enter" button
// 1 "reset" button

// Outputs
// 4 leds - how many guesses
// 2 digit display

// Hardware
// Counter
// Button debouncer
// Current Answer
// Current Guess
// num guesses

// THINGS TO DO:
// Debounce buttons: 2 ms
// Flicker segment:  20 ms

// States
parameter IDLE    = 0,
          GUESS1  = 1,
          GUESS2  = 2,
          VERIFY  = 3,
          WRONGHI = 4,
          RSTHI   = 5,
          WRONGLO = 6,
          RSTLO   = 7,
          WINNER  = 15;

module hilo (
  output [3:0] leds,
  output [7:0] segments,
  input  [3:0] switches,
  input        rtn_btn,
  input        rst_btn,
  input        clk
);

reg rtn_press;
reg rst_press;

reg [7:0] counter = 0;
reg [7:0] answer;
reg [7:0] guess;

reg [3:0] state;

debouncer rtn_db(rtn_press, rtn_btn, clk);
debouncer rst_db(rst_press, rst_btn, clk);

segment_display screen(segments, guess, state, clk);

always @ (posedge clk) begin
  counter <= counter + 1;

  if (rtn_press)
    STATE <= STATE + 1;
  if (rst_press)
    STATE <= IDLE;

  case( STATE )
    IDLE:
      begin
        answer <= counter;
        leds <= switches; // Set Difficulty
      end
    GUESS1:
      begin
        guess [7:4] <= switches;
      end
    GUESS2:
      begin
        guess [3:0] <= switches;
      end
    VERIFY:
      begin
        leds <= leds + 1;
        if (guess == answer)
          state <= WINNER;
        else if (guess > answer)
          state <= WRONGHI;
        else
          state <= WRONGLO
      end
    WRONGHI:
      begin
      end
    RSTHI:
      state <= GUESS1;
    WRONGLO:
      begin
      end
    RSTLO:
      state <= GUESS1;
    WINNER:
      begin
        led <= counter[24:21];
      end
    DEFAULT: led <= 0; //TODO PANIC
  endcase
end
endmodule

module debouncer(
  output btn_press,
  input btn,
  input clk
);
  reg [24:0] tracker;

  always @ (posedge clk)
  begin
    tracker[0] <= btn;
    tracker = tracker << 1;

    if (tracker == 25b0_1111_1111_1111_1111_1111_1111)
      btn_press <= 1;
    else
      btn_press <= 0;
    // ^ vs assign btn_press = (tracker == 25b0...) ? 1 : 0;
  end
endmodule

module segment_display(
  output [7:0] segment,
  input  [7:0] val,
  input  [3:0] state,
  input clk
);
reg [7:0] seg1;
reg [7:0] seg2;
reg [24:0] flicker = 0;

always @ (posedge clk) begin
  flicker <= flicker + 1;
  if (flicker == 0) begin
    if (segments[7] == 1)
      segment <= seg1;
    else
      segment <= seg2;
  end

  case (state)
    IDLE:
    GUESS1:
    GUESS2:
    WRONGHI:
    WRONGLO:
    WINNER:
    DEFAULT:
  endcase
end
  
endmodule
