///////////////////////////////////////////////////Testing vending_machine_FSM///////////////////////////////////////////////////////////////////////
//Inputs: clock (N/A), reset - 1'b; SUM - 10'b; A - 1'b; B - 1'b; C - 1'b; D - 1'b; ONE - 1'b; TWO - 1'b; THREE - 1'b; FOUR - 1'b; FIVE - 1'b; 
//          food_dispensed - 1'b; change_returned - 1'b;  
//Outputs: food_selection - 5'b; load - 1'b; 
//format: reset(x), food_dispensed(x), change_returned (x), SUM(xxxxxxxxxx), A(x), B(x), C(x), D(x), ONE(x), TWO(x), THREE(x), FOUR(x), FIVE(x),  
//        food_selection(xxxxx), load(x) --> x_x_x_xxxxxxxxxxx_x_x_x_x_x_x_x_x_x_xxxxx_x

//testing reset/initializing system
1_0_1_0000000000_0_0_0_0_0_0_0_0_0_00000_0

//testing hitting reset when money has been entered but no selection made
0_0_1_0000000001_0_0_0_0_0_0_0_0_0_00000_0  //inserting one cent
1_0_1_0000000001_0_0_0_0_0_0_0_0_0_00000_0  //hitting reset
0_0_0_0000000001_0_0_0_0_0_0_0_0_0_00000_1  //loading value to rest of circuit
0_0_1_0000000000_0_0_0_0_0_0_0_0_0_00000_0  //when change returned is true again clear sum

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0000000000_00000_0000000000

//testing dispensing food from A1 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0001100100_00000_0000000000   //inserting 1 dollar 0001100100
0_0001100100_1_0_0_0_1_0_0_0_0_0_xxxxxxxxxx_0001100100_00000_0000000000   //making A1 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0001100100_00001_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0001100100_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_xxxxxxxxxx_0001100100_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from A1 with change   $1.15
0_0001110011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0001110011_00000_0000000000   //inserting $1.15 0001110011
0_0001110011_1_0_0_0_1_0_0_0_0_0_xxxxxxxxxx_0001110011_00000_0000000000   //making A1 selection
0_0001110011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0001110011_00001_0000000000   //Telling machine which selection was made
0_0001110011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0001110011_00001_0000001111   //Waiting for food to dispense and calculating change
0_0001110011_0_0_0_0_0_0_0_0_0_1_xxxxxxxxxx_0001110011_00000_0000001111   //Food dispensed
0_0001110011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0001110011_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from A2 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_0_1_0_0_0_0_xxxxxxxxxx_0001100100_00000_0000000000   //making A2 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0001100100_00010_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0001100100_00010_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_xxxxxxxxxx_0001100100_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from A2 with change   $1.06
0_0001101010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001110011_00000_0000000000   //inserting $1.06
0_0001101010_1_0_0_0_0_1_0_0_0_0_xxxxxxxxx_0001110011_00000_0000000000   //making A2 selection
0_0001101010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001110011_00010_0000000000   //Telling machine which selection was made
0_0001101010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001110011_00010_0000000110   //Waiting for food to dispense and calculating change
0_0001101010_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001110011_00000_0000000110   //Food dispensed
0_0001101010_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001110011_00000_0000000110   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from A3 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_0_0_1_0_0_0_xxxxxxxxx_0001100100_00000_0000000000   //making A3 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_00011_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_00011_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001100100_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from A3 with change   $1.26
0_0001111110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001110011_00000_0000000000   //inserting $1.26
0_0001111110_1_0_0_0_0_0_1_0_0_0_xxxxxxxxx_0001110011_00000_0000000000   //making A3 selection
0_0001111110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001110011_00011_0000000000   //Telling machine which selection was made
0_0001111110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001110011_00011_0000011010   //Waiting for food to dispense and calculating change
0_0001111110_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001110011_00000_0000011010   //Food dispensed
0_0001111110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001110011_00000_0000011010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from A4 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_0_0_0_1_0_0_xxxxxxxxx_0001100100_00000_0000000000   //making A4 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_00100_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_00100_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001100100_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from A4 with change $1.55
0_0010011011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010011011_00000_0000000000   //inserting $1.55
0_0010011011_1_0_0_0_0_0_0_1_0_0_xxxxxxxxx_0010011011_00000_0000000000   //making A4 selection
0_0010011011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010011011_00100_0000000000   //Telling machine which selection was made
0_0010011011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010011011_00100_0000110111   //Waiting for food to dispense and calculating change
0_0010011011_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010011011_00000_0000110111   //Food dispensed
0_0010011011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010011011_00000_0000110111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from A5 no change
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_00000_0000000000   //inserting 1 dollar
0_0001100100_1_0_0_0_0_0_0_0_1_0_xxxxxxxxx_0001100100_00000_0000000000   //making A5 selection
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_00101_0000000000   //Telling machine which selection was made
0_0001100100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_00101_0000000000   //Waiting for food to dispense and calculating change
0_0001100100_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001100100_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from A5 with change   $1.30
0_0010000010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010000010_00000_0000000000   //inserting $1.30
0_0010000010_1_0_0_0_0_0_0_0_1_0_xxxxxxxxx_0010000010_00000_0000000000   //making A5 selection
0_0010000010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010000010_00101_0000000000   //Telling machine which selection was made
0_0010000010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010000010_00101_0000011110   //Waiting for food to dispense and calculating change
0_0010000010_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010000010_00000_0000011110   //Food dispensed
0_0010000010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010000010_00000_0000011110   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

