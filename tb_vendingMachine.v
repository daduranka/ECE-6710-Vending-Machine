//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ECE 6710 VLSI Project: Vending Machine Controller
// Student: Braden Brown
//
// Description: This code represents the testbench of a Vending Machine controller (see vendingMachine.v). 
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
//
// This program attempts to test as many of the possible inputs as possible to verify correct operation. 
// With two five bit inputs this results in a minumum of 2^10 or 1024 inputs. 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//*****************************************INTEGRATIVE TESTS*******************************************************/
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ps/1ps

module tb_vendingMachine();

reg clock, reset, food_dispensed, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE;
reg [2:0] inserted_coin;

wire [2:0] coin_to_return;
wire [4:0] food_selection;
wire [9:0] num_to_display

integer [31:0] i;

coin_summer uut(
    .clock(clock),
    .reset(reset),
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .ONE(ONE),
    .TWO(TWO),
    .THREE(THREE),
    .FOUR(FOUR),
    .FIVE(FIVE),
    .food_dispensed(food_dispensed),
    .coin_to_return(coin_to_return),
    .num_to_display(num_to_display),
    .food_selection(food_selection)
);

logic [13:0] test_vector [32:0];

logic [2:0] expected_return_coin;
logic [4:0] expected_food_selection;
logic [9:0] expected_num_to_display;

initial begin
   
    $readmemb("coin_summer_testVectors", test_vector);
    
    clock = 0;
    i = 0;
    reset = 1;
    {A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed, change_dispensed}
    coin_inserted = 3'b0;

end

always @ (posedge clock) begin

    {reset, inserted_coin, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed, change_dispensed, expected_return_coin, expected_num_to_display, expected_food_selection} = test_vector[i]; #10;

end

always@(negedge clock) begin

    if(expected_return_coin != coin_to_return) begin
        
        $display("Test number %d failed: Wrong coin returned; the expected coin %b != the calculated coin %b", i, expected_return_coin, coin_to_return);
    
    end
    else if(expected_num_to_display != num_to_display) begin
    
        $display("Test number %d failed: Wrong num displayed; the expected num %b != the calculated num %b", i, expected_num_to_display, num_to_display);

    end
    else if(expected_food_selection != food_selection) begin
    
        $display("Test number %d failed: Wrong food selected; the expected selection %b != the calculated selection %b", i, expected_food_selection, food_selection);

    end
    else begin
        
        $display("Test number %d passed!", i);
    end
    
    i = i + 1;

end

always #5 clock = ~ clock;

endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//*********************************************UNIT TESTS**********************************************************/
//Testing coin_summer

//Testing coin_dispenser

//Testing vending_machine_FSM

//Input: inserted_coin 3'b - 000 = default; 001 = penny (1); 010 = nickel(5), 011 = dime(10), 100 = quarter(25), 
//101 = half-dollar (50), 110 = dollar(100), reset - 1'b;
//Outputs: sum: 10'b
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module tb_coin_summer();

reg clock, reset;
reg [2:0] inserted_coin;
wire [9:0] sum;

integer [31:0] i;

coin_summer uut(
    .clock(clock),
    .reset(reset),
    .inserted_coin(inserted_coin),
    .sum(sum)
);

logic [13:0] test_vector [20:0];

logic [9:0] expected_sum;


initial begin
   
    $readmemb("coin_summer_testVectors", test_vector);
    
    clock = 0;
    i = 0;
    reset = 1;
    coin_inserted = 3'b0;

end

always @ (posedge clock) begin

    {reset, inserted_coin, expected_sum} = test_vector[i]; #10;

end

always@(negedge clock) begin

    if(expected_sum != sum) begin
        
        $display("Test number %d failed: Wrong output for inputs %b and %b; the expected sum %b != the calculated sum %b", i, reset, inserted_coin, expected_sum, sum);
    
    end
    else begin
        
        $display("Test number %d passed!", i);
    end
    i = i + 1;

end

always #5 clock = ~ clock;

endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Inputs: clock (N/A), reset - 1'b; SUM - 10'b; A - 1'b; B - 1'b; C - 1'b; D - 1'b; ONE - 1'b; TWO - 1'b; THREE - 1'b; FOUR - 1'b; FIVE - 1'b; 
//          food_dispensed - 1'b; change_dispensed - 1'b;  
//Outputs: num_to_display - 10'b; food_selection - 5'b; amount_to_return - 10'b; 
//format: reset(x), SUM(xxxxxxxxxx), A(x), B(x), C(x), D(x), ONE(x), TWO(x), THREE(x), FOUR(x), FIVE(x), food_dispensed(x), change_dispensed(x) 
//        num_to_display(xxxxxxxxxx), food_selection(xxxxx), amount_to_return (xxxxxxxxxx)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module tb_vending_machine_FSM();

reg clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed, change_dispensed;
reg [9:0] SUM;

wire [9:0] num_to_display, amount_to_return;
wire [4:0] food_selection;

integer [31:0] i;

vending_machine_FSM uut(

    .clock(clock),
    .reset(reset),
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .ONE(ONE),
    .TWO(TWO),
    .THREE(THREE),
    .FOUR(FOUR),
    .FIVE(FIVE),
    .food_dispensed(food_dispensed),
    .change_dispensed(change_dispensed),
    .SUM(SUM),
    .num_to_display(num_to_display),
    .amount_to_return(amount_to_return),
    .food_selection(food_selection)
);

logic [13:0] test_vector [20:0];

logic [9:0] expected_num_to display, expected_amount_to_return;

logic [4:0] expected_food_selection;


initial begin
   
    $readmemb("coin_summer_testVectors", test_vector);
    
    clock = 0;
    i = 0;
    reset = 1;
    {A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed, change_dispensed} = 11'b0;
    SUM = 10'b0

end

always @ (posedge clock) begin

    {reset, SUM, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed, change_dispensed, expected_num_to_display, expected_food_selection, expected_amount_to_return} = test_vector[i]; #10;

end

always@(negedge clock) begin

    if(expected_num_to_display != num_to_display) begin
        
        $display("Test number %d failed: Wrong display value, the expected num_to_display %b != the calculated num_to_display %b", i, expected_num_to_display, num_to_display);
    
    end

    else if(expected_food_selection != food_selection) begin

        $display("Test number %d failed: Wrong food selection value, the expected food selection value %b != the calcuated food_selection value %b", i, expected_food_selection, food_selection);
    
    
    end
    
    else if(expected_amount_to_return != amount_to_return) begin

        $display("Test number %d failed: Wrong food selection value, the expected return value %b != the calcuated return value %b", i, expected_amount_to_return, amount_to_return);
    
    
    end
    
    else begin
        
        $display("Test number %d passed!", i);
    
    end
    
    i = i + 1;

end

always #5 clock = ~ clock;

endmodule

//Input: amount_to_return 10'b - (sum - cost); 
//Outputs: 3'b - coin to return penny(001), nickel(010), dime(011), quarter(100), half-dollar(101), dollar(110)
//format: amount_to_return(xxxxxxxxxx), coin_to_return(xxx), change_returned 1'b (x) ----> xxxxxxxxxx_xxx_x

module tb_coin_dispenser();

reg clock, reset;
reg [2:0] inserted_coin;
wire [9:0] sum;

integer [31:0] i;

coin_summer uut(
    .clock(clock),
    .reset(reset),
    .amount_to_return(amount_to_return),
    .coin_to_return(coin_to_return),
    .change_returned(change_returned)
);

logic [13:0] test_vector [100:0];

logic [2:0] expected_coin;

logic expected_return;


initial begin

    $readmemb("coin_dispenser_testVectors", test_vector);
    clock = 0;
    i = 0;
    amount_to_return = 10'b0;

end

always@(posedge clock) begin

    {amount_to_return, expected_coin, expected_return} = test_vector[i]; #10;

end

always@(negedge clock) begin

    if(expected_coin != coin_to_return) begin
        
        $display("Test number %d failed: Wrong coin dispensed, expected coin: %b coin_to_return: %b", i, expected_coin, coin_to_return);
    
    end
    
    else if(expected_return != change_returned) begin
        
        $display("Test number %d failed: Wrong change returned signal: expected_return: %b change_returned: %b", i, expected_return, change_returned);
    
    end
    
    else begin
        
        $display("Test number %d passed!", i);
    
    end
    
    i = i + 1;

end

always #5 clock = ~ clock;

endmodule

module tb_bcd_converter();


endmodule