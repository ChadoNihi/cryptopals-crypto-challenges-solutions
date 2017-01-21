defmodule HexToBase64 do
  def hex_to_64!(number_string) do
    if !String.match?(number_string, ~r/^[0-9a-f]$/i) do
      raise ArgumentError
    else
      
    end
  end
end
