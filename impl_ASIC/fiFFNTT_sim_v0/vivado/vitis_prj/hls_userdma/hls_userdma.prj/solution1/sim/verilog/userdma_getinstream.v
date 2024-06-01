// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module userdma_getinstream (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        inStreamTop_TDATA,
        inStreamTop_TVALID,
        inStreamTop_TREADY,
        inStreamTop_TKEEP,
        inStreamTop_TSTRB,
        inStreamTop_TUSER,
        inStreamTop_TLAST,
        kernel_mode,
        s2m_err,
        s2m_err_ap_vld,
        inbuf_din,
        inbuf_num_data_valid,
        inbuf_fifo_cap,
        inbuf_full_n,
        inbuf_write,
        incount25_din,
        incount25_num_data_valid,
        incount25_fifo_cap,
        incount25_full_n,
        incount25_write,
        kernel_mode_c_din,
        kernel_mode_c_num_data_valid,
        kernel_mode_c_fifo_cap,
        kernel_mode_c_full_n,
        kernel_mode_c_write
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] inStreamTop_TDATA;
input   inStreamTop_TVALID;
output   inStreamTop_TREADY;
input  [3:0] inStreamTop_TKEEP;
input  [3:0] inStreamTop_TSTRB;
input  [1:0] inStreamTop_TUSER;
input  [0:0] inStreamTop_TLAST;
input  [1:0] kernel_mode;
output  [1:0] s2m_err;
output   s2m_err_ap_vld;
output  [32:0] inbuf_din;
input  [6:0] inbuf_num_data_valid;
input  [6:0] inbuf_fifo_cap;
input   inbuf_full_n;
output   inbuf_write;
output  [31:0] incount25_din;
input  [1:0] incount25_num_data_valid;
input  [1:0] incount25_fifo_cap;
input   incount25_full_n;
output   incount25_write;
output  [1:0] kernel_mode_c_din;
input  [1:0] kernel_mode_c_num_data_valid;
input  [1:0] kernel_mode_c_fifo_cap;
input   kernel_mode_c_full_n;
output   kernel_mode_c_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[1:0] s2m_err;
reg s2m_err_ap_vld;
reg inbuf_write;
reg incount25_write;
reg kernel_mode_c_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    kernel_mode_c_blk_n;
wire   [11:0] select_ln84_fu_129_p3;
reg   [11:0] select_ln84_reg_162;
wire    ap_CS_fsm_state2;
wire    grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_start;
wire    grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_done;
wire    grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_idle;
wire    grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_ready;
wire   [32:0] grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_inbuf_din;
wire    grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_inbuf_write;
wire   [31:0] grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_incount25_din;
wire    grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_incount25_write;
wire    grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_inStreamTop_TREADY;
wire   [0:0] grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_tmp_last_V_out;
wire    grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_tmp_last_V_out_ap_vld;
reg    grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg    ap_block_state1;
wire   [1:0] select_ln94_fu_141_p3;
reg   [1:0] s2m_err_preg;
wire   [0:0] icmp_ln1065_fu_113_p2;
wire   [0:0] icmp_ln1065_4_fu_118_p2;
wire   [0:0] or_ln81_fu_123_p2;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    regslice_both_inStreamTop_V_data_V_U_apdone_blk;
wire   [31:0] inStreamTop_TDATA_int_regslice;
wire    inStreamTop_TVALID_int_regslice;
reg    inStreamTop_TREADY_int_regslice;
wire    regslice_both_inStreamTop_V_data_V_U_ack_in;
wire    regslice_both_inStreamTop_V_keep_V_U_apdone_blk;
wire   [3:0] inStreamTop_TKEEP_int_regslice;
wire    regslice_both_inStreamTop_V_keep_V_U_vld_out;
wire    regslice_both_inStreamTop_V_keep_V_U_ack_in;
wire    regslice_both_inStreamTop_V_strb_V_U_apdone_blk;
wire   [3:0] inStreamTop_TSTRB_int_regslice;
wire    regslice_both_inStreamTop_V_strb_V_U_vld_out;
wire    regslice_both_inStreamTop_V_strb_V_U_ack_in;
wire    regslice_both_inStreamTop_V_user_V_U_apdone_blk;
wire   [1:0] inStreamTop_TUSER_int_regslice;
wire    regslice_both_inStreamTop_V_user_V_U_vld_out;
wire    regslice_both_inStreamTop_V_user_V_U_ack_in;
wire    regslice_both_inStreamTop_V_last_V_U_apdone_blk;
wire   [0:0] inStreamTop_TLAST_int_regslice;
wire    regslice_both_inStreamTop_V_last_V_U_vld_out;
wire    regslice_both_inStreamTop_V_last_V_U_ack_in;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_start_reg = 1'b0;
#0 s2m_err_preg = 2'd0;
end

