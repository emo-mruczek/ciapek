# CIAPEK
## MIPS-like, 16bit CPU 
### made in VHDL for Mimas V2 FPGA
#### with help of Digital Design and Computer Architecture book

### Part 0 - introduction

Even tho I have no prior experience in CPU design or any HDL, I've decided to make this small CPU as my engineering thesis project. It's veeeery loosely connected to my current studies (Algorithmic Computer Science,so mostly math and algorithms and stuff), but it is certainly a thing that I've discovered that I absolutely love doing. The idea came to me after going through study stuff that I've done before for some labs, and I've realized that I had a lot of fun designing a barrel shifter for some online CPU simulator.

Why 16-bit? Because everyone else does 8 or 32 or 64. Why MIPS? Because the aforementioned book uses it as an example. Why multicycle? Because it sounds fun. Why MimasV2? Because this was the cheapest second-hand discovery board I've found. Why VHDL? Because I like verbosity and Ada.

No AI was used while making this project. It was made for fun and learn, so AI usage would be pointless.

### Part 1 - can i even flash my FPGA on NixOs?

Surprisingly - yes. Not without a little bit of trickery, but yes.
As far as I am aware, I cannot really make a bin file for MimasV2 on Xilinx Vivado, and I have to use an old Xilinx ISE. I had to unpack the .exe and patch the file located in ise/14.7/ISE_DS/ISE/bin/lin64/ise with pachelf (also ldd is your friend). Surprisingly, after that, running this file simply works??? However, it is a little bit unstable and likes to crash randomly.
The .ucf files can be found in the repo (probably an official one?) with sample code for MimasV2. There is also a "Downloads" section at [NumatoLab's site](https://numato.com/product/mimas-v2-spartan-6-fpga-development-board-with-ddr-sdram#downloads) with .ucf and a manual (with pinout).
Handy websites: [using ISE](https://langster1980.blogspot.com/2014/12/numato-mima-v2-tutorial.html) [running ISE & flashing on Linux](https://ewen.mcneill.gen.nz/blog/entry/2017-03-06-numato-mimas-v2-from-linux/)
The second step was flashing the FPGA, but the above link explains it well. Python package can be found [there (ig it's official numato's repo?)](https://github.com/numato/samplecode/tree/master/FPGA/MimasV2/tools/configuration/python). On NixOS, running this with just the python command works, no shell is necessary.


### Part 2 - constructing an ISA for 16-bit datapath

So this is when i realized that 16 bit it's not perfect. I need to remade the ISA to fit into 16-bit. Of course, this limits the number of possible instructions (not a problem, as I never intended to implement them all) and makes an immediate and shamt values much smaller.
In MIPS, there are three types of instructions. This implementation provides as follow:

#### register type 

    
OP - REG - REG - REG - SHAMT - FUNCT
 3 -  3  -  3  -  3  -   1   -   3


| Instruction | Funct | Comments                                                                      | Controls | Implemented |
|-------------|-------|-------------------------------------------------------------------------------|----------|-------------|
| AND         | 000   |                                                                               |          | NO         |
| OR          | 001   |                                                                               |          | NO         |
| ADD         | 010   |                                                                               |          | NO         |
| XOR         | 011   |                                                                               |          | NO         |
| NOR         | 100   |                                                                               |          | NO         |
| SUB         | 101   |                                                                               |          | NO         |
| SLT         | 110   |                                                                               |          | NO         |
| SLL         | 111   | shamt 0 then shift once, 1 then twice not sure how to implement it in the ALU |          | NO         |

#### immediate type 

still not sure which ones to implement 

OP - REG - REG - IMM
 3 -  3  -  3  -  7


| Instruction | Opcode | Comments   | Controls | Implemented |
|-------------|-------|------------|----------|-------------|
| LW         | ???  |    |          | NO         |
| SW          | ???   |    |          | NO       |
| ADDI         | ???   |    |          | NO         |
| BEQ         | ???   |    |          | NO        |
| BNE         | ???   |    |          | NO        |


#### jump type

OP - ADDR 
 3 -  13

probably just J



### Part 3 - state elements

State elements consists of memories (so in multicycle processor, combined instruction and data memory) and an architectural state (program counter and registers). I've actually only implemented the register file before doing the part 4 and 5...

#### Register file

TODO


#### Instructions and data memory

TODO

### Part 4 - generic building blocks
TODO


### Part 5 - ALU

Firstly, I thought that it would be a good idea to reuse components like adder and stuff, but 1. I don't know how to use multiple entities in "when" block 2. it's actually very unnecessary and silly. So ALU it's just a case statement with operation depended on ALUControl value (3 bit vector) that comes from controller. Output is an operation result and a zero flag.
I've partially reused ALU codes from book, replacing two operations with XOR and NOR. So now, it looks like this (SLT stands for "set if less than", returns 1 if a < b and 0 otherwise):

TODO: probably add sll

| ALUControl | Function |
|------------|----------|
| 000        | AND      |
| 001        | OR       |
| 010        | ADD      |
| 011        | N/A      |
| 100        | XOR      |
| 101        | NOR      |
| 110        | SUB      |
| 111        | SLT      |

### Part 6 - control unit

Control unit is a structural component that consists of ALU decoder and main decoder. It gets one input - an 16-bit instruction. TODO

#### ALU decoder 

TODO

#### main decoder

This component has two jobs - sends ALUControl to ALU decoder, and sets every control signals based on fetched instruction.

TODO

### Part 7 - datapath 

TODO


##### TODO

- [ ] debouncing a pushbutton
- [X] ~making normaln gitignore~ add for nvc files
- [ ] this README
- [ ] formatter
- [ ] fix memory
- [ ] memory from .mem file
- [X] justfile for running testbenches
- [X] nix shell (just, nvc, gtkwave)
- [ ] what about overflow/underflow?
- [ ] controller
- [ ] what instructions to implement