// //testing dispensing food from B1 no change
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_00000_0000000000   //inserting $1.25 
0_0001111101_0_1_0_0_1_0_0_0_0_0_xxxxxxxxx_0001111101_00000_0000000000   //making B1 selection
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_00110_0000000000   //Telling machine which selection was made
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_00110_0000000000   //Waiting for food to dispense and calculating change
0_0001111101_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001111101_00000_0000000000   //Food dispensed

// //resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from B1 with change   $1.40
0_0010001100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010001100_00000_0000000000   //inserting $1.40
0_0010001100_0_1_0_0_1_0_0_0_0_0_xxxxxxxxx_0010001100_00000_0000000000   //making B1 selection
0_0010001100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010001100_00110_0000000000   //Telling machine which selection was made
0_0010001100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010001100_00110_0000001111   //Waiting for food to dispense and calculating change
0_0010001100_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010001100_00000_0000001111   //Food dispensed
0_0010001100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010001100_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

// //testing dispensing food from B2 no change
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_00000_0000000000   //inserting $1.25 dollar
0_0001111101_0_1_0_0_0_1_0_0_0_0_xxxxxxxxx_0001111101_00000_0000000000   //making B2 selection
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_00111_0000000000   //Telling machine which selection was made
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_00111_0000000000   //Waiting for food to dispense and calculating change
0_0001111101_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001111101_00000_0000000000   //Food dispensed

// //resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from B2 with change   $1.45
0_0010010001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010001_00000_0000000000   //inserting $1.45
0_0010010001_0_1_0_0_0_1_0_0_0_0_xxxxxxxxx_0010010001_00000_0000000000   //making B2 selection
0_0010010001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010001_00111_0000000000   //Telling machine which selection was made
0_0010010001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010001_00111_0000010100   //Waiting for food to dispense and calculating change
0_0010010001_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010010001_00000_0000010100   //Food dispensed
0_0010010001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010001_00000_0000010100   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

// //testing dispensing food from B3 no change
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_00000_0000000000   //inserting $1.25
0_0001111101_0_1_0_0_0_0_1_0_0_0_xxxxxxxxx_0001111101_00000_0000000000   //making B3 selection
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_01000_0000000000   //Telling machine which selection was made
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_01000_0000000000   //Waiting for food to dispense and calculating change
0_0001111101_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001111101_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from B3 with change   $1.27
0_0001111111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111111_00000_0000000000   //inserting $1.27
0_0001111111_0_1_0_0_0_0_1_0_0_0_xxxxxxxxx_0001111111_00000_0000000000   //making B3 selection
0_0001111111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111111_01000_0000000000   //Telling machine which selection was made
0_0001111111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111111_01000_0000000010   //Waiting for food to dispense and calculating change
0_0001111111_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001111111_00000_0000000010   //Food dispensed
0_0001111111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111111_00000_0000000010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

