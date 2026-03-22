// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission
module mac_16in (clk, reset, out, a, b);

parameter bw = 8;
parameter bw_psum = 2*bw+6;
parameter pr = 64; // parallel factor: number of inputs = 64

output [bw_psum-1:0] out;
input  [pr*bw-1:0] a;
input  [pr*bw-1:0] b;


input clk, reset;
// wire		[2*bw-1:0]	product0	;
// wire		[2*bw-1:0]	product1	;
// wire		[2*bw-1:0]	product2	;
// wire		[2*bw-1:0]	product3	;
// wire		[2*bw-1:0]	product4	;
// wire		[2*bw-1:0]	product5	;
// wire		[2*bw-1:0]	product6	;
// wire		[2*bw-1:0]	product7	;
// wire		[2*bw-1:0]	product8	;
// wire		[2*bw-1:0]	product9	;
// wire		[2*bw-1:0]	product10	;
// wire		[2*bw-1:0]	product11	;
// wire		[2*bw-1:0]	product12	;
// wire		[2*bw-1:0]	product13	;
// wire		[2*bw-1:0]	product14	;
// wire		[2*bw-1:0]	product15	;

reg signed  [2*bw-1:0]	product0_reg;
reg signed  [2*bw-1:0]	product1_reg;
reg signed  [2*bw-1:0]	product2_reg;
reg signed  [2*bw-1:0]	product3_reg;
reg signed  [2*bw-1:0]	product4_reg;
reg signed  [2*bw-1:0]	product5_reg;
reg signed  [2*bw-1:0]	product6_reg;
reg signed  [2*bw-1:0]	product7_reg;
// reg signed  [2*bw-1:0]	product8_reg;
// reg signed  [2*bw-1:0]	product9_reg;
// reg signed  [2*bw-1:0]	product10_reg;
// reg signed  [2*bw-1:0]	product11_reg;
// reg signed  [2*bw-1:0]	product12_reg;
// reg signed  [2*bw-1:0]	product13_reg;
// reg signed  [2*bw-1:0]	product14_reg;
// reg signed  [2*bw-1:0]	product15_reg;

reg signed 	[bw_psum-1:0]	psum0_reg;
reg signed 	[bw_psum-1:0]	psum1_reg;
reg signed 	[bw_psum-1:0]	psum2_reg;
reg signed 	[bw_psum-1:0]	psum3_reg;

reg signed [bw_psum-1:0] out0_reg;
reg signed [bw_psum-1:0] out1_reg;
reg signed [bw_psum-1:0] final_out_reg;


genvar i;



