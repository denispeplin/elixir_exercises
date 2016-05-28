_fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, r -> r
end

IO.puts _fizzbuzz.(0, 0, '')
IO.puts _fizzbuzz.(0, '', '')
IO.puts _fizzbuzz.('', 0, '')
IO.puts _fizzbuzz.('', '', "ZZZ")
IO.puts ""

fizzbuzz = fn n -> _fizzbuzz.(rem(n, 3), rem(n, 5), n) end

IO.puts fizzbuzz.(10)
IO.puts fizzbuzz.(11)
IO.puts fizzbuzz.(12)
IO.puts fizzbuzz.(13)
IO.puts fizzbuzz.(14)
IO.puts fizzbuzz.(15)
IO.puts fizzbuzz.(16)
