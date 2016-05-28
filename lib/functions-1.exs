# import_file "lib/functions-1.exs"

list_concat = fn a, b -> a ++ b end
IO.puts inspect(list_concat.([:a, :b], [:c, :d])) # [:a, :b, :c, :d]

sum = fn a, b, c -> a + b + c end
IO.puts sum.(1, 2, 3) # 6

pair_tuple_to_list = fn { a, b } -> [a, b] end
IO.puts inspect(pair_tuple_to_list.({1234, 5678})) # [1234, 5678]
