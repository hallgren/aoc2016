defmodule Day7 do
  def is_abba?(str) when is_binary(str) do
    range = 0..(String.length(str) - 4)
    Enum.any?(range, fn(i) ->
      String.slice(str, i, 4)
      |> String.codepoints()
      |> abba?
    end)
  end

  def supports_tls?(ipv7) do

    
  end

  def get_parts(ipv7) do
    reg = ~r//
  end

  defp abba?([a, b, c, d]) do
    a == d
    and
    a != b
    and
    b == c
  end
end
