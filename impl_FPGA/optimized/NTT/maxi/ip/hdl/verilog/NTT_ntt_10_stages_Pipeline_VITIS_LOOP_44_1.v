// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module NTT_ntt_10_stages_Pipeline_VITIS_LOOP_44_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        stage0_4_address0,
        stage0_4_ce0,
        stage0_4_we0,
        stage0_4_d0,
        stage0_4_address1,
        stage0_4_ce1,
        stage0_4_we1,
        stage0_4_d1,
        stage0_6_address0,
        stage0_6_ce0,
        stage0_6_we0,
        stage0_6_d0,
        stage0_6_address1,
        stage0_6_ce1,
        stage0_6_we1,
        stage0_6_d1,
        in_buf_address0,
        in_buf_ce0,
        in_buf_q0,
        in_buf_address1,
        in_buf_ce1,
        in_buf_q1,
        stage0_address0,
        stage0_ce0,
        stage0_we0,
        stage0_d0,
        stage0_address1,
        stage0_ce1,
        stage0_we1,
        stage0_d1,
        stage0_5_address0,
        stage0_5_ce0,
        stage0_5_we0,
        stage0_5_d0,
        stage0_5_address1,
        stage0_5_ce1,
        stage0_5_we1,
        stage0_5_d1
);

parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [7:0] stage0_4_address0;
output   stage0_4_ce0;
output   stage0_4_we0;
output  [15:0] stage0_4_d0;
output  [7:0] stage0_4_address1;
output   stage0_4_ce1;
output   stage0_4_we1;
output  [15:0] stage0_4_d1;
output  [7:0] stage0_6_address0;
output   stage0_6_ce0;
output   stage0_6_we0;
output  [15:0] stage0_6_d0;
output  [7:0] stage0_6_address1;
output   stage0_6_ce1;
output   stage0_6_we1;
output  [15:0] stage0_6_d1;
output  [9:0] in_buf_address0;
output   in_buf_ce0;
input  [15:0] in_buf_q0;
output  [9:0] in_buf_address1;
output   in_buf_ce1;
input  [15:0] in_buf_q1;
output  [7:0] stage0_address0;
output   stage0_ce0;
output   stage0_we0;
output  [15:0] stage0_d0;
output  [7:0] stage0_address1;
output   stage0_ce1;
output   stage0_we1;
output  [15:0] stage0_d1;
output  [7:0] stage0_5_address0;
output   stage0_5_ce0;
output   stage0_5_we0;
output  [15:0] stage0_5_d0;
output  [7:0] stage0_5_address1;
output   stage0_5_ce1;
output   stage0_5_we1;
output  [15:0] stage0_5_d1;

