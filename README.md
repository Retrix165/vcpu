# Virtual RISC-V CPU
An honors course contract project to implement a ***RV32I*** CPU using Verilog. 
### Navigation
```
├── cpu
│   ├── CPU code, testbench, and .vcd files
├── notes
│   ├── Notes on Verilog, RISCV, and RV32I
├── tests
│   ├── .s -> .o file tests with python assembler package
├── verilog_tests
│   ├── test programs to relearn verilog
└── README.md
```
## Status
### Unfinished ❌
The Virtual CPU in its current state is *unfinished* due to the following items
- *Lack of datapath support for JAL and JALR instructions*
  - *Specifically return address writeback portion*
- *Lack of Write Back stage support for R/I/S/B Formats*
- *Lack of support for non-word sized loads and stores*
- *Lack of differentiation between signed and unsigned instructions*

### Finished ✅
However, what is implemented is
- *Functioning ALU with testbench program*
- *Functioning Register and Instruction Memory modules with testbench program*
- *Functioning Immediate Generation and ALU Control modules with testbench program*
- *Functioning PC and Control Signals modules with testbench program*
- *A ***mostly*** completed datapath for R/I/S/B Formats*

## Challenges
### Time mangament
I began this project with an objective to stick to a set schedule of progress and learning, so I could re-evalutate my goals every couple of weeks. While I started the semester following the schedule I laid out in ```notes/schedule.txt```, it did not end that way. As school began and I took on new responsibilites, and I did not keep the same commitment to this project as before. This led to changing goals and dates to end up essentially not using a schedule as I wanted to do. The split of time use throughout this semester could be recorded as the first two months being research into Verilog and the RV32I specification, most of my work in ```notes/```, half a month devoted to relearning how to code in Verilog in ```tests/```, and the last month of the project encompassing all cpu coding in ```cpu/```
### Detail Orientedness
Another challenge that came to be known in the final weeks is the specificity in which some parts of the datapath need to be recorded or done. In my initial two months of research into RV32I, I looked over the specification sheets as well as textbooks concerning RISCV. While I certainly got the gist of each chip inside a CPU and gained a greater understanding as I progressed in my Computer Architecture class as well, I realized in the final month of coding that I had missed some details. These details would be things like a diagram not including all the inputs/outputs, some information only being applicable to signed vs. unsigned numbers, or entire datapaths/format being missing in a description of a chip. While I would eventually discover these it would take more time and effort to search back for resources on what to *actually* do. 
### Note:
*The GitHub language distribution is skewed due to having a Python virtual environment package committed to this repository, oops. All the vcpu code is written in Verilog*
