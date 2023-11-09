defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  @example_input"""
  1000
  2000
  3000

  4000

  5000
  6000

  7000
  8000
  9000

  10000
  """

  test "part 1" do
    assert Day1.part1(@example_input) == 24000
  end

  test "part 1 interation 2" do
    assert Day1.part1_interation2(@example_input) == 24000
  end

  test "part 2" do
    assert Day1.part2(@example_input) == 45000
  end
end
