/* =======================================================================
* Copyright (c) 2023, MongooseOrion.
* All rights reserved.
*
* The following code snippet may contain portions that are derived from
* OPEN-SOURCE communities, and these portions will be licensed with: 
*
* <GPLv3.0 pango>
*
* If there is no OPEN-SOURCE licenses are listed, it indicates none of
* content in this Code document is sourced from OPEN-SOURCE communities. 
*
* In this case, the document is protected by copyright, and any use of
* all or part of its content by individuals, organizations, or companies
* without authorization is prohibited, unless the project repository
* associated with this document has added relevant OPEN-SOURCE licenses
* by github.com/MongooseOrion. 
*
* Please make sure using the content of this document in accordance with 
* the respective OPEN-SOURCE licenses. 
* 
* THIS CODE IS PROVIDED BY https://github.com/MongooseOrion. 
* FILE ENCODER TYPE: GBK
* ========================================================================
*/
// 将输入数据数据分离成左右声道数据 ldata，rdata
//
`timescale 1ns/1ns
module i2s_loop
#(
    parameter DATA_WIDTH = 8
)
(
    input                       sck,
    input                       rst_n,

    output reg [DATA_WIDTH - 1:0]  ldata,
    output reg [DATA_WIDTH - 1:0]  rdata,

    input   [DATA_WIDTH - 1:0]  data,
    input                       r_vld,
    input                       l_vld
);

always @(posedge sck or negedge rst_n)
begin
    if(~rst_n)
        ldata <= {DATA_WIDTH{1'b0}};
    else if(l_vld)
        ldata <= data;
end

always @(posedge sck or negedge rst_n)
begin
    if(~rst_n)
        rdata <= {DATA_WIDTH{1'b0}};
    else if(r_vld)
        rdata <= data;
end

endmodule //i2s_loop
