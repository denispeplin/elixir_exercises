defmodule Strings.MyString do
  @moduledoc """
  String exercises.
  """

  @doc """
  Detect printable list.

  ## Examples
      iex> Strings.MyString.is_printable? ' abc~'
      true
      iex> Strings.MyString.is_printable? [0, 97]
      false
  """
  def is_printable?(list) do
    Enum.all? list, fn char -> char >= 32 && char <= 126 end
  end

  @doc """
  Anagram matcher.

  ## Examples
      iex> Strings.MyString.is_anagram? "cat", "dog"
      false
      iex> Strings.MyString.is_anagram? "master", "stream"
      true
      iex> Strings.MyString.is_anagram? "cat", "cat"
      false
      iex> Strings.MyString.is_anagram? "cat", "bird"
      false
  """
  def is_anagram?(word1, word2) when word1 == word2, do: false
  def is_anagram?(word1, word2) do
    Enum.sort(to_char_list word1) == Enum.sort(to_char_list word2)
  end

  @doc """
  Calculator.

  ## Example
      iex> Strings.MyString.calculate '127 + 32'
      159
      iex> Strings.MyString.calculate '33 - 17'
      16
  """
  def calculate(input) do
    case ?+ in input do
      true ->
        [left, right] = String.split(to_string(input), "+")
        _to_integer(left) + _to_integer(right)
      false ->
        [left, right] = String.split(to_string(input), "-")
        _to_integer(left) - _to_integer(right)
    end
  end
  defp _to_integer(string), do: String.strip(string) |> String.to_integer

  @doc """
  Center strings on longest.

  ## Example
      iex> Strings.MyString.center(["cat", "zebra", "elephant"])
      ["  cat", "zebra", "elephant"]
  """
  def center(list) do
    longest = Enum.max_by list, fn(str) -> String.length(str) end
    Enum.map list, fn(str) -> String.rjust(str, round(String.length(longest) / 2 + 1)) end
  end
end
