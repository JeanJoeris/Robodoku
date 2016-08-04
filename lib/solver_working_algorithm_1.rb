

class Solver

  def initialize(puzzle_text)
    @puzzle_text = puzzle_text
  end


  def solve

    puzzle = parse_into_puzzle(@puzzle_text)
    empty_squares = find_empty_squares(puzzle)

    until empty_squares.count == 0 do

      empty_squares.each do |empty_square_indices|
        row_index = empty_square_indices[0]
        column_index = empty_square_indices[1]
        parsed_puzzle = solve_square_by_single_possibility(puzzle, row_index, column_index)
      end
      empty_squares = find_empty_squares(puzzle)

    end

    final_format_puzzle = write_into_final_format(puzzle)
    puts final_format_puzzle

  end

  def parse_into_puzzle(row_split_puzzle)
    puzzle = []
    row_split_puzzle.length.times do |row_number|
      puzzle[row_number] = row_split_puzzle[row_number].chomp.chars
    end
    return puzzle
  end


  def get_numbers_in_row(puzzle, row_index)
    numbers_in_row = puzzle[row_index]
  end

  def get_numbers_in_column(puzzle, column_index)
    numbers_in_column = puzzle.map { |row| row[column_index] }
  end

  def get_index_range_for_block(index)
    if index % 3 == 0 then
      range = (index..index+2)
    elsif index % 3 == 1 then
      range = (index-1..index+1)
    else
      range = (index-2..index)
    end
    range
  end

  def get_numbers_in_block(puzzle, row_index, column_index)

    row_range = get_index_range_for_block(row_index)
    column_range = get_index_range_for_block(column_index)

    numbers_in_block = puzzle[row_range].map { |row| row[column_range] }
    # puts "here are the numbers in the block"
    # print numbers_in_block
    # puts

    return numbers_in_block
  end

  def find_possible_square_values(puzzle, row_index, column_index)
    possible_values = ["1","2","3","4","5","6","7","8","9"]

    eliminated_row_numbers = get_numbers_in_row(puzzle, row_index)
    eliminated_column_numbers = get_numbers_in_column(puzzle, column_index)
    eliminated_block_numbers = get_numbers_in_block(puzzle, row_index, column_index).flatten

    all_eliminated_elements = (eliminated_row_numbers +
    eliminated_column_numbers + eliminated_block_numbers)
    all_eliminated_numbers = all_eliminated_elements.flatten.uniq
    all_eliminated_numbers.delete(" ")

    non_eliminated_numbers = possible_values - all_eliminated_numbers

    return non_eliminated_numbers
  end

  # write into output format
  def write_into_final_format(comleted_puzzle)
    formatted_puzzle = []
    comleted_puzzle.length.times do |row_number|
      formatted_puzzle[row_number] = comleted_puzzle[row_number].join
    end
    formatted_puzzle = formatted_puzzle.join("\n")
  end

  def find_empty_squares(parsed_puzzle)
    empty_squares = []
    parsed_puzzle.length.times do |row_number|
      parsed_puzzle[row_number].length.times do |column_number|
        if parsed_puzzle [row_number][column_number] == " "
          empty_squares << [row_number, column_number]
        end
      end
    end
    return empty_squares
  end

  def solve_square_by_single_possibility(parsed_puzzle, row_index, column_index)
    square_values = find_possible_square_values(parsed_puzzle, row_index, column_index)
    if square_values.count == 1 then
      parsed_puzzle[row_index][column_index] = square_values[0]
      #puts "Solved location #{row_index}, #{column_index}"
    end
    return parsed_puzzle
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
