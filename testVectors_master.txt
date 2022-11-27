
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

////////////////////////////////////////Testing coin_dispenser///////////////////////////////////////////////////
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
////////////////////////////////////////////////////End Testing Coin Dispenser///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////Testing vending_machine_FSM///////////////////////////////////////////////////////////////////////
//Inputs: clock (N/A), reset - 1'b; SUM - 10'b; A - 1'b; B - 1'b; C - 1'b; D - 1'b; ONE - 1'b; TWO - 1'b; THREE - 1'b; FOUR - 1'b; FIVE - 1'b; 
//          food_dispensed - 1'b; change_dispensed - 1'b;  
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
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0001100100_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from A1 with change   $1.15
0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.15
0_0001110011_1_0_0_0_1_0_0_0_0_0_1_0001110011_00000_0000000000   //making A1 selection
0_0001110011_0_0_0_0_0_0_0_0_0_0_1_0001110011_00001_0000000000   //Telling machine which selection was made
0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00001_0000001111   //Waiting for food to dispense and calculating change
0_0001110011_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000001111   //Food dispensed
0_0001110011_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from A2 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_0_1_0_0_0_0_1_0001100100_00000_0000000000   //making A2 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00010_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00010_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0001100100_00000_0000000000   //Food dispensed

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
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0001100100_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from A3 with change   $1.26
0_0001111110_0_0_0_0_0_0_0_0_0_0_1_0001110011_00000_0000000000   //inserting $1.26
0_0001111110_1_0_0_0_0_0_1_0_0_0_1_0001110011_00000_0000000000   //making A3 selection
0_0001111110_0_0_0_0_0_0_0_0_0_0_1_0001110011_00011_0000000000   //Telling machine which selection was made
0_0001111110_0_0_0_0_0_0_0_0_0_0_0_0001110011_00011_0000011010   //Waiting for food to dispense and calculating change
0_0001111110_0_0_0_0_0_0_0_0_0_1_0_0001110011_00000_0000011010   //Food dispensed
0_0001111110_0_0_0_0_0_0_0_0_0_0_0_0001110011_00000_0000011010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from A4 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_0_0_0_1_0_0_1_0001100100_00000_0000000000   //making A4 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00100_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00100_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0001100100_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from A4 with change $1.55
0_0010011011_0_0_0_0_0_0_0_0_0_0_1_0010011011_00000_0000000000   //inserting $1.55
0_0010011011_1_0_0_0_0_0_0_1_0_0_1_0010011011_00000_0000000000   //making A4 selection
0_0010011011_0_0_0_0_0_0_0_0_0_0_1_0010011011_00100_0000000000   //Telling machine which selection was made
0_0010011011_0_0_0_0_0_0_0_0_0_0_0_0010011011_00100_0000110111   //Waiting for food to dispense and calculating change
0_0010011011_0_0_0_0_0_0_0_0_0_1_0_0010011011_00000_0000110111   //Food dispensed
0_0010011011_0_0_0_0_0_0_0_0_0_0_0_0010011011_00000_0000110111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from A5 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_0_0_0_0_1_0_1_0001100100_00000_0000000000   //making A5 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00101_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_1_0001100100_00101_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_1_0001100100_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from A5 with change   $1.30
0_0010000010_0_0_0_0_0_0_0_0_0_0_1_0010000010_00000_0000000000   //inserting $1.30
0_0010000010_1_0_0_0_0_0_0_0_1_0_1_0010000010_00000_0000000000   //making A5 selection
0_0010000010_0_0_0_0_0_0_0_0_0_0_1_0010000010_00101_0000000000   //Telling machine which selection was made
0_0010000010_0_0_0_0_0_0_0_0_0_0_0_0010000010_00101_0000011110   //Waiting for food to dispense and calculating change
0_0010000010_0_0_0_0_0_0_0_0_0_1_0_0010000010_00000_0000011110   //Food dispensed
0_0010000010_0_0_0_0_0_0_0_0_0_0_0_0010000010_00000_0000011110   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

// //testing dispensing food from B1 no change
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_00000_0000000000   //inserting $1.25 
0_0001111101_0_1_0_0_1_0_0_0_0_0_1_0001111101_00000_0000000000   //making B1 selection
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_00110_0000000000   //Telling machine which selection was made
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_00110_0000000000   //Waiting for food to dispense and calculating change
0_0001111101_0_0_0_0_0_0_0_0_0_1_1_0001111101_00000_0000000000   //Food dispensed

// //resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from B1 with change   $1.40
0_0010001100_0_0_0_0_0_0_0_0_0_0_1_0010001100_00000_0000000000   //inserting $1.40
0_0010001100_0_1_0_0_1_0_0_0_0_0_1_0010001100_00000_0000000000   //making B1 selection
0_0010001100_0_0_0_0_0_0_0_0_0_0_1_0010001100_00110_0000000000   //Telling machine which selection was made
0_0010001100_0_0_0_0_0_0_0_0_0_0_0_0010001100_00110_0000001111   //Waiting for food to dispense and calculating change
0_0010001100_0_0_0_0_0_0_0_0_0_1_0_0010001100_00000_0000001111   //Food dispensed
0_0010001100_0_0_0_0_0_0_0_0_0_0_0_0010001100_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from B2 no change
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_00000_0000000000   //inserting $1.25 dollar
0_0001111101_0_1_0_0_0_1_0_0_0_0_1_0001111101_00000_0000000000   //making B2 selection
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_00111_0000000000   //Telling machine which selection was made
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_00111_0000000000   //Waiting for food to dispense and calculating change
0_0001111101_0_0_0_0_0_0_0_0_0_1_1_0001111101_00000_0000000000   //Food dispensed

