
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
//Inputs: clock (N/A), reset - 1'b; SUM - 10'b; A - 1'b; B - 1'b; C - 1'b; D - 1'b; ONE - 1'b; TWO - 1'b; THREE - 1'b; FOUR - 1'b; FIVE - 1'b; food_dispensed - 1'b; 
//        change_dispensed - 1'b;  
//Outputs: num_to_display - 10'b; food_selection - 5'b; amount_to_return - 10'b; 
//format: reset(x), SUM(xxxxxxxxxx), A(x), B(x), C(x), D(x), ONE(x), TWO(x), THREE(x), FOUR(x), FIVE(x), food_dispensed(x), change_dispensed(x) 
//        num_to_display(xxxxxxxxxx), food_selection(xxxxx), amount_to_return (xxxxxxxxxx)

//testing reset/initializing system
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000

//testing hitting reset when money has been entered but no selection made
0_0000000001_0_0_0_0_0_0_0_0_0_0_1_0000000001_00000_0000000000  //inserting one cent
1_0000000000_0_0_0_0_0_0_0_0_0_0_0_0000000001_00000_0000000001  //returning the one cent
0_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  //resetting when change returned = True

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000

//testing dispensing food from A1 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_1_0_0_0_0_0_1_0001100100_00000_0000000000   //making A1 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from A1 with change   $1.15
0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
0_0001110011_1_0_0_0_1_0_0_0_0_0_1_0001110011_00000_0000000000   //making A1 selection
0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00001_0000001111   //Waiting for food to dispense and calculating change
0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
0_0000000000_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from A2 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_0_1_0_0_0_0_1_0001100100_00000_0000000000   //making A2 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00010_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00010_0000000000   //Waiting for food to dispense and calculating change
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from A2 with change   $1.06
0_0001101010_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.06
0_0001101010_1_0_0_0_0_1_0_0_0_0_1_0001110011_00000_0000000000   //making A2 selection
0_0001101010_0_0_0_0_0_0_0_0_0_0_1_0001110011_00010_0000000000   //Telling machine which selection was made
0_0001101010_0_0_0_0_0_0_0_0_0_0_0_0001110011_00010_0000000110   //Waiting for food to dispense and calculating change
0_0001101010_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000000110   //Food dispensed
0_0001101010_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000000110   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from A3 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_0_0_1_0_0_0_1_0001100100_00000_0000000000   //making A3 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00011_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00011_0000000000   //Waiting for food to dispense and calculating change
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from A3 with change   $1.26
// 0_0001111110_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.26
// 0_0001111110_1_0_0_0_0_0_1_0_0_0_1_0001110011_00000_0000000000   //making A3 selection
// 0_0001111110_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001111110_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001111110_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0001111110_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001111110_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from A4 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_0_0_0_1_0_0_1_0001100100_00000_0000000000   //making A4 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from A4 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_1_0_0_0_0_0_0_1_0_0_1_0001110011_00000_0000000000   //making A4 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

//resetting system between tests
//1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from A5 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_0_0_0_0_1_0_1_0001100100_00000_0000000000   //making A5 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from A5 with change   $1.15
//0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
//0_0001110011_1_0_0_0_0_0_0_0_1_0_1_0001110011_00000_0000000000   //making A5 selection
//0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
//0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
//0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
//0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
//0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

//resetting system between tests
//1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

// //testing dispensing food from B1 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_1_0_0_1_0_0_0_0_0_1_0001100100_00000_0000000000   //making B1 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

// //resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from B1 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_1_0_0_1_0_0_0_0_0_1_0001110011_00000_0000000000   //making B1 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from B2 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_1_0_0_0_1_0_0_0_0_1_0001100100_00000_0000000000   //making B2 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

// //resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from B2 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_1_0_0_0_1_0_0_0_0_1_0001110011_00000_0000000000   //making B2 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

// //testing dispensing food from B3 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_1_0_0_0_0_1_0_0_0_1_0001100100_00000_0000000000   //making B3 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from B3 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_1_0_0_0_0_1_0_0_0_1_0001110011_00000_0000000000   //making B3 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

// //testing dispensing food from B4 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_1_0_0_0_0_0_1_0_0_1_0001100100_00000_0000000000   //making B4 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from B4 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_1_0_0_0_0_0_1_0_0_1_0001110011_00000_0000000000   //making B4 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from B5 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_1_0_0_0_0_0_0_1_0_1_0001100100_00000_0000000000   //making B5 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from B5 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_1_0_0_0_0_0_0_1_0_1_0001110011_00000_0000000000   //making B5 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from C1 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_0_1_0_1_0_0_0_0_0_1_0001100100_00000_0000000000   //making C1 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from C1 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_0_1_0_1_0_0_0_0_0_1_0001110011_00000_0000000000   //making C1 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from C2 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_0_1_0_0_1_0_0_0_0_1_0001100100_00000_0000000000   //making C2 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from C2 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_0_1_0_0_1_0_0_0_0_1_0001110011_00000_0000000000   //making C2 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

// //testing dispensing food from C3 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_0_1_0_0_0_1_0_0_0_1_0001100100_00000_0000000000   //making C3 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from C3 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_0_1_0_0_0_1_0_0_0_1_0001110011_00000_0000000000   //making C3 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from C4 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_0_1_0_0_0_0_1_0_0_1_0001100100_00000_0000000000   //making C4 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from C4 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_0_1_0_0_0_0_1_0_0_1_0001110011_00000_0000000000   //making C4 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from C5 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_0_1_0_0_0_0_0_1_0_1_0001100100_00000_0000000000   //making C5 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from C5 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_0_1_0_0_0_0_0_1_0_1_0001110011_00000_0000000000   //making C5 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from D1 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_0_0_1_1_0_0_0_0_0_1_0001100100_00000_0000000000   //making D1 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from D1 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_0_0_1_1_0_0_0_0_0_1_0001110011_00000_0000000000   //making D1 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from D2 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_0_0_1_0_1_0_0_0_0_1_0001100100_00000_0000000000   //making D2 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from D2 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_0_0_1_0_1_0_0_0_0_1_0001110011_00000_0000000000   //making D2 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from D3 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_0_0_1_0_0_1_0_0_0_1_0001100100_00000_0000000000   //making D3 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from D3 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_0_0_1_0_0_1_0_0_0_1_0001110011_00000_0000000000   //making D3 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from D4 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_0_0_1_0_0_0_1_0_0_1_0001100100_00000_0000000000   //making D4 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from D4 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_0_0_1_0_0_0_1_0_0_1_0001110011_00000_0000000000   //making D4 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from D5 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_0_0_0_1_0_0_0_0_1_0_1_0001100100_00000_0000000000   //making D5 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Food dispensed


//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from D5 with change   $1.15
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
// 0_0001110011_0_0_0_1_0_0_0_0_1_0_1_0001110011_00000_0000000000   //making D5 selection
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
// 0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for food to dispense and calculating change
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
// 0_0000000000_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Waiting for change to dispense
// 0_0001110011_0_0_0_0_0_0_0_0_0_1_1_0001110011_00000_0000000000   //Change dispensed

// //resetting system between tests
// 1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 



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

