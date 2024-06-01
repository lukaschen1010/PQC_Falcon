// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module top_d_add (
        ap_clk,
        ap_rst,
        a,
        b,
        ap_return,
        ap_ce
);


input   ap_clk;
input   ap_rst;
input  [63:0] a;
input  [63:0] b;
output  [63:0] ap_return;
input   ap_ce;

reg[63:0] ap_return;

wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_pp0_stage0_11001;
wire    ap_block_pp0_stage0;
wire   [63:0] grp_fu_18_p2;
reg    grp_fu_18_ce;
reg    ap_ce_reg;
reg   [63:0] a_int_reg;
reg   [63:0] b_int_reg;
reg   [63:0] ap_return_int_reg;

top_dadd_64ns_64ns_64_5_full_dsp_0 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
dadd_64ns_64ns_64_5_full_dsp_0_U11(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(a_int_reg),
    .din1(b_int_reg),
    .ce(grp_fu_18_ce),
    .dout(grp_fu_18_p2)
);

always @ (posedge ap_clk) begin
    ap_ce_reg <= ap_ce;
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        a_int_reg <= a;
        b_int_reg <= b;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce_reg)) begin
        ap_return_int_reg <= grp_fu_18_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return = ap_return_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return = grp_fu_18_p2;
    end else begin
        ap_return = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_18_ce = 1'b1;
    end else begin
        grp_fu_18_ce = 1'b0;
    end
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

endmodule //top_d_add
