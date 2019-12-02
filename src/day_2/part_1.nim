import sequtils
from strutils import split, parseInt, strip

var opcode = split(readFile("src/day_2/part_1.input").strip(), ",").mapIt(
        parseInt(it))

# AoC specifies to replace this two values manually
opcode[1] = 12
opcode[2] = 2

var position: int

while true:
    case opcode[position]:
        of 1:
            opcode[opcode[position+3]] = opcode[opcode[position+1]] + opcode[
                    opcode[position+2]]
            position += 4

        of 2:
            opcode[opcode[position+3]] = opcode[opcode[position+1]] * opcode[
                    opcode[position+2]]
            position += 4
        of 99:
            break
        else:
            discard

echo opcode[0]

