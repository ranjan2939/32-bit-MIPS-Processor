`timescale 1ns / 1ps

module test_processor;

reg clk1, clk2;
integer k;

processor mips(clk1, clk2);

initial begin                        //generating two phase clock
clk1 =0; clk2 =0;                    
repeat (50)
	begin
	     #5 clk1 =1; #5 clk1 =0;
	     #5 clk2 =1; #5 clk2 =0;
	end
end

initial begin
for (k=0; k<32; k=k+1)
	mips.Reg[k] =k;               //initialising all the register values with k

	mips.Mem[0] = 32'h280a00c8;   //ADDI R10, R0, 200........................=> R10 = 200
	mips.Mem[1] = 32'h28020001;   //ADDI R2, R0, 1...........................=> R2  = 1
	mips.Mem[2] = 32'h0e940000;   //OR R20, R20, R20 (dummy instruction).....=> R20 = 20
	mips.Mem[3] = 32'h21430000;   //LOAD R3, 0(R10)..........................=> R3  = 10
	mips.Mem[4] = 32'h0e940000;   //OR R20, R20, R20 (dummy instruction).....=> R20 = 20
	mips.Mem[5] = 32'h14431000;   //LOOP: MUL R2, R2, R3.....................=> R2 = R2 * R3
	mips.Mem[6] = 32'h2c630001;   //SUBI R3, R3, 1...........................=> R3 = R3 - 1
	mips.Mem[7] = 32'h0e940000;   //OR R20, R20, R20 (dummy instruction).....=> R20 = 20
	mips.Mem[8] = 32'h3460fffc;   //BNEQZ R3, LOOP (offset -4)...............=> checking R3 != 0 then go back to loop
	mips.Mem[9] = 32'h2542fffe;   //STORE R2, -2(R10)........................=> storing value of R2 at memory location 198
	mips.Mem[10] = 32'hfc000000;  //HALT

	mips.Mem[200] =10;            //initialsing memory data at 200 memory address
	mips.HALTED = 0;            
	mips.PC = 0;
	mips.TAKEN_BRANCH = 0;

	#2000
	//for (k=0; k<6; k=k+1)
	  // $display("R%1d -%2d", k , mips.Reg[k]);
	$display("Mem[200]= %2d , Mem[198]= %6d", mips.Mem[200], mips.Mem[198]);
end

initial begin
	$monitor("R2: %4d", mips.Reg[2]);
	#3000 $finish;
end

endmodule