reg ap_idle;
reg stage0_4_ce0;
reg stage0_4_we0;
reg stage0_4_ce1;
reg stage0_4_we1;
reg stage0_6_ce0;
reg stage0_6_we0;
reg stage0_6_ce1;
reg stage0_6_we1;
reg[9:0] in_buf_address0;
reg in_buf_ce0;
reg[9:0] in_buf_address1;
reg in_buf_ce1;
reg stage0_ce0;
reg stage0_we0;
reg stage0_ce1;
reg stage0_we1;
reg stage0_5_ce0;
reg stage0_5_we0;
reg stage0_5_ce1;
reg stage0_5_we1;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_state4_pp0_stage1_iter1;
wire    ap_block_state6_pp0_stage1_iter2;
wire    ap_block_state8_pp0_stage1_iter3;
wire    ap_block_state10_pp0_stage1_iter4;
wire    ap_block_pp0_stage1_subdone;
reg   [0:0] tmp_reg_680;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [0:0] tmp_fu_233_p3;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state5_pp0_stage0_iter2;
wire    ap_block_state7_pp0_stage0_iter3;
wire    ap_block_state9_pp0_stage0_iter4;
wire    ap_block_pp0_stage0_11001;
wire   [8:0] i_fu_241_p1;
reg   [8:0] i_reg_684;
reg   [6:0] lshr_ln_reg_694;
reg   [6:0] lshr_ln_reg_694_pp0_iter1_reg;
reg   [6:0] lshr_ln_reg_694_pp0_iter2_reg;
reg   [6:0] lshr_ln_reg_694_pp0_iter3_reg;
wire   [0:0] icmp_ln64_fu_272_p2;
reg   [0:0] icmp_ln64_reg_700;
reg   [0:0] icmp_ln64_reg_700_pp0_iter1_reg;
reg   [0:0] icmp_ln64_reg_700_pp0_iter2_reg;
reg   [0:0] icmp_ln64_reg_700_pp0_iter3_reg;
wire   [8:0] i_9_fu_278_p2;
reg   [8:0] i_9_reg_704;
wire   [0:0] icmp_ln64_4_fu_303_p2;
reg   [0:0] icmp_ln64_4_reg_714;
reg   [0:0] icmp_ln64_4_reg_714_pp0_iter1_reg;
reg   [0:0] icmp_ln64_4_reg_714_pp0_iter2_reg;
reg   [0:0] icmp_ln64_4_reg_714_pp0_iter3_reg;
reg   [0:0] icmp_ln64_4_reg_714_pp0_iter4_reg;
wire    ap_block_pp0_stage1_11001;
reg  signed [15:0] in_buf_load_reg_723;
reg  signed [15:0] in_buf_load_reg_723_pp0_iter1_reg;
reg  signed [15:0] in_buf_load_2_reg_734;
reg  signed [15:0] in_buf_load_2_reg_734_pp0_iter1_reg;
reg  signed [15:0] in_buf_load_2_reg_734_pp0_iter2_reg;
reg   [15:0] u_reg_740;
reg   [15:0] u_reg_740_pp0_iter2_reg;
reg   [15:0] u_reg_740_pp0_iter3_reg;
reg   [15:0] u_7_reg_747;
reg   [15:0] u_7_reg_747_pp0_iter2_reg;
reg   [15:0] u_7_reg_747_pp0_iter3_reg;
reg   [15:0] u_7_reg_747_pp0_iter4_reg;
wire   [29:0] grp_fu_649_p2;
reg   [29:0] tmp1_49_reg_779;
reg   [7:0] stage0_4_addr_reg_789;
reg   [7:0] stage0_6_addr_reg_794;
reg   [7:0] stage0_4_addr_8_reg_799;
reg   [7:0] stage0_6_addr_8_reg_804;
reg    ap_enable_reg_pp0_iter0_reg;
wire   [63:0] zext_ln54_fu_253_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln54_19_fu_292_p1;
wire   [63:0] zext_ln52_fu_320_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln52_2_fu_324_p1;
wire   [63:0] zext_ln64_fu_439_p1;
wire   [63:0] zext_ln69_fu_487_p1;
reg   [9:0] n_fu_84;
wire   [9:0] n_15_fu_309_p2;
wire    ap_loop_init;
reg   [9:0] ap_sig_allocacmp_n_14;
wire   [15:0] add_ln64_fu_431_p2;
wire   [15:0] add_ln69_fu_472_p2;
wire   [15:0] add_ln64_4_fu_586_p2;
wire   [15:0] add_ln69_2_fu_620_p2;
wire   [9:0] zext_ln54_cast_fu_245_p3;
wire   [1:0] trunc_ln64_fu_268_p1;
wire   [9:0] zext_ln54_4_cast_fu_284_p3;
wire   [1:0] or_ln64_fu_297_p2;
wire  signed [15:0] zext_ln55_fu_328_p0;
wire   [15:0] grp_fu_628_p2;
wire  signed [15:0] zext_ln55_2_fu_331_p0;
wire   [15:0] grp_fu_635_p2;
wire   [29:0] grp_fu_642_p2;
wire   [30:0] grp_fu_655_p3;
wire   [14:0] trunc_ln_fu_349_p4;
wire  signed [14:0] tmp2_66_fu_358_p2;
wire   [0:0] tmp_56_fu_368_p3;
wire   [15:0] select_ln58_fu_376_p3;
wire  signed [15:0] sext_ln43_fu_364_p1;
wire  signed [15:0] tmp2_72_fu_384_p2;
wire   [16:0] zext_ln42_1_fu_346_p1;
wire   [16:0] add_ln62_fu_394_p2;
wire  signed [17:0] sext_ln62_fu_400_p1;
wire  signed [17:0] sext_ln43_1_fu_390_p1;
wire   [17:0] tmp1_47_fu_404_p2;
wire   [0:0] tmp_57_fu_410_p3;
wire   [15:0] select_ln64_fu_423_p3;
wire   [15:0] add_ln64_20_fu_418_p2;
wire   [17:0] zext_ln42_fu_343_p1;
wire   [17:0] tmp1_48_fu_446_p2;
wire   [0:0] tmp_58_fu_452_p3;
wire   [15:0] select_ln69_fu_464_p3;
wire   [15:0] trunc_ln68_fu_460_p1;
wire   [7:0] zext_ln69_cast_fu_480_p3;
wire   [30:0] grp_fu_664_p3;
wire   [14:0] trunc_ln43_2_fu_504_p4;
wire  signed [14:0] tmp2_69_fu_513_p2;
wire   [0:0] tmp_59_fu_523_p3;
wire   [15:0] select_ln58_10_fu_531_p3;
wire  signed [15:0] sext_ln43_4_fu_519_p1;
wire  signed [15:0] tmp2_71_fu_539_p2;
wire   [16:0] zext_ln42_5_fu_501_p1;
wire   [16:0] add_ln62_4_fu_549_p2;
wire  signed [17:0] sext_ln62_2_fu_555_p1;
wire  signed [17:0] sext_ln43_5_fu_545_p1;
wire   [17:0] tmp1_50_fu_559_p2;
wire   [0:0] tmp_60_fu_565_p3;
wire   [15:0] select_ln64_10_fu_578_p3;
wire   [15:0] add_ln64_21_fu_573_p2;
wire   [17:0] zext_ln42_4_fu_498_p1;
wire   [17:0] tmp1_51_fu_594_p2;
wire   [0:0] tmp_61_fu_600_p3;
wire   [15:0] select_ln69_10_fu_612_p3;
wire   [15:0] trunc_ln68_10_fu_608_p1;
wire  signed [13:0] grp_fu_628_p1;
wire  signed [13:0] grp_fu_635_p1;
wire   [15:0] grp_fu_642_p0;
wire   [13:0] grp_fu_642_p1;
wire   [15:0] grp_fu_649_p0;
wire   [13:0] grp_fu_649_p1;
wire   [15:0] grp_fu_655_p0;
wire   [12:0] grp_fu_655_p1;
wire   [29:0] grp_fu_655_p2;
wire   [15:0] grp_fu_664_p0;
wire   [12:0] grp_fu_664_p1;
wire   [29:0] grp_fu_664_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg   [1:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to4;
wire    ap_enable_pp0;
wire    ap_start_int;
wire   [29:0] grp_fu_642_p00;
wire   [29:0] grp_fu_649_p00;
wire   [28:0] grp_fu_655_p00;
wire   [30:0] grp_fu_655_p20;
wire   [28:0] grp_fu_664_p00;
wire   [30:0] grp_fu_664_p20;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

NTT_mul_mul_16ns_14s_16_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 14 ),
    .dout_WIDTH( 16 ))
