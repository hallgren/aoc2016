defmodule Aoc do
  def run(i) when is_integer(i) and i > 0 do
    case i do
      1 -> Day1.run()
    end
  end
end
