from strutils import parseInt

proc calculateFuel(mass: int): int =
    return int(mass / 3) - 2

proc calculateRecursiveFuel(mass: int): int =
    var fuel: int
    var currentModule: int = mass

    while currentModule > 0:
        currentModule = calculateFuel(currentModule)
        if currentModule > 0:
            fuel += currentModule
    
    return fuel


var fuel: int
var moduleFuel: int
var recursiveFuel: int

for mass in lines "src/day_1/part_1.input":
    moduleFuel = calculateFuel(parseInt(mass))
    recursiveFuel = calculateRecursiveFuel(moduleFuel)

    fuel += moduleFuel + recursiveFuel

echo fuel