mul_mul_16ns_14s_16_4_1_U5(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(in_buf_q1),
    .din1(grp_fu_628_p1),
    .ce(1'b1),
    .dout(grp_fu_628_p2)
);

NTT_mul_mul_16ns_14s_16_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 14 ),
    .dout_WIDTH( 16 ))
mul_mul_16ns_14s_16_4_1_U6(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(in_buf_q0),
    .din1(grp_fu_635_p1),
    .ce(1'b1),
    .dout(grp_fu_635_p2)
);

NTT_mul_mul_16ns_14ns_30_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 14 ),
    .dout_WIDTH( 30 ))
mul_mul_16ns_14ns_30_4_1_U7(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_642_p0),
    .din1(grp_fu_642_p1),
    .ce(1'b1),
    .dout(grp_fu_642_p2)
);

NTT_mul_mul_16ns_14ns_30_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 14 ),
    .dout_WIDTH( 30 ))
mul_mul_16ns_14ns_30_4_1_U8(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_649_p0),
    .din1(grp_fu_649_p1),
    .ce(1'b1),
    .dout(grp_fu_649_p2)
);

NTT_mac_muladd_16ns_13ns_30ns_31_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 13 ),
    .din2_WIDTH( 30 ),
    .dout_WIDTH( 31 ))
