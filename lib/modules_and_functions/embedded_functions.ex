defmodule ModulesAndFunctiions.EmbeddedFunctions do
  @moduledoc """
  Embedded functions from Elixir and Erlang
  """

  @doc """
  Float to string with two digits.

  ## Example
      iex> ModulesAndFunctiions.EmbeddedFunctions.float2string(234.567)
      "234.57"
  """
  def float2string(value) do
    [a] = :io_lib.format("~.2f", [value])
    to_string a
  end

  @doc """
  Get ENV variable

  ## Example
      iex> ModulesAndFunctiions.EmbeddedFunctions.get_env("EMU")
      "beam"
  """
  def get_env(name), do: System.get_env(name)

  @doc """
  Get file extension

  ## Example
      iex> ModulesAndFunctiions.EmbeddedFunctions.extension("path/file.txt")
      ".txt"
  """
  def extension(filename), do: Path.extname(filename)

  @doc """
  Get current working directory

  ## Example
      iex> Path.basename ModulesAndFunctiions.EmbeddedFunctions.cwd
      "elixir_exercises"
  """
  def cwd, do: System.cwd
end
