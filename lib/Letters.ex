defmodule Letters do
  @doc """
  Count the number of occurences of each letter.

  Example: Letters.count("abbccc")
           {"a"=>1, "b"=>2, "c"=>3}
  """
  def count(str) when is_binary(str) do
    chars = String.codepoints(str)
    counts = Enum.reduce(chars, %{}, fn(word, m) ->
        if m[word] == nil && word != "" do
          Map.put(m, word, 1)
        else
          Map.put(m, word, m[word]+1)
        end
      end)
    counts
  end
end
