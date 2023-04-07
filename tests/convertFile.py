from riscv_assembler.convert import *

cnv = AssemblyConverter(output_type = "t", nibble = False, hexMode = False)

result = cnv.convert('riscvfiles/add.s')
