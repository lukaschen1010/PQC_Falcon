-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity compute_public_mq_NTT_1_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_gmem_AWVALID : OUT STD_LOGIC;
    m_axi_gmem_AWREADY : IN STD_LOGIC;
    m_axi_gmem_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_WVALID : OUT STD_LOGIC;
    m_axi_gmem_WREADY : IN STD_LOGIC;
    m_axi_gmem_WDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    m_axi_gmem_WSTRB : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_WLAST : OUT STD_LOGIC;
    m_axi_gmem_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_ARVALID : OUT STD_LOGIC;
    m_axi_gmem_ARREADY : IN STD_LOGIC;
    m_axi_gmem_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_RVALID : IN STD_LOGIC;
    m_axi_gmem_RREADY : OUT STD_LOGIC;
    m_axi_gmem_RDATA : IN STD_LOGIC_VECTOR (15 downto 0);
    m_axi_gmem_RLAST : IN STD_LOGIC;
    m_axi_gmem_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_RFIFONUM : IN STD_LOGIC_VECTOR (9 downto 0);
    m_axi_gmem_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_BVALID : IN STD_LOGIC;
    m_axi_gmem_BREADY : OUT STD_LOGIC;
    m_axi_gmem_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    a : IN STD_LOGIC_VECTOR (63 downto 0);
    logn : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of compute_public_mq_NTT_1_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_1 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal GMb_address0 : STD_LOGIC_VECTOR (9 downto 0);
    signal GMb_ce0 : STD_LOGIC;
    signal GMb_q0 : STD_LOGIC_VECTOR (13 downto 0);
    signal n_fu_135_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal n_reg_247 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln507_fu_159_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal trunc_ln507_reg_258 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln511_fu_154_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ht_fu_163_p4 : STD_LOGIC_VECTOR (62 downto 0);
    signal ht_reg_263 : STD_LOGIC_VECTOR (62 downto 0);
    signal zext_ln514_fu_173_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln514_reg_268 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_1_fu_182_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_1_reg_277 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal icmp_ln515_fu_177_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal j1_fu_202_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal j1_reg_287 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln515_fu_208_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln515_reg_292 : STD_LOGIC_VECTOR (63 downto 0);
    signal s_reg_297 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_start : STD_LOGIC;
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_done : STD_LOGIC;
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_idle : STD_LOGIC;
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_ready : STD_LOGIC;
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWVALID : STD_LOGIC;
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WVALID : STD_LOGIC;
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WDATA : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WSTRB : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WLAST : STD_LOGIC;
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARVALID : STD_LOGIC;
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_RREADY : STD_LOGIC;
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_BREADY : STD_LOGIC;
    signal indvars_iv_reg_81 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal j1_2_reg_91 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_reg_103 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_start_reg : STD_LOGIC := '0';
    signal zext_ln519_fu_197_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal t_fu_48 : STD_LOGIC_VECTOR (63 downto 0);
    signal m_fu_52 : STD_LOGIC_VECTOR (63 downto 0);
    signal m_2_fu_214_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln509_fu_131_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln515_fu_188_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln519_fu_192_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component compute_public_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        m_axi_gmem_AWVALID : OUT STD_LOGIC;
        m_axi_gmem_AWREADY : IN STD_LOGIC;
        m_axi_gmem_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem_WVALID : OUT STD_LOGIC;
        m_axi_gmem_WREADY : IN STD_LOGIC;
        m_axi_gmem_WDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
        m_axi_gmem_WSTRB : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem_WLAST : OUT STD_LOGIC;
        m_axi_gmem_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem_ARVALID : OUT STD_LOGIC;
        m_axi_gmem_ARREADY : IN STD_LOGIC;
        m_axi_gmem_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem_RVALID : IN STD_LOGIC;
        m_axi_gmem_RREADY : OUT STD_LOGIC;
        m_axi_gmem_RDATA : IN STD_LOGIC_VECTOR (15 downto 0);
        m_axi_gmem_RLAST : IN STD_LOGIC;
        m_axi_gmem_RID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem_RFIFONUM : IN STD_LOGIC_VECTOR (9 downto 0);
        m_axi_gmem_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem_BVALID : IN STD_LOGIC;
        m_axi_gmem_BREADY : OUT STD_LOGIC;
        m_axi_gmem_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem_BID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        j1_2 : IN STD_LOGIC_VECTOR (63 downto 0);
        indvars_iv : IN STD_LOGIC_VECTOR (63 downto 0);
        a : IN STD_LOGIC_VECTOR (63 downto 0);
        ht : IN STD_LOGIC_VECTOR (62 downto 0);
        zext_ln517 : IN STD_LOGIC_VECTOR (13 downto 0) );
    end component;


    component compute_public_mq_NTT_1_1_GMb_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (9 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (13 downto 0) );
    end component;



