defmodule DocTest do
  use ExUnit.Case, async: true
  doctest ModulesAndFunctions.Times
  doctest ModulesAndFunctions.PatternMatch
end