// //resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from B2 with change   $1.45
0_0010010001_0_0_0_0_0_0_0_0_0_0_1_0010010001_00000_0000000000   //inserting $1.45
0_0010010001_0_1_0_0_0_1_0_0_0_0_1_0010010001_00000_0000000000   //making B2 selection
0_0010010001_0_0_0_0_0_0_0_0_0_0_1_0010010001_00111_0000000000   //Telling machine which selection was made
0_0010010001_0_0_0_0_0_0_0_0_0_0_0_0010010001_00111_0000010100   //Waiting for food to dispense and calculating change
0_0010010001_0_0_0_0_0_0_0_0_0_1_0_0010010001_00000_0000010100   //Food dispensed
0_0010010001_0_0_0_0_0_0_0_0_0_0_0_0010010001_00000_0000010100   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

// //testing dispensing food from B3 no change
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_00000_0000000000   //inserting $1.25
0_0001111101_0_1_0_0_0_0_1_0_0_0_1_0001111101_00000_0000000000   //making B3 selection
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_01000_0000000000   //Telling machine which selection was made
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_01000_0000000000   //Waiting for food to dispense and calculating change
0_0001111101_0_0_0_0_0_0_0_0_0_1_1_0001111101_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from B3 with change   $1.27
0_0001111111_0_0_0_0_0_0_0_0_0_0_1_0001111111_00000_0000000000   //inserting $1.27
0_0001111111_0_1_0_0_0_0_1_0_0_0_1_0001111111_00000_0000000000   //making B3 selection
0_0001111111_0_0_0_0_0_0_0_0_0_0_1_0001111111_01000_0000000000   //Telling machine which selection was made
0_0001111111_0_0_0_0_0_0_0_0_0_0_0_0001111111_01000_0000000010   //Waiting for food to dispense and calculating change
0_0001111111_0_0_0_0_0_0_0_0_0_1_0_0001111111_00000_0000000010   //Food dispensed
0_0001111111_0_0_0_0_0_0_0_0_0_0_0_0001111111_00000_0000000010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

// //testing dispensing food from B4 no change
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001100100_00000_0000000000   //inserting $1.25 
0_0001111101_0_1_0_0_0_0_0_1_0_0_1_0001100100_00000_0000000000   //making B4 selection
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001100100_01001_0000000000   //Telling machine which selection was made
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001100100_01001_0000000000   //Waiting for food to dispense and calculating change
0_0001111101_0_0_0_0_0_0_0_0_0_1_1_0001111101_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from B4 with change   $1.31
0_0010000011_0_0_0_0_0_0_0_0_0_0_1_0010000011_00000_0000000000   //inserting $1.31
0_0010000011_0_1_0_0_0_0_0_1_0_0_1_0010000011_00000_0000000000   //making B4 selection
0_0010000011_0_0_0_0_0_0_0_0_0_0_1_0010000011_01001_0000000000   //Telling machine which selection was made
0_0010000011_0_0_0_0_0_0_0_0_0_0_0_0010000011_01001_0000000110   //Waiting for food to dispense and calculating change
0_0010000011_0_0_0_0_0_0_0_0_0_1_0_0010000011_00000_0000000110   //Food dispensed
0_0010000011_0_0_0_0_0_0_0_0_0_0_0_0010000011_00000_0000000110   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from B5 no change
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_00000_0000000000   //inserting $1.25 
0_0001111101_0_1_0_0_0_0_0_0_1_0_1_0001111101_01010_0000000000   //making B5 selection
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_01010_0000000000   //Telling machine which selection was made
0_0001111101_0_0_0_0_0_0_0_0_0_0_1_0001111101_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001111101_0_0_0_0_0_0_0_0_0_1_1_0001111101_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from B5 with change   $3.25
0_0101000101_0_0_0_0_0_0_0_0_0_0_1_0101000101_00000_0000000000   //inserting $3.25
0_0101000101_0_1_0_0_0_0_0_0_1_0_1_0101000101_00000_0000000000   //making B5 selection
0_0101000101_0_0_0_0_0_0_0_0_0_0_1_0101000101_01010_0000000000   //Telling machine which selection was made
0_0101000101_0_0_0_0_0_0_0_0_0_0_0_0101000101_01010_0011001000   //Waiting for food to dispense and calculating change
0_0101000101_0_0_0_0_0_0_0_0_0_1_0_0101000101_00000_0011001000   //Food dispensed
0_0101000101_0_0_0_0_0_0_0_0_0_1_0_0101000101_00000_0011001000   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from C1 no change
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_00000_0000000000   //inserting $1.50
0_0010010110_0_0_1_0_1_0_0_0_0_0_1_0010010110_00000_0000000000   //making C1 selection
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_01011_0000000000   //Telling machine which selection was made
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_01011_0000000000   //Waiting for food to dispense and calculating change
0_0010010110_0_0_0_0_0_0_0_0_0_1_1_0010010110_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from C1 with change   $1.52
0_0010011000_0_0_0_0_0_0_0_0_0_0_1_0010011000_00000_0000000000   //inserting $1.52
0_0010011000_0_0_1_0_1_0_0_0_0_0_1_0010011000_00000_0000000000   //making C1 selection
0_0010011000_0_0_0_0_0_0_0_0_0_0_1_0010011000_01011_0000000000   //Telling machine which selection was made
0_0010011000_0_0_0_0_0_0_0_0_0_0_0_0010011000_01011_0000000010   //Waiting for food to dispense and calculating change
0_0010011000_0_0_0_0_0_0_0_0_0_1_0_0010011000_00000_0000000010   //Food dispensed
0_0010011000_0_0_0_0_0_0_0_0_0_1_0_0010011000_00000_0000000010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

