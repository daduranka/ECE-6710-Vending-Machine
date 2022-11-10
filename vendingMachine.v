
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

endmodule

module coin_summer(clock, reset, inserted_coin, sum);

input clock, reset;
input [2:0] inserted_coin;

output reg [9:0] sum;

always@(reset, inserted_coin) begin

    if(reset) begin
        sum = 10'b0;
    end
    else begin
        case (inserted_coin)

        3'b000: sum <= sum + 1'b0
        3'b001: sum <= sum + 1'b1
        3'b010: sum <= sum + 3'b101
        3'b011: sum <= sum + 4'b1010
        3'b100: sum <= sum + 5'b11001
        3'b101: sum <= sum + 6'b110010
        3'b110: sum <= sum + 7'b1100100
        
        default: sum <= sum;
        
        endcase
    end

end

endmodule

module coin_dispenser();

endmodule

//module bcd_converter();

//endmodule 
