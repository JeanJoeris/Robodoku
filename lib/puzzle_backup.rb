require 'pry'

class Puzzle

  def initialize(puzzle_text)
    puzzle = puzzle_text.map do |row|
      row.chomp.chars
    end
    @puzzle = puzzle
  end

  def get_puzzle_array
    @puzzle
  end

  def get_numbers_in_row(row_index)
    numbers_in_row = @puzzle[row_index]
  end

  def get_numbers_in_column(column_index)
    numbers_in_column = @puzzle.map { |row| row[column_index] }
  end

  def get_index_range_for_block(index)

    if index % 3 == 0 then
      range = (index..index+2)
    elsif index % 3 == 1 then
      range = (index-1..index+1)
    else
      range = (index-2..index)
    end
    return range

  end

  def get_numbers_in_block(row_index, column_index)

    row_range = get_index_range_for_block(row_index)
    column_range = get_index_range_for_block(column_index)

    numbers_in_block = @puzzle[row_range].map { |row| row[column_range] }

    return numbers_in_block

  end

  def find_empty_squares(puzzle = @puzzle)
    empty_squares = []
    puzzle.length.times do |row_number|
      puzzle[row_number].length.times do |column_number|
        if puzzle [row_number][column_number] == " "
          empty_squares << [row_number, column_number]
        end
      end
    end
    return empty_squares

  end
end
