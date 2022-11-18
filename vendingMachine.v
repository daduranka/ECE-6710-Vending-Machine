
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
module vendingMachine(clock, reset, A,B,C,D,ONE,TWO,THREE,FOUR,FIVE, food_dispensed, coin_inserted, num_to_display, food_selection, coin_to_return);

input clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed, change_dispensed;
input [2:0] coin_inserted;

output wire [2:0] coin_to_return;
output wire [4:0] food_selection;
output wire [9:0] num_to_display;

wire [9:0] sum_wire, amount_to_return_wire;
wire change_dispensed_wire

vending_machine_FSM FSM(.clock(clock), .reset(reset), .A(A), .B(B), .C(C), .D(D), .ONE(ONE), .TWO(TWO), .THREE(THREE), .FOUR(FOUR), .FIVE(FIVE), 
                    .food_dispensed(food_dispensed), .change_dispensed(change_dispensed_wire), .SUM(sum_wire), .num_to_display(num_to_display), 
                    .amount_to_return(), .food_selection(food_selection));
    
coin_summer coins(.reset(reset), .inserted_coin(inserted_coin), .sum(sum_wire));

coin_dispenser returns(.clock(clock), .amount_to_return(amount_to_return_wire), coin_to_return(coin_to_return), .change_returned(change_dispensed_wire));

endmodule

module vending_machine_FSM(clock, rest, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed, change_dispensed, SUM, num_to_display, amount_to_return, food_selection);

input clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed, change_dispensed;
input [9:0] SUM;

output reg [9:0] num_to_display, amount_to_return;
output reg [4:0] food_selection;

parameter [2:0] rst = 3'b000, dispenseA = 3'b001, dispenseB = 3'b010 , dispenseC = 3'b011 , dispenseD =3'b100 , dispenseChange = 3'b101, dispenseFood = 3'b110, collecting = 3'b111;

reg [2:0] ps, ns;

always@(posedge Clock, posedge Reset) begin

    if(reset) begin
	    if(ps == rst) begin    
            ps <= rst;
        end
        else begin
            ps <= dispenseChange;
        end
    end
    else begin
	    ps <= ns;
    end

end

always@(SUM, A,B,C,D,ONE,TWO,THREE,FOUR,FIVE, food_dispensed, change_dispensed, ps) begin 

	case (ps)
	
		rst: if(SUM > 0)
				begin
					ns = collecting;
                    num_to_display = ; 
                    amount_to_return = ;
                    food_selection = ;
				end
				else begin
					ns = idle;
                    num_to_display = ; 
                    amount_to_return = ;
                    food_selection = ;
				end
		collecting: if(SUM >= 100 && SUM <125)
					begin
						ns = dispenseA;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
					end
					else if (SUM >= 125 && SUM <150)
					begin
						ns = dispenseB;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
					end
                    else if (SUM >= 150 && SUM <175)
					begin
						ns = dispenseC;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
					end
                    else if (SUM >= 175)
                    begin
                        ns = dispenseD;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
                    end
                    else begin
                        ns = collecting;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
                    end
		dispenseA: if(A && ONE || A && TWO || A && THREE || A && FOUR || A && FIVE)
					begin
						ns = dispenseFood;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
					end
					else begin
                        if (SUM >= 125 && SUM <150)
					    begin
						    ns = dispenseB;
                            num_to_display = ; 
                            amount_to_return = ;
                            food_selection = ;
					    end
                        else if (SUM >= 150 && SUM <175)
					    begin
						    ns = dispenseC;
                            num_to_display = ; 
                            amount_to_return = ;
                            food_selection = ;
					    end
                        else if (SUM >= 175)
                        begin
                            ns = dispenseD;
                            num_to_display = ; 
                            amount_to_return = ;
                            food_selection = ;
                        end
                        else begin
                            ns = dispenseA;
                            num_to_display = ; 
                            amount_to_return = ;
                            food_selection = ;
                        end
					end
		
        dispenseB: if(A && ONE || A && TWO || A && THREE || A && FOUR || A && FIVE)
					begin
						ns = dispenseFood;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
					end
					else if(B && ONE || B && TWO || B && THREE || B && FOUR || B && FIVE) 
                    begin
                        ns = dispenseFood;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
                    end
                    else begin
                        else if (SUM >= 150 && SUM <175)
					    begin
						    ns = dispenseC;
                            num_to_display = ; 
                            amount_to_return = ;
                            food_selection = ;
					    end
                        else if (SUM >= 175)
                        begin
                            ns = dispenseD;
                            num_to_display = ; 
                            amount_to_return = ;
                            food_selection = ;
                        end
                        else begin
                            ns = dispenseB;
                            num_to_display = ; 
                            amount_to_return = ;
                            food_selection = ;
                        end
					end
		
        dispenseC: if(A && ONE || A && TWO || A && THREE || A && FOUR || A && FIVE)
					begin
						ns = dispenseFood;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
					end
					else if(B && ONE || B && TWO || B && THREE || B && FOUR || B && FIVE) 
                    begin
                        ns = dispenseFood;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
                    end
                    else if(C && ONE || C && TWO || C && THREE || C && FOUR || C && FIVE) 
                    begin
                        ns = dispenseFood;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
                    end
                    else begin
					    end
                        else if (SUM >= 175)
                        begin
                            ns = dispenseD;
                            num_to_display = ; 
                            amount_to_return = ;
                            food_selection = ;
                        end
                        else begin
                            ns = dispenseC;
                            num_to_display = ; 
                            amount_to_return = ;
                            food_selection = ;
                        end
		
        dispenseD: if(A && ONE || A && TWO || A && THREE || A && FOUR || A && FIVE)
					begin
						ns = dispenseFood;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
					end
					else if(B && ONE || B && TWO || B && THREE || B && FOUR || B && FIVE) 
                    begin
                        ns = dispenseFood;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
                    end
                    else if(C && ONE || C && TWO || C && THREE || C && FOUR || C && FIVE) 
                    begin
                        ns = dispenseFood;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
                    end
                    else if(D && ONE || D && TWO || D && THREE || D && FOUR || D && FIVE) 
                    begin
                        ns = dispenseFood;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
                    end
                    else begin
                        ns = dispenseD;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
					end

		dispenseFood: if(food_dispensed)
					begin
						ns = dispenseChange;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
					end
					else begin
						ns = dispenseFood;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
					end
		dispenseChange: if(change_returned)
					begin
						ns = rst;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;    
					end
					else begin
						ns = dispenseChange;
                        num_to_display = ; 
                        amount_to_return = ;
                        food_selection = ;
					end
	    default: 
            ns = dispenseChange;
            num_to_display = ; 
            amount_to_return = ;
            food_selection = ;

	endcase

