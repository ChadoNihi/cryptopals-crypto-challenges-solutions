defmodule HexToBase64 do
  def hex_to_64(hex_str) do
    Base.decode16(hex_str, case: :mixed) |> elem(1)
    |> Base.encode64
end
