defmodule Day01 do
  @moduledoc """
  Day One of Advent of Code 2018.
  """
  @external_resource "priv/day01_sample.txt"
  @input File.read!("priv/day01-01.txt")
  #@input File.read!("priv/day01_sample.txt")
         |> String.trim()                      # remove trailing newlines or spaces
         |> String.split("\n")                 # split by lines
         |> Enum.map(fn line ->
           line
           |> String.split()                   # Split each line by spaces (handles extra spaces)
           |> Enum.map(&String.to_integer/1)   # Convert each part to an integer
         end)

  def sample do
    @input
  end

  def create_lists do
    IO.puts("calling create_lists")
    lists = @input
    heads = Enum.map(lists, fn [head, _tail] -> head end)
    tails = Enum.map(lists, fn [_head, tail] -> tail end)
    {heads, tails}
  end

  def day01_answer do
    {left, right} = create_lists()
    left = Enum.sort(left)
    right = Enum.sort(right)
    Enum.zip_reduce(left, right,0, fn x, y,acc ->
      absxy = abs(x - y)
      #IO.inspect("x is #{x}, y is #{y}, x-y is #{absxy}")
      abs(x - y) + acc
    end)
  end

  def day01_part2 do
    {left, right} = create_lists()
    IO.inspect(left)
    rightFreq = Enum.frequencies(right)
    Enum.reduce(left, 0, fn x, acc ->
      #IO.inspect("x is #{x}, rightFreq is #{rightFreq[x]} acc is #{acc}")
      case rightFreq[x] do
                nil -> acc
                _ -> x * rightFreq[x] + acc
                end

    end
    )

end

end
