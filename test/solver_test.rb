require "minitest"
require "minitest/autorun"
require "./lib/solver"
require "pry"


class SolverTest < Minitest::Test
  # def test_it_solves
  #   assert_equal false, "make it solve!"
  # end

  def test_it_solves_the_easy_puzzle
    puzzle_text = IO.readlines("./puzzles/nine_by_nine_trivial.txt")
    solver = Solver.new(puzzle_text)
    solved_puzzle = solver.solve

    expected_solution = File.read("./puzzles/nine_by_nine_trivial_completed.txt")

    assert_equal expected_solution, solved_puzzle
    expected_solution == solved_puzzle
  end
end