// //testing dispensing food from C2 no change
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_00000_0000000000   //inserting $1.50
0_0010010110_0_0_1_0_0_1_0_0_0_0_1_0010010110_00000_0000000000   //making C2 selection
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_01100_0000000000   //Telling machine which selection was made
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_01100_0000000000   //Waiting for food to dispense and calculating change
0_0010010110_0_0_0_0_0_0_0_0_0_1_1_0010010110_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from C2 with change   $1.80
0_0010110100_0_0_0_0_0_0_0_0_0_0_1_0010110100_00000_0000000000   //inserting $1.80
0_0010110100_0_0_1_0_0_1_0_0_0_0_1_0010110100_00000_0000000000   //making C2 selection
0_0010110100_0_0_0_0_0_0_0_0_0_0_1_0010110100_01100_0000000000   //Telling machine which selection was made
0_0010110100_0_0_0_0_0_0_0_0_0_0_0_0010110100_01100_0000001111   //Waiting for food to dispense and calculating change
0_0010110100_0_0_0_0_0_0_0_0_0_1_0_0010110100_00000_0000001111   //Food dispensed
0_0010110100_0_0_0_0_0_0_0_0_0_1_0_0010110100_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from C3 no change
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_00000_0000000000   //inserting $1.50
0_0010010110_0_0_1_0_0_0_1_0_0_0_1_0010010110_00000_0000000000   //making C3 selection
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_01101_0000000000   //Telling machine which selection was made
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_01101_0000000000   //Waiting for food to dispense and calculating change
0_0010010110_0_0_0_0_0_0_0_0_0_1_1_0010010110_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from C3 with change   $1.60
0_0010100000_0_0_0_0_0_0_0_0_0_0_1_0010100000_00000_0000000000   //inserting $1.60
0_0010100000_0_0_1_0_0_0_1_0_0_0_1_0010100000_00000_0000000000   //making C3 selection
0_0010100000_0_0_0_0_0_0_0_0_0_0_1_0010100000_01101_0000000000   //Telling machine which selection was made
0_0010100000_0_0_0_0_0_0_0_0_0_0_0_0010100000_01101_0000001010   //Waiting for food to dispense and calculating change
0_0010100000_0_0_0_0_0_0_0_0_0_1_0_0010100000_00000_0000001010   //Food dispensed
0_0010100000_0_0_0_0_0_0_0_0_0_1_0_0010100000_00000_0000001010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from C4 no change
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_00000_0000000000   //inserting $1.50 
0_0010010110_0_0_1_0_0_0_0_1_0_0_1_0010010110_00000_0000000000   //making C4 selection
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_01110_0000000000   //Telling machine which selection was made
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_01110_0000000000   //Waiting for food to dispense and calculating change
0_0010010110_0_0_0_0_0_0_0_0_0_1_1_0010010110_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from C4 with change   $1.70
0_0010101010_0_0_0_0_0_0_0_0_0_0_1_0010101010_00000_0000000000   //inserting $1.15
0_0010101010_0_0_1_0_0_0_0_1_0_0_1_0010101010_00000_0000000000   //making C4 selection
0_0010101010_0_0_0_0_0_0_0_0_0_0_1_0010101010_01110_0000000000   //Telling machine which selection was made
0_0010101010_0_0_0_0_0_0_0_0_0_0_0_0010101010_01110_0000001111   //Waiting for food to dispense and calculating change
0_0010101010_0_0_0_0_0_0_0_0_0_1_0_0010101010_00000_0000001111   //Food dispensed
0_0010101010_0_0_0_0_0_0_0_0_0_1_0_0010101010_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from C5 no change
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_00000_0000000000   //inserting $1.50 
0_0010010110_0_0_1_0_0_0_0_0_1_0_1_0010010110_00000_0000000000   //making C5 selection
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_01111_0000000000   //Telling machine which selection was made
0_0010010110_0_0_0_0_0_0_0_0_0_0_1_0010010110_01111_0000000000   //Waiting for food to dispense and calculating change
0_0010010110_0_0_0_0_0_0_0_0_0_1_1_0010010110_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from C5 with change   $1.56
0_0010011100_0_0_0_0_0_0_0_0_0_0_1_0010011100_00000_0000000000   //inserting $1.56
0_0010011100_0_0_1_0_0_0_0_0_1_0_1_0010011100_00000_0000000000   //making C5 selection
0_0010011100_0_0_0_0_0_0_0_0_0_0_1_0010011100_01111_0000000000   //Telling machine which selection was made
0_0010011100_0_0_0_0_0_0_0_0_0_0_0_0010011100_01111_0000001111   //Waiting for food to dispense and calculating change
0_0010011100_0_0_0_0_0_0_0_0_0_1_0_0010011100_00000_0000001111   //Food dispensed
0_0010011100_0_0_0_0_0_0_0_0_0_1_0_0010011100_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from D1 no change
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_00000_0000000000   //inserting $1.75
0_0010101111_0_0_0_1_1_0_0_0_0_0_1_0010101111_00000_0000000000   //making D1 selection
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_10000_0000000000   //Telling machine which selection was made
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_10000_0000000000   //Waiting for food to dispense and calculating change
0_0010101111_0_0_0_0_0_0_0_0_0_1_1_0010101111_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from D1 with change   $2.25
0_0011100001_0_0_0_0_0_0_0_0_0_0_1_0011100001_00000_0000000000   //inserting $2.25
0_0011100001_0_0_0_1_1_0_0_0_0_0_1_0011100001_00000_0000000000   //making D1 selection
0_0011100001_0_0_0_0_0_0_0_0_0_0_1_0011100001_10000_0000000000   //Telling machine which selection was made
0_0011100001_0_0_0_0_0_0_0_0_0_0_0_0011100001_10000_0000110010   //Waiting for food to dispense and calculating change
0_0011100001_0_0_0_0_0_0_0_0_0_1_0_0011100001_00000_0000110010   //Food dispensed
0_0011100001_0_0_0_0_0_0_0_0_0_1_0_0011100001_00000_0000110010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from D2 no change
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_00000_0000000000   //inserting $1.75
0_0010101111_0_0_0_1_0_1_0_0_0_0_1_0010101111_00000_0000000000   //making D2 selection
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_10001_0000000000   //Telling machine which selection was made
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_10001_0000000000   //Waiting for food to dispense and calculating change
0_0010101111_0_0_0_0_0_0_0_0_0_1_1_0010101111_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from D2 with change   $1.77
0_0010110001_0_0_0_0_0_0_0_0_0_0_1_0010110001_00000_0000000000   //inserting $1.77
0_0010110001_0_0_0_1_0_1_0_0_0_0_1_0010110001_00000_0000000000   //making D2 selection
0_0010110001_0_0_0_0_0_0_0_0_0_0_1_0010110001_10001_0000000000   //Telling machine which selection was made
0_0010110001_0_0_0_0_0_0_0_0_0_0_0_0010110001_10001_0000000010   //Waiting for food to dispense and calculating change
0_0010110001_0_0_0_0_0_0_0_0_0_1_0_0010110001_00000_0000000010   //Food dispensed
0_0010110001_0_0_0_0_0_0_0_0_0_1_0_0010110001_00000_0000000010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from D3 no change
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_00000_0000000000   //inserting $1.75
0_0010101111_0_0_0_1_0_0_1_0_0_0_1_0010101111_00000_0000000000   //making D3 selection
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_10010_0000000000   //Telling machine which selection was made
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_10010_0000000000   //Waiting for food to dispense and calculating change
0_0010101111_0_0_0_0_0_0_0_0_0_1_1_0010101111_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from D3 with change   $1.86
0_0010111010_0_0_0_0_0_0_0_0_0_0_1_0010111010_00000_0000000000   //inserting $1.86
0_0010111010_0_0_0_1_0_0_1_0_0_0_1_0010111010_00000_0000000000   //making D3 selection
0_0010111010_0_0_0_0_0_0_0_0_0_0_1_0010111010_10010_0000000000   //Telling machine which selection was made
0_0010111010_0_0_0_0_0_0_0_0_0_0_0_0010111010_10010_0000001011   //Waiting for food to dispense and calculating change
0_0010111010_0_0_0_0_0_0_0_0_0_1_0_0010111010_00000_0000001011   //Food dispensed
0_0010111010_0_0_0_0_0_0_0_0_0_1_0_0010111010_00000_0000001011   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from D4 no change
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_00000_0000000000   //inserting $1.75
0_0010101111_0_0_0_1_0_0_0_1_0_0_1_0010101111_00000_0000000000   //making D4 selection
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_10011_0000000000   //Telling machine which selection was made
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_10011_0000000000   //Waiting for food to dispense and calculating change
0_0010101111_0_0_0_0_0_0_0_0_0_1_1_0010101111_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from D4 with change   $2.01
0_0011001001_0_0_0_0_0_0_0_0_0_0_1_0011001001_00000_0000000000   //inserting $2.01
0_0011001001_0_0_0_1_0_0_0_1_0_0_1_0011001001_00000_0000000000   //making D4 selection
0_0011001001_0_0_0_0_0_0_0_0_0_0_1_0011001001_10011_0000000000   //Telling machine which selection was made
0_0011001001_0_0_0_0_0_0_0_0_0_0_0_0011001001_10011_0000011010   //Waiting for food to dispense and calculating change
0_0011001001_0_0_0_0_0_0_0_0_0_1_0_0011001001_00000_0000011010   //Food dispensed
0_0011001001_0_0_0_0_0_0_0_0_0_1_0_0011001001_00000_0000011010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

