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

P = P + temp1
P = P << 1
P = P + temp2
P = P << 1
P = P + temp3
P = P << 1
P = P + temp4
P = P << 1
P = P + temp5
P = P << 1
P = P + temp6
P = P << 1
P = P + temp7
P = P << 1
P = P + temp8
P = P << 1

```

