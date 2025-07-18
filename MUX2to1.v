module mux2to1 #(parameter DATA=32)(
input [DATA-1:0] A,
input [DATA-1:0] B,
input sel,
output [DATA-1:0] out
);

assign out=sel?B:A;

endmodule
