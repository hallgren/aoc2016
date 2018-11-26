defmodule Day1 do
  def part_1() do
    coord =  File.read!("assets/day1.txt")
      |> String.split(", ")
      |> Enum.map(fn(s) -> to_ins(s) end)
      |> destination()
    x = elem(coord, 1)
    y = elem(coord, 2)
    abs(x) + abs(y)
  end

  def to_ins(s) do
    s
      |> String.split_at(1)
      |> conv_ins()
  end

  def conv_ins({a, b}) do
    b = String.trim(b)
    {a, String.to_integer(b)}
  end

  defp destination(instructions) do
    get_pos(instructions, {"N", 0, 0})
  end

  defp get_pos([], pos) do
    pos
  end

  defp get_pos([head | tail], pos) do
    get_pos(tail, move(head, pos))
  end

  defp move({"R", n}, {dir, x, y}) do
    new_dir = case dir do
      "N" -> "E"
      "E" -> "S"
      "S" -> "W"
      "W" -> "N"
    end
    move_dir({new_dir, x, y}, n)
  end

  defp move({"L", n}, {dir, x, y}) do
    new_dir = case dir do
      "N" -> "W"
      "E" -> "N"
      "S" -> "E"
      "W" -> "S"
    end
    move_dir({new_dir, x, y}, n)
  end

  defp move_dir({dir, x, y}, n) do
    case dir do
      "N" -> {dir, x, y+n}
      "E" -> {dir, x+n, y}
      "S" -> {dir, x, y-n}
      "W" -> {dir, x-n, y}
    end
  end
end
