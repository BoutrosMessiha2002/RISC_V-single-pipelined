module mux4to1 #(parameter DATA=32)(
input [DATA-1:0] A,
input [DATA-1:0] B,
input [DATA-1:0] C,
input [1:0] sel,
output reg [DATA-1:0] out
);

always @(*)
begin
case (sel)
2'b00: out=A;
2'b01: out=B;
2'b10: out=C;
2'b11: out='bx;
endcase
end
endmodule
