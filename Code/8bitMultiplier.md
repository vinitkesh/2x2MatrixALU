8 bit multiplier takes in two 8-bit binary numbers as inputs and generates a 16-bit binary number as output. 

Let the input numbers be A and B, and the output number be P. The 8-bit multiplier performs the following operation:

let the bits of A , B and P be represented as A[7:0], B[7:0] and P[15:0] respectively.

To get the output , the program must go through the following steps:

Take bit from B and apply and operation on it with all bits of A to get a 8 bit number. Shift this number left by the position of the bit in B. Add this number to P. Repeat this process for all bits of B.

The following is how we plan to implement this in verilog:

```v

temp1 = A[7:0] & B[0] 
temp2 = A[7:0] & B[1] 
temp3 = A[7:0] & B[2] 
temp4 = A[7:0] & B[3] 
temp5 = A[7:0] & B[4] 
temp6 = A[7:0] & B[5] 
temp7 = A[7:0] & B[6] 
temp8 = A[7:0] & B[7] 


P[0] = temp1[0];

P[1] = temp2[0] + temp1[1];

P[2] = temp3[0] + temp2[1] + temp1[2];

P[3] = temp4[0] + temp3[1] + temp2[2] + temp1[3];

P[4] = temp5[0] + temp4[1] + temp3[2] + temp2[3] + temp1[4];

P[5] = temp6[0] + temp5[1] + temp4[2] + temp3[3] + temp2[4] + temp1[5];

P[6] = temp7[0] + temp6[1] + temp5[2] + temp4[3] + temp3[4] + temp2[5] + temp1[6];

P[7] = temp8[0] + temp7[1] + temp6[2] + temp5[3] + temp4[4] + temp3[5] + temp2[6] + temp1[7];

P[8] = temp8[1] + temp7[2] + temp6[3] + temp5[4] + temp4[5] + temp3[6] + temp2[7];

P[9] = temp8[2] + temp7[3] + temp6[4] + temp5[5] + temp4[6] + temp3[7];

P[10] = temp8[3] + temp7[4] + temp6[5] + temp5[6] + temp4[7];

P[11] = temp8[4] + temp7[5] + temp6[6] + temp5[7];

P[12] = temp8[5] + temp7[6] + temp6[7];

P[13] = temp8[6] + temp7[7];

P[14] = temp8[7];

P[15] = 0;


```

For P[0] we need 0 full adders
for P[1] we need 1 full adder
for P[2] we need 2 full adders
for P[3] we need 3 full adders
.
.
.
for P[7] we need 7 full adders
for P[8] we need 6 full adders
for P[9] we need 5 full adders
.
.
.
for P[15] we need 0 full adder

## Gate Level Implementation:

