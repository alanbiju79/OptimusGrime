## Instructions

Given a grid (where each point on the grid is one square-meter) and a list of points representing square-meters in the office that need to be cleaned, return a list of instructions for getting OptimusGrime to those locations on the grid. An instruction is one of:

> **N**: Move north 

> **S**: Move south 

> **E**: Move east 

> **W**: Move west 

> **C**: Clean the square-meter

OptimusGrime always starts at the origin point, (0, 0). As with a mathematical graph, this point lies at the most south-westerly point of the grid.

## Running the script

```bash
ruby optimus_grime.rb 5x5 '(1, 3)' '(4, 4)'
```