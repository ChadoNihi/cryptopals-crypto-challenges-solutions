defmodule HexToBase64 do
  use Bitwise, only_operators: true

  def xor_hex(hex_str1, hex_str2) do
    if String.length(hex_str1) != String.length(hex_str2) do
      {:error, "different lengths"}
    else
      rev_bin = Enum.zip(hex_str_to_bin_list(hex_str1), hex_str_to_bin_list(hex_str2))
      |> Enum.reduce([], fn({d1, d2}, acc) -> [d1 ^^^ d2 | acc] end)

      Enum.reduce(rev_bin, {[], Enum.count(rev_bin)-1}, fn(d, {li, pow}) -> {[:math.pow(d, pow) | li], pow-1} end)
      |> elem(0)
      |> Enum.join("")
      |> String.to_integer(16)
    end
  end

  defp hex_str_to_bin_list(hex_str) do
    String.graphemes(hex_str)
    |> List.foldr([], fn(hex_d, acc) -> [hex_dig_to_bin(hex_d) | acc] end)
    |> List.flatten
  end

  defp hex_dig_to_bin(d) do
    case String.downcase(d) do
      "0" -> [0,0,0,0]
      "1" -> [0,0,0,1]
      "2" -> [0,0,1,0]
      "3" -> [0,0,1,1]
      "4" -> [0,1,0,0]
      "5" -> [0,1,0,1]
      "6" -> [0,1,1,0]
      "7" -> [0,1,1,1]
      "8" -> [1,0,0,0]
      "9" -> [1,0,0,1]
      "a" -> [1,0,1,0]
      "b" -> [1,0,1,1]
      "c" -> [1,1,0,0]
      "d" -> [1,1,0,1]
      "e" -> [1,1,1,0]
      "f" -> [1,1,1,1]
    end
  end
end
