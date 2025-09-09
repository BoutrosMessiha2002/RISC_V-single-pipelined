module reg_file #(parameter ADDRESS=5, parameter DATA=32)(
input [ADDRESS-1:0] A1,
input [ADDRESS-1:0] A2,
input [ADDRESS-1:0] A3,
input [DATA-1:0] WD3,
input clk,
input rst,
input WE3,
output wire [DATA-1:0] RD1,
output wire [DATA-1:0] RD2
);

reg [DATA-1:0] reg_mem [DATA-1:0];
integer i;
assign RD1=reg_mem[A1];
assign RD2=reg_mem[A2];

always @(posedge clk)
begin
if(WE3==1'b1)
reg_mem[A3]<=WD3;
end

initial begin
for(i=0;i<DATA;i=i+1)
reg_mem[i]<='b0;
end
endmodule

