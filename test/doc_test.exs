defmodule DocTest do
  use ExUnit.Case, async: true
  doctest ModulesAndFunctions.Times
  doctest ModulesAndFunctions.PatternMatch
  # doctest ModulesAndFunctions.Chop # do not doctest, it outputs on console
  doctest ModulesAndFunctiions.EmbeddedFunctions
end
