module or16x16x16(
    input [15:0]a, 
    input [15:0]b, 
    input [15:0]c,
    output [15:0]p
);

    wire [15:0] temp;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : or_gen
            or or_inst(temp[i], a[i], b[i]);
        end
    endgenerate

    genvar j;
    generate
        for (j = 0; j < 16; j = j + 1) begin : ans_gen
            or or_inst(p[j], temp[j], c[j]);
        end
    endgenerate

endmodule

module and16x1(
    input [15:0]a,
    input b,
    output [15:0]p
);

    genvar k;
    generate
        for (k = 0; k < 16; k = k + 1) begin : and_gen
            and and_inst(p[k], a[k], b);
        end
    endgenerate

endmodule

module Add2x2(
    input [7:0]a00, a01, a10, a11,
    input [7:0]b00, b01, b10, b11,
    output [15:0]y00, y01, y10, y11
);

    wire [15:0] a00b00, a01b01, a10b10, a11b11;

    RippleCarryAdder r1(a00, b00, y00); // a00 + b00
    RippleCarryAdder r2(a01, b01, y01); // a01 + b01
    RippleCarryAdder r3(a10, b10, y10); // a10 + b10
    RippleCarryAdder r4(a11, b11, y11); // a11 + b11

endmodule

module Sub2x2(
    input [7:0]a00, a01, a10, a11,
    input [7:0]b00, b01, b10, b11,
    output [15:0]y00, y01, y10, y11
);

    wire [15:0] a00b00, a01b01, a10b10, a11b11;

    RippleCarryAdder r1(a00, b00, y00); // a00 - b00
    RippleCarryAdder r2(a01, b01, y01); // a01 - b01
    RippleCarryAdder r3(a10, b10, y10); // a10 - b10
    RippleCarryAdder r4(a11, b11, y11); // a11 - b11

endmodule

module Mult2x2(
    input [7:0]a00, a01, a10, a11,
    input [7:0]b00, b01, b10, b11,
    output [15:0]y00, y01, y10, y11
);

    wire [15:0] a00b00, a01b10, a00b01, a01b11, a10b00, a11b10, a10b01, a11b11;

    BitMultiplier8 m1(a00, b00, a00b00); // a00 * b00
    BitMultiplier8 m2(a01, b10, a01b10); // a01 * b10
    BitMultiplier8 m3(a00, b01, a00b01); // a00 * b01
    BitMultiplier8 m4(a01, b11, a01b11); // a01 * b11
    BitMultiplier8 m5(a10, b00, a10b00); // a10 * b00
    BitMultiplier8 m6(a11, b10, a11b10); // a11 * b10
    BitMultiplier8 m7(a10, b01, a10b01); // a10 * b01
    BitMultiplier8 m8(a11, b11, a11b11); // a11 * b11

    RippleCarryAdder r1(a00b00, a01b10, y00); // a00b00 + a01b10
    RippleCarryAdder r2(a00b01, a01b11, y01); // a00b01 + a01b11
    RippleCarryAdder r3(a10b00, a11b10, y10); // a10b00 + a11b10
    RippleCarryAdder r4(a10b01, a11b11, y11); // a10b01 + a11b11

endmodule

module BitMultiplier8(
    input [3:0]a, b,
    output [7:0]p
);
    wire [39:0] w;

    and a1(w[0], a[0], b);
    and a2(w[1], a[1], b);
    and a3(w[2], a[2], b);
    and a4(w[3], a[3], b);

    and a5(w[4], a[0], b[1]);
    and a6(w[5], a[1], b[1]);
    and a7(w[6], a[2], b[1]);
    and a8(w[7], a[3], b[1]);

    and a9(w[8], a[0], b[2]);
    and a10(w[9], a[1], b[2]);
    and a11(w[10], a[2], b[2]);
    and a12(w[11], a[3], b[2]);

    and a13(w[12], a[0], b[3]);
    and a14(w[13], a[1], b[3]);
    and a15(w[14], a[2], b[3]);
    and a16(w[15], a[3], b[3]);

    assign p[0] = w[0];
    halfadder a17(w[4], w[1], w[16], w[17]);
    fulladder a18(w[5], w[2], w[17], w[18], w[19]);
    fulladder a19(w[3], w[6], w[19], w[20], w[21]);
    halfadder a20(w[7], w[21], w[22], w[23]);
    halfadder a21(w[8], w[18], w[24], w[25]);
    fulladder a22(w[25], w[9], w[20], w[26], w[27]);
    fulladder a23(w[10], w[24], w[27], w[28], w[29]);
        fulladder a24(w[11], w[23], w[29], w[30], w[31]);
    halfadder a25(w[12], w[26], w[32], w[33]);
    fulladder a26(w[13], w[28], w[33], w[34], w[35]);
    fulladder a27(w[14], w[30], w[35], w[36], w[37]);
    fulladder a28(w[37], w[15], w[31], w[38], w[39]);

    assign p[1] = w[16];
    assign p[2] = w[25];
    assign p[3] = w[32];
    assign p[4] = w[34];
    assign p[5] = w[36];
    assign p[6] = w[38];
    assign p[7] = w[39];

