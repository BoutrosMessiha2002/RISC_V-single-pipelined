module sign_extend(
input [24:0] in_val,
input  [1:0] ImmSrc,
output reg [31:0] ImmExt
);

always @(*)
begin
case (ImmSrc)
2'b00: ImmExt={{20{in_val[24]}},in_val[24:13]};//I
2'b01: ImmExt={{20{in_val[24]}},in_val[24:18],in_val[4:0]};//S
2'b10: ImmExt={{20{in_val[24]}},in_val[0],in_val[23:18],in_val[4:1],1'b0};//B
2'b11: ImmExt={{12{in_val[24]}},in_val[12:5],in_val[13],in_val[23:14],1'b0};//J
endcase
end
endmodule