//testing dispensing food from D5 no change
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_00000_0000000000   //inserting $1.75 dollar
0_0010101111_0_0_0_1_0_0_0_0_1_0_1_0010101111_00000_0000000000   //making D5 selection
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_10100_0000000000   //Telling machine which selection was made
0_0010101111_0_0_0_0_0_0_0_0_0_0_1_0010101111_10100_0000000000   //Waiting for food to dispense and calculating change
0_0010101111_0_0_0_0_0_0_0_0_0_1_1_0010101111_00000_0000000000   //Food dispensed


//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000  

//testing dispensing food from D5 with change   $2.26
0_0011100010_0_0_0_0_0_0_0_0_0_0_1_0011100010_00000_0000000000   //inserting $2.26
0_0011100010_0_0_0_1_0_0_0_0_1_0_1_0011100010_00000_0000000000   //making D5 selection
0_0011100010_0_0_0_0_0_0_0_0_0_0_1_0011100010_10100_0000000000   //Telling machine which selection was made
0_0011100010_0_0_0_0_0_0_0_0_0_0_0_0011100010_10100_0000001111   //Waiting for food to dispense and calculating change
0_0011100010_0_0_0_0_0_0_0_0_0_1_0_0011100010_00000_0000001111   //Food dispensed
0_0011100010_0_0_0_0_0_0_0_0_0_1_0_0011100010_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_1_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_1_0000000000_00000_0000000000 

/*****************************************INTEGRATIVE TEST VECTORS**************************************************/
///////////////////////////////////////////////////Testing vending_machine///////////////////////////////////////////////////////////////////////
//Inputs: clock (N/A), reset - 1'b; food_dispensed - 1'b; coin_inserted - 3'b;
//                     A - 1'b; B - 1'b; C - 1'b; D - 1'b; 
//                     ONE - 1'b; TWO - 1'b; THREE - 1'b; FOUR - 1'b; FIVE - 1'b; 
//             
//Outputs: coin_return - 3'b; food_selection - 5'b;  
//format: reset(x), food_dispensed(x), coin_inserted(xxx),A(x), B(x), C(x), D(x), ONE(x), TWO(x), THREE(x), FOUR(x), FIVE(x),  
//        food_selection(xxxxx), coin_to_return(xxx), num_to_display(xxxxxxxxxx) --> x_x_xxx_x_x_x_x_x_x_x_x_x_xxxxx_xxx_xxxxxxxxxx
//*****************************************INTEGRATIVE TESTS*******************************************************/

