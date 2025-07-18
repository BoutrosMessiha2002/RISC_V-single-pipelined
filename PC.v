module PC(
input [31:0] PCNext,
input clk,
input rst,
output reg [31:0] PC
);


always @(posedge clk or negedge rst)
begin
if(!rst)
PC<=32'b0;
else
PC<=PCNext;
end
endmodule
