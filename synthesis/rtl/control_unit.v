module control_unit(
input [6:0] op,
input [2:0] funct3,
input funct7_5,
input zero,
output PCSrc,
output [1:0] ResultSrc,
output MemWrite,
output ALUSrc,
output [1:0] ImmSrc,
output RegWrite,
output [2:0] ALUControl
);
wire branch;
wire jump;
wire [1:0] ALUOp;

main_decoder decoder (
 .OpCode(op),
 .RegWrite(RegWrite),
 .ImmSrc(ImmSrc),
 .ALUSrc(ALUSrc),
 .MemWrite(MemWrite),
 .ResultSrc(ResultSrc),
 .branch(branch),
 .ALUOp(ALUOp),
 .jump(jump)
);

ALU_decoder ALU_dec(
.ALUOp(ALUOp),
.funct3(funct3),
.op_5(op[5]),
.funct7_5(funct7_5),
.ALUControl(ALUControl)
);

assign PCSrc=(branch&zero)|jump;
endmodule
