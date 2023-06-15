// Copyright 2022 Thales DIS design services SAS
// Copyright 2022 OpenHW Group
//
// Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.0
// You may obtain a copy of the License at https://solderpad.org/licenses/
//
// Original Author: Zineb EL KACIMI (zineb.el-kacimi@external.thalesgroup.com)
// ------------------------------------------------------------------------------ //

package cva6_instr_pkg;

  typedef enum {
    // Add custom instruction name enum
    CUS_ADD,
    CUS_ADD_MULTI,
    CUS_NOP,
    CUS_ADD_RS3
    // CUS_EXC,
    // CUS_M_ADD,
    // CUS_S_ADD,
    // CUS_NOP_EXC,
    // CUS_ISS_EXC,
  } riscv_instr_name_t;

   import uvm_pkg::*;
   `include "cva6_defines.svh"
   import riscv_instr_pkg::*;
   `include "cva6_instr_gen_config.sv"
   `include "cva6_asm_program_gen.sv"
   `include "cvxif_custom_instr.sv"
   `include "rv32x_instr.sv"
   `include "riscv_core_setting.sv"

endpackage
