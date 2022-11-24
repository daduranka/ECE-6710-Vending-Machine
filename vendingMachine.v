
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
module vendingMachine(Clock, Reset, A,B,C,D,ONE,TWO,THREE,FOUR,FIVE, food_dispensed, coin_inserted, num_to_display, food_selection, coin_to_return);

input Clock, Reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed;
input [2:0] coin_inserted;

output wire [2:0] coin_to_return;
output wire [4:0] food_selection;
output wire [9:0] num_to_display;

wire [9:0] sum_wire, amount_to_return_wire, amount_left_wire;
wire change_dispensed_wire;

vending_machine_FSM FSM(.clock(Clock), .reset(Reset), .A(A), .B(B), .C(C), .D(D), .ONE(ONE), .TWO(TWO), .THREE(THREE), .FOUR(FOUR), .FIVE(FIVE), .food_dispensed(food_dispensed), .amount_left(amount_left_wire), .SUM(sum_wire), .num_to_display(num_to_display), .amount_to_return(amount_to_return_wire), .food_selection(food_selection));
    
coin_summer coins( .reset(Reset), .inserted_coin(coin_inserted), .sum(sum_wire));

coin_dispenser returns( .coin_to_return(coin_to_return),.amount_to_return(amount_to_return_wire), .amount_left(amount_left_wire), .clock(Clock));

endmodule

module vending_machine_FSM(clock, reset, change_returned, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed, SUM, food_selection, load);

input clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed, change_returned;
input [9:0] SUM;

//output reg [9:0] num_to_display;
output reg [4:0] food_selection;
output reg load;

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

