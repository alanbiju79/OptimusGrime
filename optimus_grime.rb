class OptimusGrime
  def initialize(grid, targets)
    @grid = grid.split("x").map(&:to_i)
    @targets = targets.map { |str| str[1..-2].split(",").map(&:to_i) }
    @targets.reject! { |target| !within_grid?(target) }

    @current = [0, 0]
    @directions = { "N": [0,1], "E": [1,0], "S": [0,-1], "W": [-1,0] }
  end

  def find_path
    path = ""

    @targets.each do |target|
      while @current != target
        next_move = find_closest_square(target)
        path += next_move.keys.first.to_s
        @current = next_move.values.first
      end
      path += "C"
    end

    puts path
  end

  private

  def within_grid?(position)
    position[0] < @grid[0] && position[1] < @grid[1] && position[0] >= 0 && position[1] >= 0
  end

  def valid_moves
    valid_moves = {}

    # loop through the 4 possible directions and check if they are within the grid
    @directions.each do |key, val|
      new_pos = [@current[0] + val[0], @current[1] + val[1]]
      valid_moves[key] = new_pos if within_grid?(new_pos)
    end
    
    valid_moves
  end

  def distance_to_target(square, target)
    Math.sqrt((square[0] - target[0])**2 + (square[1] - target[1])**2)
  end

  def find_closest_square(target)
    squares = valid_moves
    closest = {}
    shortest_distance = nil

    # loop through the valid squares and find the closest to the target
    squares.each do |key, val|
      distance = distance_to_target(val, target)

      if shortest_distance.nil? || distance < shortest_distance
        shortest_distance = distance
        closest = {key => val}
      end      
    end

    closest
  end
end

OptimusGrime.new(ARGV[0], ARGV[1..-1]).find_path