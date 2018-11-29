defmodule Day7Test do
  use ExUnit.Case

  test "abba?" do
    assert Day7.is_abba?("abba") == true
    assert Day7.is_abba?("ioxxoj") == true
    assert Day7.is_abba?("aaaa") == false
  end
end
