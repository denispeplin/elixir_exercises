defmodule Lists.MyEnum do
  @moduledoc """
  Self-made Enum with some of its functions.

  Docs have been copied from official Elixir docs.
  """

  @doc """
  Invokes the given `fun` for each item in the enumerable.
  It stops the iteration at the first invocation that returns `false` or `nil`.
  It returns `false` if at least one invocation returns `false` or `nil`.
  Otherwise returns `true`.

  ## Examples
      iex> Lists.MyEnum.all?([2, 4, 6], fn(x) -> rem(x, 2) == 0 end)
      true
      iex> Lists.MyEnum.all?([2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
      false

  If no function is given, it defaults to checking if
  all items in the enumerable are truthy values.

      iex> Lists.MyEnum.all?([1, 2, 3])
      true
      iex> Lists.MyEnum.all?([1, nil, 3])
      false
      iex> Lists.MyEnum.all?([1, false, 3])
      false
      iex> Lists.MyEnum.all?([])
      true
  """
  def all?([], _), do: all?([])
  def all?([head | tail], fun), do: fun.(head) && all?(tail, fun)

  def all?([]), do: true
  def all?([head | tail]), do: !!head && all?(tail)
end
