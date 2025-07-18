module ALU_decoder(
input [1:0] ALUOp,
input [2:0] funct3,
input op_5,
input funct7_5,
output reg [2:0] ALUControl
);

always @ (*)
begin
case (ALUOp)
2'b00: ALUControl=3'b000;//add
2'b01: ALUControl=3'b001;//sub
2'b10:
begin
case (funct3)
3'b000:
begin
case ({op_5,funct7_5})
2'b11: ALUControl=3'b001;
default: ALUControl=3'b000;
endcase
end
3'b010: ALUControl=3'b101;//slt
3'b110: ALUControl=3'b011;//or
3'b111: ALUControl=3'b010;//and
default: ALUControl=3'b000;//def
endcase
end
default: ALUControl=3'b000;
endcase
end
endmodule
