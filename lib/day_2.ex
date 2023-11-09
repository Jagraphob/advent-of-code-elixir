defmodule Day2 do
  @shape_score %{
    "X" => 1,
    "Y" => 2,
    "Z" => 3,
  }

  @result_score %{
    "X" => 0,
    "Y" => 3,
    "Z" => 6
  }

  @spec outcome_score(<<_::8>>, <<_::8>>) :: 0 | 3 | 6
  def outcome_score(opp, you) do
    case {opp, you} do
      {"A", "X"} -> 3
      {"A", "Y"} -> 6
      {"A", "Z"} -> 0
      {"B", "X"} -> 0
      {"B", "Y"} -> 3
      {"B", "Z"} -> 6
      {"C", "X"} -> 6
      {"C", "Y"} -> 0
      {"C", "Z"} -> 3
      _ -> 0
    end
  end

  def play_shape(opp, result) do
    case {opp, result} do
      {"A", "X"} -> "Z"
      {"A", "Y"} -> "X"
      {"A", "Z"} -> "Y"
      {"B", "X"} -> "X"
      {"B", "Y"} -> "Y"
      {"B", "Z"} -> "Z"
      {"C", "X"} -> "Y"
      {"C", "Y"} -> "Z"
      {"C", "Z"} -> "X"
    end
  end

  def run() do
    input = File.read!("day_2_input.txt")

    IO.puts("Part 1: #{part1(input)}")
    IO.puts("Part 2: #{part2(input)}")

  end

  def part1(input) do
    input
      |> String.split("\n", trim: true)
      |> Enum.map(&get_score/1)
      |> Enum.sum()
  end

  def part2(input) do
    input
      |> String.split("\n", trim: true)
      |> Enum.map(&get_score2/1)
      |> Enum.sum()
  end

  def get_score(data) do
    [opp, you] = data
      |> String.split(" ", trim: true)

    outcome_score(opp, you) + @shape_score[you]
  end

  def get_score2(data) do
    [opp, result] = data
      |> String.split(" ", trim: true)

    @shape_score[play_shape(opp, result)] + @result_score[result]
  end
end
