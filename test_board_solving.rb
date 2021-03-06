# frozen_string_literal: true

require 'test/unit'
require './board'

# Unit test created in order to check 3 problems:
# board with surrounded mines
# board with multiple mines
# empty board
class TestBoardSolving < Test::Unit::TestCase
  def problem_with_data
    [['+', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '+'],
     ['|', '*', ' ', ' ', '*', '*', ' ', '*', '*', '*', ' ', ' ', '*', '|'],
     ['|', ' ', ' ', '*', '*', '*', ' ', '*', ' ', ' ', '*', ' ', ' ', '|'],
     ['|', ' ', ' ', ' ', ' ', '*', '*', '*', ' ', '*', '*', ' ', ' ', '|'],
     ['|', ' ', ' ', '*', ' ', ' ', '*', '*', ' ', ' ', ' ', ' ', '*', '|'],
     ['+', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '+']]
  end

  def solution_with_data
    [['+', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '+'],
     ['|', '*', '2', '3', '*', '*', '4', '*', '*', '*', '2', '2', '*', '|'],
     ['|', '1', '2', '*', '*', '*', '7', '*', '6', '5', '*', '3', '1', '|'],
     ['|', '0', '2', '3', '5', '*', '*', '*', '4', '*', '*', '3', '1', '|'],
     ['|', '0', '1', '*', '2', '3', '*', '*', '3', '2', '2', '2', '*', '|'],
     ['+', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '+']]
  end

  def simple_problem
    [['+', '-', '-', '-', '+'],
     ['|', '*', '*', '*', '|'],
     ['|', '*', ' ', '*', '|'],
     ['|', '*', '*', '*', '|'],
     ['+', '-', '-', '-', '+']]
  end

  def simple_solution
    [['+', '-', '-', '-', '+'],
     ['|', '*', '*', '*', '|'],
     ['|', '*', '8', '*', '|'],
     ['|', '*', '*', '*', '|'],
     ['+', '-', '-', '-', '+']]
  end

  def test_with_data
    board = Board.new(problem_with_data)
    assert_equal(solution_with_data, board.solve)
  end

  def test_simple
    board = Board.new(simple_problem)
    assert_equal(simple_solution, board.solve)
  end

  def test_empty
    board = Board.new([])
    assert_equal([], board.solve)
  end

  def test_one_plus
    board = Board.new([['+']])
    assert_equal([['+']], board.solve)
  end
end
