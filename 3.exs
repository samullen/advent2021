defmodule Advent3 do
  def part1(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> Enum.reduce({0, {0,0,0,0,0,0,0,0,0,0,0,0}}, fn line, {i, power} ->
      {i + 1, increment_power(line, power)}
    end)
    |> calculate_power()
  end

  defp increment_power("", power), do: power
  defp increment_power(line, {a, b, c, d, e, f, g, h, i, j, k, l}) do
    {aa, bb, cc, dd, ee, ff, gg, hh, ii, jj, kk, ll} =
      line
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple

    {a+aa, b+bb, c+cc, d+dd, e+ee, f+ff, g+gg, h+hh, i+ii, j+jj, k+kk, l+ll}
  end

  defp calculate_power({count, power}) do
    power
    |> Tuple.to_list
    |> Enum.reduce({"", ""}, fn measurement, {gamma, epsilon} ->
      case measurement > count / 2 do
        true -> {gamma <> "1", epsilon <> "0"};
        _ -> {gamma <> "0", epsilon <> "1"};
      end
    end)
    |> Tuple.to_list
    |> Enum.map(&(String.to_integer(&1, 2)))
    |> Enum.reduce(fn i, acc -> i * acc end)
  end
end
