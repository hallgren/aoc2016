defmodule Day3 do
  def part_1() do
    File.read!("assets/day3.txt")
      |> String.split("\n")
      |> Enum.map(fn(s) -> String.trim(s) end)
      |> Enum.filter(fn(s) -> s != "" end)
      |> parse()
      |> find_ok_triangles()
      |> length()
  end

  defp parse(strings) do
    # strings: a list containing all the rows
    strings
    # Extract the different parts defining the triangles
    |> Enum.map(fn(s) -> Regex.run(~r/(\d+)\s+(\d+)\s+(\d+)/, s) end)
    # _ is the same as s above, and a, b, c are the string representation of the triangle sides
    |> Enum.map(fn([_, a, b, c]) -> {a, b, c} end)
    |> Enum.map(fn({a, b, c}) ->
       {String.to_integer(a),
        String.to_integer(b),
        String.to_integer(c)} end)
  end

  defp find_ok_triangles(triangles) when is_list(triangles) do
    triangles
      |> Enum.filter(fn({a, b, c}) -> triangle_ok?(a, b, c) end)
  end

  def triangle_ok?(a, b, c) do
    a+b > c
    and
    a+c > b
    and
    b+c > a
  end
end