userdma_getinstream_Pipeline_VITIS_LOOP_84_1 grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_start),
    .ap_done(grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_done),
    .ap_idle(grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_idle),
    .ap_ready(grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_ready),
    .inStreamTop_TVALID(inStreamTop_TVALID_int_regslice),
    .inbuf_din(grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_inbuf_din),
    .inbuf_num_data_valid(7'd0),
    .inbuf_fifo_cap(7'd0),
    .inbuf_full_n(inbuf_full_n),
    .inbuf_write(grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_inbuf_write),
    .incount25_din(grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_incount25_din),
    .incount25_num_data_valid(2'd0),
    .incount25_fifo_cap(2'd0),
    .incount25_full_n(incount25_full_n),
    .incount25_write(grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_incount25_write),
    .inStreamTop_TDATA(inStreamTop_TDATA_int_regslice),
    .inStreamTop_TREADY(grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_inStreamTop_TREADY),
    .inStreamTop_TKEEP(inStreamTop_TKEEP_int_regslice),
    .inStreamTop_TSTRB(inStreamTop_TSTRB_int_regslice),
    .inStreamTop_TUSER(inStreamTop_TUSER_int_regslice),
    .inStreamTop_TLAST(inStreamTop_TLAST_int_regslice),
    .select_ln84(select_ln84_reg_162),
    .tmp_last_V_out(grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_tmp_last_V_out),
    .tmp_last_V_out_ap_vld(grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_tmp_last_V_out_ap_vld)
);

userdma_regslice_both #(
    .DataWidth( 32 ))
regslice_both_inStreamTop_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(inStreamTop_TDATA),
    .vld_in(inStreamTop_TVALID),
    .ack_in(regslice_both_inStreamTop_V_data_V_U_ack_in),
    .data_out(inStreamTop_TDATA_int_regslice),
    .vld_out(inStreamTop_TVALID_int_regslice),
    .ack_out(inStreamTop_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStreamTop_V_data_V_U_apdone_blk)
);

userdma_regslice_both #(
    .DataWidth( 4 ))
regslice_both_inStreamTop_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(inStreamTop_TKEEP),
    .vld_in(inStreamTop_TVALID),
    .ack_in(regslice_both_inStreamTop_V_keep_V_U_ack_in),
    .data_out(inStreamTop_TKEEP_int_regslice),
    .vld_out(regslice_both_inStreamTop_V_keep_V_U_vld_out),
    .ack_out(inStreamTop_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStreamTop_V_keep_V_U_apdone_blk)
);

userdma_regslice_both #(
    .DataWidth( 4 ))
regslice_both_inStreamTop_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(inStreamTop_TSTRB),
    .vld_in(inStreamTop_TVALID),
    .ack_in(regslice_both_inStreamTop_V_strb_V_U_ack_in),
    .data_out(inStreamTop_TSTRB_int_regslice),
    .vld_out(regslice_both_inStreamTop_V_strb_V_U_vld_out),
    .ack_out(inStreamTop_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStreamTop_V_strb_V_U_apdone_blk)
);

userdma_regslice_both #(
    .DataWidth( 2 ))
regslice_both_inStreamTop_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(inStreamTop_TUSER),
    .vld_in(inStreamTop_TVALID),
    .ack_in(regslice_both_inStreamTop_V_user_V_U_ack_in),
    .data_out(inStreamTop_TUSER_int_regslice),
    .vld_out(regslice_both_inStreamTop_V_user_V_U_vld_out),
    .ack_out(inStreamTop_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStreamTop_V_user_V_U_apdone_blk)
);

userdma_regslice_both #(
    .DataWidth( 1 ))
regslice_both_inStreamTop_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(inStreamTop_TLAST),
    .vld_in(inStreamTop_TVALID),
    .ack_in(regslice_both_inStreamTop_V_last_V_U_ack_in),
    .data_out(inStreamTop_TLAST_int_regslice),
    .vld_out(regslice_both_inStreamTop_V_last_V_U_vld_out),
    .ack_out(inStreamTop_TREADY_int_regslice),
    .apdone_blk(regslice_both_inStreamTop_V_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_start_reg <= 1'b1;
        end else if ((grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_ready == 1'b1)) begin
            grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
                s2m_err_preg[1] <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
                        s2m_err_preg[1] <= select_ln94_fu_141_p3[1];
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        select_ln84_reg_162[11 : 10] <= select_ln84_fu_129_p3[11 : 10];
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (kernel_mode_c_full_n == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        inStreamTop_TREADY_int_regslice = grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_inStreamTop_TREADY;
    end else begin
        inStreamTop_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        inbuf_write = grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_inbuf_write;
    end else begin
        inbuf_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        incount25_write = grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_incount25_write;
    end else begin
        incount25_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kernel_mode_c_blk_n = kernel_mode_c_full_n;
    end else begin
        kernel_mode_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (kernel_mode_c_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kernel_mode_c_write = 1'b1;
    end else begin
        kernel_mode_c_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        s2m_err = select_ln94_fu_141_p3;
    end else begin
        s2m_err = s2m_err_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        s2m_err_ap_vld = 1'b1;
    end else begin
        s2m_err_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (kernel_mode_c_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (kernel_mode_c_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_start = grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_ap_start_reg;

assign icmp_ln1065_4_fu_118_p2 = ((kernel_mode == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln1065_fu_113_p2 = ((kernel_mode == 2'd0) ? 1'b1 : 1'b0);

assign inStreamTop_TREADY = regslice_both_inStreamTop_V_data_V_U_ack_in;

assign inbuf_din = grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_inbuf_din;

assign incount25_din = grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_incount25_din;

assign kernel_mode_c_din = kernel_mode;

assign or_ln81_fu_123_p2 = (icmp_ln1065_fu_113_p2 | icmp_ln1065_4_fu_118_p2);

assign select_ln84_fu_129_p3 = ((or_ln81_fu_123_p2[0:0] == 1'b1) ? 12'd2048 : 12'd1024);

assign select_ln94_fu_141_p3 = ((grp_getinstream_Pipeline_VITIS_LOOP_84_1_fu_93_tmp_last_V_out[0:0] == 1'b1) ? 2'd0 : 2'd2);

always @ (posedge ap_clk) begin
    select_ln84_reg_162[9:0] <= 10'b0000000000;
    s2m_err_preg[0] <= 1'b0;
end

endmodule //userdma_getinstream
