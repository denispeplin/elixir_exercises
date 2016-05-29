defmodule ModulesAndFunctions.PatternMatch do
  @moduledoc """
  N functions
  """

  @doc """
  Calculates factorial

  ## Examples
      iex> ModulesAndFunctions.PatternMatch.factorial 5
      120
      iex> ModulesAndFunctions.PatternMatch.factorial 10
      3628800
  """
  def factorial(0), do: 1
  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

  @doc """
  Calculates sum of integers from 1 to n

  ## Example
      iex> ModulesAndFunctions.PatternMatch.sum(10)
      55
  """
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)

  @doc """
  Calculates greatest common divisor

  ## Examples
      iex> ModulesAndFunctions.PatternMatch.gcd(54, 24)
      6
      iex> ModulesAndFunctions.PatternMatch.gcd(28, 9)
      1
      iex> ModulesAndFunctions.PatternMatch.gcd(48, 18)
      6
  """
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end
