defmodule Day4Test do
  use ExUnit.Case

  test "is_real?" do
    {res1, _} = Day4.is_real?("aaaaa-bbb-z-y-x-123[abxyz]")
    {res2, _} = Day4.is_real?("a-b-c-d-e-f-g-h-987[abcde]")
    {res3, notfound} = Day4.is_real?("not-a-real-room-404[oarel]")
    {res4, _} = Day4.is_real?("totally-real-room-200[decoy]")
    assert notfound == 404
    assert res1 == true
    assert res2 == true
    assert res3 == true
    assert res4 == false
  end

  test "found_in?" do
    assert Day4.found_in?("abcdef", "acf") == true
    assert Day4.found_in?("abcdef", "acx") == false
  end
end
