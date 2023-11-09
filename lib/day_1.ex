defmodule Day1 do

  def run() do
    input = File.read!("day_1_input.txt")

    IO.puts("Part 1: ")
    IO.puts(part1(input))

    IO.puts("Part 1 iteration 2: ")
    IO.puts(part1_interation2(input))

    IO.puts("Part 2: ")
    IO.puts(part2(input))
  end

  def part1(input) do
    input
      |> String.split("\n")
      |> to_elf_sum_carry_list()
      |> get_maximum()
  end

  def part1_interation2(input) do
    input
      |> String.split("\n\n", trim: true)
      |> Enum.map(&sum_list/1)
      |> Enum.max()
  end

  def part2(input) do
    input
      |> String.split("\n\n", trim: true)
      |> Enum.map(&sum_list/1)
      |> Enum.sort(&(&1 >= &2))
      |> Enum.take(3)
      |> Enum.sum()
  end

  def sum_list(data) do
    data
      |> String.split("\n", trim: true)
      |> Enum.map(fn e -> String.to_integer(e) end)
      |> Enum.sum()
      # |> Enum.reduce(0, fn e, acc -> acc + String.to_integer(e) end)
  end

  def to_elf_sum_carry_list(carry_list) do
    do_sum_carry_list(carry_list, [], 0)
  end

  def get_maximum(elf_sum_carry_list) do
    do_get_maximum(elf_sum_carry_list, 0)
  end

  defp do_sum_carry_list([], sum_carry_list, accum) do
    sum_carry_list ++ [accum]
  end

  defp do_sum_carry_list([head | tail], sum_carry_list, accum) do
    head_value = parse_integer(head)

   {sum_carry_list, accum} = case head_value do
     0 -> {sum_carry_list ++ [accum], 0}
     _ -> {sum_carry_list, accum}
   end

    do_sum_carry_list(tail, sum_carry_list, accum + head_value)
  end

  defp do_get_maximum([], max), do: max
  defp do_get_maximum([head | tail], max) do
    max = if head > max do
      head
    else
      max
    end

    do_get_maximum(tail, max)
  end

  defp parse_integer(value) do
    result = Integer.parse(value)
    case result do
      :error -> 0
      _ -> elem(result, 0)
    end
  end
end
