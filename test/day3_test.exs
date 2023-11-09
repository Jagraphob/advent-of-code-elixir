defmodule Day3Test do
  use ExUnit.Case

  @example_input """
  vJrwpWtwJgWrhcsFMMfFFhFp
  jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
  PmmdzqPrVvPwwTWBwg
  wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
  ttgJtRGJQctTZtZT
  CrZsJsPPZsGzwwsLwLmpwMDw
  """

  test "part1" do
    Day3.part1(@example_input) == 157
  end

  test "part2" do
    Day3.part2(@example_input) == 70
  end
end
