defmodule Advent2A do
  def run(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> move({0,0})
  end

  defp move(["forward " <> amount|tail], {depth, progress}) do
    move(tail, {depth, progress + String.to_integer(amount)})
  end

  defp move(["up " <> amount|tail], {depth, progress}) do
    change = String.to_integer(amount)

    case depth > change do
      true -> move(tail, {depth - change, progress})
      _ -> move(tail, {0, progress})
    end
  end

  defp move(["down " <> amount|tail], {depth, progress}) do
    move(tail, {depth + String.to_integer(amount), progress})
  end

  defp move(_, {depth, progress}) do
    depth * progress
  end
end
