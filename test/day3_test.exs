defmodule Day3Test do
  use ExUnit.Case

  test "triangle_ok?" do
    assert Day3.triangle_ok?(1, 2, 3) == false
    assert Day3.triangle_ok?(3, 4, 5) == true
  end
end
