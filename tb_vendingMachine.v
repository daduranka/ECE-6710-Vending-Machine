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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ps/1ps

module tb_vending_machine();

reg clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed;
reg [2:0] coin_inserted;

wire [2:0] coin_to_return;
wire [4:0] food_selection;
wire [9:0] num_to_display;

//wire load_wire, change_returned_wire;
//wire [9:0] SUM_wire, return_amount_wire;

integer i;

vending_machine uut(
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
	 .coin_inserted(coin_inserted),
    .coin_to_return(coin_to_return),
    .num_to_display(num_to_display),
    .food_selection(food_selection)
);

reg [31:0] test_vector [1000:0];

reg [2:0] expected_coin;
reg [4:0] expected_selection;
reg [9:0] expected_display;

initial begin
   
    $readmemb("C:/intelFPGA_lite/18.0/vending_machine/vending_machine_testVectors.txt", test_vector);
    
    clock = 0;
    i = 0;
    reset = 1;
    {food_dispensed, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, coin_inserted} = 13'b0;
    coin_inserted = 3'b0;
    #10;

end

always @ (posedge clock) begin

    {reset, food_dispensed, coin_inserted, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, expected_selection, expected_coin, expected_display} = test_vector[i]; #10;

end

always@(negedge clock) begin

    if(expected_coin != coin_to_return) begin
        
        $display("Test number %d failed: Wrong coin returned; the expected coin %b != the calculated coin %b", i, expected_coin, coin_to_return);
        
    
    end
    else if(expected_display != num_to_display) begin
    
        $display("Test number %d failed: Wrong num displayed; the expected num %b != the calculated num %b", i, expected_display, num_to_display);
        

    end
    else if(expected_selection != food_selection) begin
    
        $display("Test number %d failed: Wrong food selected; the expected selection %b != the calculated selection %b", i, expected_selection, food_selection);
        

    end
    else begin
        
        $display("Test number %d passed!", i);
        
    end
    
    i = i + 1;

end

always #5 clock = ~ clock;

endmodule 