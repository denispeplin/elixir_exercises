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

  @doc """
  Invokes the given `fun` for each item in the enumerable.
  Returns `:ok`.

  ## Examples
      Lists.MyEnum.each(["some", "example"], fn(x) -> IO.puts x end)
      "some"
      "example"
      #=> :ok
  """
  def each([head | tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  @doc """
  Filters the enumerable, i.e. returns only those elements
  for which `fun` returns a truthy value.

  ## Examples
      iex> Enum.filter([1, 2, 3], fn(x) -> rem(x, 2) == 0 end)
      [2]
  """
  def filter([head | tail], fun) do
    if fun.(head) do
      [head | filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end

  @doc """
  Splits the `enumerable` into two enumerables, leaving `count`
  elements in the first one. If `count` is a negative number,
  it starts counting from the back to the beginning of the
  enumerable.

  Be aware that a negative `count` implies the `enumerable`
  will be enumerated twice: once to calculate the position, and
  a second time to do the actual splitting.

  ## Examples

      iex> Lists.MyEnum.split([1, 2, 3], 2)
      {[1, 2], [3]}

      iex> Lists.MyEnum.split([1, 2, 3], 10)
      {[1, 2, 3], []}

      iex> Lists.MyEnum.split([1, 2, 3], 0)
      {[], [1, 2, 3]}

      iex> Lists.MyEnum.split([1, 2, 3], -1)
      {[1, 2], [3]}

      iex> Lists.MyEnum.split([1, 2, 3], -5)
      {[], [1, 2, 3]}
  """
  def split([head | tail], count) when count > 0 do
    {left, right} = split(tail, count - 1)
    {[head | left], right}
  end
  def split(list, count) when count < 0 do
    size = length list
    new_count = if size + count >= 0, do: size + count, else: 0
    split(list, new_count)
  end
  def split(list, _), do: {[], list}

  @doc """
  Takes the first `count` items from the enumerable.

  `count` must be an integer. If a negative `count` is given, the last
  `count` values will be taken.
  For such, the enumerable is fully enumerated keeping up
  to `2 * count` elements in memory. Once the end of the enumerable is
  reached, the last `count` elements are returned.

  ## Examples

      iex> Lists.MyEnum.take([1, 2, 3], 2)
      [1, 2]

      iex> Lists.MyEnum.take([1, 2, 3], 10)
      [1, 2, 3]

      iex> Lists.MyEnum.take([1, 2, 3], 0)
      []

      iex> Lists.MyEnum.take([1, 2, 3], -2)
      [2, 3]
  """
  def take([head | tail], count) when count > 0 do
    [head | take(tail, count - 1)]
  end
  def take(list, count) when count < 0 do
    {_, right} = split(list, count)
    right
  end
  def take(_, _), do: []
end
