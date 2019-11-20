function digit;
input [3:0] value;
input segment;
digit[7] = segment;
case( value )
  'h0: digit[6:0] = 7'b1111110
  'h1: digit[6:0] = 7'b0000110
  'h2: digit[6:0] = 7'b1101101
  'h3: digit[6:0] = 7'b1001111
  'h4: digit[6:0] = 7'b0010111
  'h5: digit[6:0] = 7'b1011011
  'h6: digit[6:0] = 7'b1101111
  'h7: digit[6:0] = 7'b0001110
  'h8: digit[6:0] = 7'b1111111
  'h9: digit[6:0] = 7'b1011111
  'hA: digit[6:0] = 7'b0111111
  'hB: digit[6:0] = 7'b1110011
  'hC: digit[6:0] = 7'b1111000
  'hD: digit[6:0] = 7'b1100111
  'hE: digit[6:0] = 7'b1111001
  'hF: digit[6:0] = 7'b0111001
  default: digit[6:0] = 7'b0110111
endcase
endfunction
