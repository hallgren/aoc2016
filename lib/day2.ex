defmodule Day2 do
  def part_1() do
    File.read!("assets/day2.txt")
      |> String.split("\n")
      |> Enum.filter(fn(s) -> s != "" end)
      |> get_code({1, 1})
  end

  defp get_code([], {r, c}) do end

  defp get_code([head | tail], {r, c}) do
    p = get_number(head, {r, c})
    get_code(tail, p)
  end

  defp get_number(seq, {r, c}) do
    seq
      |> String.codepoints()
      |> process({r,c})
  end

  defp process([], {r, c}) do
    IO.puts(get_at(keypad(), r, c))
    {r, c}
  end

  defp process([head | tail], {r, c}) do
    process(tail, move(head, {r, c}))
  end

  def move(dir, {r, c}) do
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
