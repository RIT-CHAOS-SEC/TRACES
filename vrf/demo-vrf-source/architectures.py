# Architectures
class MSP430:
    def __init__(self):
        self.return_instrs           = ['reti','ret']
        self.call_instrs             = ['call']
        self.unconditional_br_instrs = ['br','jmp']
        self.conditional_br_instrs   = ['jne', 'jnz', 'jeq','jz', 'jnc', 'jc', 'jn', 'jge', 'jl']
        self.arch_type 				 = "elf32-msp430"

class ARMv8M33:
    def __init__(self): 
        self.return_instrs           = ['bx']
        self.call_instrs			 = ['bl']
        self.unconditional_br_instrs = [ 'b', 'b.n', 'bal']
        self.conditional_br_instrs   = ['beq','bne','bhs','blo','bhi','bls','bgt','blt','bge','ble','bcs','bcc','bmi','bpl','bvs','bvc']
        self.arch_type 				 = "armv8-m33"
        self.instrmentation_handle   = "SECURE"

        dot_n = []
        dot_w = []
        for inst in self.conditional_br_instrs:
            dot_n.append(inst+".n")
            dot_w.append(inst+".w")

        self.conditional_br_instrs += dot_n[:] + dot_w[:]
