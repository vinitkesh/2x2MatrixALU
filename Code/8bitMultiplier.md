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

reg P = 16'b0;

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

