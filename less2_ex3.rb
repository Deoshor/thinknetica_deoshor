#Заполнить массив числами Фибоначчи до 100
fib = [0, 1]
i = 0
while fib.last < 100 do
  fib_next = fib[i] + fib[i.next]
  fib << fib_next
  i += 1
  puts fib[i]
end