begin
    GMb_U : component compute_public_mq_NTT_1_1_GMb_ROM_AUTO_1R
    generic map (
        DataWidth => 14,
        AddressRange => 1024,
        AddressWidth => 10)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => GMb_address0,
        ce0 => GMb_ce0,
        q0 => GMb_q0);

    grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114 : component compute_public_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_start,
        ap_done => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_done,
        ap_idle => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_idle,
        ap_ready => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_ready,
        m_axi_gmem_AWVALID => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWVALID,
        m_axi_gmem_AWREADY => m_axi_gmem_AWREADY,
        m_axi_gmem_AWADDR => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWADDR,
        m_axi_gmem_AWID => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWID,
        m_axi_gmem_AWLEN => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWLEN,
        m_axi_gmem_AWSIZE => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWSIZE,
        m_axi_gmem_AWBURST => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWBURST,
        m_axi_gmem_AWLOCK => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWLOCK,
        m_axi_gmem_AWCACHE => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWCACHE,
        m_axi_gmem_AWPROT => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWPROT,
        m_axi_gmem_AWQOS => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWQOS,
        m_axi_gmem_AWREGION => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWREGION,
        m_axi_gmem_AWUSER => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWUSER,
        m_axi_gmem_WVALID => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WVALID,
        m_axi_gmem_WREADY => m_axi_gmem_WREADY,
        m_axi_gmem_WDATA => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WDATA,
        m_axi_gmem_WSTRB => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WSTRB,
        m_axi_gmem_WLAST => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WLAST,
        m_axi_gmem_WID => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WID,
        m_axi_gmem_WUSER => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WUSER,
        m_axi_gmem_ARVALID => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARVALID,
        m_axi_gmem_ARREADY => m_axi_gmem_ARREADY,
        m_axi_gmem_ARADDR => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARADDR,
        m_axi_gmem_ARID => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARID,
        m_axi_gmem_ARLEN => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARLEN,
        m_axi_gmem_ARSIZE => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARSIZE,
        m_axi_gmem_ARBURST => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARBURST,
        m_axi_gmem_ARLOCK => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARLOCK,
        m_axi_gmem_ARCACHE => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARCACHE,
        m_axi_gmem_ARPROT => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARPROT,
        m_axi_gmem_ARQOS => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARQOS,
        m_axi_gmem_ARREGION => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARREGION,
        m_axi_gmem_ARUSER => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARUSER,
        m_axi_gmem_RVALID => m_axi_gmem_RVALID,
        m_axi_gmem_RREADY => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_RREADY,
        m_axi_gmem_RDATA => m_axi_gmem_RDATA,
        m_axi_gmem_RLAST => m_axi_gmem_RLAST,
        m_axi_gmem_RID => m_axi_gmem_RID,
        m_axi_gmem_RFIFONUM => m_axi_gmem_RFIFONUM,
        m_axi_gmem_RUSER => m_axi_gmem_RUSER,
        m_axi_gmem_RRESP => m_axi_gmem_RRESP,
        m_axi_gmem_BVALID => m_axi_gmem_BVALID,
        m_axi_gmem_BREADY => grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_BREADY,
        m_axi_gmem_BRESP => m_axi_gmem_BRESP,
        m_axi_gmem_BID => m_axi_gmem_BID,
        m_axi_gmem_BUSER => m_axi_gmem_BUSER,
        j1_2 => j1_2_reg_91,
        indvars_iv => indvars_iv_reg_81,
        a => a,
        ht => ht_reg_263,
        zext_ln517 => s_reg_297);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_ready = ap_const_logic_1)) then 
                    grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_reg_103_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln511_fu_154_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                i_reg_103 <= ap_const_lv64_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state5) and (grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_done = ap_const_logic_1))) then 
                i_reg_103 <= i_1_reg_277;
            end if; 
        end if;
    end process;

    indvars_iv_reg_81_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln511_fu_154_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                indvars_iv_reg_81 <= zext_ln514_fu_173_p1;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state5) and (grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_done = ap_const_logic_1))) then 
                indvars_iv_reg_81 <= add_ln515_reg_292;
            end if; 
        end if;
    end process;

    j1_2_reg_91_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln511_fu_154_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                j1_2_reg_91 <= ap_const_lv64_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state5) and (grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_done = ap_const_logic_1))) then 
                j1_2_reg_91 <= j1_reg_287;
            end if; 
        end if;
    end process;

    m_fu_52_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                m_fu_52 <= ap_const_lv64_1;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state3) and (icmp_ln515_fu_177_p2 = ap_const_lv1_1))) then 
                m_fu_52 <= m_2_fu_214_p2;
            end if; 
        end if;
    end process;

    t_fu_48_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                t_fu_48 <= n_fu_135_p2;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state3) and (icmp_ln515_fu_177_p2 = ap_const_lv1_1))) then 
                t_fu_48 <= zext_ln514_reg_268;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state3) and (icmp_ln515_fu_177_p2 = ap_const_lv1_0))) then
                add_ln515_reg_292 <= add_ln515_fu_208_p2;
                j1_reg_287 <= j1_fu_202_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln511_fu_154_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                ht_reg_263 <= t_fu_48(63 downto 1);
                trunc_ln507_reg_258 <= trunc_ln507_fu_159_p1;
                    zext_ln514_reg_268(62 downto 0) <= zext_ln514_fu_173_p1(62 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                i_1_reg_277 <= i_1_fu_182_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                n_reg_247 <= n_fu_135_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                s_reg_297 <= GMb_q0;
            end if;
        end if;
    end process;
    zext_ln514_reg_268(63) <= '0';

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln511_fu_154_p2, ap_CS_fsm_state3, icmp_ln515_fu_177_p2, grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_done, ap_CS_fsm_state5)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln511_fu_154_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (icmp_ln515_fu_177_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state5) and (grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    GMb_address0 <= zext_ln519_fu_197_p1(10 - 1 downto 0);

    GMb_ce0_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            GMb_ce0 <= ap_const_logic_1;
        else 
            GMb_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    add_ln515_fu_208_p2 <= std_logic_vector(unsigned(t_fu_48) + unsigned(indvars_iv_reg_81));
    add_ln519_fu_192_p2 <= std_logic_vector(unsigned(trunc_ln515_fu_188_p1) + unsigned(trunc_ln507_reg_258));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_ST_fsm_state5_blk_assign_proc : process(grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_done)
    begin
        if ((grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln511_fu_154_p2)
    begin
        if ((((icmp_ln511_fu_154_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln511_fu_154_p2)
    begin
        if (((icmp_ln511_fu_154_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_start <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_ap_start_reg;
    ht_fu_163_p4 <= t_fu_48(63 downto 1);
    i_1_fu_182_p2 <= std_logic_vector(unsigned(i_reg_103) + unsigned(ap_const_lv64_1));
    icmp_ln511_fu_154_p2 <= "1" when (unsigned(m_fu_52) < unsigned(n_reg_247)) else "0";
    icmp_ln515_fu_177_p2 <= "1" when (i_reg_103 = m_fu_52) else "0";
    j1_fu_202_p2 <= std_logic_vector(unsigned(t_fu_48) + unsigned(j1_2_reg_91));
    m_2_fu_214_p2 <= std_logic_vector(shift_left(unsigned(m_fu_52),to_integer(unsigned('0' & ap_const_lv64_1(31-1 downto 0)))));
    m_axi_gmem_ARADDR <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARADDR;
    m_axi_gmem_ARBURST <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARBURST;
    m_axi_gmem_ARCACHE <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARCACHE;
    m_axi_gmem_ARID <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARID;
    m_axi_gmem_ARLEN <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARLEN;
    m_axi_gmem_ARLOCK <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARLOCK;
    m_axi_gmem_ARPROT <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARPROT;
    m_axi_gmem_ARQOS <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARQOS;
    m_axi_gmem_ARREGION <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARREGION;
    m_axi_gmem_ARSIZE <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARSIZE;
    m_axi_gmem_ARUSER <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARUSER;

    m_axi_gmem_ARVALID_assign_proc : process(ap_CS_fsm_state4, grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARVALID, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            m_axi_gmem_ARVALID <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_ARVALID;
        else 
            m_axi_gmem_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem_AWADDR <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWADDR;
    m_axi_gmem_AWBURST <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWBURST;
    m_axi_gmem_AWCACHE <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWCACHE;
    m_axi_gmem_AWID <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWID;
    m_axi_gmem_AWLEN <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWLEN;
    m_axi_gmem_AWLOCK <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWLOCK;
    m_axi_gmem_AWPROT <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWPROT;
    m_axi_gmem_AWQOS <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWQOS;
    m_axi_gmem_AWREGION <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWREGION;
    m_axi_gmem_AWSIZE <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWSIZE;
    m_axi_gmem_AWUSER <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWUSER;

    m_axi_gmem_AWVALID_assign_proc : process(ap_CS_fsm_state4, grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWVALID, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            m_axi_gmem_AWVALID <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_AWVALID;
        else 
            m_axi_gmem_AWVALID <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_gmem_BREADY_assign_proc : process(ap_CS_fsm_state4, grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_BREADY, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            m_axi_gmem_BREADY <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_BREADY;
        else 
            m_axi_gmem_BREADY <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_gmem_RREADY_assign_proc : process(ap_CS_fsm_state4, grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_RREADY, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            m_axi_gmem_RREADY <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_RREADY;
        else 
            m_axi_gmem_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem_WDATA <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WDATA;
    m_axi_gmem_WID <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WID;
    m_axi_gmem_WLAST <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WLAST;
    m_axi_gmem_WSTRB <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WSTRB;
    m_axi_gmem_WUSER <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WUSER;

    m_axi_gmem_WVALID_assign_proc : process(ap_CS_fsm_state4, grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WVALID, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            m_axi_gmem_WVALID <= grp_mq_NTT_1_1_Pipeline_VITIS_LOOP_521_3_fu_114_m_axi_gmem_WVALID;
        else 
            m_axi_gmem_WVALID <= ap_const_logic_0;
        end if; 
    end process;

    n_fu_135_p2 <= std_logic_vector(shift_left(unsigned(ap_const_lv64_1),to_integer(unsigned('0' & zext_ln509_fu_131_p1(31-1 downto 0)))));
    trunc_ln507_fu_159_p1 <= m_fu_52(10 - 1 downto 0);
    trunc_ln515_fu_188_p1 <= i_reg_103(10 - 1 downto 0);
    zext_ln509_fu_131_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(logn),64));
    zext_ln514_fu_173_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ht_fu_163_p4),64));
    zext_ln519_fu_197_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln519_fu_192_p2),64));
end behav;
