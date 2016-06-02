defmodule Lists.MyList do
  @moduledoc """
  List functions
  """

  @doc """
  Sum list values.

  ## Example
      iex> Lists.MyList.sum [1, 2, 3, 4, 5]
      15
  """
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  @doc """
  Maps list by given function and sums values.

  ## Example
      iex> Lists.MyList.mapsum [1, 2, 3], &(&1 * &1)
      14
  """
  def mapsum([], _), do: 0
  def mapsum([head | tail], fun), do: fun.(head) + mapsum(tail, fun)

  @doc """
  Returns max value of a list.

  ## Example
      iex> Lists.MyList.max [14, 0, 33, 3, 42, 0, 11]
      42
      iex> Lists.MyList.max []
      nil
      iex> Lists.MyList.max [-1]
      -1
      iex> Lists.MyList.max [0, 0, 0]
      0
  """
  def max(list), do: _max(list, nil)
  defp _max([head | tail], nil), do: _max(tail, head)
  defp _max([head | tail], max) when head <= max, do: _max(tail, max)
  defp _max([head | tail], max) when head > max, do: _max(tail, head)
  defp _max([], max), do: max
end
