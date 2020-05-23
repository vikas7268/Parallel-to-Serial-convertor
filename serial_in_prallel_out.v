`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2020 14:17:08
// Design Name: 
// Module Name: serial_in_prallel_out
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module serial_in_prallel_out( );
reg clock,reset;
reg [31:0]in_data;
//wire [31:0]sum,out;
//wire [31:0] out0,out1,out2,out3;
//reg [31:0] datafile [3:0];
//wire [31:0]serial_in;
wire [31:0]d0,d1,d2,d3,com_data;
 
// summing_ckt k0(reset,clock,d0,d1,d2,d3,in_data,sum,com_data);

serial_to_parllal_convertor t1(in_data,d0,d1,d2,d3,com_data,clock ,reset  );
//summing_ckt p5(reset,clock,d0,d1,d2,d3,in_data,sum,com_data,out);

initial 
begin
clock = 1'b0;
reset =1'b0;
end

always
begin
#10 clock =! clock;
end

initial
begin
    in_data =32'h00000003;
#20 in_data =32'h00000004;
#20 in_data =32'h00000005;
#20 in_data =32'h00000002;
#20 in_data =32'd00000001;
#20 in_data =32'h00000008;
#20 in_data =32'h00000002;
#20 in_data =32'h04000004; 
//#20 in_data =32'h32005502;
//#20 in_data =32'd30071001;
//#20 in_data =32'h32800011;
//#20 in_data =32'h00110011;
//#20 in_data =32'h22001111;
//#20 in_data =32'h02001100;
//#20 in_data =32'd30000001;

#100 $finish();
end

endmodule
