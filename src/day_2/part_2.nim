import sequtils
from strutils import split, parseInt, strip

proc calculate(opcode: seq[int], noun: int, verb: int): int =
    var opcode = opcode # Copy the input sequence

    # AoC specifies to replace this two values manually
    opcode[1] = noun
    opcode[2] = verb

    var position: int

    while true:
        case opcode[position]:
            of 1:
                opcode[opcode[position+3]] = opcode[opcode[position+1]] +
                        opcode[opcode[position+2]]
                position += 4

            of 2:
                opcode[opcode[position+3]] = opcode[opcode[position+1]] *
                        opcode[opcode[position+2]]
                position += 4
            of 99:
                return opcode[0]
            else:
                discard


var opcode = split(readFile("src/day_2/part_1.input").strip(), ",").mapIt(
        parseInt(it))

block nestedLoops:
    for noun in 0..99:
        for verb in 0..99:
            if calculate(opcode, noun, verb) == 19690720:
                echo noun * 100 + verb
                break nestedLoops
