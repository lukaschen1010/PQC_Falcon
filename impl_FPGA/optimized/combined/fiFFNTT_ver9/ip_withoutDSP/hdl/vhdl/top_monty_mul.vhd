-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_monty_mul is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    x : IN STD_LOGIC_VECTOR (15 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (15 downto 0);
    ap_ce : IN STD_LOGIC );
end;


architecture behav of top_monty_mul is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv17_1CFFF : STD_LOGIC_VECTOR (16 downto 0) := "11100111111111111";
    constant ap_const_lv16_CFFF : STD_LOGIC_VECTOR (15 downto 0) := "1100111111111111";
    constant ap_const_lv16_3001 : STD_LOGIC_VECTOR (15 downto 0) := "0011000000000001";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv16_2FFF : STD_LOGIC_VECTOR (15 downto 0) := "0010111111111111";
    constant ap_const_lv30_3001 : STD_LOGIC_VECTOR (29 downto 0) := "000000000000000011000000000001";

attribute shreg_extract : string;
    signal tmp2_u_mul_fu_34_ap_return : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp2_reg_123 : STD_LOGIC_VECTOR (21 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter6 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal tmp2_reg_123_pp0_iter1_reg : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp2_reg_123_pp0_iter2_reg : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp2_reg_123_pp0_iter3_reg : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp2_reg_123_pp0_iter4_reg : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp2_reg_123_pp0_iter5_reg : STD_LOGIC_VECTOR (21 downto 0);
    signal tmp2_u_mul_fu_34_ap_ready : STD_LOGIC;
    signal tmp_u_add_fu_40_ap_ready : STD_LOGIC;
    signal tmp_u_add_fu_40_a : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_u_add_fu_40_b : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_u_add_fu_40_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln235_fu_50_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_109_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_116_p2 : STD_LOGIC_VECTOR (29 downto 0);
    signal trunc_ln5_fu_61_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln233_2_fu_71_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp2_1_fu_75_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_15_fu_87_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln233_fu_95_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln233_fu_81_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_109_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_109_p1 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_fu_116_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_116_p1 : STD_LOGIC_VECTOR (13 downto 0);
    signal tmp2_2_fu_103_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_109_ce : STD_LOGIC;
    signal grp_fu_116_ce : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;
    signal x_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_return_int_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_116_p00 : STD_LOGIC_VECTOR (29 downto 0);

    component top_u_mul IS
    port (
        ap_ready : OUT STD_LOGIC;
        a : IN STD_LOGIC_VECTOR (15 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (21 downto 0) );
    end component;


    component top_u_add IS
    port (
        ap_ready : OUT STD_LOGIC;
        a : IN STD_LOGIC_VECTOR (31 downto 0);
        b : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component top_mul_mul_16s_14ns_16_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (13 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component top_mul_mul_16ns_14ns_30_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (13 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (29 downto 0) );
    end component;



begin
    tmp2_u_mul_fu_34 : component top_u_mul
    port map (
        ap_ready => tmp2_u_mul_fu_34_ap_ready,
        a => x_int_reg,
        ap_return => tmp2_u_mul_fu_34_ap_return);

    tmp_u_add_fu_40 : component top_u_add
    port map (
        ap_ready => tmp_u_add_fu_40_ap_ready,
        a => tmp_u_add_fu_40_a,
        b => tmp_u_add_fu_40_b,
        ap_return => tmp_u_add_fu_40_ap_return);

    mul_mul_16s_14ns_16_4_1_U47 : component top_mul_mul_16s_14ns_16_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 16,
        din1_WIDTH => 14,
        dout_WIDTH => 16)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_109_p0,
        din1 => grp_fu_109_p1,
        ce => grp_fu_109_ce,
        dout => grp_fu_109_p2);

    mul_mul_16ns_14ns_30_4_1_U48 : component top_mul_mul_16ns_14ns_30_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 16,
        din1_WIDTH => 14,
        dout_WIDTH => 30)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_116_p0,
        din1 => grp_fu_116_p1,
        ce => grp_fu_116_ce,
        dout => grp_fu_116_p2);





    ap_ce_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            ap_ce_reg <= ap_ce;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_ce_reg)) then
                ap_return_int_reg <= tmp2_2_fu_103_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_ce_reg))) then
                tmp2_reg_123 <= tmp2_u_mul_fu_34_ap_return;
                tmp2_reg_123_pp0_iter1_reg <= tmp2_reg_123;
                tmp2_reg_123_pp0_iter2_reg <= tmp2_reg_123_pp0_iter1_reg;
                tmp2_reg_123_pp0_iter3_reg <= tmp2_reg_123_pp0_iter2_reg;
                tmp2_reg_123_pp0_iter4_reg <= tmp2_reg_123_pp0_iter3_reg;
                tmp2_reg_123_pp0_iter5_reg <= tmp2_reg_123_pp0_iter4_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_ce)) then
                x_int_reg <= x;
            end if;
        end if;
    end process;
    add_ln233_fu_81_p2 <= std_logic_vector(unsigned(trunc_ln5_fu_61_p4) + unsigned(ap_const_lv16_CFFF));
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter5 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter6 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_return_assign_proc : process(tmp2_2_fu_103_p2, ap_ce_reg, ap_return_int_reg)
    begin
        if ((ap_const_logic_0 = ap_ce_reg)) then 
            ap_return <= ap_return_int_reg;
        elsif ((ap_const_logic_1 = ap_ce_reg)) then 
            ap_return <= tmp2_2_fu_103_p2;
        else 
            ap_return <= "XXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_109_ce_assign_proc : process(ap_block_pp0_stage0_11001, ap_ce_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_ce_reg))) then 
            grp_fu_109_ce <= ap_const_logic_1;
        else 
            grp_fu_109_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_109_p0 <= tmp2_u_mul_fu_34_ap_return(16 - 1 downto 0);
    grp_fu_109_p1 <= ap_const_lv16_2FFF(14 - 1 downto 0);

    grp_fu_116_ce_assign_proc : process(ap_block_pp0_stage0_11001, ap_ce_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_ce_reg))) then 
            grp_fu_116_ce <= ap_const_logic_1;
        else 
            grp_fu_116_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_116_p0 <= grp_fu_116_p00(16 - 1 downto 0);
    grp_fu_116_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln235_fu_50_p0),30));
    grp_fu_116_p1 <= ap_const_lv30_3001(14 - 1 downto 0);
    select_ln233_fu_95_p3 <= 
        ap_const_lv16_3001 when (tmp_15_fu_87_p3(0) = '1') else 
        ap_const_lv16_0;
    tmp2_1_fu_75_p2 <= std_logic_vector(unsigned(zext_ln233_2_fu_71_p1) + unsigned(ap_const_lv17_1CFFF));
    tmp2_2_fu_103_p2 <= std_logic_vector(unsigned(select_ln233_fu_95_p3) + unsigned(add_ln233_fu_81_p2));
    tmp_15_fu_87_p3 <= tmp2_1_fu_75_p2(16 downto 16);
    tmp_u_add_fu_40_a <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp2_reg_123_pp0_iter5_reg),32));
    tmp_u_add_fu_40_b <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_116_p2),32));
    trunc_ln5_fu_61_p4 <= tmp_u_add_fu_40_ap_return(31 downto 16);
    zext_ln233_2_fu_71_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln5_fu_61_p4),17));
    zext_ln235_fu_50_p0 <= grp_fu_109_p2;
end behav;
