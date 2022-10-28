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

`timescale 1ns/1ps

module tb_vendingMachine();

//*********************************************UNIT TESTS**********************************************************/
//Testing coin_summer

//Testing coin_dispenser

//Testing vending_machine_FSM



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


endmodule