// assign	product0	=	{{(bw){a[bw*	1	-1]}},	a[bw*	1	-1:bw*	0	]}	*	{{(bw){b[bw*	1	-1]}},	b[bw*	1	-1:	bw*	0	]};
// assign	product1	=	{{(bw){a[bw*	2	-1]}},	a[bw*	2	-1:bw*	1	]}	*	{{(bw){b[bw*	2	-1]}},	b[bw*	2	-1:	bw*	1	]};
// assign	product2	=	{{(bw){a[bw*	3	-1]}},	a[bw*	3	-1:bw*	2	]}	*	{{(bw){b[bw*	3	-1]}},	b[bw*	3	-1:	bw*	2	]};
// assign	product3	=	{{(bw){a[bw*	4	-1]}},	a[bw*	4	-1:bw*	3	]}	*	{{(bw){b[bw*	4	-1]}},	b[bw*	4	-1:	bw*	3	]};
// assign	product4	=	{{(bw){a[bw*	5	-1]}},	a[bw*	5	-1:bw*	4	]}	*	{{(bw){b[bw*	5	-1]}},	b[bw*	5	-1:	bw*	4	]};
// assign	product5	=	{{(bw){a[bw*	6	-1]}},	a[bw*	6	-1:bw*	5	]}	*	{{(bw){b[bw*	6	-1]}},	b[bw*	6	-1:	bw*	5	]};
// assign	product6	=	{{(bw){a[bw*	7	-1]}},	a[bw*	7	-1:bw*	6	]}	*	{{(bw){b[bw*	7	-1]}},	b[bw*	7	-1:	bw*	6	]};
// assign	product7	=	{{(bw){a[bw*	8	-1]}},	a[bw*	8	-1:bw*	7	]}	*	{{(bw){b[bw*	8	-1]}},	b[bw*	8	-1:	bw*	7	]};
// assign	product8	=	{{(bw){a[bw*	9	-1]}},	a[bw*	9	-1:bw*	8	]}	*	{{(bw){b[bw*	9	-1]}},	b[bw*	9	-1:	bw*	8	]};
// assign	product9	=	{{(bw){a[bw*	10	-1]}},	a[bw*	10	-1:bw*	9	]}	*	{{(bw){b[bw*	10	-1]}},	b[bw*	10	-1:	bw*	9	]};
// assign	product10	=	{{(bw){a[bw*	11	-1]}},	a[bw*	11	-1:bw*	10	]}	*	{{(bw){b[bw*	11	-1]}},	b[bw*	11	-1:	bw*	10	]};
// assign	product11	=	{{(bw){a[bw*	12	-1]}},	a[bw*	12	-1:bw*	11	]}	*	{{(bw){b[bw*	12	-1]}},	b[bw*	12	-1:	bw*	11	]};
// assign	product12	=	{{(bw){a[bw*	13	-1]}},	a[bw*	13	-1:bw*	12	]}	*	{{(bw){b[bw*	13	-1]}},	b[bw*	13	-1:	bw*	12	]};
// assign	product13	=	{{(bw){a[bw*	14	-1]}},	a[bw*	14	-1:bw*	13	]}	*	{{(bw){b[bw*	14	-1]}},	b[bw*	14	-1:	bw*	13	]};
// assign	product14	=	{{(bw){a[bw*	15	-1]}},	a[bw*	15	-1:bw*	14	]}	*	{{(bw){b[bw*	15	-1]}},	b[bw*	15	-1:	bw*	14	]};
// assign	product15	=	{{(bw){a[bw*	16	-1]}},	a[bw*	16	-1:bw*	15	]}	*	{{(bw){b[bw*	16	-1]}},	b[bw*	16	-1:	bw*	15	]};



// assign out = 
// 		{{(4){product0[2*bw-1]}},product0	}
// 	+	{{(4){product1[2*bw-1]}},product1	}
// 	+	{{(4){product2[2*bw-1]}},product2	}
// 	+	{{(4){product3[2*bw-1]}},product3	}
// 	+	{{(4){product4[2*bw-1]}},product4	}
// 	+	{{(4){product5[2*bw-1]}},product5	}
// 	+	{{(4){product6[2*bw-1]}},product6	}
// 	+	{{(4){product7[2*bw-1]}},product7	}
// 	+	{{(4){product8[2*bw-1]}},product8	}
// 	+	{{(4){product9[2*bw-1]}},product9	}
// 	+	{{(4){product10[2*bw-1]}},product10	}
// 	+	{{(4){product11[2*bw-1]}},product11	}
// 	+	{{(4){product12[2*bw-1]}},product12	}
// 	+	{{(4){product13[2*bw-1]}},product13	}
// 	+	{{(4){product14[2*bw-1]}},product14	}
// 	+	{{(4){product15[2*bw-1]}},product15	};


// Added 2 pipelines
assign out = final_out_reg;

