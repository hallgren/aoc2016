defmodule Day4 do
  def part_1() do
    File.read!("assets/day4.txt")
    |> String.trim()
    |> String.split("\n")
    |> Enum.reduce(0, fn(s, sum) ->
         {ok, sector_id} = is_real?(s)
         if ok do
           sum + sector_id
         else
           sum
         end
       end)
  end

  @doc """
  Validates if a room is real.
  """
  def is_real?(room) do
    reg = ~r/(.*)-(\d+)\[([a-z]+)\]/
    match = Regex.run(reg, room)
    if match == nil do
      false
    else
      [_, name, sector_id, checksum] = Regex.run(reg, room)
      {cheksum_ok?(name, checksum), String.to_integer(sector_id)}
    end
  end

  @doc """
  Returns true if the checksum is the five most common
  letters in the encrypted name, in order, with ties broken
  by alphabetization.
  """
  def cheksum_ok?(name, checksum) do
    sorted_letters =
      name
      |> String.replace("-", "") # Get only letters
      |> Letters.count() # Count each letter
      |> sorted_by_count() # Sort by count and alphabetically
      |> Enum.map(fn({k, _}) -> k end) # Get the letters only
      |> Enum.reduce("", fn(l, acc) -> acc <> l end)
    found_in?(sorted_letters, checksum)
  end

  @doc """
  Returns true if sub's letters can be found in str.

  Exmple:
  found_in?("abcdef", "acf") returns true since the
  letters a, c and f can be found in "abcdef".
  
  """
  def found_in?(str, sub) do
    contains(str, sub, 0, 0)
  end

  defp contains(str, sub, i1, i2) do
    if i2 == String.length(sub) do
      true
    else
      if i1 < String.length(str) and i2 < String.length(sub) do
        cond do
          String.at(str, i1) == String.at(sub, i2) -> contains(str, sub, i1+1, i2+1)
          true -> contains(str, sub, i1+1, i2)
        end
      else
        false
    end
    end
  end

  def sorted_by_count(map) do
    map
    |> Enum.to_list()
    |> Enum.sort(fn({k1, v1}, {k2, v2}) ->
        cond do
          v1 == v2 -> k1 < k2
          true -> v1 > v2
        end
       end)
  end
end