/////////////////////////////////////////////Base Cases and Initial tests////////////////////////////////////////////////////////////

//testing reset/initializing system
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000

//testing inserting one cent
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //inserting one cent
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000001  //displaying amount inserted
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//resetting system
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //waiting for penny to return
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000  //dispensing penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //waiting for system to settle

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //7

//inserting coins one by one to get to $0.61
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting half dollar
0_0_011_0_0_0_0_0_0_0_0_0_00000_000_0000110010	//inserting dime 
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0000111100	//inserting penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000111101	//displaying amount inserted
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for half dollar to return
0_0_000_0_0_0_0_0_0_0_0_0_00000_101_0000000000	//waiting for dime to return and dispensing half dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_011_0000000000	//waiting for penny to return and dispensing dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000

//making a selection with exact change A1
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar 20
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//displaying amount inserted
0_0_000_1_0_0_0_1_0_0_0_0_00000_000_0001100100	//selecting A1
0_0_000_0_0_0_0_0_0_0_0_0_00001_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00001_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00001_000_0001100100	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00001_000_0001100100	//food_dispensed 24
0_0_000_0_0_0_0_0_0_0_0_0_00001_000_0001100100  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00001_000_0000000000

//making a selection with change A2 $1.15
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_011_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting dime
0_0_010_0_0_0_0_0_0_0_0_0_00000_000_0001101110	//inserting nickel
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001110011	//displaying amount inserted
0_0_000_1_0_0_0_0_1_0_0_0_00000_000_0001110011	//selecting A2
0_0_000_0_0_0_0_0_0_0_0_0_00010_000_0001110011	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00010_000_0001110011	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00010_000_0001110011	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00010_000_0001110011	//food_dispensed
1_0_000_0_0_0_0_0_0_0_0_0_00010_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for dime to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_011_0000000000	//waiting for nickel to return and dispensing dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_010_0000000000	//dispensing nickel
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //40


//making a selection with not enough money A3 $0.75 then adding enough money after
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting half dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0000110010	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001001011	//displaying amount inserted
0_0_000_1_0_0_0_0_0_1_0_0_00000_000_0001001011	//selecting A3
0_0_000_0_0_0_0_0_0_0_0_0_00011_000_0001001011	//telling mahcine which selection made
0_0_000_0_0_0_0_0_0_0_0_0_00011_000_0001001011	//expecting nothing to happen
0_0_100_0_0_0_0_0_0_0_0_0_00011_000_0001001011	//adding an extra quarter
0_0_000_0_0_0_0_0_0_0_0_0_00011_000_0001100100	//displaying total and dispensing food
0_1_000_0_0_0_0_0_0_0_0_0_00011_000_0001100100	//food dispensed
1_0_000_0_0_0_0_0_0_0_0_0_00011_000_0000000000	//asking for change/resetting
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting to make sure no change is dispensed

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////Testing every selection with change//////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000

//making a selection with exact change A1
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar

0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//displaying amount inserted
0_0_000_1_0_0_0_1_0_0_0_0_00000_000_0001100100	//selecting A1
0_0_000_0_0_0_0_0_0_0_0_0_00001_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00001_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00001_000_0001100100	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00001_000_0001100100	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00001_000_0001100100  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00001_000_0000000000

//making a selection with exact change A2
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//displaying amount inserted
0_0_000_1_0_0_0_0_1_0_0_0_00000_000_0001100100	//selecting A2
0_0_000_0_0_0_0_0_0_0_0_0_00010_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00010_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00010_000_0001100100	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00010_000_0001100100	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00010_000_0001100100  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00010_000_0000000000

//making a selection with exact change A3
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//displaying amount inserted
0_0_000_1_0_0_0_0_0_1_0_0_00000_000_0001100100	//selecting A3
0_0_000_0_0_0_0_0_0_0_0_0_00011_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00011_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00011_000_0001100100	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00011_000_0001100100	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00011_000_0001100100  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00011_000_0000000000

//making a selection with exact change A4
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//displaying amount inserted
0_0_000_1_0_0_0_0_0_0_1_0_00000_000_0001100100	//selecting A4
0_0_000_0_0_0_0_0_0_0_0_0_00100_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00100_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00100_000_0001100100	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00100_000_0001100100	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00100_000_0001100100  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00100_000_0000000000

//making a selection with exact change A5
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//displaying amount inserted
0_0_000_1_0_0_0_0_0_0_0_1_00000_000_0001100100	//selecting A5
0_0_000_0_0_0_0_0_0_0_0_0_00101_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00101_000_0001100100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00101_000_0001100100	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00101_000_0001100100	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00101_000_0001100100  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00101_000_0000000000

//making a selection with exact change B1
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001111101	//displaying amount inserted
0_0_000_0_1_0_0_1_0_0_0_0_00000_000_0001111101	//selecting B1
0_0_000_0_0_0_0_0_0_0_0_0_00110_000_0001111101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00110_000_0001111101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00110_000_0001111101	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00110_000_0001111101	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00110_000_0001111101  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00110_000_0000000000  //107

//making a selection with exact change B2
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001111101	//displaying amount inserted
0_0_000_0_1_0_0_0_1_0_0_0_00000_000_0001111101	//selecting B2
0_0_000_0_0_0_0_0_0_0_0_0_00111_000_0001111101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00111_000_0001111101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00111_000_0001111101	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00111_000_0001111101	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00111_000_0001111101  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00111_000_0000000000  //

