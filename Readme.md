# CIAPEK
## MIPS-like, 16bit CPU 
### made in VHDL for Mimas V2 FPGA
#### with help of Digital Design and Computer Architecture book

### Part 0 - introduction

Even tho I have no prior experience in CPU design or any HDL, I've decided to make this small CPU as my engineering thesis project. It's veeeery loosely connected to my current studies (Algorithmic Computer Science,so mostly math and algorithms and stuff), but it is certainly a thing that I've discovered that I absolutely love doing. The idea came to me after going through study stuff that I've done before for some labs, and I've realized that I had a lot of fun designing a barrel shifter for some online CPU simulator.

Why 16-bit? Because everyone else does 8 or 32 or 64. Why MIPS? Because the aforementioned book uses it as an example. Why MimasV2? Because this was the cheapest second-hand discovery board I've found. Why VHDL? Because I like verbosity and Ada.

No AI was used while making this project. It was made for fun and learn, so AI usaged would be pointless.

### Part 1 - can i even flash my FPGA on NixOs?

Surprisingly - yes. Not without a little bit of trickery, but yes.
As I am aware of, I cannot really make a bin file for MimasV2 on Xilinx Vivado and I have to use an old Xilinx ISE. I had to unpack the .exe and patch the file located in ise/14.7/ISE_DS/ISE/bin/lin64/ise with pachelf (also ldd is your friend). Surprisingly, after that, running this file simply works???
The .ucf files can be find in repo (probably an official one?) with sample code for MimasV2. There is also "Downloads" section at [NumatoLab's site](https://numato.com/product/mimas-v2-spartan-6-fpga-development-board-with-ddr-sdram#downloads) with .ucf and manual (with pinout).
Handy websites: [using ISE](https://langster1980.blogspot.com/2014/12/numato-mima-v2-tutorial.html) [running ISE & flashing on Linux](https://ewen.mcneill.gen.nz/blog/entry/2017-03-06-numato-mimas-v2-from-linux/)
The second step was flashing the FPGA, but above link explains it well. Python package can be found [there (ig it's official numato's repo?)](https://github.com/numato/samplecode/tree/master/FPGA/MimasV2/tools/configuration/python). On NixOS, running this with just python command works, no shell is necessary.


### Part 2 - constructing an ISA for 16-bit datapath

### Part 3 - state elements

State elements consists of memories (so in multicycle processor, combined instruction and data memory) and an architectural state (program counter and registers). I've actually only implemented the register file before doing the part 4 and 5, but shhhh...

#### Register file




#### Instructions and data memory

### Part 4 - generic building blocks



### Part 5 -  ALU

##### TODO

- [ ] debouncing pushbutton
- [X] ~making normaln gitignore~ add for nvc files
- [ ] this README
- [ ] formatter
- [ ] fix memory
- [ ] memory from .mem file
- [X] justfile for running testbenches
- [X] nix shell (just, nvc, gtkwave)
