require './lib/solver'
require './test/solver_test.rb'

puzzle_path = ARGV[0]
puzzle_text = IO.readlines(puzzle_path)
solver = Solver.new(puzzle_text)
# solver_test = SolverTest.new
puts "\n" + solver.solve
#
# It passes the Solver test for 9x9 board, not sure why this doesn't work
#
# if solver_test.test_it_solves_the_easy_puzzle == true then
#   puts "And it actually got the puzzle right! "
# end
puts