// //testing dispensing food from B4 no change
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_00000_0000000000   //inserting $1.25 
0_0001111101_0_1_0_0_0_0_0_1_0_0_xxxxxxxxx_0001100100_00000_0000000000   //making B4 selection
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_01001_0000000000   //Telling machine which selection was made
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001100100_01001_0000000000   //Waiting for food to dispense and calculating change
0_0001111101_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001111101_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from B4 with change   $1.31
0_0010000011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010000011_00000_0000000000   //inserting $1.31
0_0010000011_0_1_0_0_0_0_0_1_0_0_xxxxxxxxx_0010000011_00000_0000000000   //making B4 selection
0_0010000011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010000011_01001_0000000000   //Telling machine which selection was made
0_0010000011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010000011_01001_0000000110   //Waiting for food to dispense and calculating change
0_0010000011_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010000011_00000_0000000110   //Food dispensed
0_0010000011_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010000011_00000_0000000110   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from B5 no change
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_00000_0000000000   //inserting $1.25 
0_0001111101_0_1_0_0_0_0_0_0_1_0_xxxxxxxxx_0001111101_01010_0000000000   //making B5 selection
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_01010_0000000000   //Telling machine which selection was made
0_0001111101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0001111101_00001_0000000000   //Waiting for food to dispense and calculating change
0_0001111101_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0001111101_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from B5 with change   $3.25
0_0101000101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0101000101_00000_0000000000   //inserting $3.25
0_0101000101_0_1_0_0_0_0_0_0_1_0_xxxxxxxxx_0101000101_00000_0000000000   //making B5 selection
0_0101000101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0101000101_01010_0000000000   //Telling machine which selection was made
0_0101000101_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0101000101_01010_0011001000   //Waiting for food to dispense and calculating change
0_0101000101_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0101000101_00000_0011001000   //Food dispensed
0_0101000101_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0101000101_00000_0011001000   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from C1 no change
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_00000_0000000000   //inserting $1.50
0_0010010110_0_0_1_0_1_0_0_0_0_0_xxxxxxxxx_0010010110_00000_0000000000   //making C1 selection
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_01011_0000000000   //Telling machine which selection was made
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_01011_0000000000   //Waiting for food to dispense and calculating change
0_0010010110_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010010110_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from C1 with change   $1.52
0_0010011000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010011000_00000_0000000000   //inserting $1.52
0_0010011000_0_0_1_0_1_0_0_0_0_0_xxxxxxxxx_0010011000_00000_0000000000   //making C1 selection
0_0010011000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010011000_01011_0000000000   //Telling machine which selection was made
0_0010011000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010011000_01011_0000000010   //Waiting for food to dispense and calculating change
0_0010011000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010011000_00000_0000000010   //Food dispensed
0_0010011000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010011000_00000_0000000010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

