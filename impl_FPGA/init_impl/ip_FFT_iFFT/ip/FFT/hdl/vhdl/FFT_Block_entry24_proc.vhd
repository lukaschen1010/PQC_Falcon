-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FFT_Block_entry24_proc is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    logn : IN STD_LOGIC_VECTOR (31 downto 0);
    logn_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    logn_c_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    logn_c_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    logn_c_full_n : IN STD_LOGIC;
    logn_c_write : OUT STD_LOGIC;
    ap_return_0 : OUT STD_LOGIC_VECTOR (63 downto 0);
    ap_return_1 : OUT STD_LOGIC_VECTOR (62 downto 0) );
end;


architecture behav of FFT_Block_entry24_proc is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv64_1 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv63_0 : STD_LOGIC_VECTOR (62 downto 0) := "000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal logn_c_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal zext_ln951_fu_48_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal n_fu_52_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal hn_fu_58_p4 : STD_LOGIC_VECTOR (62 downto 0);
    signal zext_ln952_fu_68_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_return_0_preg : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_return_1_preg : STD_LOGIC_VECTOR (62 downto 0) := "000000000000000000000000000000000000000000000000000000000000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;


begin




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


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((not(((ap_start = ap_const_logic_0) or (logn_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_return_0_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_0_preg(0) <= '0';
                ap_return_0_preg(1) <= '0';
                ap_return_0_preg(2) <= '0';
                ap_return_0_preg(3) <= '0';
                ap_return_0_preg(4) <= '0';
                ap_return_0_preg(5) <= '0';
                ap_return_0_preg(6) <= '0';
                ap_return_0_preg(7) <= '0';
                ap_return_0_preg(8) <= '0';
                ap_return_0_preg(9) <= '0';
                ap_return_0_preg(10) <= '0';
                ap_return_0_preg(11) <= '0';
                ap_return_0_preg(12) <= '0';
                ap_return_0_preg(13) <= '0';
                ap_return_0_preg(14) <= '0';
                ap_return_0_preg(15) <= '0';
                ap_return_0_preg(16) <= '0';
                ap_return_0_preg(17) <= '0';
                ap_return_0_preg(18) <= '0';
                ap_return_0_preg(19) <= '0';
                ap_return_0_preg(20) <= '0';
                ap_return_0_preg(21) <= '0';
                ap_return_0_preg(22) <= '0';
                ap_return_0_preg(23) <= '0';
                ap_return_0_preg(24) <= '0';
                ap_return_0_preg(25) <= '0';
                ap_return_0_preg(26) <= '0';
                ap_return_0_preg(27) <= '0';
                ap_return_0_preg(28) <= '0';
                ap_return_0_preg(29) <= '0';
                ap_return_0_preg(30) <= '0';
                ap_return_0_preg(31) <= '0';
                ap_return_0_preg(32) <= '0';
                ap_return_0_preg(33) <= '0';
                ap_return_0_preg(34) <= '0';
                ap_return_0_preg(35) <= '0';
                ap_return_0_preg(36) <= '0';
                ap_return_0_preg(37) <= '0';
                ap_return_0_preg(38) <= '0';
                ap_return_0_preg(39) <= '0';
                ap_return_0_preg(40) <= '0';
                ap_return_0_preg(41) <= '0';
                ap_return_0_preg(42) <= '0';
                ap_return_0_preg(43) <= '0';
                ap_return_0_preg(44) <= '0';
                ap_return_0_preg(45) <= '0';
                ap_return_0_preg(46) <= '0';
                ap_return_0_preg(47) <= '0';
                ap_return_0_preg(48) <= '0';
                ap_return_0_preg(49) <= '0';
                ap_return_0_preg(50) <= '0';
                ap_return_0_preg(51) <= '0';
                ap_return_0_preg(52) <= '0';
                ap_return_0_preg(53) <= '0';
                ap_return_0_preg(54) <= '0';
                ap_return_0_preg(55) <= '0';
                ap_return_0_preg(56) <= '0';
                ap_return_0_preg(57) <= '0';
                ap_return_0_preg(58) <= '0';
                ap_return_0_preg(59) <= '0';
                ap_return_0_preg(60) <= '0';
                ap_return_0_preg(61) <= '0';
                ap_return_0_preg(62) <= '0';
            else
                if ((not(((ap_start = ap_const_logic_0) or (logn_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                                        ap_return_0_preg(62 downto 0) <= zext_ln952_fu_68_p1(62 downto 0);
                end if; 
            end if;
        end if;
    end process;


    ap_return_1_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_1_preg <= ap_const_lv63_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (logn_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_return_1_preg <= n_fu_52_p2(63 downto 1);
                end if; 
            end if;
        end if;
    end process;

    ap_return_0_preg(63) <= '0';

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, logn_c_full_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, logn_c_full_n)
    begin
        if (((ap_start = ap_const_logic_0) or (logn_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, logn_c_full_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (logn_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, logn_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (logn_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, logn_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (logn_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_0_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, logn_c_full_n, zext_ln952_fu_68_p1, ap_return_0_preg)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (logn_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_return_0 <= zext_ln952_fu_68_p1;
        else 
            ap_return_0 <= ap_return_0_preg;
        end if; 
    end process;


    ap_return_1_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, logn_c_full_n, n_fu_52_p2, ap_return_1_preg)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (logn_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_return_1 <= n_fu_52_p2(63 downto 1);
        else 
            ap_return_1 <= ap_return_1_preg;
        end if; 
    end process;

    hn_fu_58_p4 <= n_fu_52_p2(63 downto 1);

    logn_c_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, logn_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            logn_c_blk_n <= logn_c_full_n;
        else 
            logn_c_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    logn_c_din <= logn;

    logn_c_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, logn_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (logn_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            logn_c_write <= ap_const_logic_1;
        else 
            logn_c_write <= ap_const_logic_0;
        end if; 
    end process;

    n_fu_52_p2 <= std_logic_vector(shift_left(unsigned(ap_const_lv64_1),to_integer(unsigned('0' & zext_ln951_fu_48_p1(31-1 downto 0)))));
    zext_ln951_fu_48_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(logn),64));
    zext_ln952_fu_68_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(hn_fu_58_p4),64));
end behav;
