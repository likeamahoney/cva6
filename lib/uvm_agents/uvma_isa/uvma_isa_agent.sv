// Copyright 2021 OpenHW Group
// Copyright 2021 Silicon Labs, Inc.
//
// Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://solderpad.org/licenses/
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


class uvma_isa_agent_c extends uvm_agent;

  `uvm_component_utils(uvma_isa_agent_c);

  uvma_isa_cntxt_c cntxt;
  uvma_isa_mon_c   monitor;

  extern function new(string name, uvm_component parent);
  extern virtual function void build_phase(uvm_phase phase);
  extern function void get_and_set_cntxt();
  extern function void retrieve_vif();
  extern function void create_components();

endclass : uvma_isa_agent_c


function uvma_isa_agent_c::new(string name = "uvma_isa_agent", uvm_component parent = null);

  super.new(name, parent);

endfunction : new


function void uvma_isa_agent_c::build_phase(uvm_phase phase);

  super.build_phase(phase);
  get_and_set_cntxt();
  retrieve_vif();
  create_components();

endfunction : build_phase


function void uvma_isa_agent_c::get_and_set_cntxt();

  void'(uvm_config_db#(uvma_isa_cntxt_c)::get(this, "", "cntxt", cntxt));
  if (!cntxt) begin
    `uvm_info("CNTXT", "Context handle is null; creating.", UVM_DEBUG)
    cntxt = uvma_isa_cntxt_c::type_id::create("cntxt");
  end
  uvm_config_db#(uvma_isa_cntxt_c)::set(this, "*", "cntxt", cntxt);

endfunction : get_and_set_cntxt


function void uvma_isa_agent_c::retrieve_vif();

  if (!uvm_config_db#(virtual uvma_isa_if)::get(this, "", "vif", cntxt.vif)) begin
    `uvm_fatal("VIF", $sformatf(
               "Could not find vif handle of type %s in uvm_config_db", $typename(cntxt.vif)))
  end else begin
    `uvm_info("VIF", $sformatf("Found vif handle of type %s in uvm_config_db", $typename(cntxt.vif)
              ), UVM_DEBUG)
  end

endfunction : retrieve_vif


function void uvma_isa_agent_c::create_components();

  monitor = uvma_isa_mon_c::type_id::create("monitor", this);

endfunction
