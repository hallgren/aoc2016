defmodule Day1 do
  def part_1() do
    coord = instructions()
      |> destination()
    x = elem(coord, 1)
    y = elem(coord, 2)
    abs(x) + abs(y)
  end

  def instructions() do
    File.read!("assets/day1.txt")
    |> String.split(", ")
    |> Enum.map(fn(s) -> to_ins(s) end)
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

  defp destination(instructions) when is_list(instructions) do
    {"N", 0, 0} |> get_pos(instructions)
  end

  defp get_pos(pos, []) do
    pos
  end

  defp get_pos(pos, [ins | tail]) do
    pos
    |> move(ins)
    |> get_pos(tail)
  end

  defp move({"N", x, y}, {"R", n}) do
    {"E", x + n, y}
  end

  defp move({"N", x, y}, {"L", n}) do
    {"W", x - n, y}
  end

  defp move({"E", x, y}, {"R", n}) do
    {"S", x, y - n}
  end

  defp move({"E", x, y}, {"L", n}) do
    {"N", x, y + n}
  end

  defp move({"W", x, y}, {"R", n}) do
    {"N", x, y + n}
  end

  defp move({"W", x, y}, {"L", n}) do
    {"S", x, y - n}
  end

  defp move({"S", x, y}, {"R", n}) do
    {"W", x - n, y}
  end

  defp move({"S", x, y}, {"L", n}) do
    {"E", x + n, y}
  end
end