//making a selection with exact change B3
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001111101	//displaying amount inserted
0_0_000_0_1_0_0_0_0_1_0_0_00000_000_0001111101	//selecting B3
0_0_000_0_0_0_0_0_0_0_0_0_01000_000_0001111101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01000_000_0001111101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01000_000_0001111101	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01000_000_0001111101	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01000_000_0001111101  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_01000_000_0000000000  //

//making a selection with exact change B4
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001111101	//displaying amount inserted
0_0_000_0_1_0_0_0_0_0_1_0_00000_000_0001111101	//selecting B4
0_0_000_0_0_0_0_0_0_0_0_0_01001_000_0001111101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01001_000_0001111101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01001_000_0001111101	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01001_000_0001111101	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01001_000_0001111101  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_01001_000_0000000000  //

//making a selection with exact change B5
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001111101	//displaying amount inserted
0_0_000_0_1_0_0_0_0_0_0_1_00000_000_0001111101	//selecting B5
0_0_000_0_0_0_0_0_0_0_0_0_01010_000_0001111101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01010_000_0001111101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01010_000_0001111101	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01010_000_0001111101	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01010_000_0001111101  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_01010_000_0000000000  //

//making a selection with exact change C1
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//displaying amount inserted
0_0_000_0_0_1_0_1_0_0_0_0_00000_000_0010010110	//selecting C1
0_0_000_0_0_0_0_0_0_0_0_0_01011_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01011_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01011_000_0010010110	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01011_000_0010010110	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01011_000_0010010110  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_01011_000_0000000000  //

//making a selection with exact change C2
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//displaying amount inserted
0_0_000_0_0_1_0_0_1_0_0_0_00000_000_0010010110	//selecting C2
0_0_000_0_0_0_0_0_0_0_0_0_01100_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01100_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01100_000_0010010110	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01100_000_0010010110	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01100_000_0010010110  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_01100_000_0000000000  //

//making a selection with exact change C3
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//displaying amount inserted
0_0_000_0_0_1_0_0_0_1_0_0_00000_000_0010010110	//selecting C3
0_0_000_0_0_0_0_0_0_0_0_0_01101_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01101_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01101_000_0010010110	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01101_000_0010010110	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01101_000_0010010110  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_01101_000_0000000000  //

//making a selection with exact change C4
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//displaying amount inserted
0_0_000_0_0_1_0_0_0_0_1_0_00000_000_0010010110	//selecting C4
0_0_000_0_0_0_0_0_0_0_0_0_01110_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01110_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01110_000_0010010110	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01110_000_0010010110	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01110_000_0010010110  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_01110_000_0000000000  //

//making a selection with exact change C5
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//displaying amount inserted
0_0_000_0_0_1_0_0_0_0_0_1_00000_000_0010010110	//selecting C5
0_0_000_0_0_0_0_0_0_0_0_0_01111_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01111_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01111_000_0010010110	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01111_000_0010010110	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01111_000_0010010110  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_01111_000_0000000000  //197

//making a selection with exact change D1
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010101111	//displaying amount inserted
0_0_000_0_0_0_1_1_0_0_0_0_00000_000_0010101111	//selecting D1
0_0_000_0_0_0_0_0_0_0_0_0_10000_000_0010101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10000_000_0010101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10000_000_0010101111	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_10000_000_0010101111	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_10000_000_0010101111  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_10000_000_0000000000  //

//making a selection with exact change D2
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010101111	//displaying amount inserted
0_0_000_0_0_0_1_0_1_0_0_0_00000_000_0010101111	//selecting D2
0_0_000_0_0_0_0_0_0_0_0_0_10001_000_0010101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10001_000_0010101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10001_000_0010101111	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_10001_000_0010101111	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_10001_000_0010101111  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_10001_000_0000000000  //

//making a selection with exact change D3
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010101111	//displaying amount inserted
0_0_000_0_0_0_1_0_0_1_0_0_00000_000_0010101111	//selecting D3
0_0_000_0_0_0_0_0_0_0_0_0_10010_000_0010101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10010_000_0010101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10010_000_0010101111	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_10010_000_0010101111	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_10010_000_0010101111  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_10010_000_0000000000  //

//making a selection with exact change D4
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010101111	//displaying amount inserted
0_0_000_0_0_0_1_0_0_0_1_0_00000_000_0010101111	//selecting D4
0_0_000_0_0_0_0_0_0_0_0_0_10011_000_0010101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10011_000_0010101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10011_000_0010101111	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_10011_000_0010101111	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_10011_000_0010101111  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_10011_000_0000000000  //

//making a selection with exact change D5
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010101111	//displaying amount inserted
0_0_000_0_0_0_1_0_0_0_0_1_00000_000_0010101111	//selecting D4
0_0_000_0_0_0_0_0_0_0_0_0_10100_000_0010101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10100_000_0010101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10100_000_0010101111	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_10100_000_0010101111	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_10100_000_0010101111  //food picked up

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_10100_000_0000000000  //252

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////Testing every selection with change//////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000

//making a selection with change A1 $1.15
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_011_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting dime
0_0_010_0_0_0_0_0_0_0_0_0_00000_000_0001101110	//inserting nickel
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001110011	//displaying amount inserted
0_0_000_1_0_0_0_1_0_0_0_0_00000_000_0001110011	//selecting A1
0_0_000_0_0_0_0_0_0_0_0_0_00001_000_0001110011	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00001_000_0001110011	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00001_000_0001110011  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_00001_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for dime to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_011_0000000000	//waiting for nickel to return and dispensing dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_010_0000000000	//dispensing nickel
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000 //267

//making a selection with exact change A2 $1.11
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_011_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting dime
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0001101110	//inserting penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001101111	//displaying amount inserted
0_0_000_1_0_0_0_0_1_0_0_0_00000_000_0001101111	//selecting A2
0_0_000_0_0_0_0_0_0_0_0_0_00010_000_0001101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00010_000_0001101111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00010_000_0001101111	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00010_000_0001101111	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00010_000_0001101111  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_00010_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for dime to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_011_0000000000	//waiting for penny to return and dispensing dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //283

