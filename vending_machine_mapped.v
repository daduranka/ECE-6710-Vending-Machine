/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03-SP5
// Date      : Sat Nov 26 22:34:59 2022
/////////////////////////////////////////////////////////////


module input_reg ( clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, 
        food_selection );
  output [4:0] food_selection;
  input clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE;
  wire   n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12;

  sky130_fd_sc_hd__o21ai_1 U6 ( .A1(n11), .A2(n29), .B1(n30), .Y(n28) );
  sky130_fd_sc_hd__o21ai_1 U7 ( .A1(n6), .A2(n32), .B1(n33), .Y(n24) );
  sky130_fd_sc_hd__o21ai_1 U10 ( .A1(n8), .A2(n35), .B1(n42), .Y(n40) );
  sky130_fd_sc_hd__a32oi_1 U31 ( .A1(n24), .A2(n25), .A3(n26), .B1(n27), .B2(
        n28), .Y(n15) );
  sky130_fd_sc_hd__a222oi_1 U32 ( .A1(food_selection[1]), .A2(n19), .B1(n2), 
        .B2(n40), .C1(n26), .C2(n41), .Y(n39) );
  sky130_fd_sc_hd__a31oi_1 U33 ( .A1(n43), .A2(n30), .A3(n27), .B1(n44), .Y(
        n38) );
  sky130_fd_sc_hd__a32oi_1 U34 ( .A1(n3), .A2(n22), .A3(n17), .B1(
        food_selection[2]), .B2(n19), .Y(n46) );
  sky130_fd_sc_hd__a31oi_1 U35 ( .A1(n10), .A2(n30), .A3(n27), .B1(n44), .Y(
        n45) );
  sky130_fd_sc_hd__nor2b_1 U36 ( .B_N(n48), .A(n49), .Y(n27) );
  sky130_fd_sc_hd__a311o_1 U37 ( .A1(n26), .A2(n25), .A3(n33), .B1(n2), .C1(
        n50), .X(n60) );
  sky130_fd_sc_hd__and2_0 U38 ( .A(food_selection[3]), .B(n19), .X(n50) );
  sky130_fd_sc_hd__a21bo_1 U39 ( .A1(food_selection[4]), .A2(n19), .B1_N(n49), 
        .X(n61) );
  sky130_fd_sc_hd__and3_1 U40 ( .A(n49), .B(n14), .C(n51), .X(n19) );
  sky130_fd_sc_hd__nor2_1 U41 ( .A(n52), .B(reset), .Y(n17) );
  sky130_fd_sc_hd__nor2b_1 U42 ( .B_N(n53), .A(n54), .Y(n26) );
  sky130_fd_sc_hd__nand3b_1 U43 ( .A_N(n55), .B(n53), .C(n54), .Y(n14) );
  sky130_fd_sc_hd__nand4_1 U44 ( .A(n54), .B(n55), .C(n53), .D(n56), .Y(n49)
         );
  sky130_fd_sc_hd__nand2_1 U45 ( .A(n31), .B(n29), .Y(n43) );
  sky130_fd_sc_hd__nand2_1 U46 ( .A(D), .B(FOUR), .Y(n29) );
  sky130_fd_sc_hd__nand2_1 U47 ( .A(D), .B(THREE), .Y(n31) );
  sky130_fd_sc_hd__nand2_1 U48 ( .A(D), .B(ONE), .Y(n48) );
  sky130_fd_sc_hd__nand2_1 U49 ( .A(D), .B(TWO), .Y(n30) );
  sky130_fd_sc_hd__nor2b_1 U50 ( .B_N(n52), .A(reset), .Y(n53) );
  sky130_fd_sc_hd__a211o_1 U51 ( .A1(A), .A2(FOUR), .B1(n5), .C1(n47), .X(n21)
         );
  sky130_fd_sc_hd__nand2_1 U52 ( .A(n23), .B(n20), .Y(n47) );
  sky130_fd_sc_hd__nand2_1 U53 ( .A(THREE), .B(A), .Y(n20) );
  sky130_fd_sc_hd__nand2_1 U54 ( .A(TWO), .B(A), .Y(n23) );
  sky130_fd_sc_hd__nand2_1 U55 ( .A(A), .B(ONE), .Y(n22) );
  sky130_fd_sc_hd__and2_0 U56 ( .A(C), .B(THREE), .X(n35) );
  sky130_fd_sc_hd__nand2_1 U57 ( .A(C), .B(ONE), .Y(n42) );
  sky130_fd_sc_hd__nand2_1 U58 ( .A(C), .B(TWO), .Y(n36) );
  sky130_fd_sc_hd__and4_1 U59 ( .A(n32), .B(n34), .C(n33), .D(n25), .X(n41) );
  sky130_fd_sc_hd__nand2_1 U60 ( .A(ONE), .B(B), .Y(n25) );
  sky130_fd_sc_hd__nand2_1 U61 ( .A(TWO), .B(B), .Y(n33) );
  sky130_fd_sc_hd__nand2_1 U62 ( .A(THREE), .B(B), .Y(n34) );
  sky130_fd_sc_hd__nand2_1 U63 ( .A(FOUR), .B(B), .Y(n32) );
  sky130_fd_sc_hd__dfxtp_1 \food_selection_reg[3]  ( .D(n60), .CLK(clock), .Q(
        food_selection[3]) );
  sky130_fd_sc_hd__dfxtp_1 \food_selection_reg[4]  ( .D(n61), .CLK(clock), .Q(
        food_selection[4]) );
  sky130_fd_sc_hd__dfxtp_1 \food_selection_reg[0]  ( .D(n57), .CLK(clock), .Q(
        food_selection[0]) );
  sky130_fd_sc_hd__dfxtp_1 \food_selection_reg[2]  ( .D(n59), .CLK(clock), .Q(
        food_selection[2]) );
  sky130_fd_sc_hd__dfxtp_1 \food_selection_reg[1]  ( .D(n58), .CLK(clock), .Q(
        food_selection[1]) );
  sky130_fd_sc_hd__inv_2 U3 ( .A(n14), .Y(n2) );
  sky130_fd_sc_hd__inv_2 U4 ( .A(n43), .Y(n10) );
  sky130_fd_sc_hd__inv_2 U5 ( .A(n47), .Y(n3) );
  sky130_fd_sc_hd__o211ai_1 U8 ( .A1(n4), .A2(n20), .B1(n21), .C1(n22), .Y(n18) );
  sky130_fd_sc_hd__inv_2 U9 ( .A(n23), .Y(n4) );
  sky130_fd_sc_hd__a21boi_1 U11 ( .A1(n33), .A2(n25), .B1_N(n26), .Y(n44) );
  sky130_fd_sc_hd__inv_2 U12 ( .A(n31), .Y(n11) );
  sky130_fd_sc_hd__inv_2 U13 ( .A(n34), .Y(n6) );
  sky130_fd_sc_hd__inv_2 U14 ( .A(n42), .Y(n7) );
  sky130_fd_sc_hd__inv_2 U15 ( .A(n36), .Y(n8) );
  sky130_fd_sc_hd__inv_2 U16 ( .A(n22), .Y(n5) );
  sky130_fd_sc_hd__o311ai_1 U17 ( .A1(n1), .A2(n5), .A3(n3), .B1(n38), .C1(n39), .Y(n58) );
  sky130_fd_sc_hd__inv_2 U18 ( .A(n17), .Y(n1) );
  sky130_fd_sc_hd__o211ai_1 U19 ( .A1(n7), .A2(n14), .B1(n45), .C1(n46), .Y(
        n59) );
  sky130_fd_sc_hd__o211ai_1 U20 ( .A1(n13), .A2(n14), .B1(n15), .C1(n16), .Y(
        n57) );
  sky130_fd_sc_hd__a211oi_1 U21 ( .A1(n35), .A2(n36), .B1(n7), .C1(n37), .Y(
        n13) );
  sky130_fd_sc_hd__a22oi_1 U22 ( .A1(n17), .A2(n18), .B1(food_selection[0]), 
        .B2(n19), .Y(n16) );
  sky130_fd_sc_hd__a2111oi_0 U23 ( .A1(FOUR), .A2(C), .B1(n8), .C1(n7), .D1(
        n35), .Y(n37) );
  sky130_fd_sc_hd__nor3_1 U24 ( .A(n26), .B(reset), .C(n17), .Y(n51) );
  sky130_fd_sc_hd__a21boi_1 U25 ( .A1(B), .A2(FIVE), .B1_N(n41), .Y(n54) );
  sky130_fd_sc_hd__o2111ai_1 U26 ( .A1(n12), .A2(n9), .B1(n30), .C1(n48), .D1(
        n10), .Y(n56) );
  sky130_fd_sc_hd__inv_2 U27 ( .A(FIVE), .Y(n12) );
  sky130_fd_sc_hd__inv_2 U28 ( .A(D), .Y(n9) );
  sky130_fd_sc_hd__a21oi_1 U29 ( .A1(A), .A2(FIVE), .B1(n21), .Y(n52) );
  sky130_fd_sc_hd__a21boi_1 U30 ( .A1(FIVE), .A2(C), .B1_N(n37), .Y(n55) );
endmodule


module coin_summer_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  sky130_fd_sc_hd__ha_1 U1_1_8 ( .A(A[8]), .B(carry[8]), .COUT(carry[9]), 
        .SUM(SUM[8]) );
  sky130_fd_sc_hd__ha_1 U1_1_7 ( .A(A[7]), .B(carry[7]), .COUT(carry[8]), 
        .SUM(SUM[7]) );
  sky130_fd_sc_hd__ha_1 U1_1_6 ( .A(A[6]), .B(carry[6]), .COUT(carry[7]), 
        .SUM(SUM[6]) );
  sky130_fd_sc_hd__ha_1 U1_1_5 ( .A(A[5]), .B(carry[5]), .COUT(carry[6]), 
        .SUM(SUM[5]) );
  sky130_fd_sc_hd__ha_1 U1_1_3 ( .A(A[3]), .B(carry[3]), .COUT(carry[4]), 
        .SUM(SUM[3]) );
  sky130_fd_sc_hd__ha_1 U1_1_4 ( .A(A[4]), .B(carry[4]), .COUT(carry[5]), 
        .SUM(SUM[4]) );
  sky130_fd_sc_hd__ha_1 U1_1_1 ( .A(A[1]), .B(A[0]), .COUT(carry[2]), .SUM(
        SUM[1]) );
  sky130_fd_sc_hd__ha_1 U1_1_2 ( .A(A[2]), .B(carry[2]), .COUT(carry[3]), 
        .SUM(SUM[2]) );
  sky130_fd_sc_hd__inv_2 U1 ( .A(A[0]), .Y(SUM[0]) );
  sky130_fd_sc_hd__xor2_1 U2 ( .A(carry[9]), .B(A[9]), .X(SUM[9]) );
endmodule


