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
    {0, 0, 0} |> get_pos(instructions)
  end

  defp get_pos(pos, []) do
    pos
  end

  defp get_pos(pos, [ins | tail]) do
    pos
    |> move(ins)
    |> get_pos(tail)
  end

  defp move({dir, x, y}, {"R", n}) do
    dir + 1 |>
    rem(4) |>
    move(x,y,n)
  end

  defp move({dir, x, y}, {"L", n}) do
    dir + 3 |>
    rem(4) |>
    move(x,y,n)
  end

  defp move(0, x, y, n) do
    { 0, x, y + n }
  end

  defp move(1, x, y, n) do
    { 1, x + n, y }
  end

  defp move(2, x, y, n) do
    { 2, x, y - n }
  end

  defp move(3, x, y, n) do
    { 3, x - n, y }
  end

end
