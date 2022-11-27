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
1_0_0_0000000001_0_0_0_0_0_0_0_0_0_00000_1  //hitting reset
0_0_0_0000000001_0_0_0_0_0_0_0_0_0_00000_1  //loading value to rest of circuit
0_0_1_0000000000_0_0_0_0_0_0_0_0_0_00000_0  //when change returned is true again clear sum

//resetting system between tests
1_0_1_0000000000_0_0_0_0_0_0_0_0_0_00000_0

//testing dispensing food from A1 no change
0_0_1_0001100100_0_0_0_0_0_0_0_0_0_00000_0   //inserting 1 dollar 0001100100
0_0_0_0001100100_1_0_0_0_1_0_0_0_0_00000_0   //making A1 selection
0_0_0_0001100100_1_0_0_0_1_0_0_0_0_00001_0   //telling machine which selection was made
0_0_0_0001100100_0_0_0_0_0_0_0_0_0_00000_1   //loading value
0_0_0_0001100100_0_0_0_0_0_0_0_0_0_00000_1   //waiting for food to dispense
0_1_0_0001100100_0_0_0_0_0_0_0_0_0_00000_1   //Food dispensed
0_0_1_0000000000_0_0_0_0_0_0_0_0_0_00000_0   //change returned

//resetting system between tests
1_0_1_0000000000_0_0_0_0_0_0_0_0_0_00000_0 

//testing dispensing food from A1 with change   $1.15
0_0_1_0001110011_0_0_0_0_0_0_0_0_0_00000_0   //inserting $1.15 0001110011
0_0_0_0001110011_1_0_0_0_1_0_0_0_0_00000_0   //making A1 selection
0_0_0_0001110011_1_0_0_0_1_0_0_0_0_00001_0   //Telling machine which selection was made
0_0_0_0001110011_0_0_0_0_0_0_0_0_0_00000_1   //loading value
0_0_0_0001110011_0_0_0_0_0_0_0_0_0_00000_1   //waiting for food to dispense
0_1_0_0001110011_0_0_0_0_0_0_0_0_0_00000_1   //food dispensed
0_0_0_0001110011_0_0_0_0_0_0_0_0_0_00000_1   //waiting for change to dispense
0_0_1_0001110011_0_0_0_0_0_0_0_0_0_00000_0   //change returned
