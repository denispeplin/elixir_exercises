defmodule ModulesAndFunctions.Times do
  @moduledoc """
  This is the times module
  """

  @doc """
  Doubles input value

  ## Example
      iex> ModulesAndFunctions.Times.double 3
      6
  """
  def double(n), do: n * 2

  @doc """
  Triples input value

  ## Example
      iex> ModulesAndFunctions.Times.triple 3
      9
  """
  def triple(n), do: n * 3

  @doc """
  Quadruples input value

  ## Example
      iex> ModulesAndFunctions.Times.quadruple 3
      12
  """
  def quadruple(n), do: double double(n)
end
