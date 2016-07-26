defmodule Play do
  # fib(0) -> 1
  # fib(1) -> 1
  # fib(n) -> fib(n - 2) + fib(n - 1)
  def fib(0), do: 1
  def fib(1), do: 1
  def fib(n) when n > 0, do: fib(n - 2) + fib(n - 1)

  # sum([]) -> 0
  # sum([head | tail]) -> head + sum(tail)
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  # map([]) -> []
  # map([head | tail], fun) -> [ fun.(head) | map(tail, fun)]
  def map([], _func), do: []
  def map([head | tail], func), do: [ func.(head) | map(tail, func)]
end
