defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "sample_test" do
    assert Day01.sample() == [[3, 4], [4, 3], [2, 5], [1, 3], [3, 9], [3, 3]]
  end

  test "create lists test" do
    assert Day01.create_lists() == {[3, 4, 2, 1, 3, 3], [4, 3, 5, 3, 9, 3]}
  end

  test "day 01 example works" do
    assert Day01.day01_answer() == 11
  end

  test "day 01 answer" do
    IO.inspect(Day01.day01_answer())
  end


end
