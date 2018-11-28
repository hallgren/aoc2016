defmodule LettersTest do
  use ExUnit.Case

  test "count" do
    count =  Letters.count("abbccc") 
    assert count["a"] == 1
    assert count["b"] == 2
    assert count["c"] == 3
  end
end
