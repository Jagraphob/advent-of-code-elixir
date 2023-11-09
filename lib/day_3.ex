defmodule Day3 do
  def run() do
    input = read_file("day_3_input.txt")

    IO.puts("Part 1: #{part1(input)}")
    IO.puts("Part 2: #{part2(input)}")

  end

  def read_file(file_path) do
    File.read!(file_path)
  end

  def part1(input) do
    input
      |> String.split("\n", trim: true)
      |> Enum.map(fn sack -> find_dup_letter(sack) end)
      |> Enum.reduce(0, fn letter, acc -> to_priority(letter) + acc end)
  end

  def part2(input) do
    input
      |> String.split("\n", trim: true)
      |> Enum.chunk_every(3)
      |> Enum.map(fn chunk -> find_common_item(chunk) end)
  end

  def find_common_item(data) do
#  ["vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", "PmmdzqPrVvPwwTWBwg"]
    data
      |> Enum.map(fn rugsack ->
        rugsack
          |> String.graphemes()
          |> Enum.uniq()
      end)
      |> Enum.reduce(fn  ->  end)

  end

  def find_dup_letter(sack) do
    sack_length_half = String.length(sack) / 2
      |> trunc()

    {first_comp, second_comp} =String.split_at(sack, sack_length_half)

    String.graphemes(first_comp)
      |> Enum.uniq()
      |> Enum.find(fn letter -> String.contains?(second_comp, letter) end)
  end

  def to_priority(letter) do
    ascii = String.to_charlist(letter) |> hd

    case ascii do
      x when x in ?a..?z -> ascii - 96
      x when x in ?A..?Z -> ascii - 38
      _ -> 0
    end
  end
end
