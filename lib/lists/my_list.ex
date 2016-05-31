defmodule Lists.MyList do
  @moduledoc """
  List functions
  """

  @doc """
  Sum list values.

  ## Example
      iex> Lists.MyList.sum([1, 2, 3, 4, 5])
      15
  """
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
end
