defmodule Day2 do
  def part_1() do
    {1, 1}
    |> get_code(instructions())
  end

  defp instructions() do
    File.read!("assets/day2.txt")
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn(s) -> String.codepoints(s) end)
  end

  defp get_code(_, []) do end

  defp get_code({r, c}, [ins | tail]) do
    {r, c}
    |> process(ins)
    |> get_code(tail)
  end

  defp process({r, c}, []) do

    IO.puts(get_at(keypad(), r, c))
    {r, c}
  end

  defp process({r, c}, [ins | tail]) do
    {r, c}
    |> move(ins)
    |> process(tail)
  end

  def move({r, c}, dir) do
    case dir do
      "R" -> move_right(r, c)
      "L" -> move_left(r, c)
      "U" -> move_up(r, c)
      "D" -> move_down(r, c)
    end
  end

  defp move_right(r, c) do
    cond do
      c < 2 -> {r, c+1}
      true -> {r, c}
    end
  end

  defp move_left(r, c) do
    cond do
      c > 0 -> {r, c-1}
      true -> {r, c}
    end
  end

  defp move_up(r, c) do
    cond do
      r > 0 -> {r-1, c}
      true -> {r, c}
    end
  end

  defp move_down(r, c) do
    cond do
      r < 2 -> {r+1, c}
      true -> {r, c}
    end
  end

  def keypad do
    %{0=>1, 1=>2, 2=>3, 3=>4, 4=>5, 5=>6, 6=>7, 7=>8, 8=>9}
  end

  defp get_at(kp, r, c) do
    kp[index(r, c)]
  end

  defp index(r, c) do
    3*r+c
  end
end
