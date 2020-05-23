
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2020 10:53:47
// Design Name: 
// Module Name: serial_to_parllal_convertor
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


module serial_to_parllal_convertor #(parameter n=3)(in_data,out0,out1,out2,out3,outcoming_data,clk ,rst  );
input [31:0] in_data;
input clk,rst;
output reg [31:0] out0,out1,out2,out3;
output reg [31:0]outcoming_data;
reg [31:0] datafile [n:0];
wire [31:0]serial_in;
reg [31:0] data_out[3:0];

integer i;
assign serial_in  = in_data;
initial 
begin
  for(i=0;i<=n;i=i+1)  
   begin
       datafile[n-i] <=32'd0; 
   end
end
always @(posedge clk or posedge rst)
begin
  if(rst==1'b1)
   begin
   for(i=0;i<=n;i=i+1)  
    begin
        datafile[n-i] <=32'd0; 
    end
   end
  else
   begin
     for(i=0;i<=n;i=i+1) 
      begin
        if(i==0)
          begin
            datafile[n-i] <= serial_in; 
          end
        else
           begin
             datafile[n-i] <= datafile[n-i+1];
           end
        end
     end 
     outcoming_data =datafile[0]; 
end

always @(posedge clk)
begin
 
    out0 <= datafile[n-3];
    out1 <= datafile[n-2];
    out2 <= datafile[n-1];
    out3 <= datafile[n-0];
end

endmodule
