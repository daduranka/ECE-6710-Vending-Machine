//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ECE 6710 VLSI Project: Vending Machine Controller
// Student: Braden Brown
//
// Description: This code represents the implementation of a Vending Machine controller. 
// The vending machine will have 5 functions: 
// 1. Reading the user’s selection 
// 2. Counting coins and displaying current values on a BCD display 
// 3. Dispensing food selection after checking correct amount of money is deposited 
// 4. Checking if the food has been dispensed (assuming a pressure sensor is connected to the controller) 
//    and dispensing until the food has been released 
// 5. Dispensing change after food has been released. 
// 
// I will also assume that the vending machine has 4 rows with 5 options on each row making a possible 20 selections. 
// Each selection will have two identifiers a row identifier (A, B, C, D) and a column identifier (1, 2, 3, 4, 5) 
// with each row having a different price. 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module vending_machine(clock, reset, A,B,C,D,ONE,TWO,THREE,FOUR,FIVE, food_dispensed, coin_inserted, num_to_display, food_selection, coin_to_return);

input clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed;
input [2:0] coin_inserted;

output wire [2:0] coin_to_return;
output wire [4:0] food_selection;
output wire [9:0] num_to_display;

wire load_wire, change_returned_wire;
wire [4:0] food_selection_wire;
wire [9:0] SUM_wire, return_amount_wire;

input_reg user_input(.clock(clock), .reset(reset), 
								.A(A), .B(B), .C(C), .D(D), 
								.ONE(ONE), .TWO(TWO), .THREE(THREE), .FOUR(FOUR), .FIVE(FIVE),
								.food_selection(food_selection_wire));

vending_machine_FSM FSM(.clock(clock), .reset(reset), 
								.change_returned(change_returned_wire),  
								.food_dispensed(food_dispensed), 
								.SUM(SUM_wire), 
								.food_selection(food_selection_wire));
    
coin_summer coins(.clock(clock), .reset(reset), .inserted_coin(coin_inserted), .sum(SUM_wire));

amount_to_return value(.clock(clock), .reset(reset), .SUM(SUM_wire), .load(load_wire), 
							  .food_selection(food_selection_wire), .amount_to_return(return_amount_wire));

coin_dispenser returns(.clock(clock), .load(load_wire), .amount_to_return(return_amount_wire), 
								.coin_to_return(coin_to_return), .change_returned(change_returned_wire));


assign num_to_display = SUM_wire;
assign food_selection = food_selection_wire;
								
endmodule 

module vending_machine_FSM(clock, reset, change_returned, food_dispensed, SUM, food_selection);

input clock, reset, food_dispensed, change_returned;
input [9:0] SUM;


input [4:0] food_selection;


parameter [2:0] collecting = 3'b000, dispenseA = 3'b001, dispenseB = 3'b010 , dispenseC = 3'b011 , dispenseD =3'b100 , dispenseChange = 3'b101, dispenseFood = 3'b110; 
parameter [4:0] base = 5'b0, A1 =5'b00001 , A2 = 5'b00010, A3 = 5'b00011 , A4 = 5'b00100 , A5 = 5'b00101, B1 = 5'b00110, B2 = 5'b00111, B3 = 5'b01000, B4 = 5'b01001, B5 = 5'b01010, C1 = 5'b01011, C2 = 5'b01100, C3 = 5'b01101, C4 = 5'b01110, C5 = 5'b01111, D1 = 5'b10000, D2 = 5'b10001, D3 = 5'b10010, D4 = 5'b10011, D5 = 5'b10100;

reg [2:0] ps, ns;

always@(posedge clock, posedge reset) begin

    if(reset) begin
       
		 ps <= dispenseChange;
    
	 end
    else begin
	    
		 ps <= ns;
    
	 end

end

