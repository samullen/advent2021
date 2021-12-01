defmodule Advent1 do
  def run(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> depths()
  end

  defp depths([head|_] = measurements) do
    depths(measurements, String.to_integer(head))
  end

  defp depths([""|_], _), do: 0

  defp depths([head|tail], depth) do
    new_depth = String.to_integer(head)

    case new_depth > depth do
      true ->
        1 + depths(tail, new_depth)

      _ ->
        depths(tail, new_depth)
    end
  end
end
