////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Copyright 2018 ETH Zurich and University of Bologna.                       //
// Copyright and related rights are licensed under the Solderpad Hardware     //
// License, Version 0.51 (the "License"); you may not use this file except in //
// compliance with the License.  You may obtain a copy of the License at      //
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law  //
// or agreed to in writing, software, hardware and materials distributed under//
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR     //
// CONDITIONS OF ANY KIND, either express or implied. See the License for the //
// specific language governing permissions and limitations under the License. //
//                                                                            //
// Company:        Micrel Lab @ DEIS - University of Bologna                  //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Igor Loi - igor.loi@unibo.it                               //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    01/01/2019                                                 //
// Design Name:    FPU_INTERCONNECT                                           //
// Module Name:    RR_Flag_Req_FPU                                            //
// Project Name:   VEGA                                                       //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:                                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - 01/01/2019 : File Created                                  //
//                                                                            //
// Additional Comments:                                                       //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module RR_Flag_Req_FPU
#(
    parameter WIDTH     = 3,
    parameter MAX_COUNT = 2**WIDTH-1
)
(
    input  logic                clk,
    input  logic                rst_n,
    output logic [WIDTH-1:0]    RR_FLAG_o,
    input  logic                data_req_i,
    input  logic                data_gnt_i
);
  
    always_ff @(posedge clk, negedge rst_n)
    begin : RR_Flag_Req_SEQ
        if(rst_n == 1'b0)
           RR_FLAG_o <= '0;
        else
          if( data_req_i  & data_gnt_i )
          begin
                if(RR_FLAG_o < MAX_COUNT)
                  RR_FLAG_o <= RR_FLAG_o + 1'b1;
               else
                  RR_FLAG_o <= '0;
          end
    end
    
    
endmodule
