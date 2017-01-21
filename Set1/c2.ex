defmodule HexToBase64 do
  use Bitwise, only_operators: true

  def xor_hex(hex_str1, hex_str2) do
    if String.length(hex_str1) != String.length(hex_str2) do
      {:error, "different lengths"}
    else
      rev_bin = Enum.zip(hex_str_to_bin_list(hex_str1), hex_str_to_bin_list(hex_str2))
      |> Enum.reduce([], fn({d1, d2}, acc) -> [d1 ^^^ d2 | acc] end)

      Enum.reduce({[], Enum.count(rev_bin)-1}, fn(d, {li, pow}) -> {[:math.pow(d, pow) | li], pow-1} end)
      |> Enum.join
      |> String.to_integer(16)
    end
  end

  defp hex_str_to_bin_list(hex_str) do
    
  end
end
