prefix = fn pr ->
  fn content ->
    "#{pr} #{content}"
  end
end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")

IO.puts prefix.("Elixir").("Rocks")
