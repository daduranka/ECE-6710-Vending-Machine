# ECE-6710-Vending-Machine

#Student name: Braden Brown 

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

Stretch Goals:

If I'm able to stay on top of deadlines I hope to be able to also add in some or all of the following functionalities:
    1. Max input limit on the amount of change put into the machine, i.e. after 10 dollars has been input 
       additional coins will be returned 
    2. A cancel option that will stop dispensing the food and return the input money back to the user as long
       as the food hasn't been dispensed already
    3. The option to make mulitple selections as long as enough money is input
    4. An additional display that shows how what selection(s) is being made and gives different prompts
       to the user

Physical Considerations:

The end tape out design is meant to fit on a 2.9mm x 3.52 mm silicon area and has a limit of 38 I/O pads and 4 power pads (42 total). 

My current design uses 35 input and output pins. 

The inputs include:  
    1. 3 bit input that specifies which coin was inserted (penny, nickel, dime, quarter, half dollar, or dollar)
    2. 9 separate one bit inputs that represent each of the 9 user selection buttons
    3. 1 clock signal
    4. 1 reset signal (push button among user selection options for cancelling order and starting a new order)
    5. 1 bit pressure sensor signal that signals if food has been dispensed or not

The outputs include:
    1. 3 bit output that specifies which coin needs to be returned to give the user their change
    2. 5 bit output that signals which selection to dispense
    3. (12 bits) 3 separate four bit outputs used to control the 3 hex to 7 seg displays that say how much money has been inserted 

Researching some commerical models showed that a clock signal of 100-300 MHz is common; I assume I won't be as skilled as a professional designer in this design so I will plan on using a 50 MHz clock with 300 MHz being the stretch goal. The safety goal will be to use an 8 MHz clock. 

With push buttons in play, debouncing will need to occurr. This can be done by using a clock divder to slow down the number of times the clock will allow a read from the button being pressed. 

Project Deliverables/Milestones:

The first project milestone will be to have a completed repository with the necessary files along with completing research into normal clock rates for similar devices. I will also have tried to identify the different risks associated with the machine and how I will adress them. I will also want to have the tests written for a few of the modules like displaying the amount of money that has been input into the system. 

The second project milestone will be to have completed all of the tests in the testbench and have completed the rest of the verilog design modules. I will also attempt to have completed the integrative testing of the verilog code at this point. I will synthesize the verilog at this point and have performed another synythesis using synopsys DC to further verify the design and to check the post synthesis area. 

The third project milestone will be an RTL freeze. This means that all no further Verilog design will be completed. The RTL implementation will have been validated with modelsim or a similar product at this point. 

The fourth project milestone will be the final tapeout step when a .gds file will be created and the project will be completed. 




