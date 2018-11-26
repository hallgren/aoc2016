defmodule Day6 do
  def part_1() do
    File.read!("assets/day6_test.txt")
    |> String.trim()
    |> String.split("\n")
    |> process_lines()
  end

  defp process_lines(lines) do
    Enum.each(0..5, fn(i) -> process_lines(lines, i) end)
  end

  defp process_lines(lines, index) do
    parse_line(%{}, lines, index)
  end

  defp parse_line(map, [], index) do
    IO.puts(max_count(map))
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
    # Enum.max seem to return the highest count...?
    Enum.min(map)
  end
end
