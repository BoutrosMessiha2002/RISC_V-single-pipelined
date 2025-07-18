module instr_mem #(parameter ADDRESS=32, parameter INSTR=32)(
input [ADDRESS-1:0] A,
output [INSTR-1:0] RD
);
reg [ADDRESS-1:0] instr_memory [INSTR-1:0];

initial
begin
$readmemh("riscvtest.txt",instr_memory);
end
assign RD=instr_memory[A[31:2]];

endmodule

