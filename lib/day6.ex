defmodule Day6 do
  def part_1() do
    File.read!("assets/day6.txt")
    |> String.trim()
    |> String.split("\n")
    |> process_lines()
  end

  defp process_lines(lines) do
    num_columns = String.length(hd lines)
    columns = 0..(num_columns-1)
    Enum.reduce(columns, "", fn(i, acc) -> acc <> process_column(lines, i) end)
  end

  defp process_column(lines, index) do
    parse_line(%{}, lines, index)
  end

  defp parse_line(map, [], _) do
    t = max_count(map)
    elem(t, 0)
  end

  defp parse_line(map, [head | tail], index) do
    ch = String.at(head, index)
    count = map[ch]
    if count == nil do
      parse_line(Map.put(map, ch, 1), tail, index)
    else
      updated = Map.update(map, ch, count, fn(n) -> n+1 end)
      parse_line(updated, tail, index)
    end
  end

  def max_count(map) do
    max_value = Map.values(map) |> Enum.max()
    Enum.find(map, fn({_, v}) -> v == max_value end)
  end
end
