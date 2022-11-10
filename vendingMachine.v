
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
module vendingMachine();

endmodule

module vending_machine_FSM();

input clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed, change_dispensed;
input [9:0] SUM;

output reg [9:0] num_to_display, amount_to_return;
output reg [4:0] food_selection;

parameter [2:0] reset = 3'b000, collecting = 3'b001, dispenseA = 3'b010, dispenseB = 3'b011 , dispenseC = 3'b100 , dispenseD =3'b101 , dispenseChange = 3'b110, dispenseFood = 3'b111;

reg [2:0] ps, ns;

always@(posedge Clock, posedge Reset) begin

if(reset) begin
	ps <= idle;
end
else begin
	ps <= ns;
end

end

always@(Byte_Ready, T_Byte, Bit_Count, ps)begin 

	case(ps)
	
		idle: if(Byte_Ready)
				begin
					ns = waiting;
					Clear = 1'b0;
					Shift = 1'b0;
					Start = 1'b0;
					Load_shift_register = 1'b1;
				end
				else begin
					ns = idle;
					Clear = 1'b1;
					Shift = 1'b0;
					Start = 1'b0;
					Load_shift_register = 1'b0;
				end
		
		waiting: if(T_Byte)
					begin
						ns = sending;
						Clear = 1'b0; 
						Shift = 1'b0;
						Start = 1'b1;
						Load_shift_register = 1'b0;
					end
					else
					begin
						ns = waiting;
						Clear = 1'b0;
						Shift = 1'b0;
						Start = 1'b0;
						Load_shift_register = 1'b1;
					end
		
		sending: if(Bit_Count >= 9)
					begin
						ns = idle;
						Clear = 1'b1;
						Shift = 1'b0;
						Start = 1'b0;
						Load_shift_register = 1'b0;
					end
					else begin
						ns = sending;
						Clear = 1'b0;
						Start = 1'b0;
						Shift = 1'b1;
						Load_shift_register = 1'b0;
					end
		
		default: ns <= idle;
					

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

//module bcd_converter();

//endmodule 