always @ (posedge clk) begin
	if (reset) begin
		product0_reg <= 0;
		product1_reg <= 0;
		product2_reg <= 0;
		product3_reg <= 0;
		product4_reg <= 0;
		product5_reg <= 0;
		product6_reg <= 0;
		product7_reg <= 0;
		// product8_reg <= 0;
		// product9_reg <= 0;
		// product10_reg <= 0;
		// product11_reg <= 0;
		// product12_reg <= 0;
		// product13_reg <= 0;
		// product14_reg <= 0;
		// product15_reg <= 0;
		psum0_reg <= 0;
		psum1_reg <= 0;
		psum2_reg <= 0;
		psum3_reg <= 0;
		out0_reg <= 0;
		out1_reg <= 0;
		final_out_reg <= 0;
	end
	else begin
		// product0_reg <= {{(bw){a[bw*1-1]}}, a[bw*1-1:bw*0]} * {{(bw){b[bw*1-1]}}, b[bw*1-1:bw*0]};
		// product1_reg <= {{(bw){a[bw*2-1]}}, a[bw*2-1:bw*1]} * {{(bw){b[bw*2-1]}}, b[bw*2-1:bw*1]};
		// product2_reg <= {{(bw){a[bw*3-1]}}, a[bw*3-1:bw*2]} * {{(bw){b[bw*3-1]}}, b[bw*3-1:bw*2]};
		// product3_reg <= {{(bw){a[bw*4-1]}}, a[bw*4-1:bw*3]} * {{(bw){b[bw*4-1]}}, b[bw*4-1:bw*3]};
		// product4_reg <= {{(bw){a[bw*5-1]}}, a[bw*5-1:bw*4]} * {{(bw){b[bw*5-1]}}, b[bw*5-1:bw*4]};
		// product5_reg <= {{(bw){a[bw*6-1]}}, a[bw*6-1:bw*5]} * {{(bw){b[bw*6-1]}}, b[bw*6-1:bw*5]};
		// product6_reg <= {{(bw){a[bw*7-1]}}, a[bw*7-1:bw*6]} * {{(bw){b[bw*7-1]}}, b[bw*7-1:bw*6]};
		// product7_reg <= {{(bw){a[bw*8-1]}}, a[bw*8-1:bw*7]} * {{(bw){b[bw*8-1]}}, b[bw*8-1:bw*7]};
		// product8_reg <= {{(bw){a[bw*9-1]}}, a[bw*9-1:bw*8]} * {{(bw){b[bw*9-1]}}, b[bw*9-1:bw*8]};
		// product9_reg <= {{(bw){a[bw*10-1]}}, a[bw*10-1:bw*9]} * {{(bw){b[bw*10-1]}}, b[bw*10-1:bw*9]};
		// product10_reg <= {{(bw){a[bw*11-1]}}, a[bw*11-1:bw*10]} * {{(bw){b[bw*11-1]}}, b[bw*11-1:bw*10]};
		// product11_reg <= {{(bw){a[bw*12-1]}}, a[bw*12-1:bw*11]} * {{(bw){b[bw*12-1]}}, b[bw*12-1:bw*11]};
		// product12_reg <= {{(bw){a[bw*13-1]}}, a[bw*13-1:bw*12]} * {{(bw){b[bw*13-1]}}, b[bw*13-1:bw*12]};
		// product13_reg <= {{(bw){a[bw*14-1]}}, a[bw*14-1:bw*13]} * {{(bw){b[bw*14-1]}}, b[bw*14-1:bw*13]};
		// product14_reg <= {{(bw){a[bw*15-1]}}, a[bw*15-1:bw*14]} * {{(bw){b[bw*15-1]}}, b[bw*15-1:bw*14]};
		// product15_reg <= {{(bw){a[bw*16-1]}}, a[bw*16-1:bw*15]} * {{(bw){b[bw*16-1]}}, b[bw*16-1:bw*15]};

		product0_reg <= {{(bw){a[bw*1-1]}}, a[bw*1-1:bw*0]} * {{(bw){b[bw*1-1]}}, b[bw*1-1:bw*0]};
		product1_reg <= {{(bw){a[bw*2-1]}}, a[bw*2-1:bw*1]} * {{(bw){b[bw*2-1]}}, b[bw*2-1:bw*1]};
		product2_reg <= {{(bw){a[bw*3-1]}}, a[bw*3-1:bw*2]} * {{(bw){b[bw*3-1]}}, b[bw*3-1:bw*2]};
		product3_reg <= {{(bw){a[bw*4-1]}}, a[bw*4-1:bw*3]} * {{(bw){b[bw*4-1]}}, b[bw*4-1:bw*3]};
		product4_reg <= {{(bw){a[bw*5-1]}}, a[bw*5-1:bw*4]} * {{(bw){b[bw*5-1]}}, b[bw*5-1:bw*4]};
		product5_reg <= {{(bw){a[bw*6-1]}}, a[bw*6-1:bw*5]} * {{(bw){b[bw*6-1]}}, b[bw*6-1:bw*5]};
		product6_reg <= {{(bw){a[bw*7-1]}}, a[bw*7-1:bw*6]} * {{(bw){b[bw*7-1]}}, b[bw*7-1:bw*6]};
		product7_reg <= {{(bw){a[bw*8-1]}}, a[bw*8-1:bw*7]} * {{(bw){b[bw*8-1]}}, b[bw*8-1:bw*7]};
		// product8_reg <= {{(bw){a[bw*9-1]}}, a[bw*9-1:bw*8]} * {{(bw){b[bw*9-1]}}, b[bw*9-1:bw*8]};
		// product9_reg <= {{(bw){a[bw*10-1]}}, a[bw*10-1:bw*9]} * {{(bw){b[bw*10-1]}}, b[bw*10-1:bw*9]};
		// product10_reg <= {{(bw){a[bw*11-1]}}, a[bw*11-1:bw*10]} * {{(bw){b[bw*11-1]}}, b[bw*11-1:bw*10]};
		// product11_reg <= {{(bw){a[bw*12-1]}}, a[bw*12-1:bw*11]} * {{(bw){b[bw*12-1]}}, b[bw*12-1:bw*11]};
		// product12_reg <= {{(bw){a[bw*13-1]}}, a[bw*13-1:bw*12]} * {{(bw){b[bw*13-1]}}, b[bw*13-1:bw*12]};
		// product13_reg <= {{(bw){a[bw*14-1]}}, a[bw*14-1:bw*13]} * {{(bw){b[bw*14-1]}}, b[bw*14-1:bw*13]};
		// product14_reg <= {{(bw){a[bw*15-1]}}, a[bw*15-1:bw*14]} * {{(bw){b[bw*15-1]}}, b[bw*15-1:bw*14]};
		// product15_reg <= {{(bw){a[bw*16-1]}}, a[bw*16-1:bw*15]} * {{(bw){b[bw*16-1]}}, b[bw*16-1:bw*15]};

		psum0_reg <={{(4){product0_reg[2*bw-1]}},product0_reg}
				+	{{(4){product1_reg[2*bw-1]}},product1_reg};
		psum1_reg <={{(4){product2_reg[2*bw-1]}},product2_reg}
				+	{{(4){product3_reg[2*bw-1]}},product3_reg};
		psum2_reg <={{(4){product4_reg[2*bw-1]}},product4_reg}
				+	{{(4){product5_reg[2*bw-1]}},product5_reg};
		psum3_reg <={{(4){product6_reg[2*bw-1]}},product6_reg}
				+	{{(4){product7_reg[2*bw-1]}},product7_reg};
		// psum2_reg <={{(4){product8_reg[2*bw-1]}},product8_reg}
		// 		+	{{(4){product9_reg[2*bw-1]}},product9_reg}
		// 		+	{{(4){product10_reg[2*bw-1]}},product10_reg}
		// 		+	{{(4){product11_reg[2*bw-1]}},product11_reg};

		// psum3_reg <={{(4){product12_reg[2*bw-1]}},product12_reg}
		// 		+	{{(4){product13_reg[2*bw-1]}},product13_reg}
		// 		+	{{(4){product14_reg[2*bw-1]}},product14_reg}
		// 		+	{{(4){product15_reg[2*bw-1]}},product15_reg};

		out0_reg <= psum0_reg + psum1_reg;
		out1_reg <= psum2_reg + psum3_reg;

		final_out_reg <= out0_reg + out1_reg;
	end
end

endmodule
