# CIAPEK
## MIPS-like, 16bit CPU 
### made in VHDL for Mimas V2 FPGA
#### with help of Digital Design and Computer Architecture book

### Part 0 - introduction

Even tho I have no prior experience in CPU design or any HDL, I've decided to make this small CPU as my engineering thesis project. It's veeeery loosely connected to my current studies (Algorithmic Computer Science,so mostly math and algorithms and stuff), but it is certainly a thing that I've discovered that I absolutely love doing. The idea came to me after going through study stuff that I've done before for some labs, and I've realized that I had a lot of fun designing a barrel shifter for some online CPU simulator.

Why 16-bit? Because everyone else does 8 or 32 or 64. Why MIPS? Because the aforementioned book uses it as an example. Why MimasV2? Because this was the cheapest second-hand discovery board I've found. Why VHDL? Because I like verbosity and Ada.

No AI was used while making this project. It was made for fun and learn, so AI usaged would be pointless.

### Part 1 - can i even flash my FPGA on NixOs?

### Part 2 - constructing an ISA for 16-bit datapath

### Part 3 - state elements

#### Register file

nvc

#### Instructions and data memory

### Part 4 - generic building blocks

### Part 5 -  

##### TODO

- [ ] debouncing pushbutton
- [X] ~making normaln gitignore~ add for nvc files
- [ ] this README
- [ ] formatter
- [ ] fix memory
- [ ] memory from .mem file
- [ ] justfile for running testbenches
- [ ] nix shell (just, nvc, gtkwave)
