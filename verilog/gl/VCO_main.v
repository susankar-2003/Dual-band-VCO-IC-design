// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_analog_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user analog project.
 *
 *-------------------------------------------------------------
 */
module user_analog_project_wrapper (
`ifdef USE_POWER_PINS
    inout VDD1,    // User area 1 1.8V supply
    inout GND,     // User area 1 ground
`endif

       
    // Control voltages and select line
    input Vcntr1,  // Control voltage 1
    input Vcntr2,  // Control voltage 2
    input S,       // Select line

    // Independent clock (on independent integer divider)
    input user_clock2,

    output [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] OUT
);

// Internal signal to select between Vcntr1 and Vcntr2
wire Vcntr_selected;

// Control logic for selecting the control voltage based on select line S
assign Vcntr_selected = (S == 1'b1) ? Vcntr1 : Vcntr2;

// Dummy assignment so that we can take it through the openlane flow
assign io_out = io_in;

// You can implement additional logic here using Vcntr_selected as needed.

endmodule // user_analog_project_wrapper