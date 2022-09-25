# 32-bit-RISC-Processor
RISC Architecture is used in MIPS Processor. It can compute simple arithmetic operations such as addition, substraction, multiplication and can perform loop operation as well. It uses piplined architecture.

# Introduction
MIPS Pipeline
![Capture](https://user-images.githubusercontent.com/93189400/192135651-0a0504ba-a884-4f83-bea3-d1be0da1e601.PNG)

This processor consists of 5 stages.<br />
(A) Instruction Fetch Stage <br />
(B) Instruction Decode Stage <br />
(C) Execution Stage <br />
(D) Memory Stage <br />
(E) Write Back Stage <br />
All stages are separated by pipeline latches. <br />

# Method of Operation
(A) Instruction is fetched from Instruction Memory by using PC. <br />
(B) Instruction is forwarded to Decode stage where source and desitination registor are declared. Immediated value is sign extended. <br />
(C) Depending upon the opcode in instruction in Execution stage the functions on registers are implemented and stored in destination register. <br />
(D) In Memory stage one of these process is happening <br />
   (1) Memory value from a address is loaded in a register. <br /> 
   (2) Resister value is stored in memory. <br />
   (3) Value of register stored in register in Execution stage is forwarded to Write Back Stage. <br />
(E) In Write Back Stage destination register is updated.

# Description about Test Bench
The test bench given is used to compute a factorial of a number. In this case number is taken as 10. <br />
Other arithemetic operation can also be done by making changes in the test bench.