// //testing dispensing food from C2 no change
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_00000_0000000000   //inserting $1.50
0_0010010110_0_0_1_0_0_1_0_0_0_0_xxxxxxxxx_0010010110_00000_0000000000   //making C2 selection
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_01100_0000000000   //Telling machine which selection was made
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_01100_0000000000   //Waiting for food to dispense and calculating change
0_0010010110_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010010110_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from C2 with change   $1.80
0_0010110100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010110100_00000_0000000000   //inserting $1.80
0_0010110100_0_0_1_0_0_1_0_0_0_0_xxxxxxxxx_0010110100_00000_0000000000   //making C2 selection
0_0010110100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010110100_01100_0000000000   //Telling machine which selection was made
0_0010110100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010110100_01100_0000001111   //Waiting for food to dispense and calculating change
0_0010110100_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010110100_00000_0000001111   //Food dispensed
0_0010110100_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010110100_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from C3 no change
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_00000_0000000000   //inserting $1.50
0_0010010110_0_0_1_0_0_0_1_0_0_0_xxxxxxxxx_0010010110_00000_0000000000   //making C3 selection
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_01101_0000000000   //Telling machine which selection was made
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_01101_0000000000   //Waiting for food to dispense and calculating change
0_0010010110_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010010110_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from C3 with change   $1.60
0_0010100000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010100000_00000_0000000000   //inserting $1.60
0_0010100000_0_0_1_0_0_0_1_0_0_0_xxxxxxxxx_0010100000_00000_0000000000   //making C3 selection
0_0010100000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010100000_01101_0000000000   //Telling machine which selection was made
0_0010100000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010100000_01101_0000001010   //Waiting for food to dispense and calculating change
0_0010100000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010100000_00000_0000001010   //Food dispensed
0_0010100000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010100000_00000_0000001010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from C4 no change
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_00000_0000000000   //inserting $1.50 
0_0010010110_0_0_1_0_0_0_0_1_0_0_xxxxxxxxx_0010010110_00000_0000000000   //making C4 selection
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_01110_0000000000   //Telling machine which selection was made
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_01110_0000000000   //Waiting for food to dispense and calculating change
0_0010010110_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010010110_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from C4 with change   $1.70
0_0010101010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101010_00000_0000000000   //inserting $1.15
0_0010101010_0_0_1_0_0_0_0_1_0_0_xxxxxxxxx_0010101010_00000_0000000000   //making C4 selection
0_0010101010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101010_01110_0000000000   //Telling machine which selection was made
0_0010101010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101010_01110_0000001111   //Waiting for food to dispense and calculating change
0_0010101010_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010101010_00000_0000001111   //Food dispensed
0_0010101010_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010101010_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from C5 no change
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_00000_0000000000   //inserting $1.50 
0_0010010110_0_0_1_0_0_0_0_0_1_0_xxxxxxxxx_0010010110_00000_0000000000   //making C5 selection
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_01111_0000000000   //Telling machine which selection was made
0_0010010110_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010010110_01111_0000000000   //Waiting for food to dispense and calculating change
0_0010010110_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010010110_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from C5 with change   $1.56
0_0010011100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010011100_00000_0000000000   //inserting $1.56
0_0010011100_0_0_1_0_0_0_0_0_1_0_xxxxxxxxx_0010011100_00000_0000000000   //making C5 selection
0_0010011100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010011100_01111_0000000000   //Telling machine which selection was made
0_0010011100_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010011100_01111_0000001111   //Waiting for food to dispense and calculating change
0_0010011100_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010011100_00000_0000001111   //Food dispensed
0_0010011100_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010011100_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from D1 no change
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_00000_0000000000   //inserting $1.75
0_0010101111_0_0_0_1_1_0_0_0_0_0_xxxxxxxxx_0010101111_00000_0000000000   //making D1 selection
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_10000_0000000000   //Telling machine which selection was made
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_10000_0000000000   //Waiting for food to dispense and calculating change
0_0010101111_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010101111_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from D1 with change   $2.25
0_0011100001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0011100001_00000_0000000000   //inserting $2.25
0_0011100001_0_0_0_1_1_0_0_0_0_0_xxxxxxxxx_0011100001_00000_0000000000   //making D1 selection
0_0011100001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0011100001_10000_0000000000   //Telling machine which selection was made
0_0011100001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0011100001_10000_0000110010   //Waiting for food to dispense and calculating change
0_0011100001_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0011100001_00000_0000110010   //Food dispensed
0_0011100001_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0011100001_00000_0000110010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from D2 no change
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_00000_0000000000   //inserting $1.75
0_0010101111_0_0_0_1_0_1_0_0_0_0_xxxxxxxxx_0010101111_00000_0000000000   //making D2 selection
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_10001_0000000000   //Telling machine which selection was made
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_10001_0000000000   //Waiting for food to dispense and calculating change
0_0010101111_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010101111_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from D2 with change   $1.77
0_0010110001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010110001_00000_0000000000   //inserting $1.77
0_0010110001_0_0_0_1_0_1_0_0_0_0_xxxxxxxxx_0010110001_00000_0000000000   //making D2 selection
0_0010110001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010110001_10001_0000000000   //Telling machine which selection was made
0_0010110001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010110001_10001_0000000010   //Waiting for food to dispense and calculating change
0_0010110001_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010110001_00000_0000000010   //Food dispensed
0_0010110001_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010110001_00000_0000000010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from D3 no change
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_00000_0000000000   //inserting $1.75
0_0010101111_0_0_0_1_0_0_1_0_0_0_xxxxxxxxx_0010101111_00000_0000000000   //making D3 selection
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_10010_0000000000   //Telling machine which selection was made
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_10010_0000000000   //Waiting for food to dispense and calculating change
0_0010101111_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010101111_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from D3 with change   $1.86
0_0010111010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010111010_00000_0000000000   //inserting $1.86
0_0010111010_0_0_0_1_0_0_1_0_0_0_xxxxxxxxx_0010111010_00000_0000000000   //making D3 selection
0_0010111010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010111010_10010_0000000000   //Telling machine which selection was made
0_0010111010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010111010_10010_0000001011   //Waiting for food to dispense and calculating change
0_0010111010_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010111010_00000_0000001011   //Food dispensed
0_0010111010_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010111010_00000_0000001011   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from D4 no change
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_00000_0000000000   //inserting $1.75
0_0010101111_0_0_0_1_0_0_0_1_0_0_xxxxxxxxx_0010101111_00000_0000000000   //making D4 selection
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_10011_0000000000   //Telling machine which selection was made
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_10011_0000000000   //Waiting for food to dispense and calculating change
0_0010101111_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010101111_00000_0000000000   //Food dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from D4 with change   $2.01
0_0011001001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0011001001_00000_0000000000   //inserting $2.01
0_0011001001_0_0_0_1_0_0_0_1_0_0_xxxxxxxxx_0011001001_00000_0000000000   //making D4 selection
0_0011001001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0011001001_10011_0000000000   //Telling machine which selection was made
0_0011001001_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0011001001_10011_0000011010   //Waiting for food to dispense and calculating change
0_0011001001_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0011001001_00000_0000011010   //Food dispensed
0_0011001001_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0011001001_00000_0000011010   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 

