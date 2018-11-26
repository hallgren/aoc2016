defmodule Day5 do
  def part_1() do
    input = "ffykfhsq"
    password(input)
  end

  def password(door_id) do
    password(door_id, "", 0, 0)
  end

  defp password(_, pass, _, 8) do
    pass
  end

  defp password(door_id, pass, index, found) do
    h = md5_hash(door_id <> Integer.to_string(index))

    if hash_ok?(h) do
      password(door_id, pass <> get_password_char(h), index+1, found+1)
    else
      password(door_id, pass, index+1, found)
    end
  end

  def md5_hash(s) do
    hash = :crypto.hash(:md5, s)
    Base.encode16(hash, case: :lower)
  end

  def hash_ok?(hash) do
    String.match?(hash, ~r/^00000/)
  end

  defp get_password_char(hash) do
    String.at(hash, 5)
  end
end
