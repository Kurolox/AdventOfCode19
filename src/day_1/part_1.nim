from strutils import parseInt

var fuel: int

for mass in lines "src/day_1/part_1.input":
    fuel += int(parseInt(mass) / 3) - 2

echo fuel