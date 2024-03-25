# 2x2MatrixALU

# Project Description: 2x2 Matrix ALU Implementation in Verilog

## Introduction :

☆ The project focuses on implementing a 2x2 Matrix Arithmetic Logic Unit (ALU) in Verilog, capable of performing **addition**, **subtraction, and multiplication** operations on two 2x2 matrices. Each matrix element is represented by an 8-bit binary number, resulting in a 16-bit binary number for each element in the output matrix.

## Inputs: 

☆ Matrix Inputs: Two 2x2 matrices, each containing four elements represented as 8-bit binary numbers, are taken as inputs from the user.

☆ Operation Selector: An input from the user to determine the operation to be performed by the ALU. This input is encoded as follows:

#### 0: Addition operation - [code]()
#### 1: Subtraction operation - [code]()
#### 2: Multiplication operation - [code]()

## Processing :

☆ Matrix Operation Selection: Based on the input provided by the user, the ALU selects the appropriate arithmetic operation to perform.

☆ Arithmetic Logic Unit (ALU): The ALU processes the selected operation on the input matrices, performing element-wise addition, subtraction, or multiplication.

☆ Output Generation: After performing the selected operation, the ALU generates a new 2x2 matrix as the output, with each element represented as a 16-bit binary number.

## Output: 
☆ The output of the project is the resulting 2x2 matrix obtained after applying the selected arithmetic operation on the input matrices. Each element of the output matrix is represented as a 16-bit binary number.