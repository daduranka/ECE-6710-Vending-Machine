# ECE-6710-Vending-Machine

#student name: Braden Brown 

#Project: VLSI design of a vending machine controller

This project entails designing a vending machine controller starting from Verilog and ending with tape out. 
The vending machine will have 5 functions: 
    1. Reading the user’s selection 
    2. Counting coins and displaying current values on a BCD display 
    3. Dispensing food selection after checking correct amount of money is deposited 
    4. Checking if the food has been dispensed (assuming a pressure sensor is connected to the controller) 
       and dispensing until the food has been released 
    5. Dispensing change after food has been released. 
 
It is assumed that the vending machine this controller will work with has 4 rows with 5 options on each row making a possible 20 selections. Each selection will have two identifiers a row identifier (A, B, C, D) and a column identifier (1, 2, 3, 4, 5) with each row having a different set price.

