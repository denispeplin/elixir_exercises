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

  ## Examples
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

  @doc """
  Adds number to each element of a list, wraps if result > 'z'.

  ## Example
      iex> Lists.MyList.caesar 'ryvkve', 13
      'elixir'
  """
  def caesar([], _n), do: []
  def caesar([head | tail], n), do: [_caesar(head, n) | caesar(tail, n)]
  defp _caesar(sym, n) when sym + n > 122, do: sym + n - 122 + 96
  defp _caesar(sym, n), do: sym + n

  @doc """
  Returns list of numbers from `from` up to `to`.

  ## Example
      iex> Lists.MyList.span(5, 10)
      [5, 6, 7, 8, 9, 10]
      iex> Lists.MyList.span(97, 122)
      'abcdefghijklmnopqrstuvwxyz'
  """
  def span(to, to), do: [to]
  def span(from, to), do: [from | span(from + 1, to)]

  @doc """
  Filters list of lists by first element.

  ## Example
      iex> Lists.MyList.filter_by_first ['abc', 'zy', 'a', 'xl', 'avs'], 97
      ['abc', 'a', 'avs']
  """
  def filter_by_first([], _), do: []
  def filter_by_first([list = [filter | _] | tail], filter) do
    [list | filter_by_first(tail, filter)]
  end
  def filter_by_first([_ | tail], filter), do: filter_by_first(tail, filter)

  @doc """
  List of prime numbers from 2 to n.
  Simple iteration without exclusions, so poor perfomance.

  ## Example
      iex> Lists.MyList.primes(37)
      [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
  """
  def primes(n) do
    for x <- span(2, n), _prime?(x), do: x
  end
  defp _prime?(2), do: true
  defp _prime?(x) do
    !Enum.any?(2..(x - 1), fn(y) -> rem(x, y) == 0 end)
  end
end
