defmodule Advent1A do
  def run(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> depths()
  end

  defp depths(measurements) do
    depths(measurements, measure(measurements))
  end

  defp depths([a|[b|[""|_]]], _), do: 0

  defp depths([_|tail] = measurements, window) do
    new_window = measure(measurements)

    case new_window > window do
      true ->
        1 + depths(tail, new_window)

      _ ->
        depths(tail, new_window)
    end
  end

  defp measure([a|[b|[c|_]]]) do
    String.to_integer(a) + String.to_integer(b) + String.to_integer(c)
  end
end
