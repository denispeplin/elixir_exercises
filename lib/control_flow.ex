defmodule ControlFlow do
  @moduledoc """
  Control flow exercises.
  """

  @doc """
  FizzBuzz using `case`.

  ## Example.
      iex> ControlFlow.fizzbuzz(15)
      [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"]
  """
  def fizzbuzz(n) when n > 0 do
    1..n |> Enum.map(&_fizzbuzz/1)
  end
  defp _fizzbuzz(n) do
    case { rem(n, 3), rem(n, 5) } do
      { 0, 0 } -> "FizzBuzz"
      { 0, _ } -> "Fizz"
      { _, 0 } -> "Buzz"
      _ -> n
    end
  end

  @doc ~S"""
  Exmark function for everything.

  ## Examples.
      iex> file = ControlFlow.ok! File.open("lib/control_flow.txt")
      iex> IO.read file, :line
      "Hello World!\n"
      iex> ControlFlow.ok! File.open("nonexistent.file")
      ** (RuntimeError) enoent
  """
  def ok!({ :ok, data }) do
    data
  end
  def ok!({ :error, message }) do
    raise RuntimeError, message: Atom.to_string(message)
  end
end
