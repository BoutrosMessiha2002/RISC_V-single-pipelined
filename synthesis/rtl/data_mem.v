module data_mem #(parameter ADDRESS=32, parameter DATA=32)(
input [DATA-1:0] A,
input [DATA-1:0] WD,
input clk,
input rst,
input WE,
output wire [DATA-1:0] RD
);

reg [DATA-1:0] data_memory [ADDRESS-1:0] ;
integer i;


always @(posedge clk)
begin
if(WE)
data_memory[A[31:2]]<= WD;
end
assign RD=data_memory[A[31:2]];
initial begin
for(i=0;i<DATA;i=i+1)
data_memory[i]<='b0;
end
endmodule