```v

module 8bitAdder(
    input [7:0] A,
    input [7:0] B,
    output reg [16:0] P
);

wire temp1[7:0];
wire temp2[7:0];
wire temp3[7:0];
wire temp4[7:0];
wire temp5[7:0];
wire temp6[7:0];
wire temp7[7:0];
wire temp8[7:0];

and and1(A[0], B[0], temp1[0]); 
and and2(A[1], B[0], temp1[1]);
and and3(A[2], B[0], temp1[2]);
and and4(A[3], B[0], temp1[3]);
and and5(A[4], B[0], temp1[4]);
and and6(A[5], B[0], temp1[5]);
and and7(A[6], B[0], temp1[6]);
and and8(A[7], B[0], temp1[7]);

and and1(A[0], B[1], temp2[0]); 
and and2(A[1], B[1], temp2[1]);
and and3(A[2], B[1], temp2[2]);
and and4(A[3], B[1], temp2[3]);
and and5(A[4], B[1], temp2[4]);
and and6(A[5], B[1], temp2[5]);
and and7(A[6], B[1], temp2[6]);
and and8(A[7], B[1], temp2[7]);

and and1(A[0], B[2], temp3[0]); 
and and2(A[1], B[2], temp3[1]);
and and3(A[2], B[2], temp3[2]);
and and4(A[3], B[2], temp3[3]);
and and5(A[4], B[2], temp3[4]);
and and6(A[5], B[2], temp3[5]);
and and7(A[6], B[2], temp3[6]);
and and8(A[7], B[2], temp3[7]);

and and1(A[0], B[3], temp4[0]); 
and and2(A[1], B[3], temp4[1]);
and and3(A[2], B[3], temp4[2]);
and and4(A[3], B[3], temp4[3]);
and and5(A[4], B[3], temp4[4]);
and and6(A[5], B[3], temp4[5]);
and and7(A[6], B[3], temp4[6]);
and and8(A[7], B[3], temp4[7]);

and and1(A[0], B[4], temp5[0]); 
and and2(A[1], B[4], temp5[1]);
and and3(A[2], B[4], temp5[2]);
and and4(A[3], B[4], temp5[3]);
and and5(A[4], B[4], temp5[4]);
and and6(A[5], B[4], temp5[5]);
and and7(A[6], B[4], temp5[6]);
and and8(A[7], B[4], temp5[7]);

and and1(A[0], B[5], temp6[0]); 
and and2(A[1], B[5], temp6[1]);
and and3(A[2], B[5], temp6[2]);
and and4(A[3], B[5], temp6[3]);
and and5(A[4], B[5], temp6[4]);
and and6(A[5], B[5], temp6[5]);
and and7(A[6], B[5], temp6[6]);
and and8(A[7], B[5], temp6[7]);

and and1(A[0], B[6], temp7[0]); 
and and2(A[1], B[6], temp7[1]);
and and3(A[2], B[6], temp7[2]);
and and4(A[3], B[6], temp7[3]);
and and5(A[4], B[6], temp7[4]);
and and6(A[5], B[6], temp7[5]);
and and7(A[6], B[6], temp7[6]);
and and8(A[7], B[6], temp7[7]);

and and1(A[0], B[7], temp8[0]); 
and and2(A[1], B[7], temp8[1]);
and and3(A[2], B[7], temp8[2]);
and and4(A[3], B[7], temp8[3]);
and and5(A[4], B[7], temp8[4]);
and and6(A[5], B[7], temp8[5]);
and and7(A[6], B[7], temp8[6]);
and and8(A[7], B[7], temp8[7]);


wire cout[51:0];
wire P1_temp;
wire P2_temp[1:0];
wire P3_temp[2:0];
wire P4_temp[3:0];
wire P5_temp[4:0];
wire P6_temp[5:0];
wire P7_temp[6:0];
wire P8_temp[5:0];
wire P9_temp[4:0];
wire P10_temp[3:0];
wire P11_temp[2:0];
wire P12_temp[1:0];
wire P13_temp;

FA P0(temp1[0], 1'b0, 1'b0, P[0], cout[0]); // 

FA tempP1_1(temp2[0], temp1[1], cout[0], P[1], cout[1]); 

FA tempP2_1(temp3[0], temp2[1], cout[1], P2_temp[0], cout[2]);
FA tempP2_2(P2_temp[0], temp1[2], cout[2], P[2], cout[3]);

FA tempP3_1(temp4[0], temp3[1], cout[3], P3_temp[0], cout[4]);
FA tempP3_2(P3_temp[0], temp2[2], cout[4], P3_temp[1], cout[5]);
FA tempP3_3(P3_temp[1], temp1[3], cout[5], P[3], cout[6]);

FA tempP4_1(temp5[0], temp4[1], cout[6], P4_temp[0], cout[7]);
FA tempP4_2(P4_temp[0], temp3[2], cout[7], P4_temp[1], cout[8]);
FA tempP4_3(P4_temp[1], temp2[3], cout[8], P4_temp[2], cout[9]);
FA tempP4_4(P4_temp[2], temp1[4], cout[9], P[4], cout[10]);

FA tempP5_1(temp6[0], temp5[1], cout[10], P5_temp[0], cout[11]);
FA tempP5_2(P5_temp[0], temp4[2], cout[11], P5_temp[1], cout[12]);
FA tempP5_3(P5_temp[1], temp3[3], cout[12], P5_temp[2], cout[13]);
FA tempP5_4(P5_temp[2], temp2[4], cout[13], P5_temp[3], cout[14]);
FA tempP5_5(P5_temp[3], temp1[5], cout[14], P[5], cout[15]);

FA tempP6_1(temp7[0], temp6[1], cout[15], P6_temp[0], cout[16]);
FA tempP6_2(P6_temp[0], temp5[2], cout[16], P6_temp[1], cout[17]);
FA tempP6_3(P6_temp[1], temp4[3], cout[17], P6_temp[2], cout[18]);
FA tempP6_4(P6_temp[2], temp3[4], cout[18], P6_temp[3], cout[19]);
FA tempP6_5(P6_temp[3], temp2[5], cout[19], P6_temp[4], cout[20]);
FA tempP6_6(P6_temp[4], temp1[6], cout[20], P[6], cout[21]);

FA tempP7_1(temp8[0], temp7[1], cout[21], P7_temp[0], cout[22]);
FA tempP7_2(P7_temp[0], temp6[2], cout[22], P7_temp[1], cout[23]);
FA tempP7_3(P7_temp[1], temp5[3], cout[23], P7_temp[2], cout[24]);
FA tempP7_4(P7_temp[2], temp4[4], cout[24], P7_temp[3], cout[25]);
FA tempP7_5(P7_temp[3], temp3[5], cout[25], P7_temp[4], cout[26]);
FA tempP7_6(P7_temp[4], temp2[6], cout[26], P7_temp[5], cout[27]);
FA tempP7_7(P7_temp[5], temp1[7], cout[27], P[7], cout[28]);

FA tempP8_1(temp8[1], temp7[2], cout[28], P8_temp[0], cout[29]);
FA tempP8_2(P8_temp[0], temp6[3], cout[29], P8_temp[1], cout[30]);
FA tempP8_3(P8_temp[1], temp5[4], cout[30], P8_temp[2], cout[31]);
FA tempP8_4(P8_temp[2], temp4[5], cout[31], P8_temp[3], cout[32]);
FA tempP8_5(P8_temp[3], temp3[6], cout[32], P8_temp[4], cout[33]);
FA tempP8_6(P8_temp[4], temp2[7], cout[33], P[8], cout[34]);

FA tempP9_1(temp8[2], temp7[3], cout[34], P9_temp[0], cout[35]);
FA tempP9_2(P9_temp[0], temp6[4], cout[35], P9_temp[1], cout[36]);
FA tempP9_3(P9_temp[1], temp5[5], cout[36], P9_temp[2], cout[37]);
FA tempP9_4(P9_temp[2], temp4[6], cout[37], P9_temp[3], cout[38]);
FA tempP9_5(P9_temp[3], temp3[7], cout[38], P[9], cout[39]);

FA tempP10_1(temp8[3], temp7[4], cout[39], P10_temp[0], cout[40]);
FA tempP10_2(P10_temp[0], temp6[5], cout[40], P10_temp[1], cout[41]);
FA tempP10_3(P10_temp[1], temp5[6], cout[41], P10_temp[2], cout[42]);
FA tempP10_4(P10_temp[2], temp4[7], cout[42], P[10], cout[43]);

FA tempP11_1(temp8[4], temp7[5], cout[43], P11_temp[0], cout[44]);
FA tempP11_2(P11_temp[0], temp6[6], cout[44], P11_temp[1], cout[45]);
FA tempP11_3(P11_temp[1], temp5[7], cout[45], P[11], cout[46]);

FA tempP12_1(temp8[5], temp7[6], cout[46], P12_temp[0], cout[47]);
FA tempP12_2(P12_temp[0], temp6[7], cout[47], P[12], cout[48]);

FA tempP13_1(temp8[6], temp7[7], cout[48], P13_temp, cout[49]);
FA tempP13_2(P13_temp, P[13], cout[50]);

FA tempP14_1(temp8[7], 1'b0, cout[50], P[15], cout[51]);

FA tempP15_1(1'b0, 1'b0, 1'b0, P[14], 1'b0);


endmodule

```

```v

module FA(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);

xor xor1(A, B, S);
xor xor2(S, Cin, Cout);
and and1(A, B, temp1);
and and2(S, Cin, temp2);
or or1(temp1, temp2, Cout);

endmodule

```

```v


```
