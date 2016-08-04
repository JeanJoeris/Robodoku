require 'pry'
require './lib/puzzle'
require './lib/find_value_by_direct_peers'

class Solver

  def initialize(puzzle_text)
    @puzzle_text = puzzle_text
  end


  def solve

    puzzle = Puzzle.new(@puzzle_text)
    direct_peer_solver = FindValueByDirectPeers.new(@puzzle_text)

    # I know this breaks the don't name vars after data type rule
    # but I am not sure how else to get the array and store it for
    # overwriting as write solved values in
    puzzle_array = puzzle.get_puzzle_array

    empty_squares = puzzle.find_empty_squares

    until empty_squares.count == 0 do

      empty_squares.each do |empty_square_indices|

        row_index = empty_square_indices[0]
        column_index = empty_square_indices[1]
        puzzle_array = direct_peer_solver.solve_square_by_single_possibility(row_index, column_index)
        puzzle_array

      end
      empty_squares = puzzle.find_empty_squares(puzzle_array)

    end

    final_format_puzzle = write_into_final_format(puzzle_array)
    print final_format_puzzle

  end

  def write_into_final_format(comleted_puzzle)

    formatted_puzzle = []
    comleted_puzzle.length.times do |row_number|
      formatted_puzzle[row_number] = comleted_puzzle[row_number].join
    end

    formatted_puzzle = formatted_puzzle.join("\n")
    
  end

end


  # def solve_square_by_only_candinate(puzzle, empty_squares)
  #
  #
  #   empty_peers = empty_squares.find_all do |square_indicies|
  #     empty_squares.map do |empty_square|
  #       (empty_square.first == square_indicies.first) || (empty_square.last  == square_indicies.last)
  #     end
  #   end
  #   print empty_peers
  #
  # end

  # def solve_square_by_only_candinate(puzzle, empty_square_locations)
  #   empty_peers = empty_square_locations.map do |x,y|
  #     empty_square_locations.find_all do |square_location|
  #       # print square_location
  #       # print "\n #{x}, #{y} \n"
  #       # puts "\n ^ That is where we are searching now\n"
  #       # square_location.first == x || square_location.last == y
  #       square_location.first == x || square_location.last == y
  #     end
  #   end
  #
  #   location_and_possible_values = {}
  #   empty_peers.each do |square_location|
  #     #print square_location
  #     #puts
  #     # location_and_possible_values[square_location] =
  #     # find_possible_square_values(puzzle, square_location.first, square_location.last)
  #   end
  #   # puts location_and_possible_values
  #
  #   # print empty_peers
  #   # puts "\nloop done"
  # end
