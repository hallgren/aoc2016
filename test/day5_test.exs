defmodule Day5Test do
  use ExUnit.Case

  test "hash_ok?" do
    assert Day5.hash_ok?("000001") == true
    assert Day5.hash_ok?("00abc") == false
  end
end
