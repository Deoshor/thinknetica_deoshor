#Заполнить массив числами Фибоначчи до 100
fib = [0, 1]
i = 0
while (fib[-1] + fib[-2]) < 100 do
  fib_next = fib[-1] + fib[-2]
  fib << fib_next
  i += 1
  puts fib[i]
end