endmodule

module fulladder(
    input a, b, cin,
    output sum, cout
);

    wire x1, x2, x3;

    xor(x1, a, b);
    and(x3, a, b);
    xor(sum, x1, cin);
    and(x2, x1, cin);
    or(cout, x2, x3);

endmodule

module halfadder(
    input a, b,
    output sum, out
);

    xor(sum, a, b);
    and(out, a, b);

endmodule

module RippleCarryAdder(
    input [7:0] a,
    input [7:0] b,
    output [15:0] sum
);

    wire [15:0] carry;

    fulladder fa0(a[0], b[0], 1'b0, sum[0], carry[0]);
    fulladder fa1(a[1], b[1], carry[0], sum[1], carry[1]);
    fulladder fa2(a[2], b[2], carry[1], sum[2], carry[2]);
    fulladder fa3(a[3], b[3], carry[2], sum[3], carry[3]);
    fulladder fa4(a[4], b[4], carry[3], sum[4], carry[4]);
    fulladder fa5(a[5], b[5], carry[4], sum[5], carry[5]);
    fulladder fa6(a[6], b[6], carry[5], sum[6], carry[6]);
    fulladder fa7(a[7], b[7], carry[6], sum[7], carry[7]);

    fulladder fa00(0, 0, carry[7], sum[8], carry[8]);
    fulladder fa01(0, 0, 0, sum[9], carry[9]);
    fulladder fa02(0, 0, 0, sum[10], carry[10]);
    fulladder fa03(0, 0, 0, sum[11], carry[11]);
    fulladder fa04(0, 0, 0, sum[12], carry[12]);
    fulladder fa05(0, 0, 0, sum[13], carry[13]);
    fulladder fa06(0, 0, 0, sum[14], carry[14]);
    fulladder fa07(0, 0, 0, sum[15], carry[15]);

endmodule

module mult8(
    input [7:0]a00, a01, a10, a11, b00, b01, b10, b11,
    input [1:0]op,
    output [15:0]y00, y01, y10, y11
);

    wire [15:0] ansadd00, ansadd01, ansadd10, ansadd11;
    wire [15:0] anssub00, anssub01, anssub10, anssub11;
    wire [15:0] ansmult00, ansmult01, ansmult10, ansmult11;

    Add2x2 add(a00, a01, a10, a11, b00, b01, b10, b11, ansadd00, ansadd01, ansadd10, ansadd11);
    Sub2x2 sub(a00, a01, a10, a11, b00, b01, b10, b11, anssub00, anssub01, anssub10, anssub11);
    Mult2x2 mult(a00, a01, a10, a11, b00, b01, b10, b11, ansmult00, ansmult01, ansmult10, ansmult11);

    wire notop0;
    not not1(notop0, op[0]);

    wire [15:0] aluadd00, aluadd01, aluadd10, aluadd11;
    wire [15:0] alusub00, alusub01, alusub10, alusub11;
    wire [15:0] alumult00, alumult01, alumult10, alumult11;

    and16x1 and1(ansadd00, op[0], aluadd00);
    and16x1 and2(ansadd01, op[0], aluadd01);
    and16x1 and3(ansadd10, op[0], aluadd10);
    and16x1 and4(ansadd11, op[0], aluadd11);

    and16x1 and5(anssub00, notop0, alusub00);
    and16x1 and6(anssub01, notop0, alusub01);
    and16x1 and7(anssub10, notop0, alusub10);
    and16x1 and8(anssub11, notop0, alusub11);

    and16x1 and9(ansmult00, op, alumult00);
    and16x1 and10(ansmult01, op, alumult01);
    and16x1 and11(ansmult10, op, alumult10);
    and16x1 and12(ansmult11, op, alumult11);

    or16x16x16 or1(aluadd00, alusub00, alumult00, y00);
    or16x16x16 or2(aluadd01, alusub01, alumult01, y01);
    or16x16x16 or3(aluadd10, alusub10, alumult10, y10);
    or16x16x16 or4(aluadd11, alusub11, alumult11, y11);

endmodule
