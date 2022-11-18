//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ECE 6710 VLSI Project: Vending Machine Controller
// Student: Braden Brown
//
// Description: This code contains the test vectors to be used by the test bench to determine if the verilog code
// is working correctly.
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*******************************************UNIT TEST VECTORS****************************************************/
//////////////////////////////////////////Testing coin_summer//////////////////////////////////////////////////////
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
/////////////////////////////////////////End testing coin_summer//////////////////////////////////////////////////