module coin_summer ( clock, reset, inserted_coin, sum );
  input [2:0] inserted_coin;
  output [9:0] sum;
  input clock, reset;
  wire   N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N43, N44, N45, N46,
         N47, N48, N49, N50, N51, N52, N54, N55, N56, N57, N58, N59, N60, N61,
         N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N74, N75, N76, N77,
         N78, N79, N80, N81, N83, N85, N86, N87, N88, N89, N90, N91, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, \add_279/carry[9] , \add_279/carry[8] ,
         \add_279/carry[7] , \add_279/carry[6] , \add_279/carry[5] ,
         \add_279/carry[4] , \add_278/carry[9] , \add_278/carry[8] ,
         \add_278/carry[7] , \add_278/carry[6] , \add_278/carry[5] ,
         \add_278/carry[4] , \add_278/carry[3] , \add_277/carry[2] ,
         \add_277/carry[3] , \add_277/carry[4] , \add_277/carry[5] ,
         \add_277/carry[6] , \add_277/carry[7] , \add_277/carry[8] ,
         \add_277/carry[9] , \add_276/carry[9] , \add_276/carry[8] ,
         \add_276/carry[7] , \add_276/carry[6] , \add_276/carry[5] ,
         \add_276/carry[4] , \add_276/carry[3] , \add_275/carry[2] ,
         \add_275/carry[3] , \add_275/carry[4] , \add_275/carry[5] ,
         \add_275/carry[6] , \add_275/carry[7] , \add_275/carry[8] ,
         \add_275/carry[9] , n1, n2, n3, n4, n5, n6;
  assign sum[0] = N52;
  assign sum[1] = N83;

  sky130_fd_sc_hd__dfrtp_1 \sum_reg[0]  ( .D(n61), .CLK(clock), .RESET_B(n3), 
        .Q(N52) );
  sky130_fd_sc_hd__dfrtp_1 \sum_reg[9]  ( .D(n52), .CLK(clock), .RESET_B(n3), 
        .Q(sum[9]) );
  sky130_fd_sc_hd__dfrtp_1 \sum_reg[8]  ( .D(n53), .CLK(clock), .RESET_B(n3), 
        .Q(sum[8]) );
  sky130_fd_sc_hd__dfrtp_1 \sum_reg[7]  ( .D(n54), .CLK(clock), .RESET_B(n3), 
        .Q(sum[7]) );
  sky130_fd_sc_hd__dfrtp_1 \sum_reg[6]  ( .D(n55), .CLK(clock), .RESET_B(n3), 
        .Q(sum[6]) );
  sky130_fd_sc_hd__dfrtp_1 \sum_reg[5]  ( .D(n56), .CLK(clock), .RESET_B(n3), 
        .Q(sum[5]) );
  sky130_fd_sc_hd__dfrtp_1 \sum_reg[1]  ( .D(n60), .CLK(clock), .RESET_B(n3), 
        .Q(N83) );
  sky130_fd_sc_hd__dfrtp_1 \sum_reg[2]  ( .D(n59), .CLK(clock), .RESET_B(n3), 
        .Q(sum[2]) );
  sky130_fd_sc_hd__dfrtp_1 \sum_reg[3]  ( .D(n58), .CLK(clock), .RESET_B(n3), 
        .Q(sum[3]) );
  sky130_fd_sc_hd__dfrtp_1 \sum_reg[4]  ( .D(n57), .CLK(clock), .RESET_B(n3), 
        .Q(sum[4]) );
  sky130_fd_sc_hd__a222oi_1 U49 ( .A1(sum[9]), .A2(n18), .B1(N51), .B2(n19), 
        .C1(N41), .C2(n20), .Y(n17) );
  sky130_fd_sc_hd__a222oi_1 U50 ( .A1(sum[8]), .A2(n18), .B1(N50), .B2(n19), 
        .C1(N40), .C2(n20), .Y(n27) );
  sky130_fd_sc_hd__a222oi_1 U51 ( .A1(sum[7]), .A2(n18), .B1(N49), .B2(n19), 
        .C1(N39), .C2(n20), .Y(n30) );
  sky130_fd_sc_hd__a222oi_1 U52 ( .A1(sum[6]), .A2(n18), .B1(N48), .B2(n19), 
        .C1(N38), .C2(n20), .Y(n33) );
  sky130_fd_sc_hd__a222oi_1 U53 ( .A1(sum[5]), .A2(n18), .B1(N47), .B2(n19), 
        .C1(N37), .C2(n20), .Y(n36) );
  sky130_fd_sc_hd__a222oi_1 U54 ( .A1(sum[4]), .A2(n18), .B1(N46), .B2(n19), 
        .C1(N36), .C2(n20), .Y(n39) );
  sky130_fd_sc_hd__a222oi_1 U55 ( .A1(sum[3]), .A2(n18), .B1(N45), .B2(n19), 
        .C1(N35), .C2(n20), .Y(n42) );
  sky130_fd_sc_hd__a222oi_1 U56 ( .A1(sum[2]), .A2(n18), .B1(N44), .B2(n19), 
        .C1(N34), .C2(n20), .Y(n45) );
  sky130_fd_sc_hd__a222oi_1 U57 ( .A1(N83), .A2(n18), .B1(N43), .B2(n19), .C1(
        N33), .C2(n20), .Y(n48) );
  sky130_fd_sc_hd__a222oi_1 U58 ( .A1(N52), .A2(n18), .B1(N62), .B2(n19), .C1(
        N32), .C2(n20), .Y(n51) );
  coin_summer_DW01_inc_0 add_274 ( .A({sum[9:2], N83, N52}), .SUM({N41, N40, 
        N39, N38, N37, N36, N35, N34, N33, N32}) );
  sky130_fd_sc_hd__nand3_1 U3 ( .A(n34), .B(n35), .C(n36), .Y(n56) );
  sky130_fd_sc_hd__a22oi_1 U4 ( .A1(N87), .A2(n21), .B1(N77), .B2(n22), .Y(n35) );
  sky130_fd_sc_hd__a22oi_1 U5 ( .A1(N67), .A2(n23), .B1(N57), .B2(n24), .Y(n34) );
  sky130_fd_sc_hd__nand3_1 U6 ( .A(n31), .B(n32), .C(n33), .Y(n55) );
  sky130_fd_sc_hd__a22oi_1 U7 ( .A1(N88), .A2(n21), .B1(N78), .B2(n22), .Y(n32) );
  sky130_fd_sc_hd__a22oi_1 U8 ( .A1(N68), .A2(n23), .B1(N58), .B2(n24), .Y(n31) );
  sky130_fd_sc_hd__nand3_1 U9 ( .A(n28), .B(n29), .C(n30), .Y(n54) );
  sky130_fd_sc_hd__a22oi_1 U10 ( .A1(N89), .A2(n21), .B1(N79), .B2(n22), .Y(
        n29) );
  sky130_fd_sc_hd__a22oi_1 U11 ( .A1(N69), .A2(n23), .B1(N59), .B2(n24), .Y(
        n28) );
  sky130_fd_sc_hd__nand3_1 U12 ( .A(n25), .B(n26), .C(n27), .Y(n53) );
  sky130_fd_sc_hd__a22oi_1 U13 ( .A1(N90), .A2(n21), .B1(N80), .B2(n22), .Y(
        n26) );
  sky130_fd_sc_hd__a22oi_1 U14 ( .A1(N70), .A2(n23), .B1(N60), .B2(n24), .Y(
        n25) );
  sky130_fd_sc_hd__nand3_1 U15 ( .A(n40), .B(n41), .C(n42), .Y(n58) );
  sky130_fd_sc_hd__a22oi_1 U16 ( .A1(N85), .A2(n21), .B1(N75), .B2(n22), .Y(
        n41) );
  sky130_fd_sc_hd__a22oi_1 U17 ( .A1(N65), .A2(n23), .B1(N55), .B2(n24), .Y(
        n40) );
  sky130_fd_sc_hd__nand3_1 U18 ( .A(n46), .B(n47), .C(n48), .Y(n60) );
  sky130_fd_sc_hd__a22oi_1 U19 ( .A1(N83), .A2(n21), .B1(n1), .B2(n22), .Y(n47) );
  sky130_fd_sc_hd__a22oi_1 U20 ( .A1(N63), .A2(n23), .B1(n1), .B2(n24), .Y(n46) );
  sky130_fd_sc_hd__nand3_1 U21 ( .A(n37), .B(n38), .C(n39), .Y(n57) );
  sky130_fd_sc_hd__a22oi_1 U22 ( .A1(N86), .A2(n21), .B1(N76), .B2(n22), .Y(
        n38) );
  sky130_fd_sc_hd__a22oi_1 U23 ( .A1(N66), .A2(n23), .B1(N56), .B2(n24), .Y(
        n37) );
  sky130_fd_sc_hd__nand3_1 U24 ( .A(n43), .B(n44), .C(n45), .Y(n59) );
  sky130_fd_sc_hd__a22oi_1 U25 ( .A1(n2), .A2(n21), .B1(N74), .B2(n22), .Y(n44) );
  sky130_fd_sc_hd__a22oi_1 U26 ( .A1(N64), .A2(n23), .B1(N54), .B2(n24), .Y(
        n43) );
  sky130_fd_sc_hd__nand3_1 U27 ( .A(n49), .B(n50), .C(n51), .Y(n61) );
  sky130_fd_sc_hd__a22oi_1 U28 ( .A1(N52), .A2(n21), .B1(N52), .B2(n22), .Y(
        n50) );
  sky130_fd_sc_hd__a22oi_1 U29 ( .A1(N62), .A2(n23), .B1(N52), .B2(n24), .Y(
        n49) );
  sky130_fd_sc_hd__inv_2 U30 ( .A(N52), .Y(N62) );
  sky130_fd_sc_hd__inv_2 U31 ( .A(N83), .Y(n1) );
  sky130_fd_sc_hd__inv_2 U32 ( .A(sum[2]), .Y(n2) );
  sky130_fd_sc_hd__nand3_1 U33 ( .A(n15), .B(n16), .C(n17), .Y(n52) );
  sky130_fd_sc_hd__a22oi_1 U34 ( .A1(N91), .A2(n21), .B1(N81), .B2(n22), .Y(
        n16) );
  sky130_fd_sc_hd__a22oi_1 U35 ( .A1(N71), .A2(n23), .B1(N61), .B2(n24), .Y(
        n15) );
  sky130_fd_sc_hd__nor3_1 U36 ( .A(inserted_coin[1]), .B(inserted_coin[2]), 
        .C(n6), .Y(n20) );
  sky130_fd_sc_hd__nor3_1 U37 ( .A(inserted_coin[0]), .B(inserted_coin[2]), 
        .C(n5), .Y(n19) );
  sky130_fd_sc_hd__nor3_1 U38 ( .A(inserted_coin[1]), .B(inserted_coin[2]), 
        .C(inserted_coin[0]), .Y(n18) );
  sky130_fd_sc_hd__inv_2 U39 ( .A(reset), .Y(n3) );
  sky130_fd_sc_hd__inv_2 U40 ( .A(inserted_coin[1]), .Y(n5) );
  sky130_fd_sc_hd__inv_2 U41 ( .A(inserted_coin[2]), .Y(n4) );
  sky130_fd_sc_hd__inv_2 U42 ( .A(inserted_coin[0]), .Y(n6) );
  sky130_fd_sc_hd__nor3_1 U43 ( .A(inserted_coin[0]), .B(inserted_coin[1]), 
        .C(n4), .Y(n23) );
  sky130_fd_sc_hd__nor3_1 U44 ( .A(n5), .B(inserted_coin[0]), .C(n4), .Y(n21)
         );
  sky130_fd_sc_hd__nor3_1 U45 ( .A(n5), .B(inserted_coin[2]), .C(n6), .Y(n24)
         );
  sky130_fd_sc_hd__nor3_1 U46 ( .A(n4), .B(inserted_coin[1]), .C(n6), .Y(n22)
         );
  sky130_fd_sc_hd__xor2_1 U47 ( .A(sum[9]), .B(\add_275/carry[9] ), .X(N51) );
  sky130_fd_sc_hd__and2_0 U48 ( .A(\add_275/carry[8] ), .B(sum[8]), .X(
        \add_275/carry[9] ) );
  sky130_fd_sc_hd__xor2_1 U59 ( .A(sum[8]), .B(\add_275/carry[8] ), .X(N50) );
  sky130_fd_sc_hd__and2_0 U60 ( .A(\add_275/carry[7] ), .B(sum[7]), .X(
        \add_275/carry[8] ) );
  sky130_fd_sc_hd__xor2_1 U61 ( .A(sum[7]), .B(\add_275/carry[7] ), .X(N49) );
  sky130_fd_sc_hd__and2_0 U62 ( .A(\add_275/carry[6] ), .B(sum[6]), .X(
        \add_275/carry[7] ) );
  sky130_fd_sc_hd__xor2_1 U63 ( .A(sum[6]), .B(\add_275/carry[6] ), .X(N48) );
  sky130_fd_sc_hd__and2_0 U64 ( .A(\add_275/carry[5] ), .B(sum[5]), .X(
        \add_275/carry[6] ) );
  sky130_fd_sc_hd__xor2_1 U65 ( .A(sum[5]), .B(\add_275/carry[5] ), .X(N47) );
  sky130_fd_sc_hd__and2_0 U66 ( .A(\add_275/carry[4] ), .B(sum[4]), .X(
        \add_275/carry[5] ) );
  sky130_fd_sc_hd__xor2_1 U67 ( .A(sum[4]), .B(\add_275/carry[4] ), .X(N46) );
  sky130_fd_sc_hd__and2_0 U68 ( .A(\add_275/carry[3] ), .B(sum[3]), .X(
        \add_275/carry[4] ) );
  sky130_fd_sc_hd__xor2_1 U69 ( .A(sum[3]), .B(\add_275/carry[3] ), .X(N45) );
  sky130_fd_sc_hd__or2_0 U70 ( .A(sum[2]), .B(\add_275/carry[2] ), .X(
        \add_275/carry[3] ) );
  sky130_fd_sc_hd__xnor2_1 U71 ( .A(\add_275/carry[2] ), .B(sum[2]), .Y(N44)
         );
  sky130_fd_sc_hd__and2_0 U72 ( .A(N52), .B(N83), .X(\add_275/carry[2] ) );
  sky130_fd_sc_hd__xor2_1 U73 ( .A(N83), .B(N52), .X(N43) );
  sky130_fd_sc_hd__xor2_1 U74 ( .A(sum[9]), .B(\add_278/carry[9] ), .X(N81) );
  sky130_fd_sc_hd__and2_0 U75 ( .A(\add_278/carry[8] ), .B(sum[8]), .X(
        \add_278/carry[9] ) );
  sky130_fd_sc_hd__xor2_1 U76 ( .A(sum[8]), .B(\add_278/carry[8] ), .X(N80) );
  sky130_fd_sc_hd__and2_0 U77 ( .A(\add_278/carry[7] ), .B(sum[7]), .X(
        \add_278/carry[8] ) );
  sky130_fd_sc_hd__xor2_1 U78 ( .A(sum[7]), .B(\add_278/carry[7] ), .X(N79) );
  sky130_fd_sc_hd__and2_0 U79 ( .A(\add_278/carry[6] ), .B(sum[6]), .X(
        \add_278/carry[7] ) );
  sky130_fd_sc_hd__xor2_1 U80 ( .A(sum[6]), .B(\add_278/carry[6] ), .X(N78) );
  sky130_fd_sc_hd__or2_0 U81 ( .A(sum[5]), .B(\add_278/carry[5] ), .X(
        \add_278/carry[6] ) );
  sky130_fd_sc_hd__xnor2_1 U82 ( .A(\add_278/carry[5] ), .B(sum[5]), .Y(N77)
         );
  sky130_fd_sc_hd__or2_0 U83 ( .A(sum[4]), .B(\add_278/carry[4] ), .X(
        \add_278/carry[5] ) );
  sky130_fd_sc_hd__xnor2_1 U84 ( .A(\add_278/carry[4] ), .B(sum[4]), .Y(N76)
         );
  sky130_fd_sc_hd__and2_0 U85 ( .A(\add_278/carry[3] ), .B(sum[3]), .X(
        \add_278/carry[4] ) );
  sky130_fd_sc_hd__xor2_1 U86 ( .A(sum[3]), .B(\add_278/carry[3] ), .X(N75) );
  sky130_fd_sc_hd__and2_0 U87 ( .A(N83), .B(sum[2]), .X(\add_278/carry[3] ) );
  sky130_fd_sc_hd__xor2_1 U88 ( .A(sum[2]), .B(N83), .X(N74) );
  sky130_fd_sc_hd__xor2_1 U89 ( .A(sum[9]), .B(\add_279/carry[9] ), .X(N91) );
  sky130_fd_sc_hd__and2_0 U90 ( .A(\add_279/carry[8] ), .B(sum[8]), .X(
        \add_279/carry[9] ) );
  sky130_fd_sc_hd__xor2_1 U91 ( .A(sum[8]), .B(\add_279/carry[8] ), .X(N90) );
  sky130_fd_sc_hd__and2_0 U92 ( .A(\add_279/carry[7] ), .B(sum[7]), .X(
        \add_279/carry[8] ) );
  sky130_fd_sc_hd__xor2_1 U93 ( .A(sum[7]), .B(\add_279/carry[7] ), .X(N89) );
  sky130_fd_sc_hd__or2_0 U94 ( .A(sum[6]), .B(\add_279/carry[6] ), .X(
        \add_279/carry[7] ) );
  sky130_fd_sc_hd__xnor2_1 U95 ( .A(\add_279/carry[6] ), .B(sum[6]), .Y(N88)
         );
  sky130_fd_sc_hd__or2_0 U96 ( .A(sum[5]), .B(\add_279/carry[5] ), .X(
        \add_279/carry[6] ) );
  sky130_fd_sc_hd__xnor2_1 U97 ( .A(\add_279/carry[5] ), .B(sum[5]), .Y(N87)
         );
  sky130_fd_sc_hd__and2_0 U98 ( .A(\add_279/carry[4] ), .B(sum[4]), .X(
        \add_279/carry[5] ) );
  sky130_fd_sc_hd__xor2_1 U99 ( .A(sum[4]), .B(\add_279/carry[4] ), .X(N86) );
  sky130_fd_sc_hd__and2_0 U100 ( .A(sum[2]), .B(sum[3]), .X(\add_279/carry[4] ) );
  sky130_fd_sc_hd__xor2_1 U101 ( .A(sum[3]), .B(sum[2]), .X(N85) );
  sky130_fd_sc_hd__xor2_1 U102 ( .A(sum[9]), .B(\add_276/carry[9] ), .X(N61)
         );
  sky130_fd_sc_hd__and2_0 U103 ( .A(\add_276/carry[8] ), .B(sum[8]), .X(
        \add_276/carry[9] ) );
  sky130_fd_sc_hd__xor2_1 U104 ( .A(sum[8]), .B(\add_276/carry[8] ), .X(N60)
         );
  sky130_fd_sc_hd__and2_0 U105 ( .A(\add_276/carry[7] ), .B(sum[7]), .X(
        \add_276/carry[8] ) );
  sky130_fd_sc_hd__xor2_1 U106 ( .A(sum[7]), .B(\add_276/carry[7] ), .X(N59)
         );
  sky130_fd_sc_hd__and2_0 U107 ( .A(\add_276/carry[6] ), .B(sum[6]), .X(
        \add_276/carry[7] ) );
  sky130_fd_sc_hd__xor2_1 U108 ( .A(sum[6]), .B(\add_276/carry[6] ), .X(N58)
         );
  sky130_fd_sc_hd__and2_0 U109 ( .A(\add_276/carry[5] ), .B(sum[5]), .X(
        \add_276/carry[6] ) );
  sky130_fd_sc_hd__xor2_1 U110 ( .A(sum[5]), .B(\add_276/carry[5] ), .X(N57)
         );
  sky130_fd_sc_hd__and2_0 U111 ( .A(\add_276/carry[4] ), .B(sum[4]), .X(
        \add_276/carry[5] ) );
  sky130_fd_sc_hd__xor2_1 U112 ( .A(sum[4]), .B(\add_276/carry[4] ), .X(N56)
         );
  sky130_fd_sc_hd__or2_0 U113 ( .A(sum[3]), .B(\add_276/carry[3] ), .X(
        \add_276/carry[4] ) );
  sky130_fd_sc_hd__xnor2_1 U114 ( .A(\add_276/carry[3] ), .B(sum[3]), .Y(N55)
         );
  sky130_fd_sc_hd__and2_0 U115 ( .A(N83), .B(sum[2]), .X(\add_276/carry[3] )
         );
  sky130_fd_sc_hd__xor2_1 U116 ( .A(sum[2]), .B(N83), .X(N54) );
  sky130_fd_sc_hd__xor2_1 U117 ( .A(sum[9]), .B(\add_277/carry[9] ), .X(N71)
         );
  sky130_fd_sc_hd__and2_0 U118 ( .A(\add_277/carry[8] ), .B(sum[8]), .X(
        \add_277/carry[9] ) );
  sky130_fd_sc_hd__xor2_1 U119 ( .A(sum[8]), .B(\add_277/carry[8] ), .X(N70)
         );
  sky130_fd_sc_hd__and2_0 U120 ( .A(\add_277/carry[7] ), .B(sum[7]), .X(
        \add_277/carry[8] ) );
  sky130_fd_sc_hd__xor2_1 U121 ( .A(sum[7]), .B(\add_277/carry[7] ), .X(N69)
         );
  sky130_fd_sc_hd__and2_0 U122 ( .A(\add_277/carry[6] ), .B(sum[6]), .X(
        \add_277/carry[7] ) );
  sky130_fd_sc_hd__xor2_1 U123 ( .A(sum[6]), .B(\add_277/carry[6] ), .X(N68)
         );
  sky130_fd_sc_hd__and2_0 U124 ( .A(\add_277/carry[5] ), .B(sum[5]), .X(
        \add_277/carry[6] ) );
  sky130_fd_sc_hd__xor2_1 U125 ( .A(sum[5]), .B(\add_277/carry[5] ), .X(N67)
         );
  sky130_fd_sc_hd__or2_0 U126 ( .A(sum[4]), .B(\add_277/carry[4] ), .X(
        \add_277/carry[5] ) );
  sky130_fd_sc_hd__xnor2_1 U127 ( .A(\add_277/carry[4] ), .B(sum[4]), .Y(N66)
         );
  sky130_fd_sc_hd__or2_0 U128 ( .A(sum[3]), .B(\add_277/carry[3] ), .X(
        \add_277/carry[4] ) );
  sky130_fd_sc_hd__xnor2_1 U129 ( .A(\add_277/carry[3] ), .B(sum[3]), .Y(N65)
         );
  sky130_fd_sc_hd__and2_0 U130 ( .A(\add_277/carry[2] ), .B(sum[2]), .X(
        \add_277/carry[3] ) );
  sky130_fd_sc_hd__xor2_1 U131 ( .A(sum[2]), .B(\add_277/carry[2] ), .X(N64)
         );
  sky130_fd_sc_hd__and2_0 U132 ( .A(N52), .B(N83), .X(\add_277/carry[2] ) );
  sky130_fd_sc_hd__xor2_1 U133 ( .A(N83), .B(N52), .X(N63) );