//making a selection with exact change A3 $1.35
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_011_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting dime
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001101110	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010000111	//displaying amount inserted
0_0_000_1_0_0_0_0_0_1_0_0_00000_000_0010000111	//selecting A3
0_0_000_0_0_0_0_0_0_0_0_0_00011_000_0010000111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00011_000_0010000111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00011_000_0010000111	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00011_000_0010000111	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00011_000_0010000111   //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_00011_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for quarter to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_100_0000000000	//waiting for dime to return and dispensing quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_011_0000000000	//dispensing dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //299

//making a selection with change A4 $1.50
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting quarter
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001111101	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//displaying amount inserted
0_0_000_1_0_0_0_0_0_0_1_0_00000_000_0010010110	//selecting A4
0_0_000_0_0_0_0_0_0_0_0_0_00100_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00100_000_0010010110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00100_000_0010010110	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00100_000_0010010110	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00100_000_0010010110  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_00100_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for half dollar to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_101_0000000000	//dispensing half dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//314

//making a selection with exact change A5 $1.02
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting penny
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0001100101	//inserting penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001100110	//displaying amount inserted
0_0_000_1_0_0_0_0_0_0_0_1_00000_000_0001100110	//selecting A5
0_0_000_0_0_0_0_0_0_0_0_0_00101_000_0001100110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00101_000_0001100110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00101_000_0001100110	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00101_000_0001100110	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00101_000_0001100110  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_00101_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for first penny to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//waiting for second penny to return and next penny to dispense
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing second penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_0000_000_0000000000	//330

//making a selection with change B1 $1.40
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting quarter
0_0_011_0_0_0_0_0_0_0_0_0_00000_000_0001111101	//inserting dime
0_0_010_0_0_0_0_0_0_0_0_0_00000_000_0010000111	//inserting nickel
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010001100	//displaying amount inserted
0_0_000_0_1_0_0_1_0_0_0_0_00000_000_0010001100	//selecting B1
0_0_000_0_0_0_0_0_0_0_0_0_00110_000_0010001100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00110_000_0010001100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00110_000_0010001100	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00110_000_0010001100	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00110_000_0010001100  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_00110_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for dime penny to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_011_0000000000	//waiting for nickel to return and dispensing dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_010_0000000000	//dispensing nickel
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //347

//making a selection with change B2 $1.27
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting quarter
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0001111101	//inserting penny
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0001111110	//inserting penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0001111111	//displaying amount inserted
0_0_000_0_1_0_0_0_1_0_0_0_00000_000_0001111111	//selecting B2
0_0_000_0_0_0_0_0_0_0_0_0_00111_000_0001111111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00111_000_0001111111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_00111_000_0001111111	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_00111_000_0001111111	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_00111_000_0001111111  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_00111_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for penny to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//waiting for penny to return and dispensing penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //364

//making a selection with change B3 $1.45
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting quarter
0_0_011_0_0_0_0_0_0_0_0_0_00000_000_0001111101	//inserting dime
0_0_011_0_0_0_0_0_0_0_0_0_00000_000_0010000111	//inserting dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010010001	//displaying amount inserted
0_0_000_0_1_0_0_0_0_1_0_0_00000_000_0010010001	//selecting B3
0_0_000_0_0_0_0_0_0_0_0_0_01000_000_0010010001	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01000_000_0010010001	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01000_000_0010010001	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01000_000_0010010001	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01000_000_0010010001  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_01000_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for dime to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_011_0000000000	//waiting for dime to return and dispensing dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_011_0000000000	//dispensing dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //

//making a selection with change B4 $1.60 
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting quarter
0_0_011_0_0_0_0_0_0_0_0_0_00000_000_0001111101	//inserting dime
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0010000111	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010100000	//displaying amount inserted
0_0_000_0_1_0_0_0_0_0_1_0_00000_000_0010100000	//selecting B4
0_0_000_0_0_0_0_0_0_0_0_0_01001_000_0010100000	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01001_000_0010100000	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01001_000_0010100000	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01001_000_0010100000	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01001_000_0010100000  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_01001_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for quarter to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_100_0000000000	//waiting for dime to return and dispensing quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_011_0000000000	//dispensing dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_01000_000_0000000000  //

//making a selection with change B5 $1.51
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting quarter
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0001111101	//inserting penny
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0001111110	//inserting quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010010111	//displaying amount inserted
0_0_000_0_1_0_0_0_0_0_0_1_00000_000_0010010111	//selecting B5
0_0_000_0_0_0_0_0_0_0_0_0_01010_000_0010010111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01010_000_0010010111	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01010_000_0010010111	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01010_000_0010010111	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01010_000_0010010111  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_01010_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for quarter to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_100_0000000000	//waiting for penny to return and dispensing quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //415

//making a selection with change C1 $1.56
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_010_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting nickel
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0010011011	//inserting penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010011100	//displaying amount inserted
0_0_000_0_0_1_0_1_0_0_0_0_00000_000_0010011100	//selecting C1
0_0_000_0_0_0_0_0_0_0_0_0_01011_000_0010011100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01011_000_0010011100	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01011_000_0010011100	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01011_000_0010011100	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01011_000_0010011100  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_01011_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for nickel to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_010_0000000000	//waiting for penny to return and dispensing nickel
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //432

