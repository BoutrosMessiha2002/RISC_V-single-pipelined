module dft_mux2to1(
input  A,
input  B,
input sel,
output  out
);

assign out=sel?B:A;

endmodule
