defmodule ModulesAndFunctions.Chop do
  @moduledoc """
  Guesses supplied number basing on range
  """

  @doc """
  Guess function. Puts intermediate results while executing.

  ## Parameters
    - actual: number to be guessed
    - range: range to guess from

  ## Example
      iex> ModulesAndFunctions.Chop.guess(273, 1..1000)
      Is it 500
      Is it 250
      Is it 375
      Is it 312
      Is it 281
      Is it 265
      273
  """
  def guess(actual, range) do
    _guess(actual, range, nil)
  end

  defp _guess(actual, range, nil) do
    _guess(actual, range, mid(range))
  end
  defp _guess(actual, a.._, current_guess) when current_guess > actual do
    IO.puts "Is it #{current_guess}"
    _guess(actual, a..current_guess, mid(a..current_guess))
  end
  defp _guess(actual, _..b, current_guess) when current_guess < actual do
    IO.puts "Is it #{current_guess}"
    _guess(actual, current_guess..b, mid(current_guess..b))
  end
  defp _guess(actual, _, current_guess) when current_guess == actual do
    IO.puts current_guess
  end

  defp mid(a..b) do
    a + div((b - a), 2)
  end
end