always@(SUM, change_returned, A,B,C,D,ONE,TWO,THREE,FOUR,FIVE, food_dispensed, ps) begin 

	case (ps)
		
		//rst: if(SUM > 0) begin
		//				  ns <= collecting;
      //              num_to_display <= SUM; 
      //              food_selection <= base;
		//				  load <= 1'b0;
						  
		//		  end
		//		else begin
		//				  ns <= rst;
      //              num_to_display <= 10'b0; 
      //              food_selection <= base;
		//				  load <= 1'b0;
		//		end
		collecting: 
					
					if(SUM > 0) begin
						if(SUM >= 100 && SUM <125) begin
									ns <= dispenseA;
									//num_to_display <= SUM; 
									food_selection <= 5'b0;
									load <= 1'b0;
							end
						else if (SUM >= 125 && SUM <150) begin
									ns <= dispenseB;
									//num_to_display <= SUM; 
									food_selection <= base;
									load <= 1'b0;
						end
						else if (SUM >= 150 && SUM <175)begin
									ns <= dispenseC;
									//num_to_display <= SUM; 
									food_selection <= base;
									load <= 1'b0;
						end
						else if (SUM >= 175) begin
									ns <= dispenseD;
									//num_to_display <= SUM; 
									food_selection <= base;
									load <= 1'b0;
									
						end
						else begin
									ns <= collecting;
									//num_to_display <= SUM; 
									food_selection <= base;
									load <= 1'b0;
						end
					end
					else begin
							ns <= collecting;
							//num_to_display <= 10'b0; 
							food_selection <= base;
							load <= 1'b0;						
					end
		dispenseA: if(A && ONE || A && TWO || A && THREE || A && FOUR || A && FIVE) begin
								//ns = dispenseFood;
                        //num_to_display = SUM; 
                        //amount_to_return = SUM - 10'b0001100100;
								//food_selection = 5'b00000;
                        if(A && ONE) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100; 
									 food_selection <= A1; //A1
									 load <= 1'b0;
                        end
                        else if(A && TWO) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100; 
									 food_selection <= A2; //A2
									 load <= 1'b0;
                        end
                        else if(A && THREE) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                           
									 food_selection <= A3; //A3
									 load <= 1'b0;
                        end
                        else if(A && FOUR) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                            
									 food_selection <= A4; //A4
									 load <= 1'b0;
                        end
                        else begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                            
									 food_selection <= A5; //A5
									 load <= 1'b0;
                        end
						end
					else begin
                        if (SUM >= 125 && SUM <150) begin
									 ns <= dispenseB;
                            //num_to_display <= SUM; 
                            food_selection <= base;
									 load <= 1'b0;
								end
                        else if (SUM >= 150 && SUM <175) begin
									 ns <= dispenseC;
                            //num_to_display <= SUM; 
                            food_selection <= base;
									 load <= 1'b0;
								end
                        else if (SUM >= 175)
                        begin
                            ns <= dispenseD;
                            //num_to_display <= SUM; 
                            food_selection <= base;
									 load <= 1'b0;
                        end
                        else begin
                            ns <= dispenseA;
                            //num_to_display <= SUM; 
                            food_selection <= base;
									 load <= 1'b0;
                        end
					end
		
        dispenseB: if(A && ONE || A && TWO || A && THREE || A && FOUR || A && FIVE) begin
								//ns = dispenseFood;
                        //num_to_display = SUM; 
                        //amount_to_return = SUM - 10'b0001100100;
								//food_selection = 5'b00000;
                        if(A && ONE) begin
								    ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0001100100;                            
									 food_selection <= A1; //A1
									 load <= 1'b0;
                        end
                        else if(A && TWO) begin
								    ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0001100100;                              
									 food_selection <= A2; //A2
									 load <= 1'b0;
                        end
                        else if(A && THREE) begin
								    ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0001100100;                              
									 food_selection <= A3; //A3
									 load <= 1'b0;
                        end
                        else if(A && FOUR) begin
								    ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0001100100;                              
									 food_selection <= A4; //A4
									 load <= 1'b0;
                        end
                        else begin
								    ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0001100100;                              
									 food_selection <= A5; //A5
									 load <= 1'b0;
                        end
					end
					else if(B && ONE || B && TWO || B && THREE || B && FOUR || B && FIVE) begin
                        //ns = dispenseFood;
                        //num_to_display = SUM; 
                        //amount_to_return = SUM - 10'b0001111101;
								//food_selection = 5'b00000;
                        if(B && ONE) begin
                            ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0001111101; 								
                            food_selection <= B1; //B1
									 load <= 1'b0;
                        end
                        else if(B && TWO) begin
                            ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0001111101; 								                          
									 food_selection <= B2; //B2
									 load <= 1'b0;
                        end
                        else if(B && THREE) begin
                            ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0001111101; 								                           
									 food_selection <= B3; //B3
									 load <= 1'b0;
                        end
                        else if(B && FOUR) begin
                            ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0001111101; 								                                                       
									 food_selection <= B4; //B4
									 load <= 1'b0;
                        end
                        else begin
                            ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0001111101;                             
									 food_selection <= B5; //B5
									 load <= 1'b0;
                        end
               end
               else begin
                        if (SUM >= 150 && SUM <175) begin
									 ns <= dispenseC;
                            //num_to_display <= SUM; 
                            food_selection <= base;
									 load <= 1'b0;
								end
                        else if (SUM >= 175) begin
                            ns <= dispenseD;
                            //num_to_display <= SUM; 
                            food_selection <= base;
									 load <= 1'b0;
                        end
                        else begin
                            ns <= dispenseB;
                            //num_to_display <= SUM; 
                            food_selection <= base;
									 load <= 1'b0;
                        end
					end
		
        dispenseC: if(A && ONE || A && TWO || A && THREE || A && FOUR || A && FIVE) begin
								//ns = dispenseFood;
                        //num_to_display = SUM; 
                        //amount_to_return = SUM - 10'b0001100100;
								//food_selection = 5'b00000;
                        if(A && ONE) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                            
									 food_selection <= A1; //A1
									 load <= 1'b0;
                        end
                        else if(A && TWO) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                               
									 food_selection <= A2; //A2
									 load <= 1'b0;
                        end
                        else if(A && THREE) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                               
									 food_selection <= A3; //A3
									 load <= 1'b0;
                        end
                        else if(A && FOUR) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                               
									 food_selection <= A4; //A4
									 load <= 1'b0;
                        end
                        else begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                               
									 food_selection <= A5; //A5
									 load <= 1'b0;
                        end
					end
					else if(B && ONE || B && TWO || B && THREE || B && FOUR || B && FIVE) begin
                        //ns = dispenseFood;
                        //num_to_display = SUM; 
                        //amount_to_return = SUM - 10'b0001111101;
								//food_selection = 5'b00000;
                        if(B && ONE) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001111101;                             
									 food_selection <= B1; //B1
									 load <= 1'b0;
                        end
                        else if(B && TWO) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001111101;                              
									 food_selection <= B2; //B2
									 load <= 1'b0;
                        end
                        else if(B && THREE) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001111101;                              
									 food_selection <= B3; //B3
									 load <= 1'b0;
                        end
                        else if(B && FOUR) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001111101;                              
									 food_selection <= B4; //B4
									 load <= 1'b0;
                        end
                        else begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001111101;                             
									 food_selection <= B5; //B5
									 load <= 1'b0;
                        end
                    end
                else if(C && ONE || C && TWO || C && THREE || C && FOUR || C && FIVE) begin
                        //ns = dispenseFood;
                        //num_to_display = SUM; 
                        //amount_to_return = SUM - 10'b0010010110;
								//food_selection = 5'b00000;
                        if(C && ONE) begin
									 ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0010010110;                             
									 food_selection <= C1; //C1
									 load <= 1'b0;
                        end
                        else if(C && TWO) begin
									 ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0010010110;                            
									 food_selection <= C2; //C2
									 load <= 1'b0;
                        end
                        else if(C && THREE) begin
									 ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0010010110;                             
									 food_selection <= C3; //C3
									 load <= 1'b0;
                        end
                        else if(C && FOUR) begin
									 ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0010010110;                              
									 food_selection <= C4; //C4
									 load <= 1'b0;
                        end
                        else begin
									 ns <= dispenseFood;
                            //num_to_display <= SUM - 10'b0010010110;                             
									 food_selection <= C5; //C5
									 load <= 1'b0;
                        end
                end
                else begin
                        if (SUM >= 175) begin
                            ns <= dispenseD;
                            //num_to_display <= SUM; 
                            food_selection <= base;
									 load <= 1'b0;
                        end
                        else begin
                            ns <= dispenseC;
                            //num_to_display <= SUM; 
                            food_selection <= base;
									 load <= 1'b0;
                        end
					 end 
        dispenseD: if(A && ONE || A && TWO || A && THREE || A && FOUR || A && FIVE) begin
								//ns = dispenseFood;
                        //num_to_display = SUM; 
                        //amount_to_return = SUM - 10'b0001100100;
								//food_selection = 5'b0000;
                        if(A && ONE) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                            
									 food_selection <= A1; //A1
									 load <= 1'b0;
                        end
                        else if(A && TWO) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                            
									 food_selection <= A2; //A2
									 load <= 1'b0;
                        end
                        else if(A && THREE) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                           
									 food_selection <= A3; //A3
									 load <= 1'b0;
                        end
                        else if(A && FOUR) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                             
									 food_selection <= A4; //A4
									 load <= 1'b0;
                        end
                        else begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001100100;                          
									 food_selection <= A5; //A5
									 load <= 1'b0;
                        end
					 end
					 else if(B && ONE || B && TWO || B && THREE || B && FOUR || B && FIVE) begin
                        //ns = dispenseFood;
                        //num_to_display = SUM; 
                        //amount_to_return = SUM - 10'b0001111101;
								//food_selection = 5'b00000;
                        if(B && ONE) begin
                            ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001111101;                           
									 food_selection <= B1; //B1
									 load <= 1'b0;
                        end
                        else if(B && TWO) begin
                            ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001111101;                              
									 food_selection <= B2; //B2
									 load <= 1'b0;
                        end
                        else if(B && THREE) begin
                            ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001111101;                               
									 food_selection <= B3; //B3
									 load <= 1'b0;
                        end
                        else if(B && FOUR) begin
                            ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001111101;                              
									 food_selection <= B4; //B4
									 load <= 1'b0;
                        end
                        else begin
                            ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0001111101;                               
									 food_selection <= B5; //B5
									 load <= 1'b0;
                        end
                    end
                 else if(C && ONE || C && TWO || C && THREE || C && FOUR || C && FIVE) begin
                        //ns = dispenseFood;
                        //num_to_display = SUM; 
                        //amount_to_return = SUM - 10'b0010010110;
								//food_selection = 5'b00000;
                        if(C && ONE) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0010010110;                             
									 food_selection <= C1; //C1
									 load <= 1'b0;
                        end
                        else if(C && TWO) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0010010110;                             
									 food_selection <= C2; //C2
									 load <= 1'b0;
                        end
                        else if(C && THREE) begin
 									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0010010110;                            
									 food_selection <= C3; //C3
									 load <= 1'b0;
                        end
                        else if(C && FOUR) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0010010110;                            
									 food_selection <= C4; //C4
									 load <= 1'b0;
                        end
                        else begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0010010110;                             
									 food_selection <= C5; //C5
									 load <= 1'b0;
                        end
                    end
               else if(D && ONE || D && TWO || D && THREE || D && FOUR || D && FIVE) begin
                        //ns = dispenseFood;
                        //num_to_display = SUM; 
                        //amount_to_return = SUM - 10'b0010101111;
								//food_selection = 5'b00000;
                        if(D && ONE) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0010101111;                             
									 food_selection <= D1; //D1
									 load <= 1'b0;
                        end
                        else if(D && TWO) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0010101111;                            
									 food_selection <= D2; //D2
									 load <= 1'b0;
                        end
                        else if(D && THREE) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0010101111;                             
									 food_selection <= D3; //D3
									 load <= 1'b0;
                        end
                        else if(D && FOUR) begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0010101111;                             
									 food_selection <= D4; //D4
									 load <= 1'b0;
                        end
                        else begin
									 ns <= dispenseFood;
									 //num_to_display <= SUM - 10'b0010101111;                            
									 food_selection <= D5; //D5
									 load <= 1'b0;
                        end
                    end
               else begin
                        ns <= dispenseD;
                        //num_to_display <= SUM - 10'b0010101111; 
                        food_selection <= base;
								load <= 1'b0;
					end

		dispenseFood: if(food_dispensed) begin
								ns <= dispenseChange;
                        //num_to_display <= num_to_display; 
                        food_selection <= base;
								load <= 1'b0;
					end
					else begin
								ns <= dispenseFood;
                        //num_to_display <= num_to_display; 
                        food_selection <= base;
								load <= 1'b0;
					end
		dispenseChange: 
					if(change_returned == 1'b1) begin
								ns <= collecting;
								//num_to_display <= 10'b0; ;
								food_selection <= base;
								load <= 1'b0;
					end
					else begin
								ns <= dispenseChange;
								//num_to_display <= num_to_display; 
								food_selection <= base;
								load <= 1'b1;
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

module coin_dispenser(clock, load, amount_to_return, coin_to_return, amount_left, change_returned);

input clock, load;
input [9:0] amount_to_return;

output reg change_returned;
output reg [2:0] coin_to_return;
output reg [9:0] amount_left;

always @ (posedge clock) begin

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
					change_returned = 1'b0;
			  
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





