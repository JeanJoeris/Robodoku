require './lib/puzzle'

class FindValueByDirectPeers

  def initialize(puzzle)
    @puzzle = Puzzle.new(puzzle)
  end

  def find_possible_square_values(row_index, column_index)

    possible_values = ["1","2","3","4","5","6","7","8","9"]

    eliminated_row_numbers = @puzzle.get_numbers_in_row(row_index)
    eliminated_column_numbers = @puzzle.get_numbers_in_column(column_index)
    eliminated_block_numbers = @puzzle.get_numbers_in_block(row_index, column_index).flatten

    # In terms of style, very unsure on this.
    all_eliminated_elements = (eliminated_row_numbers +
    eliminated_column_numbers + eliminated_block_numbers)

    all_eliminated_numbers = all_eliminated_elements.flatten.uniq
    non_eliminated_numbers = possible_values - all_eliminated_numbers

  end

  def solve_square_by_single_possibility(row_index, column_index)

    incremented_puzzle = @puzzle.get_puzzle_array
    square_values = find_possible_square_values(row_index, column_index)
    if square_values.count == 1 then
      incremented_puzzle[row_index][column_index] = square_values[0]
    end
    incremented_puzzle

  end
end
