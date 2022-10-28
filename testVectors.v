
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ECE 6710 VLSI Project: Vending Machine Controller
// Student: Braden Brown
//
// Description: This code contains the test vectors to be used by the test bench to determine if the verilog code
// is working correctly.
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*******************************************UNIT TEST VECTORS****************************************************/
//Testing coin_summer
//Input: inserted_coin 3'b - 000 = default; 001 = penny (1); 010 = nickel(5), 011 = dime(10), 100 = quarter(25), 
//101 = half-dollar (50), 110 = dollar(100), reset - 1'b;
//Outputs: sum: 10'b
//format: reset (x), money_input(xxx), coin_inserted(x), expected sum(xxxxxxxxxx) -----> ex. 000_0_0000000000

//Testing adding each type of coin and resetting afterwards
0_000_0000000000
0_001_0000000001
1_000_0000000000
0_010_0000000101
1_000_0000000000
0_011_0000001010
1_000_0000000000
0_100_0000011001
1_000_0000000000
0_101_0000110010
1_000_0000000000
0_110_0001100100

//Testing adding each type of coin one at a time
1_000_0000000000
0_001_0000000001
0_010_0000000110
0_011_0000001000
0_100_0000101001
0_101_0001011011
0_110_0010111111
0_000_0000000000

//Testing coin_dispenser
//Input: amount_to_return 10'b - (sum - cost); 
//Outputs: 3'b - coin to return penny(001), nickel(010), dime(011), quarter(100), half-dollar(101), dollar(110)
//format: amount_to_return(xxxxxxxxxx), coin_to_return(xxx), change_returned 1'b (x) ----> xxxxxxxxxx_xxx_x

//Testing dispensing each type of coin as change
0000000001_001_0
0000000101_010_0
0000001010_011_0
0000011001_100_0
0000110010_101_0
0001100100_110_0

//Testing the dispensing when the amount to return was $1.91
0010111111_110_0
0001011011_101_0
0000101001_100_0
0000001000_011_0
0000000110_010_0
0000000001_001_0
0000000000_000_1

//Testing the dispensing when the amount to return was the max amount $9.99
1111100111_110_0
1110000011_110_0
1100011111_110_0
1010111011_110_0
1001010111_110_0
0111110011_110_0
0110001111_110_0
0100101011_110_0
0011000111_110_0
0001100011_101_0
0000110001_100_0
0000011000_011_0
0000001110_011_0
0000000100_001_0
0000000011_001_0
0000000010_001_0
0000000001_001_0
0000000000_000_1

//Testing vending_machine_FSM
//Inputs: clock (N/A), reset - 1'b; food_dispensed - 1'b; user_input 5'b; sum - 10'b; change_to_dispense - 1'b; coin_dispensed - 3'b 
//Outputs: num_to_display - 10'b; dispense_val - 3'b; amount_to_return - 10'b; 
//format: reset(x), food_dispensed(x), user_input(xxxxx), sum(xxxxxxxxx), change_to_dispense(x), coin_dispensed(xxx), 
//        num_to_display(xxxxxxxxxx), dispense_val(xxxxx), amount_to_return (xxxxxxxxxx)

//testing reset
1_0_000_0000000000_0_000_0000000000_00000_0000000000

//testing hitting reset when money has been entered but no selection made
0_0_000_0000000001_0_000_0000000001_00000_0000000000
1_0_000_0000000000_1_000_0000000001_00000_0000000001
1_0_000_0000000000_0_000_0000000000_00000_0000000000

//testing dispensing food from A1
0_0_000_0001100100_0_000_0001100100_00000_0000000000
0_0_001_0001100100_0_000_0001100100_00000_0000000000
0_1_000_0000000000_0_000_0000000000_00000_0000000000




/*****************************************INTEGRATIVE TEST VECTORS**************************************************/
//Testing reset state proper funciton

//Testing transition from reset state to collecting state to change state to reset state

//Testing transitions from reset state to collecting state to Disp_Row_A state to change state to reset state

//Testing transitions from reset state to collecting state to Disp_Row_A state to Food_Disp state to change state 
//to reset state

//Testing transitions from reset state to collecting state to Disp_Row_A state to Disp_Row_B state to change state 
//to reset state

//Testing transitions from reset state to collecting state to Disp_Row_A state to Disp_Row_B state to Food_Disp state 
//to change state to reset state

//Testing transitions from reset state to collecting state to Disp_Row_A state to Disp_Row_B state to Disp_Row_C state
//to change state to reset state

//Testing transitions from reset state to collecting state to Disp_Row_A state to Disp_Row_B state to Disp_Row_C state
//to Food_Disp state to change state to reset state

//Testing transitions from reset state to collecting state to Disp_Row_A state to Disp_Row_B state to Disp_Row_C state
//to Disp_Row_D state to change state to reset state

//Testing transitions from reset state to collecting state to Disp_Row_A state to Disp_Row_B state to Disp_Row_C state
//to Disp_Row_D state to Food_Disp state to change state to reset state
=======

