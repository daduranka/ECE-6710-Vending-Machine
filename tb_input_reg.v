`timescale 1ps/1ps
module tb_input_reg();

reg clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE;

wire [4:0] food_selection;

integer i;

input_reg uut(
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
	.food_selection(food_selection)
);

reg [15:0] test_vector [105:0];

reg [4:0] expected_selection;

initial begin

    $readmemb("C:/intelFPGA_lite/18.0/input_reg/input_reg_testVectors.txt", test_vector);
    clock = 0;
    i = 0;
	 reset = 1;
	 A = 0; 
	 B = 0;
	 C = 0; 
	 D = 0; 
	 ONE = 0;
	 TWO = 0; 
	 THREE = 0; 
	 FOUR = 0; 
	 FIVE = 0;
    #10;

end

always@(posedge clock) begin

    {reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, expected_selection} = test_vector[i]; #10;

end

always@(negedge clock) begin

    if(expected_selection != food_selection) begin
        
        $display("Test number %d failed: Wrong selection, expected selection: %b calculated: %b", i, expected_selection, food_selection);
    
    end
    
	 else begin
        
        $display("Test number %d passed!", i);
    
    end
    
    i = i + 1;

end

always #5 clock = ~ clock;

endmodule 