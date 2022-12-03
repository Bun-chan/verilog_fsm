module FSM(
  input In1,
  input RST,
  input CLK, 
  output Out1
);

reg [1:0] current_state, next_state;
localparam [1:0] 
	a = 2'b00, b = 2'b01, c = 2'b10;
always @ (In1, current_state)
begin
		case (current_state)
			a: 
			begin
				next_state = (In1 == 0) ? a : b;
			end
			b:
			begin
				next_state = (In1 == 0) ? c : b;
			end
			c: 
			begin
				next_state = (In1 == 0) ? c : a;
			end
			default: 
			begin
				next_state = a;
			end
		endcase

end
always @ (posedge CLK)
begin
	if (RST == 0)
		current_state <= a;	
	else
		current_state <= next_state;
end
assign Out1 = (current_state == c) ? 1 : 0;
endmodule