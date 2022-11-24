module amount_to_return(clock, reset, SUM, food_selection, amount_to_return);

input clock, reset;
input [4:0] food_selection;
input [9:0] SUM;

output reg [9:0] amount_to_return;

parameter [4:0] base = 5'b0, A1 =5'b00001 , A2 = 5'b00010, A3 = 5'b00011 , A4 = 5'b00100 , A5 = 5'b00101, B1 = 5'b00110, B2 = 5'b00111, B3 = 5'b01000, B4 = 5'b01001, B5 = 5'b01010, C1 = 5'b01011, C2 = 5'b01100, C3 = 5'b01101, C4 = 5'b01110, C5 = 5'b01111, D1 = 5'b10000, D2 = 5'b10001, D3 = 5'b10010, D4 = 5'b10011, D5 = 5'b10100;

always@(posedge clock) begin

if(reset) begin

	amount_to_return <= 10'b0;

end
else begin

	if(SUM <= 0) begin
	
		amount_to_return <= 10'b0;
	
	end
	else begin
		
		if(food_selection == base) begin
		
			amount_to_return <= SUM;
		
		end
		
		else if(food_selection == A1 || food_selection == A2 || food_selection == A3 || food_selection == A4 ||food_selection == A5) begin
			
			amount_to_return <= SUM - 10'b0001100100;
		
		end
		
		else if(food_selection == B1 || food_selection == B2 || food_selection == B3 || food_selection == B4 ||food_selection == B5) begin
		
			amount_to_return <= SUM - 10'b0001111101;
		
		end
		
		else if(food_selection == C1 || food_selection == C2 || food_selection == C3 || food_selection == A4 ||food_selection == A5) begin
		
			amount_to_return <= SUM - 10'b0010010110;
		
		end
		
		else if(food_selection == D1 || food_selection == D2 || food_selection == D3 || food_selection == D4 ||food_selection == D5) begin
		
			amount_to_return <= SUM - 10'b0010101111;
		
		end
		else begin
		
			amount_to_return <= amount_to_return;
		
		end
	end

end

end

endmodule 