endmodule


module amount_to_return ( clock, reset, load, SUM, food_selection, 
        amount_to_return );
  input [9:0] SUM;
  input [4:0] food_selection;
  output [9:0] amount_to_return;
  input clock, reset;
  output load;
  wire   N1, N13, N14, N15, N16, N17, N18, N19, N20, N25, N26, N27, N28, N29,
         N30, N31, N32, N38, N39, N40, N41, N42, N43, N44, N50, N51, N52, N53,
         N54, N55, N56, N63, N64, N66, N67, N68, N69, N70, N71, N72, N74, N75,
         N76, N77, N78, N79, N80, N81, N82, N83, N87, N88, N89, N90, N91, N92,
         N93, N94, N97, N98, N99, N100, N101, N102, N103, N104, N105, N106,
         N107, N108, N109, N110, N111, N112, N113, N114, N115, N116, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, \sub_437/carry[2] , \sub_437/carry[3] , \sub_437/carry[4] ,
         \sub_437/carry[5] , \sub_437/carry[6] , \sub_437/carry[7] ,
         \sub_437/carry[8] , \sub_437/carry[9] , \sub_430/carry[9] ,
         \sub_430/carry[8] , \sub_430/carry[7] , \sub_430/carry[6] ,
         \sub_430/carry[5] , \sub_430/carry[4] , \sub_430/carry[3] ,
         \sub_423/carry[2] , \sub_423/carry[3] , \sub_423/carry[4] ,
         \sub_423/carry[5] , \sub_423/carry[6] , \sub_423/carry[7] ,
         \sub_423/carry[8] , \sub_423/carry[9] , \sub_416/carry[9] ,
         \sub_416/carry[8] , \sub_416/carry[7] , \sub_416/carry[6] ,
         \sub_416/carry[5] , \sub_416/carry[4] , \sub_387_4/carry[2] ,
         \sub_387_4/carry[3] , \sub_387_4/carry[4] , \sub_387_4/carry[5] ,
         \sub_387_4/carry[6] , \sub_387_4/carry[7] , \sub_387_4/carry[8] ,
         \sub_387_4/carry[9] , \sub_387_4/carry[10] , \sub_387_3/carry[10] ,
         \sub_387_3/carry[9] , \sub_387_3/carry[8] , \sub_387_3/carry[7] ,
         \sub_387_3/carry[6] , \sub_387_3/carry[5] , \sub_387_3/carry[4] ,
         \sub_387_3/carry[3] , \sub_387_2/carry[2] , \sub_387_2/carry[3] ,
         \sub_387_2/carry[4] , \sub_387_2/carry[5] , \sub_387_2/carry[6] ,
         \sub_387_2/carry[7] , \sub_387_2/carry[8] , \sub_387_2/carry[9] ,
         \sub_387_2/carry[10] , \sub_387/carry[10] , \sub_387/carry[9] ,
         \sub_387/carry[8] , \sub_387/carry[7] , \sub_387/carry[6] ,
         \sub_387/carry[5] , \sub_387/carry[4] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  assign amount_to_return[0] = N13;
  assign amount_to_return[1] = N14;
  assign N63 = SUM[0];
  assign N64 = SUM[1];

  sky130_fd_sc_hd__o21ai_1 U26 ( .A1(food_selection[1]), .A2(food_selection[0]), .B1(food_selection[2]), .Y(n95) );
  sky130_fd_sc_hd__o21ai_1 U27 ( .A1(n96), .A2(n16), .B1(n15), .Y(n70) );
  sky130_fd_sc_hd__nand2_1 U36 ( .A(n40), .B(n41), .Y(N116) );
  sky130_fd_sc_hd__a222oi_1 U37 ( .A1(N94), .A2(n42), .B1(amount_to_return[9]), 
        .B2(n14), .C1(N105), .C2(n43), .Y(n41) );
  sky130_fd_sc_hd__a222oi_1 U38 ( .A1(SUM[9]), .A2(n44), .B1(N83), .B2(n45), 
        .C1(N72), .C2(n46), .Y(n40) );
  sky130_fd_sc_hd__nand2_1 U39 ( .A(n47), .B(n48), .Y(N115) );
  sky130_fd_sc_hd__a222oi_1 U40 ( .A1(N93), .A2(n42), .B1(amount_to_return[8]), 
        .B2(n14), .C1(N104), .C2(n43), .Y(n48) );
  sky130_fd_sc_hd__a222oi_1 U41 ( .A1(SUM[8]), .A2(n44), .B1(N82), .B2(n45), 
        .C1(N71), .C2(n46), .Y(n47) );
  sky130_fd_sc_hd__nand2_1 U42 ( .A(n49), .B(n50), .Y(N114) );
  sky130_fd_sc_hd__a222oi_1 U43 ( .A1(N92), .A2(n42), .B1(amount_to_return[7]), 
        .B2(n14), .C1(N103), .C2(n43), .Y(n50) );
  sky130_fd_sc_hd__a222oi_1 U44 ( .A1(SUM[7]), .A2(n44), .B1(N81), .B2(n45), 
        .C1(N70), .C2(n46), .Y(n49) );
  sky130_fd_sc_hd__nand2_1 U45 ( .A(n51), .B(n52), .Y(N113) );
  sky130_fd_sc_hd__a222oi_1 U46 ( .A1(N91), .A2(n42), .B1(amount_to_return[6]), 
        .B2(n14), .C1(N102), .C2(n43), .Y(n52) );
  sky130_fd_sc_hd__a222oi_1 U47 ( .A1(SUM[6]), .A2(n44), .B1(N80), .B2(n45), 
        .C1(N69), .C2(n46), .Y(n51) );
  sky130_fd_sc_hd__nand2_1 U48 ( .A(n53), .B(n54), .Y(N112) );
  sky130_fd_sc_hd__a222oi_1 U49 ( .A1(N90), .A2(n42), .B1(amount_to_return[5]), 
        .B2(n14), .C1(N101), .C2(n43), .Y(n54) );
  sky130_fd_sc_hd__a222oi_1 U50 ( .A1(SUM[5]), .A2(n44), .B1(N79), .B2(n45), 
        .C1(N68), .C2(n46), .Y(n53) );
  sky130_fd_sc_hd__nand2_1 U51 ( .A(n55), .B(n56), .Y(N111) );
  sky130_fd_sc_hd__a222oi_1 U52 ( .A1(N89), .A2(n42), .B1(amount_to_return[4]), 
        .B2(n14), .C1(N100), .C2(n43), .Y(n56) );
  sky130_fd_sc_hd__a222oi_1 U53 ( .A1(SUM[4]), .A2(n44), .B1(N78), .B2(n45), 
        .C1(N67), .C2(n46), .Y(n55) );
  sky130_fd_sc_hd__nand2_1 U54 ( .A(n57), .B(n58), .Y(N110) );
  sky130_fd_sc_hd__a222oi_1 U55 ( .A1(N88), .A2(n42), .B1(amount_to_return[3]), 
        .B2(n14), .C1(N99), .C2(n43), .Y(n58) );
  sky130_fd_sc_hd__a222oi_1 U56 ( .A1(SUM[3]), .A2(n44), .B1(N77), .B2(n45), 
        .C1(N66), .C2(n46), .Y(n57) );
  sky130_fd_sc_hd__nand2_1 U57 ( .A(n59), .B(n60), .Y(N109) );
  sky130_fd_sc_hd__a222oi_1 U58 ( .A1(N87), .A2(n42), .B1(amount_to_return[2]), 
        .B2(n14), .C1(N98), .C2(n43), .Y(n60) );
  sky130_fd_sc_hd__a222oi_1 U59 ( .A1(SUM[2]), .A2(n44), .B1(N76), .B2(n45), 
        .C1(n10), .C2(n46), .Y(n59) );
  sky130_fd_sc_hd__nand2_1 U60 ( .A(n61), .B(n62), .Y(N108) );
  sky130_fd_sc_hd__a222oi_1 U61 ( .A1(n9), .A2(n42), .B1(N14), .B2(n14), .C1(
        N97), .C2(n43), .Y(n62) );
  sky130_fd_sc_hd__a222oi_1 U62 ( .A1(N64), .A2(n44), .B1(N75), .B2(n45), .C1(
        N64), .C2(n46), .Y(n61) );
  sky130_fd_sc_hd__nand2_1 U63 ( .A(n63), .B(n64), .Y(N107) );
  sky130_fd_sc_hd__a222oi_1 U64 ( .A1(N63), .A2(n42), .B1(N13), .B2(n14), .C1(
        N74), .C2(n43), .Y(n64) );
  sky130_fd_sc_hd__a222oi_1 U65 ( .A1(N63), .A2(n44), .B1(N74), .B2(n45), .C1(
        N63), .C2(n46), .Y(n63) );
  sky130_fd_sc_hd__nand4b_1 U66 ( .A_N(n43), .B(n65), .C(n66), .D(n67), .Y(
        N106) );
  sky130_fd_sc_hd__a41o_1 U71 ( .A1(n74), .A2(n75), .A3(n76), .A4(n77), .B1(
        n18), .X(n66) );
  sky130_fd_sc_hd__nand4_1 U72 ( .A(n78), .B(n79), .C(n80), .D(n81), .Y(n77)
         );
  sky130_fd_sc_hd__nor2_1 U73 ( .A(N14), .B(N13), .Y(n78) );
  sky130_fd_sc_hd__nand4_1 U74 ( .A(n82), .B(n83), .C(n84), .D(n85), .Y(n76)
         );
  sky130_fd_sc_hd__nor2_1 U75 ( .A(N26), .B(N25), .Y(n82) );
  sky130_fd_sc_hd__nand4_1 U76 ( .A(n86), .B(n87), .C(n88), .D(n89), .Y(n75)
         );
  sky130_fd_sc_hd__nor2_1 U77 ( .A(N38), .B(N13), .Y(n86) );
  sky130_fd_sc_hd__nand4_1 U78 ( .A(n90), .B(n91), .C(n92), .D(n93), .Y(n74)
         );
  sky130_fd_sc_hd__nor2_1 U79 ( .A(N50), .B(N25), .Y(n90) );
  sky130_fd_sc_hd__nand2_1 U81 ( .A(n95), .B(n16), .Y(n94) );
  sky130_fd_sc_hd__and2_0 U82 ( .A(n69), .B(n70), .X(n68) );
  sky130_fd_sc_hd__and3_1 U83 ( .A(n73), .B(n72), .C(n71), .X(n69) );
  sky130_fd_sc_hd__nor2_1 U84 ( .A(N1), .B(reset), .Y(n71) );
  sky130_fd_sc_hd__nand4_1 U85 ( .A(n98), .B(n17), .C(n16), .D(n15), .Y(n73)
         );
  sky130_fd_sc_hd__nor2_1 U86 ( .A(food_selection[2]), .B(food_selection[0]), 
        .Y(n98) );
  sky130_fd_sc_hd__dfxtp_1 \amount_to_return_reg[5]  ( .D(N112), .CLK(clock), 
        .Q(amount_to_return[5]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_to_return_reg[7]  ( .D(N114), .CLK(clock), 
        .Q(amount_to_return[7]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_to_return_reg[6]  ( .D(N113), .CLK(clock), 
        .Q(amount_to_return[6]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_to_return_reg[8]  ( .D(N115), .CLK(clock), 
        .Q(amount_to_return[8]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_to_return_reg[9]  ( .D(N116), .CLK(clock), 
        .Q(amount_to_return[9]) );
  sky130_fd_sc_hd__dfxtp_1 load_reg ( .D(N106), .CLK(clock), .Q(load) );
  sky130_fd_sc_hd__dfxtp_1 \amount_to_return_reg[4]  ( .D(N111), .CLK(clock), 
        .Q(amount_to_return[4]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_to_return_reg[3]  ( .D(N110), .CLK(clock), 
        .Q(amount_to_return[3]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_to_return_reg[1]  ( .D(N108), .CLK(clock), 
        .Q(N14) );
  sky130_fd_sc_hd__dfxtp_1 \amount_to_return_reg[0]  ( .D(N107), .CLK(clock), 
        .Q(N13) );
  sky130_fd_sc_hd__dfxtp_1 \amount_to_return_reg[2]  ( .D(N109), .CLK(clock), 
        .Q(amount_to_return[2]) );
  sky130_fd_sc_hd__inv_2 U3 ( .A(SUM[2]), .Y(n10) );
  sky130_fd_sc_hd__inv_2 U4 ( .A(N64), .Y(n9) );
  sky130_fd_sc_hd__nor2b_1 U5 ( .B_N(n71), .A(n73), .Y(n44) );
  sky130_fd_sc_hd__nor2b_1 U6 ( .B_N(n71), .A(n72), .Y(n46) );
  sky130_fd_sc_hd__nor2b_1 U7 ( .B_N(n69), .A(n70), .Y(n45) );
  sky130_fd_sc_hd__nor2b_1 U8 ( .B_N(n68), .A(n94), .Y(n43) );
  sky130_fd_sc_hd__and2_1 U9 ( .A(n68), .B(n15), .X(n42) );
  sky130_fd_sc_hd__inv_2 U10 ( .A(n65), .Y(n14) );
  sky130_fd_sc_hd__nor3_1 U11 ( .A(N27), .B(N29), .C(N28), .Y(n83) );
  sky130_fd_sc_hd__nor3_1 U12 ( .A(N30), .B(N32), .C(N31), .Y(n84) );
  sky130_fd_sc_hd__nor3_1 U13 ( .A(N51), .B(N53), .C(N52), .Y(n91) );
  sky130_fd_sc_hd__nor3_1 U14 ( .A(N54), .B(N56), .C(N55), .Y(n92) );
  sky130_fd_sc_hd__and3_1 U15 ( .A(n1), .B(\sub_387_2/carry[10] ), .C(n2), .X(
        n85) );
  sky130_fd_sc_hd__xor2_1 U16 ( .A(\sub_387_2/carry[8] ), .B(
        amount_to_return[8]), .X(n1) );
  sky130_fd_sc_hd__xor2_1 U17 ( .A(\sub_387_2/carry[9] ), .B(
        amount_to_return[9]), .X(n2) );
  sky130_fd_sc_hd__and3_1 U18 ( .A(n3), .B(\sub_387/carry[10] ), .C(n4), .X(
        n81) );
  sky130_fd_sc_hd__xor2_1 U19 ( .A(\sub_387/carry[8] ), .B(amount_to_return[8]), .X(n3) );
  sky130_fd_sc_hd__xor2_1 U20 ( .A(\sub_387/carry[9] ), .B(amount_to_return[9]), .X(n4) );
  sky130_fd_sc_hd__and3_1 U21 ( .A(n5), .B(\sub_387_3/carry[10] ), .C(n6), .X(
        n89) );
  sky130_fd_sc_hd__xor2_1 U22 ( .A(\sub_387_3/carry[8] ), .B(
        amount_to_return[8]), .X(n5) );
  sky130_fd_sc_hd__xor2_1 U23 ( .A(\sub_387_3/carry[9] ), .B(
        amount_to_return[9]), .X(n6) );
  sky130_fd_sc_hd__nand3_1 U24 ( .A(n68), .B(n94), .C(food_selection[4]), .Y(
        n65) );
  sky130_fd_sc_hd__nor3_1 U25 ( .A(N39), .B(N41), .C(N40), .Y(n87) );
  sky130_fd_sc_hd__nor3_1 U28 ( .A(N42), .B(N44), .C(N43), .Y(n88) );
  sky130_fd_sc_hd__nor3_1 U29 ( .A(N15), .B(N17), .C(N16), .Y(n79) );
  sky130_fd_sc_hd__nor3_1 U30 ( .A(N18), .B(N20), .C(N19), .Y(n80) );
  sky130_fd_sc_hd__nor4_1 U31 ( .A(n44), .B(n46), .C(n45), .D(n42), .Y(n67) );
  sky130_fd_sc_hd__inv_2 U32 ( .A(reset), .Y(n18) );
  sky130_fd_sc_hd__inv_2 U33 ( .A(N63), .Y(N74) );
  sky130_fd_sc_hd__and3_1 U34 ( .A(n7), .B(\sub_387_4/carry[10] ), .C(n8), .X(
        n93) );
  sky130_fd_sc_hd__xor2_1 U35 ( .A(\sub_387_4/carry[8] ), .B(
        amount_to_return[8]), .X(n7) );
  sky130_fd_sc_hd__xor2_1 U67 ( .A(\sub_387_4/carry[9] ), .B(
        amount_to_return[9]), .X(n8) );
  sky130_fd_sc_hd__a21oi_1 U68 ( .A1(food_selection[1]), .A2(food_selection[0]), .B1(food_selection[2]), .Y(n96) );
  sky130_fd_sc_hd__inv_2 U69 ( .A(food_selection[4]), .Y(n15) );
  sky130_fd_sc_hd__inv_2 U70 ( .A(food_selection[3]), .Y(n16) );
  sky130_fd_sc_hd__nand3_1 U80 ( .A(n16), .B(n15), .C(n97), .Y(n72) );
  sky130_fd_sc_hd__o22ai_1 U87 ( .A1(food_selection[2]), .A2(n17), .B1(
        food_selection[1]), .B2(n98), .Y(n97) );
  sky130_fd_sc_hd__inv_2 U88 ( .A(food_selection[1]), .Y(n17) );
  sky130_fd_sc_hd__inv_2 U89 ( .A(amount_to_return[2]), .Y(N15) );
  sky130_fd_sc_hd__inv_2 U90 ( .A(N13), .Y(N25) );
  sky130_fd_sc_hd__inv_2 U91 ( .A(N14), .Y(N38) );
  sky130_fd_sc_hd__or2_0 U92 ( .A(amount_to_return[9]), .B(\sub_387/carry[9] ), 
        .X(\sub_387/carry[10] ) );
  sky130_fd_sc_hd__or2_0 U93 ( .A(amount_to_return[8]), .B(\sub_387/carry[8] ), 
        .X(\sub_387/carry[9] ) );
  sky130_fd_sc_hd__or2_0 U94 ( .A(amount_to_return[7]), .B(\sub_387/carry[7] ), 
        .X(\sub_387/carry[8] ) );
  sky130_fd_sc_hd__xnor2_1 U95 ( .A(\sub_387/carry[7] ), .B(
        amount_to_return[7]), .Y(N20) );
  sky130_fd_sc_hd__and2_0 U96 ( .A(\sub_387/carry[6] ), .B(amount_to_return[6]), .X(\sub_387/carry[7] ) );
  sky130_fd_sc_hd__xor2_1 U97 ( .A(amount_to_return[6]), .B(\sub_387/carry[6] ), .X(N19) );
  sky130_fd_sc_hd__and2_0 U98 ( .A(\sub_387/carry[5] ), .B(amount_to_return[5]), .X(\sub_387/carry[6] ) );
  sky130_fd_sc_hd__xor2_1 U99 ( .A(amount_to_return[5]), .B(\sub_387/carry[5] ), .X(N18) );
  sky130_fd_sc_hd__or2_0 U100 ( .A(amount_to_return[4]), .B(\sub_387/carry[4] ), .X(\sub_387/carry[5] ) );
  sky130_fd_sc_hd__xnor2_1 U101 ( .A(\sub_387/carry[4] ), .B(
        amount_to_return[4]), .Y(N17) );
  sky130_fd_sc_hd__or2_0 U102 ( .A(amount_to_return[3]), .B(
        amount_to_return[2]), .X(\sub_387/carry[4] ) );
  sky130_fd_sc_hd__xnor2_1 U103 ( .A(amount_to_return[2]), .B(
        amount_to_return[3]), .Y(N16) );
  sky130_fd_sc_hd__or2_0 U104 ( .A(amount_to_return[9]), .B(
        \sub_387_2/carry[9] ), .X(\sub_387_2/carry[10] ) );
  sky130_fd_sc_hd__or2_0 U105 ( .A(amount_to_return[8]), .B(
        \sub_387_2/carry[8] ), .X(\sub_387_2/carry[9] ) );
  sky130_fd_sc_hd__or2_0 U106 ( .A(amount_to_return[7]), .B(
        \sub_387_2/carry[7] ), .X(\sub_387_2/carry[8] ) );
  sky130_fd_sc_hd__xnor2_1 U107 ( .A(\sub_387_2/carry[7] ), .B(
        amount_to_return[7]), .Y(N32) );
  sky130_fd_sc_hd__and2_0 U108 ( .A(\sub_387_2/carry[6] ), .B(
        amount_to_return[6]), .X(\sub_387_2/carry[7] ) );
  sky130_fd_sc_hd__xor2_1 U109 ( .A(amount_to_return[6]), .B(
        \sub_387_2/carry[6] ), .X(N31) );
  sky130_fd_sc_hd__and2_0 U110 ( .A(\sub_387_2/carry[5] ), .B(
        amount_to_return[5]), .X(\sub_387_2/carry[6] ) );
  sky130_fd_sc_hd__xor2_1 U111 ( .A(amount_to_return[5]), .B(
        \sub_387_2/carry[5] ), .X(N30) );
  sky130_fd_sc_hd__and2_0 U112 ( .A(\sub_387_2/carry[4] ), .B(
        amount_to_return[4]), .X(\sub_387_2/carry[5] ) );
  sky130_fd_sc_hd__xor2_1 U113 ( .A(amount_to_return[4]), .B(
        \sub_387_2/carry[4] ), .X(N29) );
  sky130_fd_sc_hd__and2_0 U114 ( .A(\sub_387_2/carry[3] ), .B(
        amount_to_return[3]), .X(\sub_387_2/carry[4] ) );
  sky130_fd_sc_hd__xor2_1 U115 ( .A(amount_to_return[3]), .B(
        \sub_387_2/carry[3] ), .X(N28) );
  sky130_fd_sc_hd__and2_0 U116 ( .A(\sub_387_2/carry[2] ), .B(
        amount_to_return[2]), .X(\sub_387_2/carry[3] ) );
  sky130_fd_sc_hd__xor2_1 U117 ( .A(amount_to_return[2]), .B(
        \sub_387_2/carry[2] ), .X(N27) );
  sky130_fd_sc_hd__or2_0 U118 ( .A(N14), .B(N13), .X(\sub_387_2/carry[2] ) );
  sky130_fd_sc_hd__xnor2_1 U119 ( .A(N13), .B(N14), .Y(N26) );
  sky130_fd_sc_hd__or2_0 U120 ( .A(amount_to_return[9]), .B(
        \sub_387_3/carry[9] ), .X(\sub_387_3/carry[10] ) );
  sky130_fd_sc_hd__or2_0 U121 ( .A(amount_to_return[8]), .B(
        \sub_387_3/carry[8] ), .X(\sub_387_3/carry[9] ) );
  sky130_fd_sc_hd__and2_0 U122 ( .A(\sub_387_3/carry[7] ), .B(
        amount_to_return[7]), .X(\sub_387_3/carry[8] ) );
  sky130_fd_sc_hd__xor2_1 U123 ( .A(amount_to_return[7]), .B(
        \sub_387_3/carry[7] ), .X(N44) );
  sky130_fd_sc_hd__or2_0 U124 ( .A(amount_to_return[6]), .B(
        \sub_387_3/carry[6] ), .X(\sub_387_3/carry[7] ) );
  sky130_fd_sc_hd__xnor2_1 U125 ( .A(\sub_387_3/carry[6] ), .B(
        amount_to_return[6]), .Y(N43) );
  sky130_fd_sc_hd__or2_0 U126 ( .A(amount_to_return[5]), .B(
        \sub_387_3/carry[5] ), .X(\sub_387_3/carry[6] ) );
  sky130_fd_sc_hd__xnor2_1 U127 ( .A(\sub_387_3/carry[5] ), .B(
        amount_to_return[5]), .Y(N42) );
  sky130_fd_sc_hd__and2_0 U128 ( .A(\sub_387_3/carry[4] ), .B(
        amount_to_return[4]), .X(\sub_387_3/carry[5] ) );
  sky130_fd_sc_hd__xor2_1 U129 ( .A(amount_to_return[4]), .B(
        \sub_387_3/carry[4] ), .X(N41) );
  sky130_fd_sc_hd__or2_0 U130 ( .A(amount_to_return[3]), .B(
        \sub_387_3/carry[3] ), .X(\sub_387_3/carry[4] ) );
  sky130_fd_sc_hd__xnor2_1 U131 ( .A(\sub_387_3/carry[3] ), .B(
        amount_to_return[3]), .Y(N40) );
  sky130_fd_sc_hd__and2_0 U132 ( .A(N14), .B(amount_to_return[2]), .X(
        \sub_387_3/carry[3] ) );
  sky130_fd_sc_hd__xor2_1 U133 ( .A(amount_to_return[2]), .B(N14), .X(N39) );
  sky130_fd_sc_hd__or2_0 U134 ( .A(amount_to_return[9]), .B(
        \sub_387_4/carry[9] ), .X(\sub_387_4/carry[10] ) );
  sky130_fd_sc_hd__or2_0 U135 ( .A(amount_to_return[8]), .B(
        \sub_387_4/carry[8] ), .X(\sub_387_4/carry[9] ) );
  sky130_fd_sc_hd__and2_0 U136 ( .A(\sub_387_4/carry[7] ), .B(
        amount_to_return[7]), .X(\sub_387_4/carry[8] ) );
  sky130_fd_sc_hd__xor2_1 U137 ( .A(amount_to_return[7]), .B(
        \sub_387_4/carry[7] ), .X(N56) );
  sky130_fd_sc_hd__or2_0 U138 ( .A(amount_to_return[6]), .B(
        \sub_387_4/carry[6] ), .X(\sub_387_4/carry[7] ) );
  sky130_fd_sc_hd__xnor2_1 U139 ( .A(\sub_387_4/carry[6] ), .B(
        amount_to_return[6]), .Y(N55) );
  sky130_fd_sc_hd__and2_0 U140 ( .A(\sub_387_4/carry[5] ), .B(
        amount_to_return[5]), .X(\sub_387_4/carry[6] ) );
  sky130_fd_sc_hd__xor2_1 U141 ( .A(amount_to_return[5]), .B(
        \sub_387_4/carry[5] ), .X(N54) );
  sky130_fd_sc_hd__or2_0 U142 ( .A(amount_to_return[4]), .B(
        \sub_387_4/carry[4] ), .X(\sub_387_4/carry[5] ) );
  sky130_fd_sc_hd__xnor2_1 U143 ( .A(\sub_387_4/carry[4] ), .B(
        amount_to_return[4]), .Y(N53) );
  sky130_fd_sc_hd__and2_0 U144 ( .A(\sub_387_4/carry[3] ), .B(
        amount_to_return[3]), .X(\sub_387_4/carry[4] ) );
  sky130_fd_sc_hd__xor2_1 U145 ( .A(amount_to_return[3]), .B(
        \sub_387_4/carry[3] ), .X(N52) );
  sky130_fd_sc_hd__and2_0 U146 ( .A(\sub_387_4/carry[2] ), .B(
        amount_to_return[2]), .X(\sub_387_4/carry[3] ) );
  sky130_fd_sc_hd__xor2_1 U147 ( .A(amount_to_return[2]), .B(
        \sub_387_4/carry[2] ), .X(N51) );
  sky130_fd_sc_hd__and2_0 U148 ( .A(N13), .B(N14), .X(\sub_387_4/carry[2] ) );
  sky130_fd_sc_hd__xor2_1 U149 ( .A(N14), .B(N13), .X(N50) );
  sky130_fd_sc_hd__xnor2_1 U150 ( .A(SUM[9]), .B(\sub_437/carry[9] ), .Y(N105)
         );
  sky130_fd_sc_hd__or2_0 U151 ( .A(SUM[8]), .B(\sub_437/carry[8] ), .X(
        \sub_437/carry[9] ) );
  sky130_fd_sc_hd__xnor2_1 U152 ( .A(\sub_437/carry[8] ), .B(SUM[8]), .Y(N104)
         );
  sky130_fd_sc_hd__and2_0 U153 ( .A(\sub_437/carry[7] ), .B(SUM[7]), .X(
        \sub_437/carry[8] ) );
  sky130_fd_sc_hd__xor2_1 U154 ( .A(SUM[7]), .B(\sub_437/carry[7] ), .X(N103)
         );
  sky130_fd_sc_hd__or2_0 U155 ( .A(SUM[6]), .B(\sub_437/carry[6] ), .X(
        \sub_437/carry[7] ) );
  sky130_fd_sc_hd__xnor2_1 U156 ( .A(\sub_437/carry[6] ), .B(SUM[6]), .Y(N102)
         );
  sky130_fd_sc_hd__and2_0 U157 ( .A(\sub_437/carry[5] ), .B(SUM[5]), .X(
        \sub_437/carry[6] ) );
  sky130_fd_sc_hd__xor2_1 U158 ( .A(SUM[5]), .B(\sub_437/carry[5] ), .X(N101)
         );
  sky130_fd_sc_hd__or2_0 U159 ( .A(SUM[4]), .B(\sub_437/carry[4] ), .X(
        \sub_437/carry[5] ) );
  sky130_fd_sc_hd__xnor2_1 U160 ( .A(\sub_437/carry[4] ), .B(SUM[4]), .Y(N100)
         );
  sky130_fd_sc_hd__and2_0 U161 ( .A(\sub_437/carry[3] ), .B(SUM[3]), .X(
        \sub_437/carry[4] ) );
  sky130_fd_sc_hd__xor2_1 U162 ( .A(SUM[3]), .B(\sub_437/carry[3] ), .X(N99)
         );
  sky130_fd_sc_hd__and2_0 U163 ( .A(\sub_437/carry[2] ), .B(SUM[2]), .X(
        \sub_437/carry[3] ) );
  sky130_fd_sc_hd__xor2_1 U164 ( .A(SUM[2]), .B(\sub_437/carry[2] ), .X(N98)
         );
  sky130_fd_sc_hd__and2_0 U165 ( .A(N63), .B(N64), .X(\sub_437/carry[2] ) );
  sky130_fd_sc_hd__xor2_1 U166 ( .A(N64), .B(N63), .X(N97) );
  sky130_fd_sc_hd__xnor2_1 U167 ( .A(SUM[9]), .B(\sub_430/carry[9] ), .Y(N94)
         );
  sky130_fd_sc_hd__or2_0 U168 ( .A(SUM[8]), .B(\sub_430/carry[8] ), .X(
        \sub_430/carry[9] ) );
  sky130_fd_sc_hd__xnor2_1 U169 ( .A(\sub_430/carry[8] ), .B(SUM[8]), .Y(N93)
         );
  sky130_fd_sc_hd__and2_0 U170 ( .A(\sub_430/carry[7] ), .B(SUM[7]), .X(
        \sub_430/carry[8] ) );
  sky130_fd_sc_hd__xor2_1 U171 ( .A(SUM[7]), .B(\sub_430/carry[7] ), .X(N92)
         );
  sky130_fd_sc_hd__or2_0 U172 ( .A(SUM[6]), .B(\sub_430/carry[6] ), .X(
        \sub_430/carry[7] ) );
  sky130_fd_sc_hd__xnor2_1 U173 ( .A(\sub_430/carry[6] ), .B(SUM[6]), .Y(N91)
         );
  sky130_fd_sc_hd__or2_0 U174 ( .A(SUM[5]), .B(\sub_430/carry[5] ), .X(
        \sub_430/carry[6] ) );
  sky130_fd_sc_hd__xnor2_1 U175 ( .A(\sub_430/carry[5] ), .B(SUM[5]), .Y(N90)
         );
  sky130_fd_sc_hd__and2_0 U176 ( .A(\sub_430/carry[4] ), .B(SUM[4]), .X(
        \sub_430/carry[5] ) );
  sky130_fd_sc_hd__xor2_1 U177 ( .A(SUM[4]), .B(\sub_430/carry[4] ), .X(N89)
         );
  sky130_fd_sc_hd__or2_0 U178 ( .A(SUM[3]), .B(\sub_430/carry[3] ), .X(
        \sub_430/carry[4] ) );
  sky130_fd_sc_hd__xnor2_1 U179 ( .A(\sub_430/carry[3] ), .B(SUM[3]), .Y(N88)
         );
  sky130_fd_sc_hd__and2_0 U180 ( .A(N64), .B(SUM[2]), .X(\sub_430/carry[3] )
         );
  sky130_fd_sc_hd__xor2_1 U181 ( .A(SUM[2]), .B(N64), .X(N87) );
  sky130_fd_sc_hd__xnor2_1 U182 ( .A(SUM[9]), .B(\sub_416/carry[9] ), .Y(N72)
         );
  sky130_fd_sc_hd__or2_0 U183 ( .A(SUM[8]), .B(\sub_416/carry[8] ), .X(
        \sub_416/carry[9] ) );
  sky130_fd_sc_hd__xnor2_1 U184 ( .A(\sub_416/carry[8] ), .B(SUM[8]), .Y(N71)
         );
  sky130_fd_sc_hd__or2_0 U185 ( .A(SUM[7]), .B(\sub_416/carry[7] ), .X(
        \sub_416/carry[8] ) );
  sky130_fd_sc_hd__xnor2_1 U186 ( .A(\sub_416/carry[7] ), .B(SUM[7]), .Y(N70)
         );
  sky130_fd_sc_hd__and2_0 U187 ( .A(\sub_416/carry[6] ), .B(SUM[6]), .X(
        \sub_416/carry[7] ) );
  sky130_fd_sc_hd__xor2_1 U188 ( .A(SUM[6]), .B(\sub_416/carry[6] ), .X(N69)
         );
  sky130_fd_sc_hd__and2_0 U189 ( .A(\sub_416/carry[5] ), .B(SUM[5]), .X(
        \sub_416/carry[6] ) );
  sky130_fd_sc_hd__xor2_1 U190 ( .A(SUM[5]), .B(\sub_416/carry[5] ), .X(N68)
         );
  sky130_fd_sc_hd__or2_0 U191 ( .A(SUM[4]), .B(\sub_416/carry[4] ), .X(
        \sub_416/carry[5] ) );
  sky130_fd_sc_hd__xnor2_1 U192 ( .A(\sub_416/carry[4] ), .B(SUM[4]), .Y(N67)
         );
  sky130_fd_sc_hd__or2_0 U193 ( .A(SUM[3]), .B(SUM[2]), .X(\sub_416/carry[4] )
         );
  sky130_fd_sc_hd__xnor2_1 U194 ( .A(SUM[2]), .B(SUM[3]), .Y(N66) );
  sky130_fd_sc_hd__xnor2_1 U195 ( .A(SUM[9]), .B(\sub_423/carry[9] ), .Y(N83)
         );
  sky130_fd_sc_hd__or2_0 U196 ( .A(SUM[8]), .B(\sub_423/carry[8] ), .X(
        \sub_423/carry[9] ) );
  sky130_fd_sc_hd__xnor2_1 U197 ( .A(\sub_423/carry[8] ), .B(SUM[8]), .Y(N82)
         );
  sky130_fd_sc_hd__or2_0 U198 ( .A(SUM[7]), .B(\sub_423/carry[7] ), .X(
        \sub_423/carry[8] ) );
  sky130_fd_sc_hd__xnor2_1 U199 ( .A(\sub_423/carry[7] ), .B(SUM[7]), .Y(N81)
         );
  sky130_fd_sc_hd__and2_0 U200 ( .A(\sub_423/carry[6] ), .B(SUM[6]), .X(
        \sub_423/carry[7] ) );
  sky130_fd_sc_hd__xor2_1 U201 ( .A(SUM[6]), .B(\sub_423/carry[6] ), .X(N80)
         );
  sky130_fd_sc_hd__and2_0 U202 ( .A(\sub_423/carry[5] ), .B(SUM[5]), .X(
        \sub_423/carry[6] ) );
  sky130_fd_sc_hd__xor2_1 U203 ( .A(SUM[5]), .B(\sub_423/carry[5] ), .X(N79)
         );
  sky130_fd_sc_hd__and2_0 U204 ( .A(\sub_423/carry[4] ), .B(SUM[4]), .X(
        \sub_423/carry[5] ) );
  sky130_fd_sc_hd__xor2_1 U205 ( .A(SUM[4]), .B(\sub_423/carry[4] ), .X(N78)
         );
  sky130_fd_sc_hd__and2_0 U206 ( .A(\sub_423/carry[3] ), .B(SUM[3]), .X(
        \sub_423/carry[4] ) );
  sky130_fd_sc_hd__xor2_1 U207 ( .A(SUM[3]), .B(\sub_423/carry[3] ), .X(N77)
         );
  sky130_fd_sc_hd__and2_0 U208 ( .A(\sub_423/carry[2] ), .B(SUM[2]), .X(
        \sub_423/carry[3] ) );
  sky130_fd_sc_hd__xor2_1 U209 ( .A(SUM[2]), .B(\sub_423/carry[2] ), .X(N76)
         );
  sky130_fd_sc_hd__or2_0 U210 ( .A(N64), .B(N63), .X(\sub_423/carry[2] ) );
  sky130_fd_sc_hd__xnor2_1 U211 ( .A(N63), .B(N64), .Y(N75) );
  sky130_fd_sc_hd__or3_1 U212 ( .A(SUM[9]), .B(SUM[8]), .C(SUM[7]), .X(n11) );
  sky130_fd_sc_hd__or3_1 U213 ( .A(SUM[6]), .B(SUM[5]), .C(n11), .X(n13) );
  sky130_fd_sc_hd__or3_1 U214 ( .A(SUM[4]), .B(SUM[3]), .C(SUM[2]), .X(n12) );
  sky130_fd_sc_hd__nor4_1 U215 ( .A(n13), .B(n12), .C(N64), .D(N63), .Y(N1) );
endmodule


module coin_dispenser ( clock, load, amount_to_return, coin_to_return, 
        change_returned );
  input [9:0] amount_to_return;
  output [2:0] coin_to_return;
  input clock, load;
  output change_returned;
  wire   N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N35, N36, N37, N38,
         N39, N40, N41, N42, N43, N45, N46, N47, N48, N49, N50, N51, N52, N53,
         N54, N57, N58, N59, N60, N61, N62, N63, N64, N65, N69, N70, N71, N72,
         N73, N74, N75, N76, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87,
         N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N100, n74,
         \sub_362/carry[9] , \sub_362/carry[8] , \sub_362/carry[7] ,
         \sub_362/carry[6] , \sub_362/carry[5] , \sub_362/carry[4] ,
         \sub_355/carry[9] , \sub_355/carry[8] , \sub_355/carry[7] ,
         \sub_355/carry[6] , \sub_355/carry[5] , \sub_355/carry[4] ,
         \sub_355/carry[3] , \sub_348/carry[2] , \sub_348/carry[3] ,
         \sub_348/carry[4] , \sub_348/carry[5] , \sub_348/carry[6] ,
         \sub_348/carry[7] , \sub_348/carry[8] , \sub_348/carry[9] ,
         \sub_341/carry[9] , \sub_341/carry[8] , \sub_341/carry[7] ,
         \sub_341/carry[6] , \sub_341/carry[5] , \sub_341/carry[4] ,
         \sub_341/carry[3] , \sub_334/carry[2] , \sub_334/carry[3] ,
         \sub_334/carry[4] , \sub_334/carry[5] , \sub_334/carry[6] ,
         \sub_334/carry[7] , \sub_334/carry[8] , \sub_334/carry[9] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70;
  wire   [9:0] amount_left;

  sky130_fd_sc_hd__dfxtp_1 \amount_left_reg[7]  ( .D(N94), .CLK(clock), .Q(
        amount_left[7]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_left_reg[8]  ( .D(N95), .CLK(clock), .Q(
        amount_left[8]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_left_reg[6]  ( .D(N93), .CLK(clock), .Q(
        amount_left[6]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_left_reg[5]  ( .D(N92), .CLK(clock), .Q(
        amount_left[5]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_left_reg[4]  ( .D(N91), .CLK(clock), .Q(
        amount_left[4]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_left_reg[0]  ( .D(N87), .CLK(clock), .Q(N45) );
  sky130_fd_sc_hd__dfxtp_1 \amount_left_reg[3]  ( .D(N90), .CLK(clock), .Q(
        amount_left[3]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_left_reg[1]  ( .D(N88), .CLK(clock), .Q(N78) );
  sky130_fd_sc_hd__dfxtp_1 \amount_left_reg[2]  ( .D(N89), .CLK(clock), .Q(
        amount_left[2]) );
  sky130_fd_sc_hd__dfxtp_1 \amount_left_reg[9]  ( .D(N96), .CLK(clock), .Q(
        amount_left[9]) );
  sky130_fd_sc_hd__dfxtp_1 change_returned_reg ( .D(N100), .CLK(clock), .Q(
        change_returned) );
  sky130_fd_sc_hd__dfxtp_1 \coin_to_return_reg[2]  ( .D(n74), .CLK(clock), .Q(
        coin_to_return[2]) );
  sky130_fd_sc_hd__dfxtp_1 \coin_to_return_reg[0]  ( .D(N97), .CLK(clock), .Q(
        coin_to_return[0]) );
  sky130_fd_sc_hd__dfxtp_1 \coin_to_return_reg[1]  ( .D(N98), .CLK(clock), .Q(
        coin_to_return[1]) );
  sky130_fd_sc_hd__nor2b_1 U3 ( .B_N(n51), .A(n52), .Y(n15) );
  sky130_fd_sc_hd__and3_1 U4 ( .A(n56), .B(n50), .C(n74), .X(n14) );
  sky130_fd_sc_hd__nor2b_1 U5 ( .B_N(n74), .A(n56), .Y(n17) );
  sky130_fd_sc_hd__nor2b_1 U6 ( .B_N(n51), .A(n53), .Y(n16) );
  sky130_fd_sc_hd__inv_2 U7 ( .A(n2), .Y(n10) );
  sky130_fd_sc_hd__inv_2 U8 ( .A(n3), .Y(n11) );
  sky130_fd_sc_hd__inv_2 U9 ( .A(n4), .Y(n12) );
  sky130_fd_sc_hd__inv_2 U10 ( .A(n5), .Y(n13) );
  sky130_fd_sc_hd__nor3b_1 U11 ( .C_N(n54), .A(load), .B(n55), .Y(n18) );
  sky130_fd_sc_hd__inv_2 U12 ( .A(amount_left[7]), .Y(n9) );
  sky130_fd_sc_hd__inv_2 U13 ( .A(amount_left[2]), .Y(N79) );
  sky130_fd_sc_hd__inv_2 U14 ( .A(N45), .Y(N23) );
  sky130_fd_sc_hd__inv_2 U15 ( .A(N78), .Y(N46) );
  sky130_fd_sc_hd__xnor2_1 U16 ( .A(amount_left[9]), .B(\sub_348/carry[9] ), 
        .Y(N65) );
  sky130_fd_sc_hd__or2_0 U17 ( .A(amount_left[8]), .B(\sub_348/carry[8] ), .X(
        \sub_348/carry[9] ) );
  sky130_fd_sc_hd__xnor2_1 U18 ( .A(\sub_348/carry[8] ), .B(amount_left[8]), 
        .Y(N64) );
  sky130_fd_sc_hd__or2_0 U19 ( .A(amount_left[7]), .B(\sub_348/carry[7] ), .X(
        \sub_348/carry[8] ) );
  sky130_fd_sc_hd__xnor2_1 U20 ( .A(\sub_348/carry[7] ), .B(amount_left[7]), 
        .Y(N63) );
  sky130_fd_sc_hd__or2_0 U21 ( .A(amount_left[6]), .B(\sub_348/carry[6] ), .X(
        \sub_348/carry[7] ) );
  sky130_fd_sc_hd__xnor2_1 U22 ( .A(\sub_348/carry[6] ), .B(amount_left[6]), 
        .Y(N62) );
  sky130_fd_sc_hd__or2_0 U23 ( .A(amount_left[5]), .B(\sub_348/carry[5] ), .X(
        \sub_348/carry[6] ) );
  sky130_fd_sc_hd__xnor2_1 U24 ( .A(\sub_348/carry[5] ), .B(amount_left[5]), 
        .Y(N61) );
  sky130_fd_sc_hd__and2_0 U25 ( .A(\sub_348/carry[4] ), .B(amount_left[4]), 
        .X(\sub_348/carry[5] ) );
  sky130_fd_sc_hd__xor2_1 U26 ( .A(amount_left[4]), .B(\sub_348/carry[4] ), 
        .X(N60) );
  sky130_fd_sc_hd__and2_0 U27 ( .A(\sub_348/carry[3] ), .B(amount_left[3]), 
        .X(\sub_348/carry[4] ) );
  sky130_fd_sc_hd__xor2_1 U28 ( .A(amount_left[3]), .B(\sub_348/carry[3] ), 
        .X(N59) );
  sky130_fd_sc_hd__or2_0 U29 ( .A(amount_left[2]), .B(\sub_348/carry[2] ), .X(
        \sub_348/carry[3] ) );
  sky130_fd_sc_hd__xnor2_1 U30 ( .A(\sub_348/carry[2] ), .B(amount_left[2]), 
        .Y(N58) );
  sky130_fd_sc_hd__xnor2_1 U31 ( .A(amount_left[9]), .B(\sub_341/carry[9] ), 
        .Y(N54) );
  sky130_fd_sc_hd__or2_0 U32 ( .A(amount_left[8]), .B(\sub_341/carry[8] ), .X(
        \sub_341/carry[9] ) );
  sky130_fd_sc_hd__xnor2_1 U33 ( .A(\sub_341/carry[8] ), .B(amount_left[8]), 
        .Y(N53) );
  sky130_fd_sc_hd__or2_0 U34 ( .A(amount_left[7]), .B(\sub_341/carry[7] ), .X(
        \sub_341/carry[8] ) );
  sky130_fd_sc_hd__xnor2_1 U35 ( .A(\sub_341/carry[7] ), .B(amount_left[7]), 
        .Y(N52) );
  sky130_fd_sc_hd__or2_0 U36 ( .A(amount_left[6]), .B(\sub_341/carry[6] ), .X(
        \sub_341/carry[7] ) );
  sky130_fd_sc_hd__xnor2_1 U37 ( .A(\sub_341/carry[6] ), .B(amount_left[6]), 
        .Y(N51) );
  sky130_fd_sc_hd__or2_0 U38 ( .A(amount_left[5]), .B(\sub_341/carry[5] ), .X(
        \sub_341/carry[6] ) );
  sky130_fd_sc_hd__xnor2_1 U39 ( .A(\sub_341/carry[5] ), .B(amount_left[5]), 
        .Y(N50) );
  sky130_fd_sc_hd__or2_0 U40 ( .A(amount_left[4]), .B(\sub_341/carry[4] ), .X(
        \sub_341/carry[5] ) );
  sky130_fd_sc_hd__xnor2_1 U41 ( .A(\sub_341/carry[4] ), .B(amount_left[4]), 
        .Y(N49) );
  sky130_fd_sc_hd__and2_0 U42 ( .A(\sub_341/carry[3] ), .B(amount_left[3]), 
        .X(\sub_341/carry[4] ) );
  sky130_fd_sc_hd__xor2_1 U43 ( .A(amount_left[3]), .B(\sub_341/carry[3] ), 
        .X(N48) );
  sky130_fd_sc_hd__or2_0 U44 ( .A(amount_left[2]), .B(N78), .X(
        \sub_341/carry[3] ) );
  sky130_fd_sc_hd__xnor2_1 U45 ( .A(N78), .B(amount_left[2]), .Y(N47) );
  sky130_fd_sc_hd__xnor2_1 U46 ( .A(amount_left[9]), .B(\sub_334/carry[9] ), 
        .Y(N43) );
  sky130_fd_sc_hd__or2_0 U47 ( .A(amount_left[8]), .B(\sub_334/carry[8] ), .X(
        \sub_334/carry[9] ) );
  sky130_fd_sc_hd__xnor2_1 U48 ( .A(\sub_334/carry[8] ), .B(amount_left[8]), 
        .Y(N42) );
  sky130_fd_sc_hd__or2_0 U49 ( .A(amount_left[7]), .B(\sub_334/carry[7] ), .X(
        \sub_334/carry[8] ) );
  sky130_fd_sc_hd__xnor2_1 U50 ( .A(\sub_334/carry[7] ), .B(amount_left[7]), 
        .Y(N41) );
  sky130_fd_sc_hd__or2_0 U51 ( .A(amount_left[6]), .B(\sub_334/carry[6] ), .X(
        \sub_334/carry[7] ) );
  sky130_fd_sc_hd__xnor2_1 U52 ( .A(\sub_334/carry[6] ), .B(amount_left[6]), 
        .Y(N40) );
  sky130_fd_sc_hd__or2_0 U53 ( .A(amount_left[5]), .B(\sub_334/carry[5] ), .X(
        \sub_334/carry[6] ) );
  sky130_fd_sc_hd__xnor2_1 U54 ( .A(\sub_334/carry[5] ), .B(amount_left[5]), 
        .Y(N39) );
  sky130_fd_sc_hd__or2_0 U55 ( .A(amount_left[4]), .B(\sub_334/carry[4] ), .X(
        \sub_334/carry[5] ) );
  sky130_fd_sc_hd__xnor2_1 U56 ( .A(\sub_334/carry[4] ), .B(amount_left[4]), 
        .Y(N38) );
  sky130_fd_sc_hd__or2_0 U57 ( .A(amount_left[3]), .B(\sub_334/carry[3] ), .X(
        \sub_334/carry[4] ) );
  sky130_fd_sc_hd__xnor2_1 U58 ( .A(\sub_334/carry[3] ), .B(amount_left[3]), 
        .Y(N37) );
  sky130_fd_sc_hd__and2_0 U59 ( .A(\sub_334/carry[2] ), .B(amount_left[2]), 
        .X(\sub_334/carry[3] ) );
  sky130_fd_sc_hd__xor2_1 U60 ( .A(amount_left[2]), .B(\sub_334/carry[2] ), 
        .X(N36) );
  sky130_fd_sc_hd__xnor2_1 U61 ( .A(amount_left[9]), .B(\sub_362/carry[9] ), 
        .Y(N86) );
  sky130_fd_sc_hd__or2_0 U62 ( .A(amount_left[8]), .B(\sub_362/carry[8] ), .X(
        \sub_362/carry[9] ) );
  sky130_fd_sc_hd__xnor2_1 U63 ( .A(\sub_362/carry[8] ), .B(amount_left[8]), 
        .Y(N85) );
  sky130_fd_sc_hd__or2_0 U64 ( .A(amount_left[7]), .B(\sub_362/carry[7] ), .X(
        \sub_362/carry[8] ) );
  sky130_fd_sc_hd__xnor2_1 U65 ( .A(\sub_362/carry[7] ), .B(amount_left[7]), 
        .Y(N84) );
  sky130_fd_sc_hd__and2_0 U66 ( .A(\sub_362/carry[6] ), .B(amount_left[6]), 
        .X(\sub_362/carry[7] ) );
  sky130_fd_sc_hd__xor2_1 U67 ( .A(amount_left[6]), .B(\sub_362/carry[6] ), 
        .X(N83) );
  sky130_fd_sc_hd__and2_0 U68 ( .A(\sub_362/carry[5] ), .B(amount_left[5]), 
        .X(\sub_362/carry[6] ) );
  sky130_fd_sc_hd__xor2_1 U69 ( .A(amount_left[5]), .B(\sub_362/carry[5] ), 
        .X(N82) );
  sky130_fd_sc_hd__or2_0 U70 ( .A(amount_left[4]), .B(\sub_362/carry[4] ), .X(
        \sub_362/carry[5] ) );
  sky130_fd_sc_hd__xnor2_1 U71 ( .A(\sub_362/carry[4] ), .B(amount_left[4]), 
        .Y(N81) );
  sky130_fd_sc_hd__or2_0 U72 ( .A(amount_left[3]), .B(amount_left[2]), .X(
        \sub_362/carry[4] ) );
  sky130_fd_sc_hd__xnor2_1 U73 ( .A(amount_left[2]), .B(amount_left[3]), .Y(
        N80) );
  sky130_fd_sc_hd__xnor2_1 U74 ( .A(amount_left[9]), .B(\sub_355/carry[9] ), 
        .Y(N76) );
  sky130_fd_sc_hd__or2_0 U75 ( .A(amount_left[8]), .B(\sub_355/carry[8] ), .X(
        \sub_355/carry[9] ) );
  sky130_fd_sc_hd__xnor2_1 U76 ( .A(\sub_355/carry[8] ), .B(amount_left[8]), 
        .Y(N75) );
  sky130_fd_sc_hd__or2_0 U77 ( .A(amount_left[7]), .B(\sub_355/carry[7] ), .X(
        \sub_355/carry[8] ) );
  sky130_fd_sc_hd__xnor2_1 U78 ( .A(\sub_355/carry[7] ), .B(amount_left[7]), 
        .Y(N74) );
  sky130_fd_sc_hd__or2_0 U79 ( .A(amount_left[6]), .B(\sub_355/carry[6] ), .X(
        \sub_355/carry[7] ) );
  sky130_fd_sc_hd__xnor2_1 U80 ( .A(\sub_355/carry[6] ), .B(amount_left[6]), 
        .Y(N73) );
  sky130_fd_sc_hd__and2_0 U81 ( .A(\sub_355/carry[5] ), .B(amount_left[5]), 
        .X(\sub_355/carry[6] ) );
  sky130_fd_sc_hd__xor2_1 U82 ( .A(amount_left[5]), .B(\sub_355/carry[5] ), 
        .X(N72) );
  sky130_fd_sc_hd__and2_0 U83 ( .A(\sub_355/carry[4] ), .B(amount_left[4]), 
        .X(\sub_355/carry[5] ) );
  sky130_fd_sc_hd__xor2_1 U84 ( .A(amount_left[4]), .B(\sub_355/carry[4] ), 
        .X(N71) );
  sky130_fd_sc_hd__or2_0 U85 ( .A(amount_left[3]), .B(\sub_355/carry[3] ), .X(
        \sub_355/carry[4] ) );
  sky130_fd_sc_hd__xnor2_1 U86 ( .A(\sub_355/carry[3] ), .B(amount_left[3]), 
        .Y(N70) );
  sky130_fd_sc_hd__or2_0 U87 ( .A(amount_left[2]), .B(N78), .X(
        \sub_355/carry[3] ) );
  sky130_fd_sc_hd__xnor2_1 U88 ( .A(N78), .B(amount_left[2]), .Y(N69) );
  sky130_fd_sc_hd__or2_0 U89 ( .A(N78), .B(N45), .X(\sub_348/carry[2] ) );
  sky130_fd_sc_hd__xnor2_1 U90 ( .A(N45), .B(N78), .Y(N57) );
  sky130_fd_sc_hd__or2_0 U91 ( .A(N78), .B(N45), .X(\sub_334/carry[2] ) );
  sky130_fd_sc_hd__xnor2_1 U92 ( .A(N45), .B(N78), .Y(N35) );
  sky130_fd_sc_hd__nor2_1 U93 ( .A(N78), .B(N45), .Y(n1) );
  sky130_fd_sc_hd__a21o_1 U94 ( .A1(N45), .A2(N78), .B1(n1), .X(N24) );
  sky130_fd_sc_hd__nor2_1 U95 ( .A(\sub_334/carry[2] ), .B(amount_left[2]), 
        .Y(n2) );
  sky130_fd_sc_hd__a21o_1 U96 ( .A1(\sub_334/carry[2] ), .A2(amount_left[2]), 
        .B1(n2), .X(N25) );
  sky130_fd_sc_hd__nor2_1 U97 ( .A(n10), .B(amount_left[3]), .Y(n3) );
  sky130_fd_sc_hd__a21o_1 U98 ( .A1(n10), .A2(amount_left[3]), .B1(n3), .X(N26) );
  sky130_fd_sc_hd__nor2_1 U99 ( .A(n11), .B(amount_left[4]), .Y(n4) );
  sky130_fd_sc_hd__a21o_1 U100 ( .A1(n11), .A2(amount_left[4]), .B1(n4), .X(
        N27) );
  sky130_fd_sc_hd__nor2_1 U101 ( .A(n12), .B(amount_left[5]), .Y(n5) );
  sky130_fd_sc_hd__a21o_1 U102 ( .A1(n12), .A2(amount_left[5]), .B1(n5), .X(
        N28) );
  sky130_fd_sc_hd__nor2_1 U103 ( .A(n13), .B(amount_left[6]), .Y(n6) );
  sky130_fd_sc_hd__a21o_1 U104 ( .A1(n13), .A2(amount_left[6]), .B1(n6), .X(
        N29) );
  sky130_fd_sc_hd__nand2_1 U105 ( .A(n6), .B(n9), .Y(n7) );
  sky130_fd_sc_hd__o21ai_0 U106 ( .A1(n6), .A2(n9), .B1(n7), .Y(N30) );
  sky130_fd_sc_hd__xnor2_1 U107 ( .A(amount_left[8]), .B(n7), .Y(N31) );
  sky130_fd_sc_hd__nor2_1 U108 ( .A(amount_left[8]), .B(n7), .Y(n8) );
  sky130_fd_sc_hd__xor2_1 U109 ( .A(amount_left[9]), .B(n8), .X(N32) );
  sky130_fd_sc_hd__or3_1 U110 ( .A(n14), .B(n15), .C(n16), .X(N98) );
  sky130_fd_sc_hd__or3_1 U111 ( .A(n17), .B(n15), .C(n18), .X(N97) );
  sky130_fd_sc_hd__nand3_1 U112 ( .A(n19), .B(n20), .C(n21), .Y(N96) );
  sky130_fd_sc_hd__a222oi_1 U113 ( .A1(load), .A2(amount_to_return[9]), .B1(
        N54), .B2(n15), .C1(N65), .C2(n22), .Y(n21) );
  sky130_fd_sc_hd__a22oi_1 U114 ( .A1(N32), .A2(n18), .B1(N43), .B2(n16), .Y(
        n20) );
  sky130_fd_sc_hd__a22oi_1 U115 ( .A1(N76), .A2(n17), .B1(N86), .B2(n14), .Y(
        n19) );
  sky130_fd_sc_hd__nand3_1 U116 ( .A(n23), .B(n24), .C(n25), .Y(N95) );
  sky130_fd_sc_hd__a222oi_1 U117 ( .A1(amount_to_return[8]), .A2(load), .B1(
        N53), .B2(n15), .C1(N64), .C2(n22), .Y(n25) );
  sky130_fd_sc_hd__a22oi_1 U118 ( .A1(N31), .A2(n18), .B1(N42), .B2(n16), .Y(
        n24) );
  sky130_fd_sc_hd__a22oi_1 U119 ( .A1(N75), .A2(n17), .B1(N85), .B2(n14), .Y(
        n23) );
  sky130_fd_sc_hd__nand3_1 U120 ( .A(n26), .B(n27), .C(n28), .Y(N94) );
  sky130_fd_sc_hd__a222oi_1 U121 ( .A1(amount_to_return[7]), .A2(load), .B1(
        N52), .B2(n15), .C1(N63), .C2(n22), .Y(n28) );
  sky130_fd_sc_hd__a22oi_1 U122 ( .A1(N30), .A2(n18), .B1(N41), .B2(n16), .Y(
        n27) );
  sky130_fd_sc_hd__a22oi_1 U123 ( .A1(N74), .A2(n17), .B1(N84), .B2(n14), .Y(
        n26) );
  sky130_fd_sc_hd__nand3_1 U124 ( .A(n29), .B(n30), .C(n31), .Y(N93) );
  sky130_fd_sc_hd__a222oi_1 U125 ( .A1(amount_to_return[6]), .A2(load), .B1(
        N51), .B2(n15), .C1(N62), .C2(n22), .Y(n31) );
  sky130_fd_sc_hd__a22oi_1 U126 ( .A1(N29), .A2(n18), .B1(N40), .B2(n16), .Y(
        n30) );
  sky130_fd_sc_hd__a22oi_1 U127 ( .A1(N73), .A2(n17), .B1(N83), .B2(n14), .Y(
        n29) );
  sky130_fd_sc_hd__nand3_1 U128 ( .A(n32), .B(n33), .C(n34), .Y(N92) );
  sky130_fd_sc_hd__a222oi_1 U129 ( .A1(amount_to_return[5]), .A2(load), .B1(
        N50), .B2(n15), .C1(N61), .C2(n22), .Y(n34) );
  sky130_fd_sc_hd__a22oi_1 U130 ( .A1(N28), .A2(n18), .B1(N39), .B2(n16), .Y(
        n33) );
  sky130_fd_sc_hd__a22oi_1 U131 ( .A1(N72), .A2(n17), .B1(N82), .B2(n14), .Y(
        n32) );
  sky130_fd_sc_hd__nand3_1 U132 ( .A(n35), .B(n36), .C(n37), .Y(N91) );
  sky130_fd_sc_hd__a222oi_1 U133 ( .A1(amount_to_return[4]), .A2(load), .B1(
        N49), .B2(n15), .C1(N60), .C2(n22), .Y(n37) );
  sky130_fd_sc_hd__a22oi_1 U134 ( .A1(N27), .A2(n18), .B1(N38), .B2(n16), .Y(
        n36) );
  sky130_fd_sc_hd__a22oi_1 U135 ( .A1(N71), .A2(n17), .B1(N81), .B2(n14), .Y(
        n35) );
  sky130_fd_sc_hd__nand3_1 U136 ( .A(n38), .B(n39), .C(n40), .Y(N90) );
  sky130_fd_sc_hd__a222oi_1 U137 ( .A1(amount_to_return[3]), .A2(load), .B1(
        N48), .B2(n15), .C1(N59), .C2(n22), .Y(n40) );
  sky130_fd_sc_hd__a22oi_1 U138 ( .A1(N26), .A2(n18), .B1(N37), .B2(n16), .Y(
        n39) );
  sky130_fd_sc_hd__a22oi_1 U139 ( .A1(N70), .A2(n17), .B1(N80), .B2(n14), .Y(
        n38) );
  sky130_fd_sc_hd__nand3_1 U140 ( .A(n41), .B(n42), .C(n43), .Y(N89) );
  sky130_fd_sc_hd__a222oi_1 U141 ( .A1(amount_to_return[2]), .A2(load), .B1(
        N47), .B2(n15), .C1(N58), .C2(n22), .Y(n43) );
  sky130_fd_sc_hd__a22oi_1 U142 ( .A1(N25), .A2(n18), .B1(N36), .B2(n16), .Y(
        n42) );
  sky130_fd_sc_hd__a22oi_1 U143 ( .A1(N69), .A2(n17), .B1(N79), .B2(n14), .Y(
        n41) );
  sky130_fd_sc_hd__nand3_1 U144 ( .A(n44), .B(n45), .C(n46), .Y(N88) );
  sky130_fd_sc_hd__a222oi_1 U145 ( .A1(amount_to_return[1]), .A2(load), .B1(
        N46), .B2(n15), .C1(N57), .C2(n22), .Y(n46) );
  sky130_fd_sc_hd__a22oi_1 U146 ( .A1(N24), .A2(n18), .B1(N35), .B2(n16), .Y(
        n45) );
  sky130_fd_sc_hd__a22oi_1 U147 ( .A1(N46), .A2(n17), .B1(N78), .B2(n14), .Y(
        n44) );
  sky130_fd_sc_hd__nand3_1 U148 ( .A(n47), .B(n48), .C(n49), .Y(N87) );
  sky130_fd_sc_hd__a222oi_1 U149 ( .A1(amount_to_return[0]), .A2(load), .B1(
        N45), .B2(n15), .C1(N23), .C2(n22), .Y(n49) );
  sky130_fd_sc_hd__nor2b_1 U150 ( .B_N(n74), .A(n50), .Y(n22) );
  sky130_fd_sc_hd__a22oi_1 U151 ( .A1(N23), .A2(n18), .B1(N23), .B2(n16), .Y(
        n48) );
  sky130_fd_sc_hd__a22oi_1 U152 ( .A1(N45), .A2(n17), .B1(N45), .B2(n14), .Y(
        n47) );
  sky130_fd_sc_hd__nand3_1 U153 ( .A(n57), .B(n50), .C(n58), .Y(n56) );
  sky130_fd_sc_hd__o311ai_0 U154 ( .A1(n59), .A2(n60), .A3(n61), .B1(n62), 
        .C1(n58), .Y(n50) );
  sky130_fd_sc_hd__o311ai_0 U155 ( .A1(amount_left[2]), .A2(amount_left[4]), 
        .A3(amount_left[3]), .B1(amount_left[5]), .C1(amount_left[6]), .Y(n57)
         );
  sky130_fd_sc_hd__and3_1 U156 ( .A(n52), .B(n53), .C(n51), .X(n74) );
  sky130_fd_sc_hd__nor2b_1 U157 ( .B_N(n55), .A(load), .Y(n51) );
  sky130_fd_sc_hd__nand3_1 U158 ( .A(n63), .B(n64), .C(n65), .Y(n55) );
  sky130_fd_sc_hd__o21ai_0 U159 ( .A1(N45), .A2(N78), .B1(amount_left[2]), .Y(
        n63) );
  sky130_fd_sc_hd__o21ai_0 U160 ( .A1(n66), .A2(n64), .B1(n65), .Y(n53) );
  sky130_fd_sc_hd__clkinv_1 U161 ( .A(amount_left[3]), .Y(n64) );
  sky130_fd_sc_hd__o2111ai_1 U162 ( .A1(n61), .A2(n67), .B1(n59), .C1(n62), 
        .D1(n68), .Y(n52) );
  sky130_fd_sc_hd__nor2_1 U163 ( .A(n69), .B(n70), .Y(n68) );
  sky130_fd_sc_hd__a21boi_0 U164 ( .A1(amount_left[3]), .A2(\sub_355/carry[3] ), .B1_N(n65), .Y(n69) );
  sky130_fd_sc_hd__clkinv_1 U165 ( .A(amount_left[6]), .Y(n62) );
  sky130_fd_sc_hd__clkinv_1 U166 ( .A(amount_left[5]), .Y(n59) );
  sky130_fd_sc_hd__o21ai_0 U167 ( .A1(N45), .A2(\sub_355/carry[3] ), .B1(
        amount_left[3]), .Y(n67) );
  sky130_fd_sc_hd__clkinv_1 U168 ( .A(amount_left[4]), .Y(n61) );
  sky130_fd_sc_hd__nor2_1 U169 ( .A(load), .B(n54), .Y(N100) );
  sky130_fd_sc_hd__nand3b_1 U170 ( .A_N(N45), .B(n65), .C(n60), .Y(n54) );
  sky130_fd_sc_hd__nor2_1 U171 ( .A(\sub_355/carry[3] ), .B(amount_left[3]), 
        .Y(n60) );
  sky130_fd_sc_hd__nor2_1 U172 ( .A(amount_left[2]), .B(N78), .Y(n66) );
  sky130_fd_sc_hd__nor4_1 U173 ( .A(n70), .B(amount_left[4]), .C(
        amount_left[5]), .D(amount_left[6]), .Y(n65) );
  sky130_fd_sc_hd__clkinv_1 U174 ( .A(n58), .Y(n70) );
  sky130_fd_sc_hd__nor3_1 U175 ( .A(amount_left[9]), .B(amount_left[8]), .C(
        amount_left[7]), .Y(n58) );
endmodule


module vending_machine ( clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, 
        food_dispensed, coin_inserted, num_to_display, food_selection, 
        coin_to_return );
  input [2:0] coin_inserted;
  output [9:0] num_to_display;
  output [4:0] food_selection;
  output [2:0] coin_to_return;
  input clock, reset, A, B, C, D, ONE, TWO, THREE, FOUR, FIVE, food_dispensed;
  wire   load_wire;
  wire   [9:0] return_amount_wire;

  input_reg user_input ( .clock(clock), .reset(reset), .A(A), .B(B), .C(C), 
        .D(D), .ONE(ONE), .TWO(TWO), .THREE(THREE), .FOUR(FOUR), .FIVE(FIVE), 
        .food_selection(food_selection) );
  coin_summer coins ( .clock(clock), .reset(reset), .inserted_coin(
        coin_inserted), .sum(num_to_display) );
  amount_to_return value ( .clock(clock), .reset(reset), .load(load_wire), 
        .SUM(num_to_display), .food_selection(food_selection), 
        .amount_to_return(return_amount_wire) );
  coin_dispenser returns ( .clock(clock), .load(load_wire), .amount_to_return(
        return_amount_wire), .coin_to_return(coin_to_return) );
endmodule