always@(SUM, change_returned, food_selection, food_dispensed, ps) begin 

	case (ps)
		
		collecting: 
					
					if(SUM > 0) begin
						if(SUM >= 100 && SUM <125) begin
									ns <= dispenseA;
									//num_to_display <= SUM; 
									//food_selection <= 5'b0;
									//load <= 1'b0;
							end
						else if (SUM >= 125 && SUM <150) begin
									ns <= dispenseB;
									//num_to_display <= SUM; 
									//food_selection <= base;
									//load <= 1'b0;
						end
						else if (SUM >= 150 && SUM <175)begin
									ns <= dispenseC;
									//num_to_display <= SUM; 
									//food_selection <= base;
									//load <= 1'b0;
						end
						else if (SUM >= 175) begin
									ns <= dispenseD;
									//num_to_display <= SUM; 
									//food_selection <= base;
									//load <= 1'b0;
									
						end
						else begin
									ns <= collecting;
									//num_to_display <= SUM; 
									//food_selection <= base;
									//load <= 1'b0;
						end
					end
					else begin
							ns <= collecting;
							//num_to_display <= 10'b0; 
							//food_selection <= base;
							//load <= 1'b0;						
					end
		dispenseA: if(food_selection ==A1 || food_selection ==A2 || food_selection ==A3 || food_selection ==A4 || food_selection ==A5) begin

									 ns <= dispenseFood;

                 end     
					  else begin
                        if (SUM >= 125 && SUM <150) begin
									 ns <= dispenseB;
								end
                        else if (SUM >= 150 && SUM <175) begin
									 ns <= dispenseC;
								end
                        else if (SUM >= 175)
                        begin
                            ns <= dispenseD;
                        end
                        else begin
                            ns <= dispenseA;
                        end
					  end
		
        dispenseB: if(food_selection ==A1 || food_selection ==A2 || food_selection ==A3 || food_selection ==A4 || food_selection ==A5) begin

								    ns <= dispenseFood;
                   end
                      
					else if(food_selection ==B1 || food_selection ==B2 || food_selection ==B3 || food_selection ==B4 || food_selection ==B5) begin

                            ns <= dispenseFood;
               end
               else begin
                        if (SUM >= 150 && SUM <175) begin
									 ns <= dispenseC;
								end
                        else if (SUM >= 175) begin
                            ns <= dispenseD;
                        end
                        else begin
                            ns <= dispenseB;
                        end
					end
		
        dispenseC: if(food_selection ==A1 || food_selection ==A2 || food_selection ==A3 || food_selection ==A4 || food_selection ==A5) begin

								    ns <= dispenseFood;
                   end
                      
					else if(food_selection ==B1 || food_selection ==B2 || food_selection ==B3 || food_selection ==B4 || food_selection ==B5) begin

                            ns <= dispenseFood;
               end
               else if(food_selection ==C1 || food_selection ==C2 || food_selection ==C3 || food_selection ==C4 || food_selection ==C5) begin
									 
									 ns <= dispenseFood;

                end
                else begin
                        if (SUM >= 175) begin
                            ns <= dispenseD;
                        end
                        else begin
                            ns <= dispenseC;
                        end
					 end 
        dispenseD: if(food_selection ==A1 || food_selection ==A2 || food_selection ==A3 || food_selection ==A4 || food_selection ==A5) begin

								    ns <= dispenseFood;
                   end
                      
					else if(food_selection ==B1 || food_selection ==B2 || food_selection ==B3 || food_selection ==B4 || food_selection ==B5) begin

                            ns <= dispenseFood;
               end
               else if(food_selection ==C1 || food_selection ==C2 || food_selection ==C3 || food_selection ==C4 || food_selection ==C5) begin
									 
									 ns <= dispenseFood;
               end
					else if(food_selection ==D1 || food_selection ==D2 || food_selection ==D3 || food_selection ==D4 || food_selection ==D5) begin

									 ns <= dispenseFood;

               end
               else begin
                        
								ns <= dispenseD;
					end

		dispenseFood: if(food_dispensed) begin
								ns <= dispenseChange;
                        //num_to_display <= num_to_display; 
                        //food_selection <= base;
								//load <= 1'b1;
					end
					else begin
								ns <= dispenseFood;
                        //num_to_display <= num_to_display; 
                        //food_selection <= base;
								//load <= 1'b0;
					end
		dispenseChange: 
					if(SUM == 10'b0) begin
								ns <= collecting;
								//num_to_display <= 10'b0;
								//food_selection <= base;
								//load <= 1'b0;
					end
					else begin
								if(change_returned == 0) begin
									ns <= dispenseChange;
									//food_selection <= base;
									//load <= 1'b1;
								end
								else begin
									ns <= collecting;
									//num_to_display <= num_to_display; 
									//food_selection <= base;
									//load <= 1'b0;									
								end
					end
	    default: ns <= dispenseChange;

	endcase

end

endmodule 

module coin_summer(clock, reset, inserted_coin, sum);

input reset;
input clock;
input [2:0] inserted_coin;

output reg [9:0] sum;

always@(posedge clock, posedge reset) begin

    if(reset) begin
        sum <= 10'b0000000000;
    end
    else begin
		case (inserted_coin)

        3'b000: sum <= sum + 10'b0;
        3'b001: sum <= sum + 10'b1;
        3'b010: sum <= sum + 10'b101;
        3'b011: sum <= sum + 10'b1010;
        3'b100: sum <= sum + 10'b11001;
        3'b101: sum <= sum + 10'b110010;
        3'b110: sum <= sum + 10'b1100100;
        
        default: sum <= 10'b0;
        
		endcase
    end
end


endmodule

module coin_dispenser(clock, load, amount_to_return, coin_to_return, change_returned);

input clock, load;
input [9:0] amount_to_return;

output reg change_returned;
output reg [2:0] coin_to_return;

reg [9:0] amount_left;

reg count;

//initial begin
//	amount_left = 10'b0;
//end

always@(posedge clock) begin
    
	 if(load == 1'b1) begin
        
        amount_left <= amount_to_return;
        coin_to_return <= 3'b0;
		  change_returned <= 1'b0;
    
    end
    else begin 
		     
			  if(amount_left == 0) begin
				  
					coin_to_return <= 3'b0;
					amount_left  <= 10'b0;
					change_returned <= 1'b1;
			  
			  end
			  else if(amount_left >= 10'b1 && amount_left < 10'b101) begin
			  
					coin_to_return <= 3'b001;
					amount_left <= amount_left - 10'b1;
					change_returned <= 1'b0;
			  
			  end
			  else if(amount_left >=10'b101 && amount_left < 10'b1010 ) begin
		 
					coin_to_return <= 3'b010;
					amount_left <= amount_left - 10'b101;
					change_returned <= 1'b0;
	
			  end
			  else if(amount_left >=10'b1010 && amount_left < 10'b11001 ) begin
		 
					coin_to_return <= 3'b011;
					amount_left <= amount_left - 10'b1010;
					change_returned <= 1'b0;
	
			  end
			  else if(amount_left >=10'b11001 && amount_left < 10'b110010 ) begin
		 
					coin_to_return <= 3'b100;
					amount_left <= amount_left - 10'b11001;
					change_returned <= 1'b0;
	
			  end
			  else if(amount_left >=10'b110010 && amount_left < 10'b1100100 ) begin
		 
					coin_to_return <= 3'b101;
					amount_left <= amount_left - 10'b110010;
					change_returned <= 1'b0;
	
			  end
			  else begin
		 
					coin_to_return <= 3'b110;
					amount_left <= amount_left - 10'b1100100;
					change_returned <= 1'b0;
	
			  end
    end

end

endmodule 

module amount_to_return(clock, reset, load, SUM, food_selection, amount_to_return);

input clock, reset;
input [4:0] food_selection;
input [9:0] SUM;

output reg [9:0] amount_to_return;
output reg load;

parameter [4:0] base = 5'b0, A1 =5'b00001 , A2 = 5'b00010, A3 = 5'b00011 , A4 = 5'b00100 , A5 = 5'b00101, B1 = 5'b00110, B2 = 5'b00111, B3 = 5'b01000, B4 = 5'b01001, B5 = 5'b01010, C1 = 5'b01011, C2 = 5'b01100, C3 = 5'b01101, C4 = 5'b01110, C5 = 5'b01111, D1 = 5'b10000, D2 = 5'b10001, D3 = 5'b10010, D4 = 5'b10011, D5 = 5'b10100;

always@(posedge clock) begin

if(reset) begin

	if(amount_to_return - 10'b1100100 == 0 || amount_to_return - 10'b1111101 == 0 || amount_to_return - 10'b10010110 == 0 || amount_to_return - 10'b10101111 == 0)begin
			amount_to_return <= 10'b0;
			load <= 1'b1;
	end
	else begin
		amount_to_return <= 10'b0;
		load <= 1'b0;
	end

end
else begin

	if(SUM <= 0) begin
	
		amount_to_return <= 10'b0;
		load <= 1'b0;
	
	end
	else begin
		
		if(food_selection == base) begin
		
			amount_to_return <= SUM;
			load <= 1'b1;
		
		end
		
		else if(food_selection == A1 || food_selection == A2 || food_selection == A3 || food_selection == A4 ||food_selection == A5) begin
			
			amount_to_return <= SUM - 10'b0001100100;
			load <= 1'b1;
		
		end
		
		else if(food_selection == B1 || food_selection == B2 || food_selection == B3 || food_selection == B4 ||food_selection == B5) begin
		
			amount_to_return <= SUM - 10'b0001111101;
			load <= 1'b1;
		
		end
		
		else if(food_selection == C1 || food_selection == C2 || food_selection == C3 || food_selection == C4 ||food_selection == C5) begin
		
			amount_to_return <= SUM - 10'b0010010110;
			load <= 1'b1;
		
		end
		
		else if(food_selection == D1 || food_selection == D2 || food_selection == D3 || food_selection == D4 ||food_selection == D5) begin
		
			amount_to_return <= SUM - 10'b0010101111;
			load <= 1'b1;
		
		end
		else begin
		
			amount_to_return <= amount_to_return;
			load <= 1'b1;
		
		end
	end

end

end

endmodule 

module input_reg(clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_selection);

input clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE;

output reg [4:0] food_selection;

parameter [4:0] base = 5'b0, A1 =5'b00001 , A2 = 5'b00010, A3 = 5'b00011 , A4 = 5'b00100 , A5 = 5'b00101, B1 = 5'b00110, B2 = 5'b00111, B3 = 5'b01000, B4 = 5'b01001, B5 = 5'b01010, C1 = 5'b01011, C2 = 5'b01100, C3 = 5'b01101, C4 = 5'b01110, C5 = 5'b01111, D1 = 5'b10000, D2 = 5'b10001, D3 = 5'b10010, D4 = 5'b10011, D5 = 5'b10100;

always@(posedge clock) begin

if(reset) begin

	food_selection <= base;
	
end
else begin

	 if(A && ONE || A && TWO || A && THREE || A && FOUR || A && FIVE) begin
		if(A && ONE) begin						 				  
			food_selection <= A1; 
      end
      else if(A && TWO) begin
			food_selection <= A2; 
      end
      else if(A && THREE) begin                          
			food_selection <= A3; 

      end
      else if(A && FOUR) begin                         
			food_selection <= A4; 
         end
      else begin                           
			food_selection <= A5; 
      end
	 end
	 else if(B && ONE || B && TWO || B && THREE || B && FOUR || B && FIVE) begin
		if(B && ONE) begin						 				  
			food_selection <= B1; 
      end
      else if(B && TWO) begin
			food_selection <= B2; 
      end
      else if(B && THREE) begin                          
			food_selection <= B3;

      end
      else if(B && FOUR) begin                         
			food_selection <= B4; 
         end
      else begin                           
			food_selection <= B5;
      end
	 end
	 else if(C && ONE || C && TWO || C && THREE || C && FOUR || C && FIVE) begin
		if(C && ONE) begin						 				  
			food_selection <= C1; 
      end
      else if(C && TWO) begin
			food_selection <= C2; 
      end
      else if(C && THREE) begin                          
			food_selection <= C3;

      end
      else if(C && FOUR) begin                         
			food_selection <= C4; 
         end
      else begin                           
			food_selection <= C5;
      end
	 end
	 else if(D && ONE || D && TWO || D && THREE || D && FOUR || D && FIVE) begin
		if(D && ONE) begin						 				  
			food_selection <= D1; 
      end
      else if(D && TWO) begin
			food_selection <= D2; 
      end
      else if(D && THREE) begin                          
			food_selection <= D3;

      end
      else if(D && FOUR) begin                         
			food_selection <= D4; 
         end
      else begin                           
			food_selection <= D5;
      end
	 end
end

end


endmodule 