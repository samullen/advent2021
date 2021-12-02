defmodule Advent2B do
  def run(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> move({0, 0, 0})
  end

  defp move(["forward " <> amount|tail], {position, aim, depth}) do
    change = String.to_integer(amount)
    move(tail, {position + change, aim, depth + aim * change})
  end

  defp move(["up " <> amount|tail], {position, aim, depth}) do
    move(tail, {position, aim - String.to_integer(amount), depth})
  end

  defp move(["down " <> amount|tail], {position, aim, depth}) do
    move(tail, {position, aim + String.to_integer(amount), depth})
  end

  defp move(_, {position, _aim, depth}) do
    position * depth
  end
end
