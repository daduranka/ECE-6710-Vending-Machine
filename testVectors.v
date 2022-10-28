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
1_000_0000000000
0_001_0000000001
0_010_0000000110
0_011_0000001000
0_100_0000101001
0_101_0001011011
0_110_0010111111
0_000_0000000000

//Testing coin_dispenser
//Input: amount_to_return 10'b - (sum - cost); change_returned 1'b
//Outputs: 3'b - coin to return penny(001), nickel(010), dime(011), quarter(100), half-dollar(101), dollar(110)
//format: change_returned (x) ,amount_to_return(xxxxxxxxxx), coin_to_return(xxx), change_returned 1'b (x) ----> x_xxxxxxxxxx_xxx_x
0_0000000001_001_0
0_0000000101_010_0
0_0000001010_011_0
0_0000011001_100_0
0_0000110010_101_0
0_0001100100_110_0

0_0010111111_110_0
0_0001011011_101_0
0_0000101001_100_0
0_0000001000_011_0
0_0000000110_010_0
0_0000000001_001_0
0_0000000000_000_1

1_0000000000_000_1
1_0000000001_001_0

//Testing vending_machine_FSM
//Inputs: clock (N/A), reset - 1'b; food_dispensed- 1'b; user_input 4'b; sum - 10'b; 
//Outputs: bcd_display 12'b; 



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