//making a selection with change C2 $1.85
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting quarter
0_0_011_0_0_0_0_0_0_0_0_0_00000_000_0010101111	//inserting dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010111001	//displaying amount inserted
0_0_000_0_0_1_0_0_1_0_0_0_00000_000_0010111001	//selecting C2
0_0_000_0_0_0_0_0_0_0_0_0_01100_000_0010111001	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01100_000_0010111001	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01100_000_0010111001	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01100_000_0010111001	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01100_000_0010111001  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_01100_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for quarter to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_100_0000000000	//waiting for dime to return and dispensing quarter
0_0_000_0_0_0_0_0_0_0_0_0_00000_011_0000000000	//dispensing dime
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //449

//making a selection with exact change C3 $3.50
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting dollar
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0011111010	//inserting dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0101011110	//displaying amount inserted
0_0_000_0_0_1_0_0_0_1_0_0_00000_000_0101011110	//selecting C3
0_0_000_0_0_0_0_0_0_0_0_0_01101_000_0101011110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01101_000_0101011110	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01101_000_0101011110	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01101_000_0101011110	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01101_000_0101011110  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_01101_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for dollar to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_110_0000000000	//waiting for dollar to return and dispensing dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_110_0000000000	//dispensing dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //466

//making a selection with change $2.50 C4
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting half dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0011001000	//displaying amount inserted
0_0_000_0_0_1_0_0_0_0_1_0_00000_000_0011001000	//selecting C4
0_0_000_0_0_0_0_0_0_0_0_0_01110_000_0011001000	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01110_000_0011001000	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01110_000_0011001000	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01110_000_0011001000	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01110_000_0011001000  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_01110_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for half dollar to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_101_0000000000	//dispensing half dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00001_000_0000000000  //

//making a selection with change C5 $2.51
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting half dollar
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0011001000	//inserting penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0011001001	//displaying amount inserted
0_0_000_0_0_1_0_0_0_0_0_1_00000_000_0011001001	//selecting C5
0_0_000_0_0_0_0_0_0_0_0_0_01111_000_0011001001	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01111_000_0011001001	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_01111_000_0011001001	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_01111_000_0011001001	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_01111_000_0011001001  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_01111_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for half dollar to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_101_0000000000	//dispensing half dollar and waiting for penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait


//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  // 498

//making a selection with change D1 $1.77
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting quarter
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0010101111	//inserting penny
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0010110000	//inserting penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010110001	//displaying amount inserted
0_0_000_0_0_0_1_1_0_0_0_0_00000_000_0010110001	//selecting D1
0_0_000_0_0_0_0_0_0_0_0_0_10000_000_0010110001	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10000_000_0010110001	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10000_000_0010110001	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_10000_000_0010110001	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_10000_000_0010110001  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_10000_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for penny to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny and waiting for penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //

//making a selection with change D2 $1.81
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_101_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting half dollar
0_0_100_0_0_0_0_0_0_0_0_0_00000_000_0010010110	//inserting quarter
0_0_010_0_0_0_0_0_0_0_0_0_00000_000_0010101111	//inserting nickel
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0010110100	//inserting penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0010110101	//displaying amount inserted
0_0_000_0_0_0_1_0_1_0_0_0_00000_000_0010110101	//selecting D2
0_0_000_0_0_0_0_0_0_0_0_0_10001_000_0010110101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10001_000_0010110101	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10001_000_0010110101	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_10001_000_0010110101	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_10001_000_0010110101  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_10001_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for nickel to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_010_0000000000	//dispensing nickel and waiting for penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //

//making a selection with change D3 $2.00
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting dollar
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0011001000	//displaying amount inserted
0_0_000_0_0_0_1_0_0_1_0_0_00000_000_0011001000	//selecting D3
0_0_000_0_0_0_0_0_0_0_0_0_10010_000_0011001000	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10010_000_0011001000	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10010_000_0011001000	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_10010_000_0011001000	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_10010_000_0011001000  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_10010_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for quarter to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_100_0000000000	//dispensing quarter 
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //548

//making a selection with change D4 $2.01
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting dollar
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0011001000	//inserting penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0011001001	//displaying amount inserted
0_0_000_0_0_0_1_0_0_0_1_0_00000_000_0011001001	//selecting D4
0_0_000_0_0_0_0_0_0_0_0_0_10011_000_0011001001	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10011_000_0011001001	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10011_000_0011001001	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_10011_000_0011001001	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_10011_000_0011001001  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_10011_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for quarter to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_100_0000000000	//dispensing quarter and waiting for penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_10000_000_0000000000  //564

//making a selection with change D5 $2.02
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//inserting dollar
0_0_110_0_0_0_0_0_0_0_0_0_00000_000_0001100100	//inserting dollar
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0011001000	//inserting penny
0_0_001_0_0_0_0_0_0_0_0_0_00000_000_0011001001	//inserting penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0011001010	//displaying amount inserted
0_0_000_0_0_0_1_0_0_0_1_0_00000_000_0011001010	//selecting D5
0_0_000_0_0_0_0_0_0_0_0_0_10100_000_0011001010	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10100_000_0011001010	//waiting for food to be dispensed
0_0_000_0_0_0_0_0_0_0_0_0_10100_000_0011001010	//waiting for food to be dispensed
0_1_000_0_0_0_0_0_0_0_0_0_10100_000_0011001010	//food_dispensed 
0_0_000_0_0_0_0_0_0_0_0_0_10100_000_0011001010  //food picked up
1_0_000_0_0_0_0_0_0_0_0_0_10100_000_0000000000	//asking for change
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000	//waiting for quarter to return 
0_0_000_0_0_0_0_0_0_0_0_0_00000_100_0000000000	//dispensing quarter and waiting for penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny and waiting for penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_001_0000000000	//dispensing penny
0_0_000_0_0_0_0_0_0_0_0_0_00000_000_0000000000  //wait

//resetting system between tests
1_0_000_0_0_0_0_0_0_0_0_0_10000_000_0000000000  //582
=======