//testing dispensing food from D5 no change
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_00000_0000000000   //inserting $1.75 dollar
0_0010101111_0_0_0_1_0_0_0_0_1_0_xxxxxxxxx_0010101111_00000_0000000000   //making D5 selection
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_10100_0000000000   //Telling machine which selection was made
0_0010101111_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0010101111_10100_0000000000   //Waiting for food to dispense and calculating change
0_0010101111_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0010101111_00000_0000000000   //Food dispensed


//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000  

//testing dispensing food from D5 with change   $2.26
0_0011100010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0011100010_00000_0000000000   //inserting $2.26
0_0011100010_0_0_0_1_0_0_0_0_1_0_xxxxxxxxx_0011100010_00000_0000000000   //making D5 selection
0_0011100010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0011100010_10100_0000000000   //Telling machine which selection was made
0_0011100010_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0011100010_10100_0000001111   //Waiting for food to dispense and calculating change
0_0011100010_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0011100010_00000_0000001111   //Food dispensed
0_0011100010_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0011100010_00000_0000001111   //Waiting for change to dispense
0_0000000000_0_0_0_0_0_0_0_0_0_1_xxxxxxxxx_0000000000_00000_0000000000   //Change dispensed

//resetting system between tests
1_0000000000_0_0_0_0_0_0_0_0_0_0_xxxxxxxxx_0000000000_00000_0000000000 
