defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  def pick_color(%Identicon.Image{hex: [r,g,b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input) # creates hash from string using md5 algorithm
    |> :binary.bin_to_list # produces a list of numbers from hash

    %Identicon.Image{hex: hex}
  end
end
