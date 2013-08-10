def fib(n)
  n < 2 ? n : fib(n-2) + fib(n-1)
end

p fib(10) == 55
p fib(4) == 3
p fib(3) == 2
p fib(2) == 1
p fib(1) ==1
p fib(0) ==0


def fib(n)
  sequence = [0,1]
  while sequence.length < n + 1
    sequence << sequence[-1] + sequence[-2]
  end
  sequence[n]
end

p fib(0) == 0
p fib(1) == 1
p fib(2) == 1
p fib(3) == 2
p fib(4) == 3
p fib(10) == 55