end



endmodule

module coin_summer(reset, inserted_coin, sum);

input reset;
input [2:0] inserted_coin;

output reg [9:0] sum;

always@(posedge clock, posedge reset) begin

    if(reset) begin
        sum <= 10'b0;
    end
    else begin
        sum <= sum;
    end
end

always@(inserted_coin) begin
    
    case (inserted_coin)

        3'b000: sum <= sum + 10'b0
        3'b001: sum <= sum + 10'b1
        3'b010: sum <= sum + 10'b101
        3'b011: sum <= sum + 10'b1010
        3'b100: sum <= sum + 10'b11001
        3'b101: sum <= sum + 10'b110010
        3'b110: sum <= sum + 10'b1100100
        
        default: sum <= sum;
        
    endcase
end

endmodule

module coin_dispenser(clock, amount_to_return, coin_to_return, change_returned);

input clock;
input [9:0] amount_to_return;

reg [9:0] store_value;

output reg change_returned;
output reg [2:0] coin_to_return;

always @ (posedge clock) begin

    if(amount_to_return == 10'b0) begin
        
        store_value <= 10'b0;
        change_returned <= 1'b1;
        coin_to_return <= 3'b0;
    
    end
    else begin
        
        store_value <= amount_to_return;
        change_returned <= 1'b0;
        coin_to_return <= coin_to_return

    end

end
always @(store_value) begin
    
    if(store_value == 0) begin
        store_value <= store_value;
        coin_to_return <= 3'b0
        change_returned <= 1'b1;
    end
    else if(store_value >= 10'b1 && store_value < 10'b101) begin
        
        coin_to_return <= 3'b001;
        store_value <= store_value - 10'b1;
        change_returned <= 1'b0;
    
    end
    else if(store_vale >=10'b101 && store_value < 10'b1010 ) begin
    
        coin_to_return <= 3'b010;
        store_value <= store_value - 10'b101;
        change_returned <= 1'b0;

    end
    else if(store_vale >=10'b1010 && store_value < 10'b11001 ) begin
    
        coin_to_return <= 3'b011;
        store_value <= store_value - 10'b1010;
        change_returned <= 1'b0;

    end
    else if(store_vale >=10'b11001 && store_value < 10'b110010 ) begin
    
        coin_to_return <= 3'b100;
        store_value <= store_value - 10'b11001;
        change_returned <= 1'b0;

    end
    else if(store_vale >=10'b110010 && store_value < 10'b1100100 ) begin
    
        coin_to_return <= 3'b101;
        store_value <= store_value - 10'b110010;
        change_returned <= 1'b0;

    end
    else begin
    
        coin_to_return <= 3'b110;
        store_value <= store_value - 10'b1100100;
        change_returned <= 1'b0

    end


end


endmodule