mac_muladd_16ns_13ns_30ns_31_4_1_U9(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_655_p0),
    .din1(grp_fu_655_p1),
    .din2(grp_fu_655_p2),
    .ce(1'b1),
    .dout(grp_fu_655_p3)
);

NTT_mac_muladd_16ns_13ns_30ns_31_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 13 ),
    .din2_WIDTH( 30 ),
    .dout_WIDTH( 31 ))
mac_muladd_16ns_13ns_30ns_31_4_1_U10(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_664_p0),
    .din1(grp_fu_664_p1),
    .din2(grp_fu_664_p2),
    .ce(1'b1),
    .dout(grp_fu_664_p3)
);

NTT_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready_pp0_iter3_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (tmp_fu_233_p3 == 1'd0))) begin
            n_fu_84 <= n_15_fu_309_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            n_fu_84 <= 10'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        in_buf_load_2_reg_734_pp0_iter1_reg <= in_buf_load_2_reg_734;
        in_buf_load_2_reg_734_pp0_iter2_reg <= in_buf_load_2_reg_734_pp0_iter1_reg;
        in_buf_load_reg_723_pp0_iter1_reg <= in_buf_load_reg_723;
        tmp1_49_reg_779 <= grp_fu_649_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_fu_233_p3 == 1'd0))) begin
        i_9_reg_704[8 : 1] <= i_9_fu_278_p2[8 : 1];
        i_reg_684 <= i_fu_241_p1;
        icmp_ln64_4_reg_714 <= icmp_ln64_4_fu_303_p2;
        icmp_ln64_reg_700 <= icmp_ln64_fu_272_p2;
        lshr_ln_reg_694 <= {{ap_sig_allocacmp_n_14[8:2]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln64_4_reg_714_pp0_iter1_reg <= icmp_ln64_4_reg_714;
        icmp_ln64_4_reg_714_pp0_iter2_reg <= icmp_ln64_4_reg_714_pp0_iter1_reg;
        icmp_ln64_4_reg_714_pp0_iter3_reg <= icmp_ln64_4_reg_714_pp0_iter2_reg;
        icmp_ln64_4_reg_714_pp0_iter4_reg <= icmp_ln64_4_reg_714_pp0_iter3_reg;
        icmp_ln64_reg_700_pp0_iter1_reg <= icmp_ln64_reg_700;
        icmp_ln64_reg_700_pp0_iter2_reg <= icmp_ln64_reg_700_pp0_iter1_reg;
        icmp_ln64_reg_700_pp0_iter3_reg <= icmp_ln64_reg_700_pp0_iter2_reg;
        lshr_ln_reg_694_pp0_iter1_reg <= lshr_ln_reg_694;
        lshr_ln_reg_694_pp0_iter2_reg <= lshr_ln_reg_694_pp0_iter1_reg;
        lshr_ln_reg_694_pp0_iter3_reg <= lshr_ln_reg_694_pp0_iter2_reg;
        stage0_4_addr_8_reg_799[6 : 0] <= zext_ln69_fu_487_p1[6 : 0];
        stage0_4_addr_reg_789[6 : 0] <= zext_ln64_fu_439_p1[6 : 0];
        stage0_6_addr_8_reg_804[6 : 0] <= zext_ln69_fu_487_p1[6 : 0];
        stage0_6_addr_reg_794[6 : 0] <= zext_ln64_fu_439_p1[6 : 0];
        tmp_reg_680 <= ap_sig_allocacmp_n_14[32'd9];
        u_7_reg_747_pp0_iter2_reg <= u_7_reg_747;
        u_7_reg_747_pp0_iter3_reg <= u_7_reg_747_pp0_iter2_reg;
        u_7_reg_747_pp0_iter4_reg <= u_7_reg_747_pp0_iter3_reg;
        u_reg_740_pp0_iter2_reg <= u_reg_740;
        u_reg_740_pp0_iter3_reg <= u_reg_740_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_680 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        in_buf_load_2_reg_734 <= in_buf_q0;
        in_buf_load_reg_723 <= in_buf_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        u_7_reg_747 <= in_buf_q0;
        u_reg_740 <= in_buf_q1;
    end
end

always @ (*) begin
    if (((tmp_reg_680 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter3_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0_1to4 = 1'b1;
    end else begin
        ap_idle_pp0_1to4 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_n_14 = 10'd0;
    end else begin
        ap_sig_allocacmp_n_14 = n_fu_84;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            in_buf_address0 = zext_ln52_2_fu_324_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            in_buf_address0 = zext_ln54_19_fu_292_p1;
        end else begin
            in_buf_address0 = 'bx;
        end
    end else begin
        in_buf_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            in_buf_address1 = zext_ln52_fu_320_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            in_buf_address1 = zext_ln54_fu_253_p1;
        end else begin
            in_buf_address1 = 'bx;
        end
    end else begin
        in_buf_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        in_buf_ce0 = 1'b1;
    end else begin
        in_buf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        in_buf_ce1 = 1'b1;
    end else begin
        in_buf_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        stage0_4_ce0 = 1'b1;
    end else begin
        stage0_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        stage0_4_ce1 = 1'b1;
    end else begin
        stage0_4_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln64_4_reg_714_pp0_iter4_reg == 1'd1))) begin
        stage0_4_we0 = 1'b1;
    end else begin
        stage0_4_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln64_4_reg_714_pp0_iter4_reg == 1'd1))) begin
        stage0_4_we1 = 1'b1;
    end else begin
        stage0_4_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        stage0_5_ce0 = 1'b1;
    end else begin
        stage0_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        stage0_5_ce1 = 1'b1;
    end else begin
        stage0_5_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln64_reg_700_pp0_iter3_reg == 1'd0))) begin
        stage0_5_we0 = 1'b1;
    end else begin
        stage0_5_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln64_reg_700_pp0_iter3_reg == 1'd0))) begin
        stage0_5_we1 = 1'b1;
    end else begin
        stage0_5_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        stage0_6_ce0 = 1'b1;
    end else begin
        stage0_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        stage0_6_ce1 = 1'b1;
    end else begin
        stage0_6_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln64_4_reg_714_pp0_iter4_reg == 1'd0))) begin
        stage0_6_we0 = 1'b1;
    end else begin
        stage0_6_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln64_4_reg_714_pp0_iter4_reg == 1'd0))) begin
        stage0_6_we1 = 1'b1;
    end else begin
        stage0_6_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        stage0_ce0 = 1'b1;
    end else begin
        stage0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        stage0_ce1 = 1'b1;
    end else begin
        stage0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln64_reg_700_pp0_iter3_reg == 1'd1))) begin
        stage0_we0 = 1'b1;
    end else begin
        stage0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln64_reg_700_pp0_iter3_reg == 1'd1))) begin
        stage0_we1 = 1'b1;
    end else begin
        stage0_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to4 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln62_4_fu_549_p2 = ($signed(zext_ln42_5_fu_501_p1) + $signed(17'd118783));

assign add_ln62_fu_394_p2 = ($signed(zext_ln42_1_fu_346_p1) + $signed(17'd118783));

assign add_ln64_20_fu_418_p2 = ($signed(u_reg_740_pp0_iter3_reg) + $signed(tmp2_72_fu_384_p2));

assign add_ln64_21_fu_573_p2 = ($signed(u_7_reg_747_pp0_iter4_reg) + $signed(tmp2_71_fu_539_p2));

assign add_ln64_4_fu_586_p2 = (select_ln64_10_fu_578_p3 + add_ln64_21_fu_573_p2);

assign add_ln64_fu_431_p2 = (select_ln64_fu_423_p3 + add_ln64_20_fu_418_p2);

assign add_ln69_2_fu_620_p2 = (select_ln69_10_fu_612_p3 + trunc_ln68_10_fu_608_p1);

assign add_ln69_fu_472_p2 = (select_ln69_fu_464_p3 + trunc_ln68_fu_460_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage1_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage1_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign grp_fu_628_p1 = 16'd57648;

assign grp_fu_635_p1 = 16'd57648;

assign grp_fu_642_p0 = grp_fu_642_p00;

assign grp_fu_642_p00 = $unsigned(zext_ln55_fu_328_p0);

assign grp_fu_642_p1 = 30'd12289;

assign grp_fu_649_p0 = grp_fu_649_p00;

assign grp_fu_649_p00 = $unsigned(zext_ln55_2_fu_331_p0);

assign grp_fu_649_p1 = 30'd12289;

assign grp_fu_655_p0 = grp_fu_655_p00;

assign grp_fu_655_p00 = $unsigned(in_buf_load_reg_723_pp0_iter1_reg);

assign grp_fu_655_p1 = 29'd7888;

assign grp_fu_655_p2 = grp_fu_655_p20;

assign grp_fu_655_p20 = grp_fu_642_p2;

assign grp_fu_664_p0 = grp_fu_664_p00;

assign grp_fu_664_p00 = $unsigned(in_buf_load_2_reg_734_pp0_iter2_reg);

assign grp_fu_664_p1 = 29'd7888;

assign grp_fu_664_p2 = grp_fu_664_p20;

assign grp_fu_664_p20 = tmp1_49_reg_779;

assign i_9_fu_278_p2 = (i_fu_241_p1 | 9'd1);

assign i_fu_241_p1 = ap_sig_allocacmp_n_14[8:0];

assign icmp_ln64_4_fu_303_p2 = ((or_ln64_fu_297_p2 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln64_fu_272_p2 = ((trunc_ln64_fu_268_p1 == 2'd0) ? 1'b1 : 1'b0);

assign n_15_fu_309_p2 = (ap_sig_allocacmp_n_14 + 10'd2);

assign or_ln64_fu_297_p2 = (trunc_ln64_fu_268_p1 | 2'd1);

assign select_ln58_10_fu_531_p3 = ((tmp_59_fu_523_p3[0:0] == 1'b1) ? 16'd12289 : 16'd0);

assign select_ln58_fu_376_p3 = ((tmp_56_fu_368_p3[0:0] == 1'b1) ? 16'd12289 : 16'd0);

assign select_ln64_10_fu_578_p3 = ((tmp_60_fu_565_p3[0:0] == 1'b1) ? 16'd0 : 16'd53247);

assign select_ln64_fu_423_p3 = ((tmp_57_fu_410_p3[0:0] == 1'b1) ? 16'd0 : 16'd53247);

assign select_ln69_10_fu_612_p3 = ((tmp_61_fu_600_p3[0:0] == 1'b1) ? 16'd12289 : 16'd0);

assign select_ln69_fu_464_p3 = ((tmp_58_fu_452_p3[0:0] == 1'b1) ? 16'd12289 : 16'd0);

assign sext_ln43_1_fu_390_p1 = tmp2_72_fu_384_p2;

assign sext_ln43_4_fu_519_p1 = tmp2_69_fu_513_p2;

assign sext_ln43_5_fu_545_p1 = tmp2_71_fu_539_p2;

assign sext_ln43_fu_364_p1 = tmp2_66_fu_358_p2;

assign sext_ln62_2_fu_555_p1 = $signed(add_ln62_4_fu_549_p2);

assign sext_ln62_fu_400_p1 = $signed(add_ln62_fu_394_p2);

assign stage0_4_address0 = stage0_4_addr_8_reg_799;

assign stage0_4_address1 = stage0_4_addr_reg_789;

assign stage0_4_d0 = add_ln69_2_fu_620_p2;

assign stage0_4_d1 = add_ln64_4_fu_586_p2;

assign stage0_5_address0 = zext_ln69_fu_487_p1;

assign stage0_5_address1 = zext_ln64_fu_439_p1;

assign stage0_5_d0 = add_ln69_fu_472_p2;

assign stage0_5_d1 = add_ln64_fu_431_p2;

assign stage0_6_address0 = stage0_6_addr_8_reg_804;

assign stage0_6_address1 = stage0_6_addr_reg_794;

assign stage0_6_d0 = add_ln69_2_fu_620_p2;

assign stage0_6_d1 = add_ln64_4_fu_586_p2;

assign stage0_address0 = zext_ln69_fu_487_p1;

assign stage0_address1 = zext_ln64_fu_439_p1;

assign stage0_d0 = add_ln69_fu_472_p2;

assign stage0_d1 = add_ln64_fu_431_p2;

assign tmp1_47_fu_404_p2 = ($signed(sext_ln62_fu_400_p1) + $signed(sext_ln43_1_fu_390_p1));

assign tmp1_48_fu_446_p2 = ($signed(zext_ln42_fu_343_p1) - $signed(sext_ln43_1_fu_390_p1));

assign tmp1_50_fu_559_p2 = ($signed(sext_ln62_2_fu_555_p1) + $signed(sext_ln43_5_fu_545_p1));

assign tmp1_51_fu_594_p2 = ($signed(zext_ln42_4_fu_498_p1) - $signed(sext_ln43_5_fu_545_p1));

assign tmp2_66_fu_358_p2 = ($signed(trunc_ln_fu_349_p4) + $signed(15'd20479));

assign tmp2_69_fu_513_p2 = ($signed(trunc_ln43_2_fu_504_p4) + $signed(15'd20479));

assign tmp2_71_fu_539_p2 = ($signed(select_ln58_10_fu_531_p3) + $signed(sext_ln43_4_fu_519_p1));

assign tmp2_72_fu_384_p2 = ($signed(select_ln58_fu_376_p3) + $signed(sext_ln43_fu_364_p1));

assign tmp_56_fu_368_p3 = tmp2_66_fu_358_p2[32'd14];

assign tmp_57_fu_410_p3 = tmp1_47_fu_404_p2[32'd17];

assign tmp_58_fu_452_p3 = tmp1_48_fu_446_p2[32'd17];

assign tmp_59_fu_523_p3 = tmp2_69_fu_513_p2[32'd14];

assign tmp_60_fu_565_p3 = tmp1_50_fu_559_p2[32'd17];

assign tmp_61_fu_600_p3 = tmp1_51_fu_594_p2[32'd17];

assign tmp_fu_233_p3 = ap_sig_allocacmp_n_14[32'd9];

assign trunc_ln43_2_fu_504_p4 = {{grp_fu_664_p3[30:16]}};

assign trunc_ln64_fu_268_p1 = ap_sig_allocacmp_n_14[1:0];

assign trunc_ln68_10_fu_608_p1 = tmp1_51_fu_594_p2[15:0];

assign trunc_ln68_fu_460_p1 = tmp1_48_fu_446_p2[15:0];

assign trunc_ln_fu_349_p4 = {{grp_fu_655_p3[30:16]}};

assign zext_ln42_1_fu_346_p1 = u_reg_740_pp0_iter3_reg;

assign zext_ln42_4_fu_498_p1 = u_7_reg_747_pp0_iter4_reg;

assign zext_ln42_5_fu_501_p1 = u_7_reg_747_pp0_iter4_reg;

assign zext_ln42_fu_343_p1 = u_reg_740_pp0_iter3_reg;

assign zext_ln52_2_fu_324_p1 = i_9_reg_704;

assign zext_ln52_fu_320_p1 = i_reg_684;

assign zext_ln54_19_fu_292_p1 = zext_ln54_4_cast_fu_284_p3;

assign zext_ln54_4_cast_fu_284_p3 = {{1'd1}, {i_9_fu_278_p2}};

assign zext_ln54_cast_fu_245_p3 = {{1'd1}, {i_fu_241_p1}};

assign zext_ln54_fu_253_p1 = zext_ln54_cast_fu_245_p3;

assign zext_ln55_2_fu_331_p0 = grp_fu_635_p2;

assign zext_ln55_fu_328_p0 = grp_fu_628_p2;

assign zext_ln64_fu_439_p1 = lshr_ln_reg_694_pp0_iter3_reg;

assign zext_ln69_cast_fu_480_p3 = {{1'd1}, {lshr_ln_reg_694_pp0_iter3_reg}};

assign zext_ln69_fu_487_p1 = zext_ln69_cast_fu_480_p3;

always @ (posedge ap_clk) begin
    i_9_reg_704[0] <= 1'b1;
    stage0_4_addr_reg_789[7] <= 1'b0;
    stage0_6_addr_reg_794[7] <= 1'b0;
    stage0_4_addr_8_reg_799[7] <= 1'b1;
    stage0_6_addr_8_reg_804[7] <= 1'b1;
end

endmodule //NTT_ntt_10_stages_Pipeline_VITIS_LOOP_44_1
