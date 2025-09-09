`include "ALU.v"
`include "ALU_decoder.v"
`include "control_unit.v"
`include "data_mem.v"
`include "instr_mem.v"
`include "main_decoder.v"
`include "MUX2to1.v"
`include "mux4to1.v"
`include "PC.v"
`include "reg_file.v"
`include "sign_extend.v"



module RISCV(
input clk,rst,
input test_mode,
output [31:0] dummy_out
);
wire [31:0] PCNext;
wire [31:0] PC;
wire [31:0] Instr;
wire [31:0] PCPlus4;
wire [31:0] SrcA;
wire [31:0] SrcB;
wire [31:0] ALUResult;
wire [31:0] ReadData;
wire [31:0] Result;
wire [31:0] ImmExt;
wire [31:0] PCTarget;
wire [31:0] WriteData;
wire PCSrc;
wire [1:0] ResultSrc;
wire MemWrite;
wire [2:0] ALUControl;
wire ALUSrc;
wire [1:0] ImmSrc;
wire RegWrite;
wire zero;

assign dummy_out=PC;
assign PCPlus4=PC+32'd4;
assign PCTarget=PC+ImmExt;



mux2to1 #(.DATA(32))PCmux(
.A(PCPlus4),
.B(PCTarget),
.sel(PCSrc),
.out(PCNext)
);

PC PC_dut(
.clk(clk),
.rst(rst),
.PC(PC),
.PCNext(PCNext)
);


instr_mem #(.ADDRESS(32), .INSTR(32))instr_m(
.A(PC),
.RD(Instr)
);

reg_file#(.ADDRESS(5), .DATA(32)) reg_f(
.clk(clk),
.rst(rst),
.A1(Instr[19:15]),
.A2(Instr[24:20]),
.A3(Instr[11:7]),
.WD3(Result),
.WE3(RegWrite),
.RD1(SrcA),
.RD2(WriteData)
);

mux2to1 #(.DATA(32))SrcB_mux(
.A(WriteData),
.B(ImmExt),
.sel(ALUSrc),
.out(SrcB)
);

sign_extend ext(
.in_val(Instr[31:7]),
.ImmExt(ImmExt),
.ImmSrc(ImmSrc)
);

ALU #(.DATA(32), .CONTROL(3))ALU_dut(
.SrcA(SrcA),
.SrcB(SrcB),
.zero(zero),
.ALUResult(ALUResult),
.ALUControl(ALUControl)
);

data_mem #(.ADDRESS(32),.DATA(32))data(
.A(ALUResult),
.WD(WriteData),
.clk(clk),
.WE(MemWrite),
.RD(ReadData),
.rst(rst)
);

 mux4to1 #(.DATA(32)) read_mux(
.A(ALUResult),
.B(ReadData),
.C(PCPlus4),
.sel(ResultSrc),
.out(Result)
);

control_unit control(
.op(Instr[6:0]),
.funct3(Instr[14:12]),
.funct7_5(Instr[30]),
.zero(zero),
.PCSrc(PCSrc),
.ResultSrc(ResultSrc),
.MemWrite(MemWrite),
.ALUControl(ALUControl),
.ALUSrc(ALUSrc),
.ImmSrc(ImmSrc),
.RegWrite(RegWrite)
);
endmodule





