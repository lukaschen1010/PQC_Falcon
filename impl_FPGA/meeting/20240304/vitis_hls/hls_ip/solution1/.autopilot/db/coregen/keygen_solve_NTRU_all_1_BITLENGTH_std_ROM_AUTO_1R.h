// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __keygen_solve_NTRU_all_1_BITLENGTH_std_ROM_AUTO_1R_H__
#define __keygen_solve_NTRU_all_1_BITLENGTH_std_ROM_AUTO_1R_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct keygen_solve_NTRU_all_1_BITLENGTH_std_ROM_AUTO_1R_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 5;
  static const unsigned AddressRange = 11;
  static const unsigned AddressWidth = 4;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(keygen_solve_NTRU_all_1_BITLENGTH_std_ROM_AUTO_1R_ram) {
        ram[0] = "0b00000";
        ram[1] = "0b00001";
        ram[2] = "0b00001";
        ram[3] = "0b00001";
        ram[4] = "0b00001";
        ram[5] = "0b00010";
        ram[6] = "0b00100";
        ram[7] = "0b00101";
        ram[8] = "0b01000";
        ram[9] = "0b01101";
        ram[10] = "0b11001";


SC_METHOD(prc_write_0);
  sensitive<<clk.pos();
   }


void prc_write_0()
{
    if (ce0.read() == sc_dt::Log_1) 
    {
            if(address0.read().is_01() && address0.read().to_uint()<AddressRange)
              q0 = ram[address0.read().to_uint()];
            else
              q0 = sc_lv<DataWidth>();
    }
}


}; //endmodule


SC_MODULE(keygen_solve_NTRU_all_1_BITLENGTH_std_ROM_AUTO_1R) {


static const unsigned DataWidth = 5;
static const unsigned AddressRange = 11;
static const unsigned AddressWidth = 4;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


keygen_solve_NTRU_all_1_BITLENGTH_std_ROM_AUTO_1R_ram* meminst;


SC_CTOR(keygen_solve_NTRU_all_1_BITLENGTH_std_ROM_AUTO_1R) {
meminst = new keygen_solve_NTRU_all_1_BITLENGTH_std_ROM_AUTO_1R_ram("keygen_solve_NTRU_all_1_BITLENGTH_std_ROM_AUTO_1R_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~keygen_solve_NTRU_all_1_BITLENGTH_std_ROM_AUTO_1R() {
    delete meminst;
}


};//endmodule
#endif
