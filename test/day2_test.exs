defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  @example_input """
  A Y
  B X
  C Z
  """

  test "part 1" do
    assert Day2.part1(@example_input) == 15
  end

  test "part 2" do
    assert Day2.part2(@example_input) == 12
  end
end
