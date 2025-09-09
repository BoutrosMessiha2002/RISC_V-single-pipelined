module adder #(parameter DATA=32)(
input [DATA-1:0] A,
input [DATA-1:0] B,
output [DATA-1:0] out
);

assign out=A+B;
endmodule
