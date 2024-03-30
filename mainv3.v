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

module BitMultiplier8(a,b,p);
input [7:0] a,b;
output [15:0] p;
wire [128:0] w;


and a1(w[0], a[0], b[0]);
and a2(w[1], a[1], b[0]);
and a3(w[2], a[2], b[0]);
and a4(w[3], a[3], b[0]);
and a5(w[4], a[4], b[0]);
and a6(w[5], a[5], b[0]);
and a7(w[6], a[6], b[0]);
and a8(w[7], a[7], b[0]);

and a9(w[8], a[0], b[1]);
and a10(w[9], a[1], b[1]);
and a11(w[10], a[2], b[1]);
and a12(w[11], a[3], b[1]);
and a13(w[12], a[4], b[1]);
and a14(w[13], a[5], b[1]);
and a15(w[14], a[6], b[1]);
and a16(w[15], a[7], b[1]);

and a17(w[16], a[0], b[2]);
and a18(w[17], a[1], b[2]);
and a19(w[18], a[2], b[2]);
and a20(w[19], a[3], b[2]);
and a21(w[20], a[4], b[2]);
and a22(w[21], a[5], b[2]);
and a23(w[22], a[6], b[2]);
and a24(w[23], a[7], b[2]);

and a25(w[24], a[0], b[3]);
and a26(w[25], a[1], b[3]);
and a27(w[26], a[2], b[3]);
and a28(w[27], a[3], b[3]);
and a29(w[28], a[4], b[3]);
and a30(w[29], a[5], b[3]);
and a31(w[30], a[6], b[3]);
and a32(w[31], a[7], b[3]);

and a33(w[32], a[0], b[4]);
and a34(w[33], a[1], b[4]);
and a35(w[34], a[2], b[4]);
and a36(w[35], a[3], b[4]);
and a37(w[36], a[4], b[4]);
and a38(w[37], a[5], b[4]);
and a39(w[38], a[6], b[4]);
and a40(w[39], a[7], b[4]);

and a41(w[40], a[0], b[5]);
and a42(w[41], a[1], b[5]);
and a43(w[42], a[2], b[5]);
and a44(w[43], a[3], b[5]);
and a45(w[44], a[4], b[5]);
and a46(w[45], a[5], b[5]);
and a47(w[46], a[6], b[5]);
and a48(w[47], a[7], b[5]);

and a49(w[48], a[0], b[6]);
and a50(w[49], a[1], b[6]);
and a51(w[50], a[2], b[6]);
and a52(w[51], a[3], b[6]);
and a53(w[52], a[4], b[6]);
and a54(w[53], a[5], b[6]);
and a55(w[54], a[6], b[6]);
and a56(w[55], a[7], b[6]);

and a57(w[56], a[0], b[7]);
and a58(w[57], a[1], b[7]);
and a59(w[58], a[2], b[7]);
and a60(w[59], a[3], b[7]);
and a61(w[60], a[4], b[7]);
and a62(w[61], a[5], b[7]);
and a63(w[62], a[6], b[7]);
and a64(w[63], a[7], b[7]);

fulladder fa0(w[0], w[8], 1'b0, p[0], w[64]);
fulladder fa1(w[1], w[9], w[64], p[1], w[65]);
fulladder fa2(w[2], w[10], w[65], p[2], w[66]);
fulladder fa3(w[3], w[11], w[66], p[3], w[67]);
fulladder fa4(w[4], w[12], w[67], p[4], w[68]);
fulladder fa5(w[5], w[13], w[68], p[5], w[69]);
fulladder fa6(w[6], w[14], w[69], p[6], w[70]);
fulladder fa7(w[7], w[15], w[70], p[7], w[71]);


assign p[8] = w[72];
assign p[9] = w[80];
assign p[10] = w[88];
assign p[11] = w[96];
assign p[12] = w[104];
assign p[13] = w[112];
assign p[14] = w[120];
assign p[15] = w[128];

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

    fulladder fa00(1'b0, 1'b0, carry[7], sum[8], carry[8]);
    fulladder fa01(1'b0, 1'b0, 1'b0, sum[9], carry[9]);
    fulladder fa02(1'b0, 1'b0, 1'b0, sum[10], carry[10]);
    fulladder fa03(1'b0, 1'b0, 1'b0, sum[11], carry[11]);
    fulladder fa04(1'b0, 1'b0, 1'b0, sum[12], carry[12]);
    fulladder fa05(1'b0, 1'b0, 1'b0, sum[13], carry[13]);
    fulladder fa06(1'b0, 1'b0, 1'b0, sum[14], carry[14]);
    fulladder fa07(1'b0, 1'b0, 1'b0, sum[15], carry[15]);

endmodule

module mult8(
    input [7:0]a00, a01, a10, a11, b00, b01, b10, b11,
    input [2:0]op,
    output [15:0]y00, y01, y10, y11
);

    wire [15:0] ansadd00, ansadd01, ansadd10, ansadd11;
    wire [15:0] anssub00, anssub01, anssub10, anssub11;
    wire [15:0] ansmult00, ansmult01, ansmult10, ansmult11;

    Add2x2 add(a00, a01, a10, a11, b00, b01, b10, b11, ansadd00, ansadd01, ansadd10, ansadd11);
    Sub2x2 sub(a00, a01, a10, a11, b00, b01, b10, b11, anssub00, anssub01, anssub10, anssub11);
    Mult2x2 mult(a00, a01, a10, a11, b00, b01, b10, b11, ansmult00, ansmult01, ansmult10, ansmult11);

    wire [15:0] aluadd00, aluadd01, aluadd10, aluadd11;
    wire [15:0] alusub00, alusub01, alusub10, alusub11;
    wire [15:0] alumult00, alumult01, alumult10, alumult11;

    and16x1 and1(ansadd00, op[0], aluadd00);
    and16x1 and2(ansadd01, op[0], aluadd01);
    and16x1 and3(ansadd10, op[0], aluadd10);
    and16x1 and4(ansadd11, op[0], aluadd11);

    and16x1 and5(anssub00, op[1], alusub00);
    and16x1 and6(anssub01, op[1], alusub01);
    and16x1 and7(anssub10, op[1], alusub10);
    and16x1 and8(anssub11, op[1], alusub11);

    and16x1  and9(ansmult00, op[2], alumult00);
    and16x1 and10(ansmult01, op[2], alumult01);
    and16x1 and11(ansmult10, op[2], alumult10);
    and16x1 and12(ansmult11, op[2], alumult11);

    or16x16x16 or1(aluadd00, alusub00, alumult00, y00);
    or16x16x16 or2(aluadd01, alusub01, alumult01, y01);
    or16x16x16 or3(aluadd10, alusub10, alumult10, y10);
    or16x16x16 or4(aluadd11, alusub11, alumult11, y11);

endmodule
