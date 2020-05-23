
//////////////////////////////////////////////////////////////////////////////////
// Test_bench :parllel to serial convertor 
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
wire [31:0]d0,d1,d2,d3,com_data;
 


serial_to_parllal_convertor t1(in_data,d0,d1,d2,d3,com_data,clock ,reset  );


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

#100 $finish();
end

endmodule
